# frozen_string_literal: true

require "lutaml/model"
require_relative "st_vertical_align_run"
class CTVerticalAlignRun < Lutaml::Model::Serializable
  attribute :val, :st_vertical_align_run

  xml do
    root "VerticalAlignRun"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_vertical_align_run)
  end
end

CTVerticalAlignRun.register_class_with_id
