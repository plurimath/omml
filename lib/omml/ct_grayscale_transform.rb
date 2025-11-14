# frozen_string_literal: true

require "lutaml/model"
class CTGrayscaleTransform < Lutaml::Model::Serializable

  xml do
    root "GrayscaleTransform"
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_grayscale_transform)
  end
end

CTGrayscaleTransform.register_class_with_id
