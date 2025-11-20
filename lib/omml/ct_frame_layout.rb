# frozen_string_literal: true

require "lutaml/model"
require_relative "st_frame_layout"
class CTFrameLayout < Lutaml::Model::Serializable
  attribute :val, :st_frame_layout

  xml do
    root "FrameLayout", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_frame_layout)
  end
end

CTFrameLayout.register_class_with_id
