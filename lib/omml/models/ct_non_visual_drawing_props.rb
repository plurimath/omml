# frozen_string_literal: true

module Omml
  module Models
    class CTNonVisualDrawingProps < Lutaml::Model::Serializable
      attribute :hlink_click, :ct_hyperlink, collection: 0..1
      attribute :hlink_hover, :ct_hyperlink, collection: 0..1
      attribute :ext_lst, :ct_office_art_extension_list, collection: 0..1
      attribute :id, :st_drawing_element_id
      attribute :name, :string
      attribute :descr, :string
      attribute :hidden, :boolean

      xml do
        element "CT_NonVisualDrawingProps"

        namespace Omml::Namespace

        sequence do
          map_element :hlinkClick, to: :hlink_click
          map_element :hlinkHover, to: :hlink_hover
          map_element :extLst, to: :ext_lst
        end
        map_attribute :id, to: :id
        map_attribute :name, to: :name
        map_attribute :descr, to: :descr
        map_attribute :hidden, to: :hidden
      end
    end

    Omml::Configuration.register_model(CTNonVisualDrawingProps)
  end
end
