# frozen_string_literal: true

module Omml
  module Models
    class CTPhantPr < Lutaml::Model::Serializable
      attribute :show, :ct_on_off, collection: 0..1
      attribute :zero_wid, :ct_on_off, collection: 0..1
      attribute :zero_asc, :ct_on_off, collection: 0..1
      attribute :zero_desc, :ct_on_off, collection: 0..1
      attribute :transp, :ct_on_off, collection: 0..1
      attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

      xml do
        element "CT_PhantPr"

        namespace Omml::Namespace

        sequence do
          map_element :show, to: :show
          map_element :zeroWid, to: :zero_wid
          map_element :zeroAsc, to: :zero_asc
          map_element :zeroDesc, to: :zero_desc
          map_element :transp, to: :transp
          map_element :ctrlPr, to: :ctrl_pr
        end
      end
    end

    Omml::Configuration.register_model(CTPhantPr)
  end
end
