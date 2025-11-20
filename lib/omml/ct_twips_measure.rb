# frozen_string_literal: true

require "lutaml/model"
require_relative "st_twips_measure"
class CTTwipsMeasure < Lutaml::Model::Serializable
  attribute :val, :st_twips_measure

  xml do
    root "TwipsMeasure", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_twips_measure)
  end
end

CTTwipsMeasure.register_class_with_id
