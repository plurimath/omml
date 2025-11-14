# frozen_string_literal: true

require "lutaml/model"
class CTEmpty < Lutaml::Model::Serializable

  xml do
    root "Empty"
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_empty)
  end
end

CTEmpty.register_class_with_id
