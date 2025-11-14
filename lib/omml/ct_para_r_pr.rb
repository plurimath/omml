# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_para_r_pr_track_changes"
require_relative "eg_r_pr_base"
require_relative "ct_para_r_pr_change"
class CTParaRPr < Lutaml::Model::Serializable
  import_model_attributes :eg_para_r_pr_track_changes
  import_model_attributes :eg_r_pr_base
  attribute :r_pr_change, :ct_para_r_pr_change, collection: 0..1

  xml do
    root "ParaRPr"

    sequence do
      import_model_mappings :eg_para_r_pr_track_changes
      import_model_mappings :eg_r_pr_base
      map_element :rPrChange, to: :r_pr_change
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_para_r_pr)
  end
end

CTParaRPr.register_class_with_id
