# frozen_string_literal: true

module Omml
  module Models
    class CTDrawing < Lutaml::Model::Serializable
      choice(min: 1, max: Float::INFINITY) do
        attribute :anchor, :ct_anchor, collection: 0..1
        attribute :inline, :ct_inline, collection: 0..1
      end

      xml do
        element "CT_Drawing"

        namespace Omml::Namespace

        map_element :anchor, to: :anchor
        map_element :inline, to: :inline
      end
    end

    Omml::Configuration.register_model(CTDrawing)
  end
end
