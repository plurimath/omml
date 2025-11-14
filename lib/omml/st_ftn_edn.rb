# frozen_string_literal: true
require "lutaml/model"

class STFtnEdn < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("normal"), super("separator"), super("continuationSeparator"), super("continuationNotice")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_ftn_edn)
  end
end

STFtnEdn.register_class_with_id
