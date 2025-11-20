# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_r_pr_content"
class CTRPr < Lutaml::Model::Serializable
  import_model_attributes :eg_r_pr_content

  xml do
    root "rPr", ordered: true
    namespace  "http://schemas.openxmlformats.org/wordprocessingml/2006/main", "w"

    sequence do
      import_model_mappings :eg_r_pr_content
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_r_pr)
  end
end

CTRPr.register_class_with_id
