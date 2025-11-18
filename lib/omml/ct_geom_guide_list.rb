# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_geom_guide"
class CTGeomGuideList < Lutaml::Model::Serializable
  attribute :gd, :ct_geom_guide, collection: 0..Float::INFINITY

  xml do
    root "GeomGuideList"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :gd, to: :gd
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_geom_guide_list)
  end
end

CTGeomGuideList.register_class_with_id
