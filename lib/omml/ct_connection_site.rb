# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_adj_point2_d"
require_relative "st_adj_angle"
class CTConnectionSite < Lutaml::Model::Serializable
  attribute :pos, :ct_adj_point2_d, collection: 1..1
  attribute :ang, :st_adj_angle

  xml do
    root "ConnectionSite"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :pos, to: :pos
    end
    map_attribute :ang, to: :ang
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_connection_site)
  end
end

CTConnectionSite.register_class_with_id
