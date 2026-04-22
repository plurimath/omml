# frozen_string_literal: true

module Omml
  module Models
    class CTBoxPr < Lutaml::Model::Serializable
      attribute :op_emu, :ct_on_off, collection: 0..1
      attribute :no_break, :ct_on_off, collection: 0..1
      attribute :diff, :ct_on_off, collection: 0..1
      attribute :brk, :ct_manual_break, collection: 0..1
      attribute :aln, :ct_on_off, collection: 0..1
      attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

      xml do
        element "CT_BoxPr"

        namespace Omml::Namespace

        sequence do
          map_element :opEmu, to: :op_emu
          map_element :noBreak, to: :no_break
          map_element :diff, to: :diff
          map_element :brk, to: :brk
          map_element :aln, to: :aln
          map_element :ctrlPr, to: :ctrl_pr
        end
      end
    end

    Omml::Configuration.register_model(CTBoxPr)
  end
end
