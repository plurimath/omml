# frozen_string_literal: true

require_relative "ct_markup"
require_relative "st_string"
require_relative "st_date_time"
class CTTrackChange < CTMarkup
  attribute :author, :st_string
  attribute :date, :st_date_time

  xml do
    root "TrackChange"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :author, to: :author
    map_attribute :date, to: :date
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_track_change)
  end
end

CTTrackChange.register_class_with_id
