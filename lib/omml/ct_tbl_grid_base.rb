# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_tbl_grid_col"
class CTTblGridBase < Lutaml::Model::Serializable
  attribute :grid_col, :ct_tbl_grid_col, collection: 0..Float::INFINITY

  xml do
    root "TblGridBase"

    sequence do
      map_element :gridCol, to: :grid_col
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tbl_grid_base)
  end
end

CTTblGridBase.register_class_with_id
