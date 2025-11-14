# frozen_string_literal: true
require "lutaml/model"

require_relative "token"
require_relative "token"
class STAlignH < Token
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("left"), super("right"), super("center"), super("inside"), super("outside")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_align_h)
  end
end

STAlignH.register_class_with_id
