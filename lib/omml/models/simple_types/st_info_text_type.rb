# frozen_string_literal: true

module Omml
  module Models
    class STInfoTextType < EnumString
      VALUES = %w[
        text
        autoText
      ].freeze
    end
  end
end
