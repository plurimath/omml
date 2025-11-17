# frozen_string_literal: true

require 'lutaml/model'
require_relative 'omml/version'

module Omml
  class Error < StandardError; end
  REGISTER_ID = :omml

  def self.register_id
    return @register_id if @register_id

    Lutaml::Model::GlobalRegister.register(
      Lutaml::Model::Register.new(REGISTER_ID),
    )
    @register_id = REGISTER_ID
  end

  def self.parse(omml, **options)
    klass = CTOMathPara

    klass.from_xml(
      omml,
      register: extract_register_id(options),
      **options,
    )
  end

  def self.extract_register_id(options)
    return register_id unless options.key?(:register)

    register = options[:register]
    case register
    when Symbol, String then register
    when Lutaml::Model::Register then register.id
    else
      raise ArgumentError, "Invalid register option: #{register.class}"
    end
  end
end

require_relative 'omml/ct_o_math_para'
