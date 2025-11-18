# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_tab_stop"
class CTTabs < Lutaml::Model::Serializable
  attribute :tab, :ct_tab_stop, collection: 1..Float::INFINITY

  xml do
    root "Tabs"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :tab, to: :tab
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tabs)
  end
end

CTTabs.register_class_with_id
