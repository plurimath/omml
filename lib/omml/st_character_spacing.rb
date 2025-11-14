# frozen_string_literal: true
require "lutaml/model"

class STCharacterSpacing < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("doNotCompress"), super("compressPunctuation"), super("compressPunctuationAndJapaneseKana")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_character_spacing)
  end
end

STCharacterSpacing.register_class_with_id
