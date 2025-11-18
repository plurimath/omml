# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_smart_tag_pr"
require_relative "eg_p_content"
require_relative "st_string"
class CTSmartTagRun < Lutaml::Model::Serializable
  attribute :smart_tag_pr, :ct_smart_tag_pr, collection: 0..1
  import_model_attributes :eg_p_content
  attribute :uri, :st_string
  attribute :element, :st_string

  xml do
    root "SmartTagRun"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :smartTagPr, to: :smart_tag_pr
      import_model_mappings :eg_p_content
    end
    map_attribute :uri, to: :uri
    map_attribute :element, to: :element
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_smart_tag_run)
  end
end

CTSmartTagRun.register_class_with_id
