# frozen_string_literal: true

require "lutaml/model"
require_relative "st_align_h"
require_relative "st_position_offset"
require_relative "st_rel_from_h"
class CTPosH < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :align, :st_align_h, collection: 1..1
    attribute :pos_offset, :st_position_offset, collection: 1..1
  end
  attribute :relative_from, :st_rel_from_h

  xml do
    root "PosH"

    sequence do
      map_element :align, to: :align
      map_element :posOffset, to: :pos_offset
    end
    map_attribute :relativeFrom, to: :relative_from
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_pos_h)
  end
end

CTPosH.register_class_with_id
