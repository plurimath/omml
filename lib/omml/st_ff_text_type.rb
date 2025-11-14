# frozen_string_literal: true
require "lutaml/model"

class STFFTextType < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("regular"), super("number"), super("date"), super("currentTime"), super("currentDate"), super("calculated")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_ff_text_type)
  end
end

STFFTextType.register_class_with_id
