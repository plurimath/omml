# frozen_string_literal: true
require "lutaml/model"

class STGeomGuideFormula < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_geom_guide_formula)
  end
end

STGeomGuideFormula.register_class_with_id
