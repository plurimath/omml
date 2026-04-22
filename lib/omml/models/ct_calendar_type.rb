# frozen_string_literal: true

module Omml
  module Models
    class CTCalendarType < Lutaml::Model::Serializable
      attribute :val, :st_calendar_type

      xml do
        element "CT_CalendarType"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTCalendarType)
  end
end
