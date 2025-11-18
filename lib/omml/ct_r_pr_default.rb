# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_r_pr"
class CTRPrDefault < Lutaml::Model::Serializable
  attribute :r_pr, :ct_r_pr, collection: 0..1

  xml do
    root "RPrDefault"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :rPr, to: :r_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_r_pr_default)
  end
end

CTRPrDefault.register_class_with_id
