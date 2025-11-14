# frozen_string_literal: true
require "lutaml/model"

class STHighlightColor < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("black"), super("blue"), super("cyan"), super("green"), super("magenta"), super("red"), super("yellow"), super("white"), super("darkBlue"), super("darkCyan"), super("darkGreen"), super("darkMagenta"), super("darkRed"), super("darkYellow"), super("darkGray"), super("lightGray"), super("none")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_highlight_color)
  end
end

STHighlightColor.register_class_with_id
