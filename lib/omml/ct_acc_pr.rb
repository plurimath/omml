# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_char"
require_relative "ct_ctrl_pr"
class CTAccPr < Lutaml::Model::Serializable
  attribute :chr, :ct_char, collection: 0..1
  attribute :ctrl_pr, :ct_ctrl_pr, collection: 0..1

  xml do
    root "AccPr"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :chr, to: :chr
      map_element :ctrlPr, to: :ctrl_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_acc_pr)
  end
end

CTAccPr.register_class_with_id
