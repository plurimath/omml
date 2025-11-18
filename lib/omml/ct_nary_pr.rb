# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_char"
require_relative "ct_lim_loc"
require_relative "ct_on_off"
require_relative "ct_ctrl_pr"
class CTNaryPr < Lutaml::Model::Serializable
  attribute :chr, :ct_char, collection: 0..1
  attribute :lim_loc, :ct_lim_loc, collection: 0..1
  attribute :grow, :ct_on_off, collection: 0..1
  attribute :sub_hide, :ct_on_off, collection: 0..1
  attribute :sup_hide, :ct_on_off, collection: 0..1
  attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

  xml do
    root "NaryPr"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :chr, to: :chr
      map_element :limLoc, to: :lim_loc
      map_element :grow, to: :grow
      map_element :subHide, to: :sub_hide
      map_element :supHide, to: :sup_hide
      map_element :ctrlPr, to: :ctrl_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_nary_pr)
  end
end

CTNaryPr.register_class_with_id
