# frozen_string_literal: true
require "lutaml/model"

require_relative "token"
require_relative "token"
class STGeomGuideName < Token
  def self.cast(value, options = {})
    return if value.nil?

    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_geom_guide_name)
  end
end

STGeomGuideName.register_class_with_id
