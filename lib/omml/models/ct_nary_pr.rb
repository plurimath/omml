# frozen_string_literal: true

module Omml
  module Models
    class CTNaryPr < Lutaml::Model::Serializable
      attribute :chr, :ct_char, collection: 0..1
      attribute :lim_loc, :ct_lim_loc, collection: 0..1
      attribute :grow, :ct_on_off, collection: 0..1
      attribute :sub_hide, :ct_on_off, collection: 0..1
      attribute :sup_hide, :ct_on_off, collection: 0..1
      attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

      xml do
        element "CT_NaryPr"

        namespace Omml::Namespace

        sequence do
          map_element :chr, to: :chr
          map_element :limLoc, to: :lim_loc
          map_element :grow, to: :grow
          map_element :subHide, to: :sub_hide
          map_element :supHide, to: :sup_hide
          map_element :ctrlPr, to: :ctrl_pr
        end
      end
    end

    Omml::Configuration.register_model(CTNaryPr)
  end
end
