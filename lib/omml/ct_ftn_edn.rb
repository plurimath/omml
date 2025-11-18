# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_block_level_elts"
require_relative "st_ftn_edn"
require_relative "st_decimal_number"
class CTFtnEdn < Lutaml::Model::Serializable
  import_model_attributes :eg_block_level_elts
  attribute :type, :st_ftn_edn
  attribute :id, :st_decimal_number

  xml do
    root "FtnEdn"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      import_model_mappings :eg_block_level_elts
    end
    map_attribute :type, to: :type
    map_attribute :id, to: :id
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ftn_edn)
  end
end

CTFtnEdn.register_class_with_id
