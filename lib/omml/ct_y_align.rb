# frozen_string_literal: true

require "lutaml/model"
require_relative "st_y_align"
class CTYAlign < Lutaml::Model::Serializable
  attribute :val, :st_y_align

  xml do
    root "YAlign"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_y_align)
  end
end

CTYAlign.register_class_with_id
