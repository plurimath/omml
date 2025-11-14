# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_ctrl_pr"
class CTSSubPr < Lutaml::Model::Serializable
  attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

  xml do
    root "SSubPr"

    sequence do
      map_element :ctrlPr, to: :ctrl_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_s_sub_pr)
  end
end

CTSSubPr.register_class_with_id
