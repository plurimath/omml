# frozen_string_literal: true

module Omml
  module Models
    class CTR < Base
      attribute :r_pr, :ct_rpr, collection: 0..1
      import_model_attributes :eg_word_r_pr
      choice(min: 0, max: Float::INFINITY) do
        import_model_attributes :eg_word_run_inner_content
        import_model_attributes :eg_run_inner_content
      end

      xml do
        element "CT_R"

        namespace Omml::Namespace
        ordered

        sequence do
          map_element :rPr, to: :r_pr
          import_model_mappings :eg_word_r_pr
          import_model_mappings :eg_word_run_inner_content
          import_model_mappings :eg_run_inner_content
        end
      end
    end
  end
end
