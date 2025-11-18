# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_lim_upp_pr"
require_relative "ct_o_math_arg"
class CTLimUpp < Lutaml::Model::Serializable
  attribute :lim_upp_pr, :ct_lim_upp_pr, collection: 0..1
  attribute :e, :ct_o_math_arg
  attribute :lim, :ct_o_math_arg

  xml do
    root "LimUpp"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :limUppPr, to: :lim_upp_pr
      map_element :e, to: :e
      map_element :lim, to: :lim
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_lim_upp)
  end
end

CTLimUpp.register_class_with_id
