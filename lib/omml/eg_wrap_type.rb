# frozen_string_literal: true

require_relative "ct_wrap_none"
require_relative "ct_wrap_square"
require_relative "ct_wrap_tight"
require_relative "ct_wrap_through"
require_relative "ct_wrap_top_bottom"
class EGWrapType < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :wrap_none, :ct_wrap_none, collection: 1..1
    attribute :wrap_square, :ct_wrap_square, collection: 1..1
    attribute :wrap_tight, :ct_wrap_tight, collection: 1..1
    attribute :wrap_through, :ct_wrap_through, collection: 1..1
    attribute :wrap_top_and_bottom, :ct_wrap_top_bottom, collection: 1..1
  end

  xml do
    no_root
    sequence do
      map_element :wrapNone, to: :wrap_none
      map_element :wrapSquare, to: :wrap_square
      map_element :wrapTight, to: :wrap_tight
      map_element :wrapThrough, to: :wrap_through
      map_element :wrapTopAndBottom, to: :wrap_top_and_bottom
    end
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_wrap_type)
  end
end

EGWrapType.register_class_with_id
