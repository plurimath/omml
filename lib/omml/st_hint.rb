# frozen_string_literal: true
require "lutaml/model"

class STHint < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("default"), super("eastAsia"), super("cs")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_hint)
  end
end

STHint.register_class_with_id
