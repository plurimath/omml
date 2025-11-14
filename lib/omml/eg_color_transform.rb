# frozen_string_literal: true

require_relative "ct_positive_fixed_percentage"
require_relative "ct_complement_transform"
require_relative "ct_inverse_transform"
require_relative "ct_grayscale_transform"
require_relative "ct_fixed_percentage"
require_relative "ct_positive_percentage"
require_relative "ct_positive_fixed_angle"
require_relative "ct_angle"
require_relative "ct_percentage"
require_relative "ct_gamma_transform"
require_relative "ct_inverse_gamma_transform"
class EGColorTransform < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :tint, :ct_positive_fixed_percentage, collection: 1..1
    attribute :shade, :ct_positive_fixed_percentage, collection: 1..1
    attribute :comp, :ct_complement_transform, collection: 1..1
    attribute :inv, :ct_inverse_transform, collection: 1..1
    attribute :gray, :ct_grayscale_transform, collection: 1..1
    attribute :alpha, :ct_positive_fixed_percentage, collection: 1..1
    attribute :alpha_off, :ct_fixed_percentage, collection: 1..1
    attribute :alpha_mod, :ct_positive_percentage, collection: 1..1
    attribute :hue, :ct_positive_fixed_angle, collection: 1..1
    attribute :hue_off, :ct_angle, collection: 1..1
    attribute :hue_mod, :ct_positive_percentage, collection: 1..1
    attribute :sat, :ct_percentage, collection: 1..1
    attribute :sat_off, :ct_percentage, collection: 1..1
    attribute :sat_mod, :ct_percentage, collection: 1..1
    attribute :lum, :ct_percentage, collection: 1..1
    attribute :lum_off, :ct_percentage, collection: 1..1
    attribute :lum_mod, :ct_percentage, collection: 1..1
    attribute :red, :ct_percentage, collection: 1..1
    attribute :red_off, :ct_percentage, collection: 1..1
    attribute :red_mod, :ct_percentage, collection: 1..1
    attribute :green, :ct_percentage, collection: 1..1
    attribute :green_off, :ct_percentage, collection: 1..1
    attribute :green_mod, :ct_percentage, collection: 1..1
    attribute :blue, :ct_percentage, collection: 1..1
    attribute :blue_off, :ct_percentage, collection: 1..1
    attribute :blue_mod, :ct_percentage, collection: 1..1
    attribute :gamma, :ct_gamma_transform, collection: 1..1
    attribute :inv_gamma, :ct_inverse_gamma_transform, collection: 1..1
  end

  xml do
    no_root
    map_element :tint, to: :tint
    map_element :shade, to: :shade
    map_element :comp, to: :comp
    map_element :inv, to: :inv
    map_element :gray, to: :gray
    map_element :alpha, to: :alpha
    map_element :alphaOff, to: :alpha_off
    map_element :alphaMod, to: :alpha_mod
    map_element :hue, to: :hue
    map_element :hueOff, to: :hue_off
    map_element :hueMod, to: :hue_mod
    map_element :sat, to: :sat
    map_element :satOff, to: :sat_off
    map_element :satMod, to: :sat_mod
    map_element :lum, to: :lum
    map_element :lumOff, to: :lum_off
    map_element :lumMod, to: :lum_mod
    map_element :red, to: :red
    map_element :redOff, to: :red_off
    map_element :redMod, to: :red_mod
    map_element :green, to: :green
    map_element :greenOff, to: :green_off
    map_element :greenMod, to: :green_mod
    map_element :blue, to: :blue
    map_element :blueOff, to: :blue_off
    map_element :blueMod, to: :blue_mod
    map_element :gamma, to: :gamma
    map_element :invGamma, to: :inv_gamma
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_color_transform)
  end
end

EGColorTransform.register_class_with_id
