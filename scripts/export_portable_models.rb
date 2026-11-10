# frozen_string_literal: true

require "json"
require "digest"
require "fileutils"
require "open3"
require "omml"

root = File.expand_path("..", __dir__)
destination = ARGV.shift || File.join(root, "model/portable")
abort("usage: export_portable_models.rb [OUTPUT_DIRECTORY]") unless ARGV.empty?
framework_source = ENV.fetch("LUTAML_MODEL_SOURCE")
expected_framework = ENV.fetch("LUTAML_MODEL_COMMIT")
framework_head, status = Open3.capture2("git", "-C", framework_source,
                                        "rev-parse", "HEAD")
unless status.success? && framework_head.strip == expected_framework
  abort("framework source pin mismatch")
end
Omml::Portable.value_declarations
changes, clean = Open3.capture2("git", "-C", framework_source, "status",
                                "--porcelain", "--untracked-files=all",
                                "--", "lib")
abort("framework source status unavailable") unless clean.success?
unless changes.empty?
  abort("framework runtime source contains uncommitted changes")
end
registry_class = Lutaml::Model::Lml::ValueDeclarations
location = registry_class.instance_method(:initialize).source_location.first
expected_directory = "#{File.expand_path(framework_source)}/lib/"
unless File.expand_path(location).start_with?(expected_directory)
  abort("framework runtime is not the pinned source checkout")
end
FileUtils.mkdir_p(destination)
runtime_roots = %i[
  CTDrawing CTFFCheckBox CTFFData CTFldChar
  CTMathPr CTPosH CTPosV CTR
  CTRPR CTRunTrackChange CTSdtEndPr CTSdtPr
  EGContentRunContent EGMathContent EGOMathElements EGOMathMathElements
  EGPContent EGRPrMath EGRangeMarkupElements EGRubyContent
  EGRunInnerContent EGRunLevelElts EGWordRunInnerContent EGWrapType
  CTOMath CTOMathPara OMath OMathPara
].map { |name| Omml::Models.const_get(name, false) }
subsets = {
  "enum-subset-v1" => [Omml::Models::CTBr],
  "runtime-graph-v1" => runtime_roots,
  "scalar-subset-v1" => [
    Omml::Models::CTHpsMeasure,
    Omml::Models::CTInteger2,
    Omml::Models::CTManualBreak,
    Omml::Models::CTSpacingRule,
    Omml::Models::CTText,
    Omml::Models::CTUnSignedInteger,
    Omml::Models::CTWordprocessingText,
  ],
}
graphs = subsets.to_h do |id, roots|
  bundle = Omml::Portable.export_bundle(roots)
  filename = "#{id}.json"
  bytes = "#{JSON.generate(bundle.to_h)}\n"
  File.binwrite(File.join(destination, filename), bytes)
  [id, {
    "file" => filename, "sha256" => Digest::SHA256.hexdigest(bytes),
    "lml_checksum" => bundle.checksum, "models" => bundle.models.length,
    "value_types" => bundle.value_types.length
  }]
end
binding_directory = File.join(root, "model/portable/bindings")
binding_files = %w[
  coordinate.rs coordinate.ts integer.rs integer.ts token.rs token.ts
]
binding_sources = binding_files.to_h do |filename|
  digest = Digest::SHA256.file(File.join(binding_directory, filename)).hexdigest
  [filename, digest]
end
source_head, source_status = Open3.capture2("git", "-C", root, "rev-parse",
                                            "HEAD")
abort("source repository unavailable") unless source_status.success?
manifest = {
  "manifest" => 1, "registry" => Omml::Portable.value_declarations.to_h,
  "graphs" => graphs,
  "binding_sources" => binding_sources,
  "producer" => {
    "source_commit" => source_head.strip,
    "framework_commit" => expected_framework, "ruby" => RUBY_VERSION,
    "scope" => "CTBr, scalar subsets, and the OMML runtime graph"
  }
}
File.write(File.join(destination, "manifest.json"),
           "#{JSON.pretty_generate(manifest)}\n")
puts JSON.generate(graphs)
