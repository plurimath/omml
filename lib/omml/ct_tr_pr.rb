# frozen_string_literal: true

require_relative "ct_tr_pr_base"
require_relative "ct_track_change"
require_relative "ct_tr_pr_change"
class CTTrPr < CTTrPrBase
  attribute :ins, :ct_track_change, collection: 0..1
  attribute :del, :ct_track_change, collection: 0..1
  attribute :tr_pr_change, :ct_tr_pr_change, collection: 0..1

  xml do
    root "TrPr"

    sequence do
      map_element :ins, to: :ins
      map_element :del, to: :del
      map_element :trPrChange, to: :tr_pr_change
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tr_pr)
  end
end

CTTrPr.register_class_with_id
