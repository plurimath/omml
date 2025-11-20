# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_phant_pr"
require_relative "ct_o_math_arg"
class CTPhant < Lutaml::Model::Serializable
  attribute :phant_pr, :ct_phant_pr, collection: 0..1
  attribute :e, :ct_o_math_arg

  xml do
    root "Phant", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :phantPr, to: :phant_pr
      map_element :e, to: :e
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_phant)
  end
end

CTPhant.register_class_with_id
