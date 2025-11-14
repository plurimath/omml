# frozen_string_literal: true

require "lutaml/model"
class CTGammaTransform < Lutaml::Model::Serializable

  xml do
    root "GammaTransform"
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_gamma_transform)
  end
end

CTGammaTransform.register_class_with_id
