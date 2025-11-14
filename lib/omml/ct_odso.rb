# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_string"
require_relative "ct_rel"
require_relative "ct_decimal_number"
require_relative "ct_mail_merge_source_type"
require_relative "ct_on_off"
require_relative "ct_odso_field_map_data"
class CTOdso < Lutaml::Model::Serializable
  attribute :udl, :ct_string, collection: 0..1
  attribute :table, :ct_string, collection: 0..1
  attribute :src, :ct_rel, collection: 0..1
  attribute :col_delim, :ct_decimal_number, collection: 0..1
  attribute :type, :ct_mail_merge_source_type, collection: 0..1
  attribute :f_hdr, :ct_on_off, collection: 0..1
  attribute :field_map_data, :ct_odso_field_map_data, collection: 0..Float::INFINITY
  attribute :recipient_data, :ct_rel, collection: 0..Float::INFINITY

  xml do
    root "Odso"

    sequence do
      map_element :udl, to: :udl
      map_element :table, to: :table
      map_element :src, to: :src
      map_element :colDelim, to: :col_delim
      map_element :type, to: :type
      map_element :fHdr, to: :f_hdr
      map_element :fieldMapData, to: :field_map_data
      map_element :recipientData, to: :recipient_data
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_odso)
  end
end

CTOdso.register_class_with_id
