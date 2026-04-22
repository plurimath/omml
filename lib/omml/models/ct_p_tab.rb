# frozen_string_literal: true

module Omml
  module Models
    class CTPTab < Lutaml::Model::Serializable
      attribute :alignment, :st_p_tab_alignment
      attribute :relative_to, :st_p_tab_relative_to
      attribute :leader, :st_p_tab_leader

      xml do
        element "CT_PTab"

        namespace Omml::Namespace

        map_attribute :alignment, to: :alignment
        map_attribute :relativeTo, to: :relative_to
        map_attribute :leader, to: :leader
      end
    end

    Omml::Configuration.register_model(CTPTab)
  end
end
