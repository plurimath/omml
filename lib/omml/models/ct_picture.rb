# frozen_string_literal: true

module Omml
  module Models
    class CTPicture < CTPictureBase
      attribute :movie, :ct_rel, collection: 0..1
      attribute :control, :ct_control, collection: 0..1

      xml do
        element "CT_Picture"

        namespace Omml::Namespace

        sequence do
          map_element :movie, to: :movie
          map_element :control, to: :control
        end
      end
    end

    Omml::Configuration.register_model(CTPicture)
  end
end
