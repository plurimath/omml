# frozen_string_literal: true
require "lutaml/model"
require_relative "st_lang_code"
require_relative "st_string"

class STLang < Lutaml::Model::Type::Value
  def self.cast(value, options = {})
    return if value.nil?

    register.get_class(:st_lang_code).cast(value, options) ||
      register.get_class(:st_string).cast(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_lang)
  end
end

STLang.register_class_with_id
