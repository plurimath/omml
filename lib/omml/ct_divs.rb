# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_div"
class CTDivs < Lutaml::Model::Serializable
  attribute :div, :ct_div

  xml do
    root "Divs"

    sequence do
      map_element :div, to: :div
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_divs)
  end
end

CTDivs.register_class_with_id
