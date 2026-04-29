# frozen_string_literal: true

module Omml
  module Models
    class EGOMathElements < Lutaml::Model::Serializable
      choice(min: 1, max: 1) do
        import_model_attributes :eg_o_math_math_elements
        import_model_attributes :eg_run_level_elts
      end

      xml do
        type_name "EG_OMathElements"
        import_model_mappings :eg_o_math_math_elements
        import_model_mappings :eg_run_level_elts
      end
    end

    Omml::Configuration.register_model(EGOMathElements)
  end
end
