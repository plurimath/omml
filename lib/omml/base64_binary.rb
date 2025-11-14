# frozen_string_literal: true
require "lutaml/model"

class Base64Binary < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:pattern] = %r{(?-mix:\A([A-Za-z0-9+\/]+={0,2}|\s)*\z)}
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :base64_binary)
  end
end

Base64Binary.register_class_with_id
