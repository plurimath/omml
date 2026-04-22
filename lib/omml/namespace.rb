# frozen_string_literal: true

module Omml
  class Namespace < Lutaml::Xml::W3c::XmlNamespace
    uri "http://schemas.openxmlformats.org/officeDocument/2006/math"
    prefix_default "m"
    attribute_form_default :qualified
  end
end
