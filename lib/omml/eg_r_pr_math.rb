# frozen_string_literal: true

require_relative "eg_r_pr"
require_relative "ct_r_pr_change"
class EGRPrMath < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    import_model_attributes :eg_r_pr
    attribute :ins, :ct_r_pr_change
    attribute :del, :ct_r_pr_change
  end

  xml do
    no_root
    import_model_mappings :eg_r_pr
    map_element :ins, to: :ins
    map_element :del, to: :del
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_r_pr_math)
  end
end

EGRPrMath.register_class_with_id
