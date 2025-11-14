# frozen_string_literal: true
require "lutaml/model"

class STXAlign < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("left"), super("center"), super("right")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_x_align)
  end
end

STXAlign.register_class_with_id
