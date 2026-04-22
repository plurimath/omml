# frozen_string_literal: true

module Omml
  module Models
    class CTSdtEndPr < Lutaml::Model::Serializable
      choice(min: 1, max: Float::INFINITY) do
        attribute :r_pr, :ct_r_pr, collection: 0..1
      end

      xml do
        element "CT_SdtEndPr"

        namespace Omml::Namespace

        map_element :rPr, to: :r_pr
      end
    end

    Omml::Configuration.register_model(CTSdtEndPr)
  end
end
