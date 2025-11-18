# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_block_level_elts"
require_relative "ct_sect_pr"
class CTBody < Lutaml::Model::Serializable
  import_model_attributes :eg_block_level_elts
  attribute :sect_pr, :ct_sect_pr, collection: 0..1

  xml do
    root "Body"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      import_model_mappings :eg_block_level_elts
      map_element :sectPr, to: :sect_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_body)
  end
end

CTBody.register_class_with_id
