# frozen_string_literal: true

require "lutaml/model"
require_relative "st_merge"
class CTHMerge < Lutaml::Model::Serializable
  attribute :val, :st_merge

  xml do
    root "HMerge"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_h_merge)
  end
end

CTHMerge.register_class_with_id
