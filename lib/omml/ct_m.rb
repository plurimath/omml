# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_m_pr"
require_relative "ct_mr"
class CTM < Lutaml::Model::Serializable
  attribute :m_pr, :ct_m_pr, collection: 0..1
  attribute :mr, :ct_mr, collection: 1..Float::INFINITY

  xml do
    root "M", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :mPr, to: :m_pr
      map_element :mr, to: :mr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_m)
  end
end

CTM.register_class_with_id
