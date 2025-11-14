# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_content_cell_content"
class CTSdtContentCell < Lutaml::Model::Serializable
  import_model_attributes :eg_content_cell_content

  xml do
    root "SdtContentCell"

    import_model_mappings :eg_content_cell_content
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sdt_content_cell)
  end
end

CTSdtContentCell.register_class_with_id
