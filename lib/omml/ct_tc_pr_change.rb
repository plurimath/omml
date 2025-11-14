# frozen_string_literal: true

require_relative "ct_track_change"
require_relative "ct_tc_pr_inner"
class CTTcPrChange < CTTrackChange
  attribute :tc_pr, :ct_tc_pr_inner, collection: 1..1

  xml do
    root "TcPrChange"

    sequence do
      map_element :tcPr, to: :tc_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tc_pr_change)
  end
end

CTTcPrChange.register_class_with_id
