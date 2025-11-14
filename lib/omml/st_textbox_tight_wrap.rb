# frozen_string_literal: true
require "lutaml/model"

class STTextboxTightWrap < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("none"), super("allLines"), super("firstAndLastLine"), super("firstLineOnly"), super("lastLineOnly")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_textbox_tight_wrap)
  end
end

STTextboxTightWrap.register_class_with_id
