# frozen_string_literal: true
require "lutaml/model"

class STStyle < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("p"), super("b"), super("i"), super("bi")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_style)
  end
end

STStyle.register_class_with_id
