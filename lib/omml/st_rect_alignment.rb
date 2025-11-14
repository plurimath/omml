# frozen_string_literal: true
require "lutaml/model"

require_relative "token"
require_relative "token"
class STRectAlignment < Token
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("tl"), super("t"), super("tr"), super("l"), super("ctr"), super("r"), super("bl"), super("b"), super("br")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_rect_alignment)
  end
end

STRectAlignment.register_class_with_id
