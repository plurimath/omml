# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_r_pr_math"
class CTCtrlPr < Lutaml::Model::Serializable
  import_model_attributes :eg_r_pr_math
  attribute :w_r_pr, :ct_r_pr, collection: 0..1

  xml do
    root "CtrlPr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :rPr, to: :w_r_pr, namespace: "http://schemas.openxmlformats.org/wordprocessingml/2006/main", prefix: "w"
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
