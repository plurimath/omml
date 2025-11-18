# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_mc"
class CTMCS < Lutaml::Model::Serializable
  attribute :mc, :ct_mc, collection: 1..Float::INFINITY

  xml do
    root "MCS"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :mc, to: :mc
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_mcs)
  end
end

CTMCS.register_class_with_id
