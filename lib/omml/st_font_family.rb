# frozen_string_literal: true
require "lutaml/model"

class STFontFamily < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("decorative"), super("modern"), super("roman"), super("script"), super("swiss"), super("auto")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_font_family)
  end
end

STFontFamily.register_class_with_id
