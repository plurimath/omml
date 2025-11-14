# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_on_off"
require_relative "ct_ctrl_pr"
class CTSSubSupPr < Lutaml::Model::Serializable
  attribute :aln_scr, :ct_on_off, collection: 0..1
  attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

  xml do
    root "SSubSupPr"

    sequence do
      map_element :alnScr, to: :aln_scr
      map_element :ctrlPr, to: :ctrl_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_s_sub_sup_pr)
  end
end

CTSSubSupPr.register_class_with_id
