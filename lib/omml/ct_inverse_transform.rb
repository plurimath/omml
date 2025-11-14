# frozen_string_literal: true

require "lutaml/model"
class CTInverseTransform < Lutaml::Model::Serializable

  xml do
    root "InverseTransform"
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_inverse_transform)
  end
end

CTInverseTransform.register_class_with_id
