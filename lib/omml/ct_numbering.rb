# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_num_pic_bullet"
require_relative "ct_abstract_num"
require_relative "ct_num"
require_relative "ct_decimal_number"
class CTNumbering < Lutaml::Model::Serializable
  attribute :num_pic_bullet, :ct_num_pic_bullet, collection: 0..Float::INFINITY
  attribute :abstract_num, :ct_abstract_num, collection: 0..Float::INFINITY
  attribute :num, :ct_num, collection: 0..Float::INFINITY
  attribute :num_id_mac_at_cleanup, :ct_decimal_number, collection: 0..1

  xml do
    root "Numbering"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :numPicBullet, to: :num_pic_bullet
      map_element :abstractNum, to: :abstract_num
      map_element :num, to: :num
      map_element :numIdMacAtCleanup, to: :num_id_mac_at_cleanup
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_numbering)
  end
end

CTNumbering.register_class_with_id
