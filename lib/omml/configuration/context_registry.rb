# frozen_string_literal: true

module Omml
  module Configuration
    # Extended only by Omml::Configuration together with the sibling modules.
    module ContextRegistry
      def context(id = context_id)
        Lutaml::Model::GlobalContext.context(id.to_sym)
      end

      def create_context(id:, registry: nil, fallback_to: [context_id],
                         substitutions: [])
        normalized_id = normalize_context_id(id)
        if default_context_id?(normalized_id)
          return create_default_context(registry, fallback_to,
                                        substitutions)
        end

        create_custom_context(
          id: normalized_id, registry: registry,
          fallback_to: fallback_to, substitutions: substitutions
        )
      end

      def populate_context!
        # Trigger the model manifest autoload before replaying registrations.
        Omml.const_get(:Models)
        reset_context!
        register_models_in(populate_base_context)
      end

      def require_context!(id = context_id)
        normalized_id = id.to_sym
        type_context = context(normalized_id)
        return type_context if type_context

        raise Omml::Errors::MissingContextError, normalized_id
      end

      def reset_context!(id: context_id)
        normalized_id = normalize_context_id(id)
        existing_context = Lutaml::Model::GlobalContext.context(normalized_id)
        return unless existing_context

        Lutaml::Model::GlobalContext.unregister_context(normalized_id)
      end

      private

      def default_context_id?(id)
        id == context_id
      end

      def create_default_context(registry, fallback_to, substitutions)
        unless default_context_options?(registry, fallback_to, substitutions)
          raise ArgumentError,
                "create_context cannot customize the default " \
                ":#{context_id} context; use populate_context! to rebuild it."
        end

        populate_context!
      end

      def default_context_options?(registry, fallback_to, substitutions)
        registry.nil? &&
          normalize_fallbacks(fallback_to) == [context_id] &&
          Array(substitutions).empty?
      end

      def create_custom_context(id:, registry:, fallback_to:, substitutions:)
        reset_context!(id: id)
        create_type_context(
          id: id,
          registry: registry || Lutaml::Model::TypeRegistry.new,
          fallback_to: prepare_fallback_contexts(fallback_to),
          substitutions: substitutions,
        )
      end

      def populate_base_context
        base_type_context.tap { bind_namespace!(context_id) }
      end

      def create_type_context(id:, registry:, fallback_to:, substitutions: [])
        Lutaml::Model::GlobalContext.create_context(
          id: id,
          registry: registry,
          fallback_to: Array(fallback_to),
          substitutions: substitutions,
        ).tap do
          Lutaml::Model::GlobalContext.clear_caches
        end
      end

      def base_type_context
        create_type_context(
          id: context_id,
          registry: Lutaml::Model::TypeRegistry.new,
          fallback_to: [:default],
        )
      end

      def prepare_fallback_contexts(fallback_to)
        normalize_fallbacks(fallback_to).tap do |fallbacks|
          populate_context! if populate_fallback_context?(fallbacks)
        end
      end

      def populate_fallback_context?(fallbacks)
        fallbacks.include?(context_id) && !context(context_id)
      end

      def normalize_fallbacks(fallback_to)
        Array(fallback_to).map do |fallback|
          normalize_context_id(fallback)
        end
      end

      def normalize_context_id(id)
        id.to_sym
      end

      def bind_namespace!(id)
        Lutaml::Model::GlobalContext.bind_register_to_namespace(
          id,
          Omml::Namespace.uri,
        )
      end
    end
  end
end
