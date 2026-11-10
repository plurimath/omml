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
Omml::Portable.enum_declarations
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
bundle = Omml::Portable.export_bundle(Omml::Models::CTBr)
FileUtils.mkdir_p(destination)
filename = "enum-subset-v1.json"
bytes = "#{JSON.generate(bundle.to_h)}\n"
File.binwrite(File.join(destination, filename), bytes)
source_head, source_status = Open3.capture2("git", "-C", root, "rev-parse",
                                            "HEAD")
abort("source repository unavailable") unless source_status.success?
manifest = {
  "manifest" => 1, "registry" => Omml::Portable.enum_declarations.to_h,
  "graphs" => {
    "enum-subset-v1" => {
      "file" => filename, "sha256" => Digest::SHA256.hexdigest(bytes),
      "lml_checksum" => bundle.checksum, "models" => bundle.models.length,
      "value_types" => bundle.value_types.length
    },
  },
  "producer" => {
    "source_commit" => source_head.strip,
    "framework_commit" => expected_framework, "ruby" => RUBY_VERSION,
    "scope" => "CTBr graph and verified closed string enum registry"
  }
}
File.write(File.join(destination, "manifest.json"),
           "#{JSON.pretty_generate(manifest)}\n")
puts JSON.generate(manifest.fetch("graphs").fetch("enum-subset-v1"))
