# frozen_string_literal: true
require "lutaml/model"

require_relative "token"
require_relative "token"
class STRelFromV < Token
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("margin"), super("page"), super("paragraph"), super("line"), super("topMargin"), super("bottomMargin"), super("insideMargin"), super("outsideMargin")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_rel_from_v)
  end
end

STRelFromV.register_class_with_id
