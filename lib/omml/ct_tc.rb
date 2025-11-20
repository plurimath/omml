# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_tc_pr"
require_relative "eg_block_level_elts"
class CTTc < Lutaml::Model::Serializable
  attribute :tc_pr, :ct_tc_pr, collection: 0..1
  import_model_attributes :eg_block_level_elts

  xml do
    root "Tc", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :tcPr, to: :tc_pr
      import_model_mappings :eg_block_level_elts
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tc)
  end
end

CTTc.register_class_with_id
