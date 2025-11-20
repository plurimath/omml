# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_integer255"
require_relative "ct_x_align"
class CTMCPr < Lutaml::Model::Serializable
  attribute :count, :ct_integer255, collection: 0..1
  attribute :mc_jc, :ct_x_align, collection: 0..1

  xml do
    root "MCPr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :count, to: :count
      map_element :mcJc, to: :mc_jc
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_mc_pr)
  end
end

CTMCPr.register_class_with_id
