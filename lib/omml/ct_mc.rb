# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_mc_pr"
class CTMC < Lutaml::Model::Serializable
  attribute :mc_pr, :ct_mc_pr, collection: 0..1

  xml do
    root "MC"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :mcPr, to: :mc_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_mc)
  end
end

CTMC.register_class_with_id
