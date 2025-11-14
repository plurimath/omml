# frozen_string_literal: true
require "lutaml/model"

require_relative "hex_binary"
require_relative "hex_binary"
class STUcharHexNumber < HexBinary
  def self.cast(value, options = {})
    return if value.nil?

    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_uchar_hex_number)
  end
end

STUcharHexNumber.register_class_with_id
