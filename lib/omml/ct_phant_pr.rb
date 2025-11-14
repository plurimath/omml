# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_on_off"
require_relative "ct_ctrl_pr"
class CTPhantPr < Lutaml::Model::Serializable
  attribute :show, :ct_on_off, collection: 0..1
  attribute :zero_wid, :ct_on_off, collection: 0..1
  attribute :zero_asc, :ct_on_off, collection: 0..1
  attribute :zero_desc, :ct_on_off, collection: 0..1
  attribute :transp, :ct_on_off, collection: 0..1
  attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

  xml do
    root "PhantPr"

    sequence do
      map_element :show, to: :show
      map_element :zeroWid, to: :zero_wid
      map_element :zeroAsc, to: :zero_asc
      map_element :zeroDesc, to: :zero_desc
      map_element :transp, to: :transp
      map_element :ctrlPr, to: :ctrl_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_phant_pr)
  end
end

CTPhantPr.register_class_with_id
