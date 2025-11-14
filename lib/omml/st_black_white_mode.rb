# frozen_string_literal: true
require "lutaml/model"

require_relative "token"
require_relative "token"
class STBlackWhiteMode < Token
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("clr"), super("auto"), super("gray"), super("ltGray"), super("invGray"), super("grayWhite"), super("blackGray"), super("blackWhite"), super("black"), super("white"), super("hidden")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_black_white_mode)
  end
end

STBlackWhiteMode.register_class_with_id
