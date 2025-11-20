# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_f_pr"
require_relative "ct_o_math_arg"
class CTF < Lutaml::Model::Serializable
  attribute :f_pr, :ct_f_pr, collection: 0..1
  attribute :num, :ct_o_math_arg
  attribute :den, :ct_o_math_arg

  xml do
    root "F", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :fPr, to: :f_pr
      map_element :num, to: :num
      map_element :den, to: :den
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_f)
  end
end

CTF.register_class_with_id
