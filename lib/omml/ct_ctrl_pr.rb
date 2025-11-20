# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_r_pr_math"
class CTCtrlPr < Lutaml::Model::Serializable
  import_model_attributes :eg_r_pr_math

  xml do
    root "CtrlPr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      import_model_mappings :eg_r_pr_math
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ctrl_pr)
  end
end

CTCtrlPr.register_class_with_id
