# frozen_string_literal: true
require "lutaml/model"

class STTheme < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("majorEastAsia"), super("majorBidi"), super("majorAscii"), super("majorHAnsi"), super("minorEastAsia"), super("minorBidi"), super("minorAscii"), super("minorHAnsi")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_theme)
  end
end

STTheme.register_class_with_id
