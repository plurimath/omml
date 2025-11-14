# frozen_string_literal: true
require "lutaml/model"

class Language < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:pattern] = %r{(?-mix:\A[a-zA-Z]{1,8}(-[a-zA-Z0-9]{1,8})*\z)}
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :language)
  end
end

Language.register_class_with_id
