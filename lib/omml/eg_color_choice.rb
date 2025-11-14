# frozen_string_literal: true

require_relative "ct_sc_rgb_color"
require_relative "ct_s_rgb_color"
require_relative "ct_hsl_color"
require_relative "ct_system_color"
require_relative "ct_scheme_color"
require_relative "ct_preset_color"
class EGColorChoice < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :scrgb_clr, :ct_sc_rgb_color, collection: 1..1
    attribute :srgb_clr, :ct_s_rgb_color, collection: 1..1
    attribute :hsl_clr, :ct_hsl_color, collection: 1..1
    attribute :sys_clr, :ct_system_color, collection: 1..1
    attribute :scheme_clr, :ct_scheme_color, collection: 1..1
    attribute :prst_clr, :ct_preset_color, collection: 1..1
  end

  xml do
    no_root
    map_element :scrgbClr, to: :scrgb_clr
    map_element :srgbClr, to: :srgb_clr
    map_element :hslClr, to: :hsl_clr
    map_element :sysClr, to: :sys_clr
    map_element :schemeClr, to: :scheme_clr
    map_element :prstClr, to: :prst_clr
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_color_choice)
  end
end

EGColorChoice.register_class_with_id
