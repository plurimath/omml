# frozen_string_literal: true

require_relative "ct_track_change"
require_relative "ct_r_pr_original"
class CTRPrChange < CTTrackChange
  attribute :r_pr, :ct_r_pr_original, collection: 1..1

  xml do
    root "RPrChange"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :rPr, to: :r_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_r_pr_change)
  end
end

CTRPrChange.register_class_with_id
