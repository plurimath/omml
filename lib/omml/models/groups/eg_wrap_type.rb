# frozen_string_literal: true

require_relative "../ct_wrap_none"
require_relative "../ct_wrap_square"
require_relative "../ct_wrap_tight"
require_relative "../ct_wrap_through"
require_relative "../ct_wrap_top_bottom"
module Omml
  module Models
    class EGWrapType < Lutaml::Model::Serializable
      choice(min: 1, max: 1) do
        attribute :wrap_none, :ct_wrap_none, collection: 1..1
        attribute :wrap_square, :ct_wrap_square, collection: 1..1
        attribute :wrap_tight, :ct_wrap_tight, collection: 1..1
        attribute :wrap_through, :ct_wrap_through, collection: 1..1
        attribute :wrap_top_and_bottom, :ct_wrap_top_bottom, collection: 1..1
      end

      xml do
        type_name "EG_WrapType"
        map_element :wrapNone, to: :wrap_none, render_empty: true
        map_element :wrapSquare, to: :wrap_square, render_empty: true
        map_element :wrapTight, to: :wrap_tight, render_empty: true
        map_element :wrapThrough, to: :wrap_through, render_empty: true
        map_element :wrapTopAndBottom, to: :wrap_top_and_bottom,
                                       render_empty: true
      end
    end

    Omml::Configuration.register_model(EGWrapType)
  end
end
