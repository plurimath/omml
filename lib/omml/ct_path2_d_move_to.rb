# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_adj_point2_d"
class CTPath2DMoveTo < Lutaml::Model::Serializable
  attribute :pt, :ct_adj_point2_d, collection: 1..1

  xml do
    root "Path2DMoveTo", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :pt, to: :pt
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_path2_d_move_to)
  end
end

CTPath2DMoveTo.register_class_with_id
