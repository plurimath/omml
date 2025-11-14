# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_content_block_content"
class CTSdtContentBlock < Lutaml::Model::Serializable
  import_model_attributes :eg_content_block_content

  xml do
    root "SdtContentBlock"

    import_model_mappings :eg_content_block_content
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sdt_content_block)
  end
end

CTSdtContentBlock.register_class_with_id
