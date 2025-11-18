# frozen_string_literal: true

require "lutaml/model"
require_relative "st_p_tab_alignment"
require_relative "st_p_tab_relative_to"
require_relative "st_p_tab_leader"
class CTPTab < Lutaml::Model::Serializable
  attribute :alignment, :st_p_tab_alignment
  attribute :relative_to, :st_p_tab_relative_to
  attribute :leader, :st_p_tab_leader

  xml do
    root "PTab"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :alignment, to: :alignment
    map_attribute :relativeTo, to: :relative_to
    map_attribute :leader, to: :leader
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_p_tab)
  end
end

CTPTab.register_class_with_id
