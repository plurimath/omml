# frozen_string_literal: true

module Omml
  module Models
    class STShp < EnumString
      VALUES = %w[
        centered
        match
      ].freeze
    end
  end
end
