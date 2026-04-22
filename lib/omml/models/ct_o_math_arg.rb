# frozen_string_literal: true

module Omml
  module Models
    class CTOMathArg < Lutaml::Model::Serializable
      attribute :arg_pr, :ct_o_math_arg_pr, collection: 0..1
      attribute :t, :ct_text, collection: 0..1
      import_model_attributes :eg_o_math_elements
      attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

      xml do
        element "CT_OMathArg"

        namespace Omml::Namespace
        ordered

        sequence do
          map_element :argPr, to: :arg_pr
          map_element :t, to: :t, render_empty: true
          import_model_mappings :eg_o_math_elements
          map_element :ctrlPr, to: :ctrl_pr
        end
      end
    end

    Omml::Configuration.register_model(CTOMathArg)
  end
end
