# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_on_off"
require_relative "ct_manual_break"
require_relative "ct_ctrl_pr"
class CTBoxPr < Lutaml::Model::Serializable
  attribute :op_emu, :ct_on_off, collection: 0..1
  attribute :no_break, :ct_on_off, collection: 0..1
  attribute :diff, :ct_on_off, collection: 0..1
  attribute :brk, :ct_manual_break, collection: 0..1
  attribute :aln, :ct_on_off, collection: 0..1
  attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

  xml do
    root "BoxPr"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :opEmu, to: :op_emu
      map_element :noBreak, to: :no_break
      map_element :diff, to: :diff
      map_element :brk, to: :brk
      map_element :aln, to: :aln
      map_element :ctrlPr, to: :ctrl_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_box_pr)
  end
end

CTBoxPr.register_class_with_id
