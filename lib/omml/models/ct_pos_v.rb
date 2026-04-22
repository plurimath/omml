# frozen_string_literal: true

module Omml
  module Models
    class CTPosV < Lutaml::Model::Serializable
      choice(min: 1, max: 1) do
        attribute :align, :st_align_v, collection: 1..1
        attribute :pos_offset, :st_position_offset, collection: 1..1
      end
      attribute :relative_from, :st_rel_from_v

      xml do
        element "CT_PosV"

        namespace Omml::Namespace

        sequence do
          map_element :align, to: :align, render_empty: true
          map_element :posOffset, to: :pos_offset, render_empty: true
        end
        map_attribute :relativeFrom, to: :relative_from
      end
    end

    Omml::Configuration.register_model(CTPosV)
  end
end
