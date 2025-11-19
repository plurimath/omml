# frozen_string_literal: true

require_relative "eg_r_pr_base"
require_relative "ct_r_pr_change"
class EGRPrContent < Lutaml::Model::Serializable
  import_model_attributes :eg_r_pr_base
  attribute :r_pr_change, :ct_r_pr_change, collection: 0..1

  xml do
    no_root

    sequence do
      import_model_mappings :eg_r_pr_base
      map_element :rPrChange, to: :r_pr_change
    end
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_r_pr_content)
  end
end

EGRPrContent.register_class_with_id
