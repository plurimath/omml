# frozen_string_literal: true

require "lutaml/model"
require_relative "st_twips_measure"
class CTTblGridCol < Lutaml::Model::Serializable
  attribute :w, :st_twips_measure

  xml do
    root "TblGridCol"

    map_attribute :w, to: :w
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tbl_grid_col)
  end
end

CTTblGridCol.register_class_with_id
