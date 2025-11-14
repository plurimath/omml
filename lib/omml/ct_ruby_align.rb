# frozen_string_literal: true

require "lutaml/model"
require_relative "st_ruby_align"
class CTRubyAlign < Lutaml::Model::Serializable
  attribute :val, :st_ruby_align

  xml do
    root "RubyAlign"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ruby_align)
  end
end

CTRubyAlign.register_class_with_id
