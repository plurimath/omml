# frozen_string_literal: true

module Omml
  module Models
    class CTDPr < Lutaml::Model::Serializable
      import_model_attributes :eg_word_r_pr
      attribute :beg_chr, :ct_char, collection: 0..1
      attribute :sep_chr, :ct_char, collection: 0..1
      attribute :end_chr, :ct_char, collection: 0..1
      attribute :grow, :ct_on_off, collection: 0..1
      attribute :shp, :ct_shp, collection: 0..1
      attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

      xml do
        element "CT_DPr"

        namespace Omml::Namespace
        ordered

        sequence do
          import_model_mappings :eg_word_r_pr
          map_element :begChr, to: :beg_chr
          map_element :sepChr, to: :sep_chr
          map_element :endChr, to: :end_chr
          map_element :grow, to: :grow
          map_element :shp, to: :shp
          map_element :ctrlPr, to: :ctrl_pr
        end
      end
    end

    Omml::Configuration.register_model(CTDPr)
  end
end
