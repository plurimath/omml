# frozen_string_literal: true

module Omml
  module Models
    class CTRunTrackChange < CTTrackChange
      choice(min: 0, max: Float::INFINITY) do
        import_model_attributes :eg_content_run_content
        import_model_attributes :eg_o_math_math_elements
      end

      xml do
        element "CT_RunTrackChange"

        namespace Omml::Namespace

        import_model_mappings :eg_content_run_content
        import_model_mappings :eg_o_math_math_elements
      end
    end

    Omml::Configuration.register_model(CTRunTrackChange)
  end
end
