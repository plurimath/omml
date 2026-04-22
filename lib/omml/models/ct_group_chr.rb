# frozen_string_literal: true

module Omml
  module Models
    class CTGroupChr < Lutaml::Model::Serializable
      attribute :group_chr_pr, :ct_group_chr_pr, collection: 0..1
      attribute :e, :ct_o_math_arg

      xml do
        element "CT_GroupChr"

        namespace Omml::Namespace

        sequence do
          map_element :groupChrPr, to: :group_chr_pr
          map_element :e, to: :e, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTGroupChr)
  end
end
