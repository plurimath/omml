# frozen_string_literal: true

require "lutaml/model"
class CTShapeDefaults < Lutaml::Model::Serializable
  choice(min: 1, max: Float::INFINITY) do
  end

  xml do
    root "ShapeDefaults"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_shape_defaults)
  end
end

CTShapeDefaults.register_class_with_id
