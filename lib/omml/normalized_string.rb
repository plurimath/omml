# frozen_string_literal: true
require "lutaml/model"

class NormalizedString < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    value = value.gsub(/[\r\n\t]/, ' ')
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :normalized_string)
  end
end

NormalizedString.register_class_with_id
