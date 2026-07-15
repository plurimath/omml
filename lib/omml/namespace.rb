# frozen_string_literal: true

module Omml
  class Namespace < Lutaml::Xml::W3c::XmlNamespace
    uri "http://schemas.openxmlformats.org/officeDocument/2006/math"
    prefix_default "m"
    # OOXML schema declares elementFormDefault="qualified": every math
    # element (oMath, sSub, r, t, etc.) MUST carry the m: prefix from
    # this namespace's prefix_default. Without this, the serializer
    # emits unprefixed children that resolve to no namespace at all
    # (the document root declares xmlns:m, not a default xmlns), and
    # Word rejects the file as unreadable.
    element_form_default :qualified
    attribute_form_default :qualified
  end
end
