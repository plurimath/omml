# frozen_string_literal: true

module Omml
  class WordprocessingNamespace < Lutaml::Xml::W3c::XmlNamespace
    uri "http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    prefix_default "w"
    # OOXML schema is elementFormDefault="qualified": every WordprocessingML
    # element (rPr, rFonts, i, t, etc.) carries the w: prefix from this
    # namespace's prefix_default. Without this, the serializer emits
    # unprefixed children that resolve to no namespace when nested inside
    # an Omml parent (e.g. <w:rPr> inside <m:ctrlPr>), and Word rejects
    # the file as unreadable.
    element_form_default :qualified
    attribute_form_default :qualified
  end
end
