# frozen_string_literal: true

module Omml
  module Models
    class CTSdtPr < Lutaml::Model::Serializable
      choice(min: 1, max: Float::INFINITY) do
        attribute :r_pr, :ct_r_pr, collection: 0..1
        attribute :alias, :ct_string, collection: 0..1
        attribute :lock, :ct_lock, collection: 0..1
        attribute :placeholder, :ct_placeholder, collection: 0..1
        attribute :showing_plc_hdr, :ct_on_off, collection: 0..1
        attribute :data_binding, :ct_data_binding, collection: 0..1
        attribute :temporary, :ct_on_off, collection: 0..1
        attribute :id, :ct_decimal_number, collection: 0..1
        attribute :tag, :ct_string, collection: 0..1
        choice(min: 0, max: 1) do
          attribute :equation, :ct_empty
          attribute :combo_box, :ct_sdt_combo_box
          attribute :date, :ct_sdt_date
          attribute :doc_part_obj, :ct_sdt_doc_part
          attribute :doc_part_list, :ct_sdt_doc_part
          attribute :drop_down_list, :ct_sdt_drop_down_list
          attribute :picture, :ct_empty
          attribute :rich_text, :ct_empty
          attribute :text, :ct_sdt_text
          attribute :citation, :ct_empty
          attribute :group, :ct_empty
          attribute :bibliography, :ct_empty
        end
      end

      xml do
        element "CT_SdtPr"

        namespace Omml::Namespace

        map_element :rPr, to: :r_pr
        map_element :alias, to: :alias
        map_element :lock, to: :lock
        map_element :placeholder, to: :placeholder
        map_element :showingPlcHdr, to: :showing_plc_hdr
        map_element :dataBinding, to: :data_binding
        map_element :temporary, to: :temporary
        map_element :id, to: :id
        map_element :tag, to: :tag
        map_element :equation, to: :equation, render_empty: true
        map_element :comboBox, to: :combo_box, render_empty: true
        map_element :date, to: :date, render_empty: true
        map_element :docPartObj, to: :doc_part_obj, render_empty: true
        map_element :docPartList, to: :doc_part_list, render_empty: true
        map_element :dropDownList, to: :drop_down_list, render_empty: true
        map_element :picture, to: :picture, render_empty: true
        map_element :richText, to: :rich_text, render_empty: true
        map_element :text, to: :text, render_empty: true
        map_element :citation, to: :citation, render_empty: true
        map_element :group, to: :group, render_empty: true
        map_element :bibliography, to: :bibliography, render_empty: true
      end
    end

    Omml::Configuration.register_model(CTSdtPr)
  end
end
