# frozen_string_literal: true
require "lutaml/model"

class STColorSchemeIndex < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("dark1"), super("light1"), super("dark2"), super("light2"), super("accent1"), super("accent2"), super("accent3"), super("accent4"), super("accent5"), super("accent6"), super("hyperlink"), super("followedHyperlink")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_color_scheme_index)
  end
end

STColorSchemeIndex.register_class_with_id
