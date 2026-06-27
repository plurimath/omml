# frozen_string_literal: true

module Omml
  module Configuration
    autoload :Adapter, "omml/configuration/adapter"
    autoload :ContextRegistry, "omml/configuration/context_registry"
    autoload :ModelRegistry, "omml/configuration/model_registry"
    autoload :TypeResolver, "omml/configuration/type_resolver"

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
