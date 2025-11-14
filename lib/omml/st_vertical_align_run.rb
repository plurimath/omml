# frozen_string_literal: true
require "lutaml/model"

class STVerticalAlignRun < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("baseline"), super("superscript"), super("subscript")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_vertical_align_run)
  end
end

STVerticalAlignRun.register_class_with_id
