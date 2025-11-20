# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_picture"
require_relative "st_decimal_number"
class CTNumPicBullet < Lutaml::Model::Serializable
  attribute :pict, :ct_picture
  attribute :num_pic_bullet_id, :st_decimal_number

  xml do
    root "NumPicBullet", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :pict, to: :pict
    end
    map_attribute :numPicBulletId, to: :num_pic_bullet_id
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_num_pic_bullet)
  end
end

CTNumPicBullet.register_class_with_id
