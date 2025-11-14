# frozen_string_literal: true
require "lutaml/model"

class STEdGrp < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("none"), super("everyone"), super("administrators"), super("contributors"), super("editors"), super("owners"), super("current")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_ed_grp)
  end
end

STEdGrp.register_class_with_id
