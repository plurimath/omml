# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_path2_d"
class CTPath2DList < Lutaml::Model::Serializable
  attribute :path, :ct_path2_d, collection: 0..Float::INFINITY

  xml do
    root "Path2DList", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :path, to: :path
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_path2_d_list)
  end
end

CTPath2DList.register_class_with_id
