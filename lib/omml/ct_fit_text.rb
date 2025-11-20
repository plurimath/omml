# frozen_string_literal: true

require "lutaml/model"
require_relative "st_twips_measure"
require_relative "st_decimal_number"
class CTFitText < Lutaml::Model::Serializable
  attribute :val, :st_twips_measure
  attribute :id, :st_decimal_number

  xml do
    root "FitText", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
    map_attribute :id, to: :id
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_fit_text)
  end
end

CTFitText.register_class_with_id
