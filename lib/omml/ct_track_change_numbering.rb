# frozen_string_literal: true

require_relative "ct_track_change"
require_relative "st_string"
class CTTrackChangeNumbering < CTTrackChange
  attribute :original, :st_string

  xml do
    root "TrackChangeNumbering", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :original, to: :original
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_track_change_numbering)
  end
end

CTTrackChangeNumbering.register_class_with_id
