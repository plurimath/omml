# frozen_string_literal: true

module Omml
  module Models
    class STRelFromV < Token
      VALUES = %w[
        margin
        page
        paragraph
        line
        topMargin
        bottomMargin
        insideMargin
        outsideMargin
      ].freeze
    end

    Omml::Configuration.register_model(STRelFromV)
  end
end
