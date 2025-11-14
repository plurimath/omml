# frozen_string_literal: true
require "lutaml/model"

class Token < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:pattern] = %r{(?-mix:\A[^\t\n\f\r ]+(?: [^\t\n\f\r ]+)*\z)}
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :token)
  end
end

Token.register_class_with_id
