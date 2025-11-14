# frozen_string_literal: true

require_relative "ct_office_art_extension"
class EGOfficeArtExtensionList < Lutaml::Model::Serializable
  attribute :ext, :ct_office_art_extension, collection: 0..Float::INFINITY

  xml do
    no_root
    sequence do
      map_element :ext, to: :ext
    end
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_office_art_extension_list)
  end
end

EGOfficeArtExtensionList.register_class_with_id
