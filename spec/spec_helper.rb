# frozen_string_literal: true

require "omml"

# omml declares ox and oga as runtime dependencies, and nokogiri arrives
# transitively through lutaml-model -> canon, so all three are always
# installed. lutaml-model's AdapterResolver auto-detects between them, so an
# unpinned run only ever exercises whichever one it settles on. The three do
# not agree -- Ox collapses whitespace where the other two preserve it -- so
# any spec that parses or serialises XML is run against all three.
#
# Tag an example `skip_adapters: %i[ox]` to exempt it from one adapter; the
# reason belongs in a comment above the example.
OMML_XML_ADAPTERS = %i[nokogiri ox oga].freeze

def describe_per_adapter(name, subject: name, **metadata)
  OMML_XML_ADAPTERS.each do |adapter|
    RSpec.describe(subject, "with the #{adapter} adapter", **metadata) do
      before do |example|
        if Array(example.metadata[:skip_adapters]).include?(adapter)
          skip("not supported on the #{adapter} adapter")
        end

        Lutaml::Model::Config.xml_adapter_type = adapter
      end

      it_behaves_like name
    end
  end
end

RSpec.configure do |config|
  # Baseline for specs that do not vary by adapter, matching mml and
  # plurimath. Without it those specs inherit whichever adapter the previous
  # example left set.
  config.before { Lutaml::Model::Config.xml_adapter_type = :nokogiri }

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
