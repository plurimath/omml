# frozen_string_literal: true
require "lutaml/model"

require_relative "token"
require_relative "token"
class STGuid < Token
  def self.cast(value, options = {})
    return if value.nil?

    options[:pattern] = %r{(\{[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}\})}
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_guid)
  end
end

STGuid.register_class_with_id
