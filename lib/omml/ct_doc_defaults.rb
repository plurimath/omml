# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_r_pr_default"
require_relative "ct_p_pr_default"
class CTDocDefaults < Lutaml::Model::Serializable
  attribute :r_pr_default, :ct_r_pr_default, collection: 0..1
  attribute :p_pr_default, :ct_p_pr_default, collection: 0..1

  xml do
    root "DocDefaults"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :rPrDefault, to: :r_pr_default
      map_element :pPrDefault, to: :p_pr_default
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_doc_defaults)
  end
end

CTDocDefaults.register_class_with_id
