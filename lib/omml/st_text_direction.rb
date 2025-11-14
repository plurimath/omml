# frozen_string_literal: true
require "lutaml/model"

class STTextDirection < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("lrTb"), super("tbRl"), super("btLr"), super("lrTbV"), super("tbRlV"), super("tbLrV")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_text_direction)
  end
end

STTextDirection.register_class_with_id
