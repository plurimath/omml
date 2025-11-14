# frozen_string_literal: true
require "lutaml/model"

class STSdtDateMappingType < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("text"), super("date"), super("dateTime")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_sdt_date_mapping_type)
  end
end

STSdtDateMappingType.register_class_with_id
