# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_p_pr"
class CTPPrDefault < Lutaml::Model::Serializable
  attribute :p_pr, :ct_p_pr, collection: 0..1

  xml do
    root "PPrDefault", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :pPr, to: :p_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_p_pr_default)
  end
end

CTPPrDefault.register_class_with_id
