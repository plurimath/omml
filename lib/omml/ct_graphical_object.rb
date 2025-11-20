# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_graphical_object_data"
class CTGraphicalObject < Lutaml::Model::Serializable
  attribute :graphic_data, :ct_graphical_object_data

  xml do
    root "GraphicalObject", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :graphicData, to: :graphic_data
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_graphical_object)
  end
end

CTGraphicalObject.register_class_with_id
