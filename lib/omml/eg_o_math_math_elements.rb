# frozen_string_literal: true

require_relative "ct_acc"
require_relative "ct_bar"
require_relative "ct_box"
require_relative "ct_border_box"
require_relative "ct_d"
require_relative "ct_eq_arr"
require_relative "ct_f"
require_relative "ct_func"
require_relative "ct_group_chr"
require_relative "ct_lim_low"
require_relative "ct_lim_upp"
require_relative "ct_m"
require_relative "ct_nary"
require_relative "ct_phant"
require_relative "ct_rad"
require_relative "ct_s_pre"
require_relative "ct_s_sub"
require_relative "ct_s_sub_sup"
require_relative "ct_s_sup"
require_relative "ct_r"
class EGOMathMathElements < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :acc, :ct_acc, collection: true
    attribute :bar, :ct_bar, collection: true
    attribute :box, :ct_box, collection: true
    attribute :border_box, :ct_border_box, collection: true
    attribute :d, :ct_d, collection: true, collection: true
    attribute :eq_arr, :ct_eq_arr, collection: true
    attribute :f, :ct_f, collection: true
    attribute :func, :ct_func, collection: true
    attribute :group_chr, :ct_group_chr, collection: true
    attribute :lim_low, :ct_lim_low, collection: true
    attribute :lim_upp, :ct_lim_upp, collection: true
    attribute :m, :ct_m, collection: true
    attribute :nary, :ct_nary, collection: true
    attribute :phant, :ct_phant, collection: true
    attribute :rad, :ct_rad, collection: true
    attribute :s_pre, :ct_s_pre, collection: true
    attribute :s_sub, :ct_s_sub, collection: true
    attribute :s_sub_sup, :ct_s_sub_sup, collection: true
    attribute :s_sup, :ct_s_sup, collection: true
    attribute :r, :ct_r, collection: true
  end

  xml do
    no_root
    map_element :acc, to: :acc
    map_element :bar, to: :bar
    map_element :box, to: :box
    map_element :borderBox, to: :border_box
    map_element :d, to: :d
    map_element :eqArr, to: :eq_arr
    map_element :f, to: :f
    map_element :func, to: :func
    map_element :groupChr, to: :group_chr
    map_element :limLow, to: :lim_low
    map_element :limUpp, to: :lim_upp
    map_element :m, to: :m
    map_element :nary, to: :nary
    map_element :phant, to: :phant
    map_element :rad, to: :rad
    map_element :sPre, to: :s_pre
    map_element :sSub, to: :s_sub
    map_element :sSubSup, to: :s_sub_sup
    map_element :sSup, to: :s_sup
    map_element :r, to: :r
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_o_math_math_elements)
  end
end

EGOMathMathElements.register_class_with_id
