# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_content_row_content"
class CTSdtContentRow < Lutaml::Model::Serializable
  import_model_attributes :eg_content_row_content

  xml do
    root "SdtContentRow", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    import_model_mappings :eg_content_row_content
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sdt_content_row)
  end
end

CTSdtContentRow.register_class_with_id
