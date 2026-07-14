# frozen_string_literal: true

module Omml
  module Models
    class EGRPrContent < Base
      import_model_attributes :eg_r_pr_base
      attribute :r_pr_change, :ct_r_pr_change, collection: 0..1

      xml do
        type_name "EG_RPrContent"
        namespace Omml::WordprocessingNamespace
        import_model_mappings :eg_r_pr_base
        map_element :rPrChange, to: :r_pr_change
      end
    end
  end
end
