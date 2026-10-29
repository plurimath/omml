# frozen_string_literal: true

module Omml
  module Models
    class STFldCharType < EnumString
      VALUES = %w[
        begin
        separate
        end
      ].freeze
    end
  end
end
