# frozen_string_literal: true

module Omml
  module Models
    class EGOMathMathElements < Lutaml::Model::Serializable
      choice(min: 1, max: 1) do
        attribute :acc, :ct_acc, collection: 0..Float::INFINITY
        attribute :bar, :ct_bar, collection: 0..Float::INFINITY
        attribute :box, :ct_box, collection: 0..Float::INFINITY
        attribute :border_box, :ct_border_box, collection: 0..Float::INFINITY
        attribute :d, :ct_d, collection: 0..Float::INFINITY
        attribute :eq_arr, :ct_eq_arr, collection: 0..Float::INFINITY
        attribute :f, :ct_f, collection: 0..Float::INFINITY
        attribute :func, :ct_func, collection: 0..Float::INFINITY
        attribute :group_chr, :ct_group_chr, collection: 0..Float::INFINITY
        attribute :lim_low, :ct_lim_low, collection: 0..Float::INFINITY
        attribute :lim_upp, :ct_lim_upp, collection: 0..Float::INFINITY
        attribute :m, :ct_m, collection: 0..Float::INFINITY
        attribute :nary, :ct_nary, collection: 0..Float::INFINITY
        attribute :phant, :ct_phant, collection: 0..Float::INFINITY
        attribute :rad, :ct_rad, collection: 0..Float::INFINITY
        attribute :s_pre, :ct_s_pre, collection: 0..Float::INFINITY
        attribute :s_sub, :ct_s_sub, collection: 0..Float::INFINITY
        attribute :s_sub_sup, :ct_s_sub_sup, collection: 0..Float::INFINITY
        attribute :s_sup, :ct_s_sup, collection: 0..Float::INFINITY
        attribute :r, :ct_r, collection: 0..Float::INFINITY
      end

      xml do
        type_name "EG_OMathMathElements"
        map_element :acc, to: :acc, render_empty: true
        map_element :bar, to: :bar, render_empty: true
        map_element :box, to: :box, render_empty: true
        map_element :borderBox, to: :border_box, render_empty: true
        map_element :d, to: :d, render_empty: true
        map_element :eqArr, to: :eq_arr, render_empty: true
        map_element :f, to: :f, render_empty: true
        map_element :func, to: :func, render_empty: true
        map_element :groupChr, to: :group_chr, render_empty: true
        map_element :limLow, to: :lim_low, render_empty: true
        map_element :limUpp, to: :lim_upp, render_empty: true
        map_element :m, to: :m, render_empty: true
        map_element :nary, to: :nary, render_empty: true
        map_element :phant, to: :phant, render_empty: true
        map_element :rad, to: :rad, render_empty: true
        map_element :sPre, to: :s_pre, render_empty: true
        map_element :sSub, to: :s_sub, render_empty: true
        map_element :sSubSup, to: :s_sub_sup, render_empty: true
        map_element :sSup, to: :s_sup, render_empty: true
        map_element :r, to: :r, render_empty: true
      end
    end

    Omml::Configuration.register_model(EGOMathMathElements)
  end
end
