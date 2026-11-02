# frozen_string_literal: true

module Omml
  class WordprocessingNamespace < Lutaml::Xml::W3c::XmlNamespace
    uri "http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    prefix_default "w"
    # Per wml.xsd: elementFormDefault="qualified"
    element_form_default :qualified
    attribute_form_default :qualified
  end
end
