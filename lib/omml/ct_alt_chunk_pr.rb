# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_on_off"
class CTAltChunkPr < Lutaml::Model::Serializable
  attribute :match_src, :ct_on_off, collection: 0..1

  xml do
    root "AltChunkPr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :matchSrc, to: :match_src
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_alt_chunk_pr)
  end
end

CTAltChunkPr.register_class_with_id
