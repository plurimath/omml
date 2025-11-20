# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_o_math_elements"
class CTOMath < Lutaml::Model::Serializable
  import_model_attributes :eg_o_math_elements
  restrict :r, collection: true

  xml do
    root "oMath", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      import_model_mappings :eg_o_math_elements
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_o_math)
  end
end

CTOMath.register_class_with_id
