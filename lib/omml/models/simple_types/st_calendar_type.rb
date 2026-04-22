# frozen_string_literal: true

module Omml
  module Models
    class STCalendarType < EnumString
      VALUES = %w[
        gregorian
        hijri
        hebrew
        taiwan
        japan
        thai
        korea
        saka
        gregorianXlitEnglish
        gregorianXlitFrench
      ].freeze
    end

    Omml::Configuration.register_model(STCalendarType)
  end
end
