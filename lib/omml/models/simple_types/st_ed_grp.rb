# frozen_string_literal: true

module Omml
  module Models
    class STEdGrp < EnumString
      VALUES = %w[
        none
        everyone
        administrators
        contributors
        editors
        owners
        current
      ].freeze
    end

    Omml::Configuration.register_model(STEdGrp)
  end
end
