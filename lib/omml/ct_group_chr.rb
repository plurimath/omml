# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_group_chr_pr"
require_relative "ct_o_math_arg"
class CTGroupChr < Lutaml::Model::Serializable
  attribute :group_chr_pr, :ct_group_chr_pr, collection: 0..1
  attribute :e, :ct_o_math_arg

  xml do
    root "GroupChr"

    sequence do
      map_element :groupChrPr, to: :group_chr_pr
      map_element :e, to: :e
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_group_chr)
  end
end

CTGroupChr.register_class_with_id
