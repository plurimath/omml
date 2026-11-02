# frozen_string_literal: true

require "spec_helper"
require "pathname"

# Verifies the Opal boot file (lib/omml/opal.rb) stays in sync with the
# autoload declarations across the gem. Under Opal, autoloads do not
# lazy-execute, so the boot file eager-requires every entry point. If
# a new autoload is added without a matching `require` here, Opal users
# will hit NameError at runtime.
RSpec.describe "Omml Opal boot file" do # rubocop:disable RSpec/DescribeClass
  let(:gem_root) { Pathname.new(__dir__).join("..", "..").expand_path }
  let(:lib_root) { gem_root.join("lib") }
  let(:boot_file) { lib_root.join("omml", "opal.rb") }
  let(:boot_source) { boot_file.read }

  def autoload_paths_in(file)
    source = file.read
    pattern = /^\s*autoload\s+:[A-Za-z_][A-Za-z0-9_]*,?\s*["']([^"']+)["']/
    source.scan(pattern).flatten
  end

  def all_autoload_paths
    paths = []
    paths.concat(autoload_paths_in(lib_root.join("omml.rb")))
    paths.concat(autoload_paths_in(lib_root.join("omml", "configuration.rb")))
    paths.uniq
  end

  def boot_required_paths
    boot_source.scan(/^require\s+["']([^"']+)["']/).flatten
  end

  describe "static structure" do
    it "exists at lib/omml/opal.rb" do
      expect(boot_file).to exist
    end

    it "is syntactically valid Ruby" do
      expect do
        RubyVM::AbstractSyntaxTree.parse(boot_source)
      end.not_to raise_error
    end

    it "requires every autoloaded entry point so Opal eager-loads them" do
      missing = all_autoload_paths - boot_required_paths
      expect(missing).to be_empty,
                         "The following autoloads are not eager-required by " \
                         "lib/omml/opal.rb — Opal users will see NameError: " \
                         "#{missing.inspect}"
    end

    it "requires omml/models which eager-loads the model tree" do
      expect(boot_required_paths).to include("omml/models"),
                                     "boot file must require omml/models to " \
                                     "trigger the model tree load"
    end
  end

  describe "Opal builder compilation", :opal do
    it "compiles under Opal when external deps are stubbed" do
      require "opal"
      require "opal/builder"

      builder = Opal::Builder.new
      builder.append_paths(lib_root.to_s)
      # Stub native-only deps that have no Opal-compatible build at this layer.
      # The gem's Opal consumer (plurimath-js) provides these at runtime.
      builder.stubs += %w[lutaml/model]

      expect { builder.build("omml/opal") }.not_to raise_error
    end
  end
end
