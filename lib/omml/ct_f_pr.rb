# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_f_type"
require_relative "ct_ctrl_pr"
class CTFPr < Lutaml::Model::Serializable
  attribute :type, :ct_f_type, collection: 0..1
  attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

  xml do
    root "FPr"

    sequence do
      map_element :type, to: :type
      map_element :ctrlPr, to: :ctrl_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_f_pr)
  end
end

CTFPr.register_class_with_id
