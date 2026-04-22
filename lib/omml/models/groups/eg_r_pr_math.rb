# frozen_string_literal: true

require_relative "eg_r_pr"
require_relative "../ct_r_pr_change"
module Omml
  module Models
    class EGRPrMath < Lutaml::Model::Serializable
      choice(min: 1, max: 1) do
        import_model_attributes :eg_r_pr
        attribute :ins, :ct_r_pr_change
        attribute :del, :ct_r_pr_change
      end

      xml do
        type_name "EG_RPrMath"
        namespace Omml::WordprocessingNamespace
        import_model_mappings :eg_r_pr
        map_element :ins, to: :ins, render_empty: true
        map_element :del, to: :del, render_empty: true
      end
    end

    Omml::Configuration.register_model(EGRPrMath)
  end
end
