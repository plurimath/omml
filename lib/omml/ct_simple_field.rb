# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_text"
require_relative "eg_p_content"
require_relative "st_string"
require_relative "st_on_off"
class CTSimpleField < Lutaml::Model::Serializable
  attribute :fld_data, :ct_text, collection: 0..1
  import_model_attributes :eg_p_content
  attribute :instr, :st_string
  attribute :fld_lock, :st_on_off
  attribute :dirty, :st_on_off

  xml do
    root "SimpleField"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :fldData, to: :fld_data
      import_model_mappings :eg_p_content
    end
    map_attribute :instr, to: :instr
    map_attribute :fldLock, to: :fld_lock
    map_attribute :dirty, to: :dirty
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_simple_field)
  end
end

CTSimpleField.register_class_with_id
