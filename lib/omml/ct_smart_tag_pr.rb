# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_attr"
class CTSmartTagPr < Lutaml::Model::Serializable
  attribute :attr, :ct_attr, collection: 0..Float::INFINITY

  xml do
    root "SmartTagPr"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :attr, to: :attr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_smart_tag_pr)
  end
end

CTSmartTagPr.register_class_with_id
