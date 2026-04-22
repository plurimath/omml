# frozen_string_literal: true

module Omml
  module Configuration
    # Extended only by Omml::Configuration together with the sibling modules.
    module ModelRegistry
      def register_model(klass, id: nil)
        model_id = (id || model_id_for(klass)).to_sym
        registered_models[model_id] = klass

        if (type_context = context(context_id))
          type_context.registry.register(model_id, klass)
          clear_cache(klass, type_context.id)
        end

        klass
      end

      def model_id_for(klass)
        class_name = klass.name.split("::").last
        prefix = SCHEMA_MODEL_PREFIXES.find do |candidate|
          class_name.start_with?(candidate) && class_name != candidate
        end

        if prefix
          model_name = class_name.delete_prefix(prefix)
          return :"#{prefix.downcase}_#{Lutaml::Model::Utils.snake_case(model_name)}"
        end

        Lutaml::Model::Utils.snake_case(class_name).to_sym
      end

      def registered_models
        @registered_models ||= {}
      end

      private

      def register_models_in(type_context)
        register_id = type_context.id
        registered_models.each do |model_id, klass|
          type_context.registry.register(model_id, klass)
          clear_cache(klass, register_id)
        end

        Omml::TypeSubstitutions.each_alias do |type_name, klass|
          type_context.registry.register(type_name, klass)
        end

        Lutaml::Model::GlobalContext.clear_caches
        type_context
      end

      def clear_cache(klass, register_id)
        klass.instance_variable_set(:@register, register_id)
        klass.clear_cache(register_id) if klass.respond_to?(:clear_cache)
      end
    end
  end
end
