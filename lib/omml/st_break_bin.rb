# frozen_string_literal: true
require "lutaml/model"

class STBreakBin < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("before"), super("after"), super("repeat")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_break_bin)
  end
end

STBreakBin.register_class_with_id
