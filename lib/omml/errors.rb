# frozen_string_literal: true

module Omml
  module Errors
    autoload :BaseError, "omml/errors/base_error"
    autoload :InvalidXmlError, "omml/errors/invalid_xml_error"
    autoload :MissingContextError, "omml/errors/missing_context_error"
    autoload :RootElementNotFoundError,
             "omml/errors/root_element_not_found_error"
    autoload :UnsupportedRootElementError,
             "omml/errors/unsupported_root_element_error"
    autoload :XmlAdapterNotConfiguredError,
             "omml/errors/xml_adapter_not_configured_error"
  end
end
