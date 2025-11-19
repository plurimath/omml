# frozen_string_literal: true

require 'lutaml/model'
require_relative 'omml/version'

module Omml
  class Error < StandardError; end
  REGISTER_ID = :omml
  ROOT_ELEMENT_NAME_REGEX = %r{\A\s*\<(\w+:)?(?<element_name>\w+)}

  def self.register_id
    return @register_id if @register_id

    Lutaml::Model::GlobalRegister.register(
      Lutaml::Model::Register.new(REGISTER_ID),
    )
    @register_id = REGISTER_ID
  end

  def self.parse(omml, **options)
    if omml.match(ROOT_ELEMENT_NAME_REGEX) && element_name = Regexp.last_match(:element_name)
      klass = element_name == "oMath" ? CTOMath : CTOMathPara
    else
      raise ArgumentError, "Unable to determine OMML root element"
    end

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
