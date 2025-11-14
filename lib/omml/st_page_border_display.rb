# frozen_string_literal: true
require "lutaml/model"

class STPageBorderDisplay < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("allPages"), super("firstPage"), super("notFirstPage")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_page_border_display)
  end
end

STPageBorderDisplay.register_class_with_id
