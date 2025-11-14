# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_doc_defaults"
require_relative "ct_latent_styles"
require_relative "ct_style"
class CTStyles < Lutaml::Model::Serializable
  attribute :doc_defaults, :ct_doc_defaults, collection: 0..1
  attribute :latent_styles, :ct_latent_styles, collection: 0..1
  attribute :style, :ct_style, collection: 0..Float::INFINITY

  xml do
    root "Styles"

    sequence do
      map_element :docDefaults, to: :doc_defaults
      map_element :latentStyles, to: :latent_styles
      map_element :style, to: :style
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_styles)
  end
end

CTStyles.register_class_with_id
