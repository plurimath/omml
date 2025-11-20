# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_block_level_elts"
class CTTxbxContent < Lutaml::Model::Serializable
  import_model_attributes :eg_block_level_elts

  xml do
    root "TxbxContent", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    import_model_mappings :eg_block_level_elts
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_txbx_content)
  end
end

CTTxbxContent.register_class_with_id
