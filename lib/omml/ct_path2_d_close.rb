# frozen_string_literal: true

require "lutaml/model"
class CTPath2DClose < Lutaml::Model::Serializable

  xml do
    root "Path2DClose", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_path2_d_close)
  end
end

CTPath2DClose.register_class_with_id
