# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_o_math_arg_pr"
require_relative "eg_o_math_elements"
require_relative "ct_ctrl_pr"
class CTOMathArg < Lutaml::Model::Serializable
  attribute :arg_pr, :ct_o_math_arg_pr, collection: 0..1
  import_model_attributes :eg_o_math_elements
  attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

  xml do
    root "OMathArg", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :argPr, to: :arg_pr
      import_model_mappings :eg_o_math_elements
      map_element :ctrlPr, to: :ctrl_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_o_math_arg)
  end
end

CTOMathArg.register_class_with_id
