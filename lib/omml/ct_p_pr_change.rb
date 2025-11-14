# frozen_string_literal: true

require_relative "ct_track_change"
require_relative "ct_p_pr_base"
class CTPPrChange < CTTrackChange
  attribute :p_pr, :ct_p_pr_base, collection: 1..1

  xml do
    root "PPrChange"

    sequence do
      map_element :pPr, to: :p_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_p_pr_change)
  end
end

CTPPrChange.register_class_with_id
