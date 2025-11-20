# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_para_r_pr_track_changes"
require_relative "eg_r_pr_base"
class CTParaRPrOriginal < Lutaml::Model::Serializable
  import_model_attributes :eg_para_r_pr_track_changes
  import_model_attributes :eg_r_pr_base

  xml do
    root "ParaRPrOriginal", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      import_model_mappings :eg_para_r_pr_track_changes
      import_model_mappings :eg_r_pr_base
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_para_r_pr_original)
  end
end

CTParaRPrOriginal.register_class_with_id
