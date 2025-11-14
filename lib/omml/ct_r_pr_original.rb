# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_r_pr_base"
class CTRPrOriginal < Lutaml::Model::Serializable
  import_model_attributes :eg_r_pr_base

  xml do
    root "RPrOriginal"

    sequence do
      import_model_mappings :eg_r_pr_base
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_r_pr_original)
  end
end

CTRPrOriginal.register_class_with_id
