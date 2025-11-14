# frozen_string_literal: true

require_relative "ct_picture_base"
require_relative "ct_rel"
require_relative "ct_control"
class CTPicture < CTPictureBase
  attribute :movie, :ct_rel, collection: 0..1
  attribute :control, :ct_control, collection: 0..1

  xml do
    root "Picture"

    sequence do
      map_element :movie, to: :movie
      map_element :control, to: :control
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_picture)
  end
end

CTPicture.register_class_with_id
