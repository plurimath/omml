# frozen_string_literal: true

module Omml
  module Configuration
    # Extended only by Omml::Configuration together with the sibling modules.
    module TypeResolver
      def resolve_type(type_name, context: context_id)
        require_context!(context)

        Lutaml::Model::GlobalContext.resolve_type(type_name, context)
      end

      def root_name_from_document(document)
        root_element_from(document).name.split(":").last
      end

      def resolve_root_class(document, context: context_id)
        resolve_type(
          resolve_root_type(root_name_from_document(document)),
          context: context,
        )
      end

      private

      def root_element_from(document)
        document.root || raise(Omml::Errors::RootElementNotFoundError)
      end

      def resolve_root_type(root_name)
        ROOT_TYPES.fetch(root_name) do
          raise Omml::Errors::UnsupportedRootElementError, root_name
        end
      end
    end
  end
end
