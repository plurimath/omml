# frozen_string_literal: true
require "lutaml/model"

class STCombineBrackets < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("none"), super("round"), super("square"), super("angle"), super("curly")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_combine_brackets)
  end
end

STCombineBrackets.register_class_with_id
