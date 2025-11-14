# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_ftn_edn"
class CTFootnotes < Lutaml::Model::Serializable
  attribute :footnote, :ct_ftn_edn, collection: 0..1

  xml do
    root "Footnotes"

    sequence do
      map_element :footnote, to: :footnote
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_footnotes)
  end
end

CTFootnotes.register_class_with_id
