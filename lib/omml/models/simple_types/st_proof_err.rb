# frozen_string_literal: true

module Omml
  module Models
    class STProofErr < EnumString
      VALUES = %w[
        spellStart
        spellEnd
        gramStart
        gramEnd
      ].freeze
    end
  end
end
