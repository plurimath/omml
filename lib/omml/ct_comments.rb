# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_comment"
class CTComments < Lutaml::Model::Serializable
  attribute :comment, :ct_comment, collection: 0..Float::INFINITY

  xml do
    root "Comments", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :comment, to: :comment
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_comments)
  end
end

CTComments.register_class_with_id
