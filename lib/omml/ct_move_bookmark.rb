# frozen_string_literal: true

require_relative "ct_bookmark"
require_relative "st_string"
require_relative "st_date_time"
class CTMoveBookmark < CTBookmark
  attribute :author, :st_string
  attribute :date, :st_date_time

  xml do
    root "MoveBookmark"

    map_attribute :author, to: :author
    map_attribute :date, to: :date
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_move_bookmark)
  end
end

CTMoveBookmark.register_class_with_id
