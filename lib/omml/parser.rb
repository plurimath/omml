# frozen_string_literal: true

module Omml
  module Parser
    extend self

    def parse(input, context: Omml::Configuration.context_id)
      context_id = prepare_context(context)
      document = parse_document(input)
      root_class = Omml::Configuration.resolve_root_class(document,
                                                          context: context_id)
      root_class.of_xml(document, register: context_id)
    end

    def root_name(input)
      Omml::Configuration.root_name_from_document(parse_document(input))
    end

    private

    def prepare_context(context)
      context_id = context.to_sym

      if context_id == Omml::Configuration.context_id
        Omml::Configuration.populate_context! unless Omml::Configuration.context(context_id)
      else
        Omml::Configuration.require_context!(context_id)
      end

      context_id
    end

    def parse_document(input)
      Omml::Configuration.xml_adapter.parse(input)
    rescue Lutaml::Model::InvalidFormatError => e
      raise Omml::Errors::InvalidXmlError, e.message
    end
  end
end
