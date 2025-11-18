# frozen_string_literal: true

require_relative "ct_bookmark_range"
require_relative "st_string"
class CTBookmark < CTBookmarkRange
  attribute :name, :st_string

  xml do
    root "Bookmark"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :name, to: :name
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_bookmark)
  end
end

CTBookmark.register_class_with_id
