# frozen_string_literal: true
require "lutaml/model"

class STTextEffect < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("blinkBackground"), super("lights"), super("antsBlack"), super("antsRed"), super("shimmer"), super("sparkle"), super("none")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_text_effect)
  end
end

STTextEffect.register_class_with_id
