# frozen_string_literal: true

require "lutaml/model"
require_relative "st_merge"
class CTVMerge < Lutaml::Model::Serializable
  attribute :val, :st_merge

  xml do
    root "VMerge"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_v_merge)
  end
end

CTVMerge.register_class_with_id
