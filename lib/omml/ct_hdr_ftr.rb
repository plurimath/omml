# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_block_level_elts"
class CTHdrFtr < Lutaml::Model::Serializable
  import_model_attributes :eg_block_level_elts

  xml do
    root "HdrFtr"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    import_model_mappings :eg_block_level_elts
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_hdr_ftr)
  end
end

CTHdrFtr.register_class_with_id
