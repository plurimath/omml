# frozen_string_literal: true

require "lutaml/model"
require_relative "st_frame_scrollbar"
class CTFrameScrollbar < Lutaml::Model::Serializable
  attribute :val, :st_frame_scrollbar

  xml do
    root "FrameScrollbar"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_frame_scrollbar)
  end
end

CTFrameScrollbar.register_class_with_id
