# frozen_string_literal: true

module Omml
  module Models
    class CTAttr < Base
      attribute :uri, :st_string
      attribute :name, :st_string
      attribute :val, :st_string

      xml do
        element "CT_Attr"

        namespace Omml::Namespace

        map_attribute :uri, to: :uri
        map_attribute :name, to: :name
        map_attribute :val, to: :val
      end
    end
  end
end
