# frozen_string_literal: true

module Omml
  module Models
    class STThemeColor < EnumString
      VALUES = %w[
        dark1
        light1
        dark2
        light2
        accent1
        accent2
        accent3
        accent4
        accent5
        accent6
        hyperlink
        followedHyperlink
        none
        background1
        text1
        background2
        text2
      ].freeze
    end

    Omml::Configuration.register_model(STThemeColor)
  end
end
