# frozen_string_literal: true

require "omml"

# Pin the XML adapter when OMML_XML_ADAPTER is set, so the suite can be run
# against each adapter omml declares. Unset, lutaml-model's AdapterResolver
# auto-detects, which means an unpinned run only ever exercises whichever
# adapter happens to be installed.
if (adapter = ENV.fetch("OMML_XML_ADAPTER", nil))
  Lutaml::Model::Config.xml_adapter_type = adapter.to_sym
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
