# frozen_string_literal: true

module Omml
  class Namespace < Lutaml::Xml::W3c::XmlNamespace
    uri "http://schemas.openxmlformats.org/officeDocument/2006/math"
    prefix_default "m"
    # Per shared-math.xsd: elementFormDefault="qualified"
    element_form_default :qualified
    attribute_form_default :qualified
  end
end
