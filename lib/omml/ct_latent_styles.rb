# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_lsd_exception"
require_relative "st_on_off"
require_relative "st_decimal_number"
class CTLatentStyles < Lutaml::Model::Serializable
  attribute :lsd_exception, :ct_lsd_exception, collection: 0..Float::INFINITY
  attribute :def_locked_state, :st_on_off
  attribute :def_ui_priority, :st_decimal_number
  attribute :def_semi_hidden, :st_on_off
  attribute :def_unhide_when_used, :st_on_off
  attribute :def_q_format, :st_on_off
  attribute :count, :st_decimal_number

  xml do
    root "LatentStyles"

    sequence do
      map_element :lsdException, to: :lsd_exception
    end
    map_attribute :defLockedState, to: :def_locked_state
    map_attribute :defUIPriority, to: :def_ui_priority
    map_attribute :defSemiHidden, to: :def_semi_hidden
    map_attribute :defUnhideWhenUsed, to: :def_unhide_when_used
    map_attribute :defQFormat, to: :def_q_format
    map_attribute :count, to: :count
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_latent_styles)
  end
end

CTLatentStyles.register_class_with_id
