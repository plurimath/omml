# frozen_string_literal: true
require "lutaml/model"

require_relative "token"
require_relative "token"
class STSchemeColorVal < Token
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("bg1"), super("tx1"), super("bg2"), super("tx2"), super("accent1"), super("accent2"), super("accent3"), super("accent4"), super("accent5"), super("accent6"), super("hlink"), super("folHlink"), super("phClr"), super("dk1"), super("lt1"), super("dk2"), super("lt2")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_scheme_color_val)
  end
end

STSchemeColorVal.register_class_with_id
