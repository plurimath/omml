# frozen_string_literal: true

require_relative "ct_markup_range"
require_relative "st_decimal_number"
class CTBookmarkRange < CTMarkupRange
  attribute :col_first, :st_decimal_number
  attribute :col_last, :st_decimal_number

  xml do
    root "BookmarkRange"

    map_attribute :colFirst, to: :col_first
    map_attribute :colLast, to: :col_last
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_bookmark_range)
  end
end

CTBookmarkRange.register_class_with_id
