# frozen_string_literal: true

require_relative "configuration/adapter"
require_relative "configuration/context_registry"
require_relative "configuration/model_registry"
require_relative "configuration/type_resolver"

module Omml
  module Configuration
    extend Adapter
    extend ContextRegistry
    extend ModelRegistry
    extend TypeResolver

    SCHEMA_MODEL_PREFIXES = %w[CT EG ST].freeze
    ROOT_TYPES = {
      "oMath" => :o_math,
      "oMathPara" => :o_math_para,
    }.freeze

    def self.context_id
      :omml
    end
  end
end
