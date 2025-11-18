# frozen_string_literal: true

require "lutaml/model"
class CTWrapNone < Lutaml::Model::Serializable

  xml do
    root "WrapNone"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_wrap_none)
  end
end

CTWrapNone.register_class_with_id
