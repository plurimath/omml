# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_char"
require_relative "ct_top_bot"
require_relative "ct_ctrl_pr"
class CTGroupChrPr < Lutaml::Model::Serializable
  attribute :chr, :ct_char, collection: 0..1
  attribute :pos, :ct_top_bot, collection: 0..1
  attribute :vert_jc, :ct_top_bot, collection: 0..1
  attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

  xml do
    root "GroupChrPr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :chr, to: :chr
      map_element :pos, to: :pos
      map_element :vertJc, to: :vert_jc
      map_element :ctrlPr, to: :ctrl_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_group_chr_pr)
  end
end

CTGroupChrPr.register_class_with_id
