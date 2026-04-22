# frozen_string_literal: true

require_relative "../ct_r_pr"

module Omml
  module Models
    class EGWordRPr < Lutaml::Model::Serializable
      attribute :word_r_pr, :ct_r_pr, collection: 0..1

      xml do
        type_name "EG_WordRPr"
        namespace Omml::WordprocessingNamespace
        map_element :rPr, to: :word_r_pr
      end
    end

    Omml::Configuration.register_model(EGWordRPr)
  end
end
