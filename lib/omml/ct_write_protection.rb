# frozen_string_literal: true

require "lutaml/model"
require_relative "st_on_off"
require_relative "st_crypt_prov"
require_relative "st_alg_class"
require_relative "st_alg_type"
require_relative "st_decimal_number"
require_relative "st_string"
require_relative "st_long_hex_number"
require_relative "base64_binary"
class CTWriteProtection < Lutaml::Model::Serializable
  attribute :recommended, :st_on_off
  attribute :crypt_provider_type, :st_crypt_prov
  attribute :crypt_algorithm_class, :st_alg_class
  attribute :crypt_algorithm_type, :st_alg_type
  attribute :crypt_algorithm_sid, :st_decimal_number
  attribute :crypt_spin_count, :st_decimal_number
  attribute :crypt_provider, :st_string
  attribute :alg_id_ext, :st_long_hex_number
  attribute :alg_id_ext_source, :st_string
  attribute :crypt_provider_type_ext, :st_long_hex_number
  attribute :crypt_provider_type_ext_source, :st_string
  attribute :hash, :base64_binary
  attribute :salt, :base64_binary

  xml do
    root "WriteProtection"

    map_attribute :recommended, to: :recommended
    map_attribute :cryptProviderType, to: :crypt_provider_type
    map_attribute :cryptAlgorithmClass, to: :crypt_algorithm_class
    map_attribute :cryptAlgorithmType, to: :crypt_algorithm_type
    map_attribute :cryptAlgorithmSid, to: :crypt_algorithm_sid
    map_attribute :cryptSpinCount, to: :crypt_spin_count
    map_attribute :cryptProvider, to: :crypt_provider
    map_attribute :algIdExt, to: :alg_id_ext
    map_attribute :algIdExtSource, to: :alg_id_ext_source
    map_attribute :cryptProviderTypeExt, to: :crypt_provider_type_ext
    map_attribute :cryptProviderTypeExtSource, to: :crypt_provider_type_ext_source
    map_attribute :hash, to: :hash
    map_attribute :salt, to: :salt
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_write_protection)
  end
end

CTWriteProtection.register_class_with_id
