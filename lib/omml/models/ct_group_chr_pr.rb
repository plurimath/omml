# frozen_string_literal: true

module Omml
  module Models
    class CTGroupChrPr < Lutaml::Model::Serializable
      attribute :chr, :ct_char, collection: 0..1
      attribute :pos, :ct_top_bot, collection: 0..1
      attribute :vert_jc, :ct_top_bot, collection: 0..1
      attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

      xml do
        element "CT_GroupChrPr"

        namespace Omml::Namespace

        sequence do
          map_element :chr, to: :chr
          map_element :pos, to: :pos
          map_element :vertJc, to: :vert_jc
          map_element :ctrlPr, to: :ctrl_pr
        end
      end
    end

    Omml::Configuration.register_model(CTGroupChrPr)
  end
end
