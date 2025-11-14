# frozen_string_literal: true
require "lutaml/model"

require_relative "hex_binary"
require_relative "hex_binary"
class STLongHexNumber < HexBinary
  def self.cast(value, options = {})
    return if value.nil?

    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_long_hex_number)
  end
end

STLongHexNumber.register_class_with_id
