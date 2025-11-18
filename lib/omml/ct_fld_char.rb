# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_text"
require_relative "ct_ff_data"
require_relative "ct_track_change_numbering"
require_relative "st_fld_char_type"
require_relative "st_on_off"
class CTFldChar < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :fld_data, :ct_text, collection: 0..1
    attribute :ff_data, :ct_ff_data, collection: 0..1
    attribute :numbering_change, :ct_track_change_numbering, collection: 0..1
  end
  attribute :fld_char_type, :st_fld_char_type
  attribute :fld_lock, :st_on_off
  attribute :dirty, :st_on_off

  xml do
    root "FldChar"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_element :fldData, to: :fld_data
    map_element :ffData, to: :ff_data
    map_element :numberingChange, to: :numbering_change
    map_attribute :fldCharType, to: :fld_char_type
    map_attribute :fldLock, to: :fld_lock
    map_attribute :dirty, to: :dirty
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_fld_char)
  end
end

CTFldChar.register_class_with_id
