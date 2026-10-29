# frozen_string_literal: true

module Omml
  module Models
    class STBrType < EnumString
      VALUES = %w[
        page
        column
        textWrapping
      ].freeze
    end
  end
end
