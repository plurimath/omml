# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_ftn_pos"
require_relative "ct_num_fmt"
require_relative "eg_ftn_edn_num_props"
class CTFtnProps < Lutaml::Model::Serializable
  attribute :pos, :ct_ftn_pos, collection: 0..1
  attribute :num_fmt, :ct_num_fmt, collection: 0..1
  import_model_attributes :eg_ftn_edn_num_props

  xml do
    root "FtnProps"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :pos, to: :pos
      map_element :numFmt, to: :num_fmt
      import_model_mappings :eg_ftn_edn_num_props
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ftn_props)
  end
end

CTFtnProps.register_class_with_id
