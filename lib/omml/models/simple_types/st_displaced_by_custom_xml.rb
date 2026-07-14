# frozen_string_literal: true

module Omml
  module Models
    class STDisplacedByCustomXml < EnumString
      VALUES = %w[
        next
        prev
      ].freeze
    end
  end
end
