# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_adj_point2_d"
class CTPath2DCubicBezierTo < Lutaml::Model::Serializable
  attribute :pt, :ct_adj_point2_d, collection: 3..3

  xml do
    root "Path2DCubicBezierTo"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :pt, to: :pt
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_path2_d_cubic_bezier_to)
  end
end

CTPath2DCubicBezierTo.register_class_with_id
