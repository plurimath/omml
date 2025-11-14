# frozen_string_literal: true
require "lutaml/model"

class STTextAlignment < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("top"), super("center"), super("baseline"), super("bottom"), super("auto")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_text_alignment)
  end
end

STTextAlignment.register_class_with_id
