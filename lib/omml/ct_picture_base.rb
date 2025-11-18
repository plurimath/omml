# frozen_string_literal: true

require "lutaml/model"
class CTPictureBase < Lutaml::Model::Serializable

  xml do
    root "PictureBase"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_picture_base)
  end
end

CTPictureBase.register_class_with_id
