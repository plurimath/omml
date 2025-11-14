# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_r_pr"
class CTSdtEndPr < Lutaml::Model::Serializable
  choice(min: 1, max: Float::INFINITY) do
    attribute :r_pr, :ct_r_pr, collection: 0..1
  end

  xml do
    root "SdtEndPr"

    map_element :rPr, to: :r_pr
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sdt_end_pr)
  end
end

CTSdtEndPr.register_class_with_id
