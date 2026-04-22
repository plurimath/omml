# frozen_string_literal: true

module Omml
  module Models
    class CTTrackChangeNumbering < CTTrackChange
      attribute :original, :st_string

      xml do
        element "CT_TrackChangeNumbering"

        namespace Omml::Namespace

        map_attribute :original, to: :original
      end
    end

    Omml::Configuration.register_model(CTTrackChangeNumbering)
  end
end
