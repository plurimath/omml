# frozen_string_literal: true

require_relative "../ct_r_pr"
module Omml
  module Models
    class EGRPr < Lutaml::Model::Serializable
      attribute :r_pr, :ct_r_pr, collection: 0..1

      xml do
        type_name "EG_RPr"
        namespace Omml::WordprocessingNamespace
        map_element :rPr, to: :r_pr
      end
    end

    Omml::Configuration.register_model(EGRPr)
  end
end
