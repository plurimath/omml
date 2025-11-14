# frozen_string_literal: true

require "lutaml/model"
require_relative "st_top_bot"
class CTTopBot < Lutaml::Model::Serializable
  attribute :val, :st_top_bot

  xml do
    root "TopBot"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_top_bot)
  end
end

CTTopBot.register_class_with_id
