# frozen_string_literal: true

require_relative "ct_picture_base"
require_relative "ct_control"
require_relative "st_twips_measure"
class CTObject < CTPictureBase
  attribute :control, :ct_control, collection: 0..1
  attribute :dxa_orig, :st_twips_measure
  attribute :dya_orig, :st_twips_measure

  xml do
    root "Object"

    sequence do
      map_element :control, to: :control
    end
    map_attribute :dxaOrig, to: :dxa_orig
    map_attribute :dyaOrig, to: :dya_orig
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_object)
  end
end

CTObject.register_class_with_id
