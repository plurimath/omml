# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_p_content"
class CTSdtContentRun < Lutaml::Model::Serializable
  import_model_attributes :eg_p_content

  xml do
    root "SdtContentRun", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    import_model_mappings :eg_p_content
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sdt_content_run)
  end
end

CTSdtContentRun.register_class_with_id
