# frozen_string_literal: true

module Omml
  module Models
    class STLimLoc < EnumString
      VALUES = %w[
        undOvr
        subSup
      ].freeze
    end

    Omml::Configuration.register_model(STLimLoc)
  end
end
