# frozen_string_literal: true
require "lutaml/model"

class AnyURI < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:pattern] = %r{\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https ftp])}\z}
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :any_uri)
  end
end

AnyURI.register_class_with_id
