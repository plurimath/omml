# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_ruby_pr"
require_relative "ct_ruby_content"
class CTRuby < Lutaml::Model::Serializable
  attribute :ruby_pr, :ct_ruby_pr
  attribute :rt, :ct_ruby_content
  attribute :ruby_base, :ct_ruby_content

  xml do
    root "Ruby"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :rubyPr, to: :ruby_pr
      map_element :rt, to: :rt
      map_element :rubyBase, to: :ruby_base
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ruby)
  end
end

CTRuby.register_class_with_id
