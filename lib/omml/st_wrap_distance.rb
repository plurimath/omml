# frozen_string_literal: true
require "lutaml/model"

require_relative "unsigned_int"
require_relative "unsigned_int"
class STWrapDistance < UnsignedInt
  def self.cast(value, options = {})
    return if value.nil?

    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_wrap_distance)
  end
end

STWrapDistance.register_class_with_id
