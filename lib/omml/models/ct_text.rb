# frozen_string_literal: true

module Omml
  module Models
    class CTText < Base
      attribute :content, :st_string
      attribute :space, ::Lutaml::Xml::W3c::XmlSpaceType
      xml do
        element "CT_Text"

        namespace Omml::Namespace
        map_content to: :content
        map_attribute :space, to: :space
      end
    end
  end
end
