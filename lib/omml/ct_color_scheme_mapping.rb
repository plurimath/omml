# frozen_string_literal: true

require "lutaml/model"
require_relative "st_color_scheme_index"
class CTColorSchemeMapping < Lutaml::Model::Serializable
  attribute :bg1, :st_color_scheme_index
  attribute :t1, :st_color_scheme_index
  attribute :bg2, :st_color_scheme_index
  attribute :t2, :st_color_scheme_index
  attribute :accent1, :st_color_scheme_index
  attribute :accent2, :st_color_scheme_index
  attribute :accent3, :st_color_scheme_index
  attribute :accent4, :st_color_scheme_index
  attribute :accent5, :st_color_scheme_index
  attribute :accent6, :st_color_scheme_index
  attribute :hyperlink, :st_color_scheme_index
  attribute :followed_hyperlink, :st_color_scheme_index

  xml do
    root "ColorSchemeMapping", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :bg1, to: :bg1
    map_attribute :t1, to: :t1
    map_attribute :bg2, to: :bg2
    map_attribute :t2, to: :t2
    map_attribute :accent1, to: :accent1
    map_attribute :accent2, to: :accent2
    map_attribute :accent3, to: :accent3
    map_attribute :accent4, to: :accent4
    map_attribute :accent5, to: :accent5
    map_attribute :accent6, to: :accent6
    map_attribute :hyperlink, to: :hyperlink
    map_attribute :followedHyperlink, to: :followed_hyperlink
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_color_scheme_mapping)
  end
end

CTColorSchemeMapping.register_class_with_id
