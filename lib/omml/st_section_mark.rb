# frozen_string_literal: true
require "lutaml/model"

class STSectionMark < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("nextPage"), super("nextColumn"), super("continuous"), super("evenPage"), super("oddPage")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_section_mark)
  end
end

STSectionMark.register_class_with_id
