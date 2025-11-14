# frozen_string_literal: true
require "lutaml/model"

require_relative "token"
require_relative "token"
class STPathFillMode < Token
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("none"), super("norm"), super("lighten"), super("lightenLess"), super("darken"), super("darkenLess")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_path_fill_mode)
  end
end

STPathFillMode.register_class_with_id
