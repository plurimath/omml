# frozen_string_literal: true

module Omml
  module Models
    # WordprocessingML text type, parallel to CTText (math).
    # Per OOXML schema, `<w:delText>`, `<w:instrText>`, and
    # `<w:delInstrText>` inside a math run (`<m:r>`) resolve to the
    # wordprocessing `CT_Text`, not the math one (`<m:t>`).
    #
    # Behavior is identical to CTText (string content + `xml:space`
    # attribute); only the XML namespace differs.
    class CTWordprocessingText < Base
      attribute :content, :st_string
      attribute :space, ::Lutaml::Xml::W3c::XmlSpaceType

      xml do
        element "CT_Text"

        namespace Omml::WordprocessingNamespace

        map_content to: :content
        map_attribute :space, to: :space
      end
    end
  end
end
