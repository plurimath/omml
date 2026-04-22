# frozen_string_literal: true

require_relative "eg_r_pr_base"
require_relative "../ct_r_pr_change"
module Omml
  module Models
    class EGRPrContent < Lutaml::Model::Serializable
      import_model_attributes :eg_r_pr_base
      attribute :r_pr_change, :ct_r_pr_change, collection: 0..1

      xml do
        type_name "EG_RPrContent"
        namespace Omml::WordprocessingNamespace
        import_model_mappings :eg_r_pr_base
        map_element :rPrChange, to: :r_pr_change
      end
    end

    Omml::Configuration.register_model(EGRPrContent)
  end
end
