# frozen_string_literal: true
require "lutaml/model"
require_relative "st_hex_color_auto"
require_relative "st_hex_color_rgb"

class STHexColor < Lutaml::Model::Type::Value
  def self.cast(value, options = {})
    return if value.nil?

    register.get_class(:st_hex_color_auto).cast(value, options) ||
      register.get_class(:st_hex_color_rgb).cast(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_hex_color)
  end
end

STHexColor.register_class_with_id
