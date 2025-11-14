# frozen_string_literal: true

require "lutaml/model"
require_relative "st_align_v"
require_relative "st_position_offset"
require_relative "st_rel_from_v"
class CTPosV < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :align, :st_align_v, collection: 1..1
    attribute :pos_offset, :st_position_offset, collection: 1..1
  end
  attribute :relative_from, :st_rel_from_v

  xml do
    root "PosV"

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
    register.register_model(self, id: :ct_pos_v)
  end
end

CTPosV.register_class_with_id
