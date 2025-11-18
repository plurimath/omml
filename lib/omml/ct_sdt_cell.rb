# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_sdt_pr"
require_relative "ct_sdt_end_pr"
require_relative "ct_sdt_content_cell"
class CTSdtCell < Lutaml::Model::Serializable
  attribute :sdt_pr, :ct_sdt_pr, collection: 0..1
  attribute :sdt_end_pr, :ct_sdt_end_pr, collection: 0..1
  attribute :sdt_content, :ct_sdt_content_cell, collection: 0..1

  xml do
    root "SdtCell"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :sdtPr, to: :sdt_pr
      map_element :sdtEndPr, to: :sdt_end_pr
      map_element :sdtContent, to: :sdt_content
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sdt_cell)
  end
end

CTSdtCell.register_class_with_id
