# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_ftn_edn"
class CTEndnotes < Lutaml::Model::Serializable
  attribute :endnote, :ct_ftn_edn, collection: 0..1

  xml do
    root "Endnotes", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :endnote, to: :endnote
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_endnotes)
  end
end

CTEndnotes.register_class_with_id
