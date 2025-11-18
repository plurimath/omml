# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_top_bot"
require_relative "ct_ctrl_pr"
class CTBarPr < Lutaml::Model::Serializable
  attribute :pos, :ct_top_bot, collection: 0..1
  attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

  xml do
    root "BarPr"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :pos, to: :pos
      map_element :ctrlPr, to: :ctrl_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_bar_pr)
  end
end

CTBarPr.register_class_with_id
