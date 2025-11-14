# frozen_string_literal: true
require "lutaml/model"

class HexBinary < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:pattern] = %r{(?-mix:([0-9a-fA-F]{2})*)}
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :hex_binary)
  end
end

HexBinary.register_class_with_id
