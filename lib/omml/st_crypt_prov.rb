# frozen_string_literal: true
require "lutaml/model"

class STCryptProv < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("rsaAES"), super("rsaFull")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_crypt_prov)
  end
end

STCryptProv.register_class_with_id
