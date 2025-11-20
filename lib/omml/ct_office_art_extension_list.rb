# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_office_art_extension_list"
class CTOfficeArtExtensionList < Lutaml::Model::Serializable
  import_model_attributes :eg_office_art_extension_list

  xml do
    root "OfficeArtExtensionList", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      import_model_mappings :eg_office_art_extension_list
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_office_art_extension_list)
  end
end

CTOfficeArtExtensionList.register_class_with_id
