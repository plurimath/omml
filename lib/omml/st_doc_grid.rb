# frozen_string_literal: true
require "lutaml/model"

class STDocGrid < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("default"), super("lines"), super("linesAndChars"), super("snapToChars")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_doc_grid)
  end
end

STDocGrid.register_class_with_id
