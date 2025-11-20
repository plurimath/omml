# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_geom_guide_list"
require_relative "ct_adjust_handle_list"
require_relative "ct_connection_site_list"
require_relative "ct_geom_rect"
require_relative "ct_path2_d_list"
class CTCustomGeometry2D < Lutaml::Model::Serializable
  attribute :av_lst, :ct_geom_guide_list, collection: 0..1
  attribute :gd_lst, :ct_geom_guide_list, collection: 0..1
  attribute :ah_lst, :ct_adjust_handle_list, collection: 0..1
  attribute :cxn_lst, :ct_connection_site_list, collection: 0..1
  attribute :rect, :ct_geom_rect, collection: 0..1
  attribute :path_lst, :ct_path2_d_list, collection: 1..1

  xml do
    root "CustomGeometry2D", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :avLst, to: :av_lst
      map_element :gdLst, to: :gd_lst
      map_element :ahLst, to: :ah_lst
      map_element :cxnLst, to: :cxn_lst
      map_element :rect, to: :rect
      map_element :pathLst, to: :path_lst
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_custom_geometry2_d)
  end
end

CTCustomGeometry2D.register_class_with_id
