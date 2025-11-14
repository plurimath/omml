# frozen_string_literal: true
require "lutaml/model"

class STPageBorderZOrder < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("front"), super("back")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_page_border_z_order)
  end
end

STPageBorderZOrder.register_class_with_id
