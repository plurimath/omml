# frozen_string_literal: true

module Omml
  module Models
    class CTObject < CTPictureBase
      attribute :control, :ct_control, collection: 0..1
      attribute :dxa_orig, :st_twips_measure
      attribute :dya_orig, :st_twips_measure

      xml do
        element "CT_Object"

        namespace Omml::Namespace

        sequence do
          map_element :control, to: :control
        end
        map_attribute :dxaOrig, to: :dxa_orig
        map_attribute :dyaOrig, to: :dya_orig
      end
    end

    Omml::Configuration.register_model(CTObject)
  end
end
