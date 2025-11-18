# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_connection_site"
class CTConnectionSiteList < Lutaml::Model::Serializable
  attribute :cxn, :ct_connection_site, collection: 0..Float::INFINITY

  xml do
    root "ConnectionSiteList"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :cxn, to: :cxn
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_connection_site_list)
  end
end

CTConnectionSiteList.register_class_with_id
