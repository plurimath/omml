# frozen_string_literal: true

require_relative "ct_track_change"
require_relative "ct_tr_pr_base"
class CTTrPrChange < CTTrackChange
  attribute :tr_pr, :ct_tr_pr_base, collection: 1..1

  xml do
    root "TrPrChange", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :trPr, to: :tr_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tr_pr_change)
  end
end

CTTrPrChange.register_class_with_id
