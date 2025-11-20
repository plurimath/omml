# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_lim_low_pr"
require_relative "ct_o_math_arg"
class CTLimLow < Lutaml::Model::Serializable
  attribute :lim_low_pr, :ct_lim_low_pr, collection: 0..1
  attribute :e, :ct_o_math_arg
  attribute :lim, :ct_o_math_arg

  xml do
    root "LimLow", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :limLowPr, to: :lim_low_pr
      map_element :e, to: :e
      map_element :lim, to: :lim
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_lim_low)
  end
end

CTLimLow.register_class_with_id
