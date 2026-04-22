# frozen_string_literal: true

module Omml
  module Models
    class STStyle < EnumString
      VALUES = %w[
        p
        b
        i
        bi
      ].freeze
    end

    Omml::Configuration.register_model(STStyle)
  end
end
