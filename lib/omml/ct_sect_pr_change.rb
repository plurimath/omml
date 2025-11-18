# frozen_string_literal: true

require_relative "ct_track_change"
require_relative "ct_sect_pr_base"
class CTSectPrChange < CTTrackChange
  attribute :sect_pr, :ct_sect_pr_base, collection: 0..1

  xml do
    root "SectPrChange"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :sectPr, to: :sect_pr
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_sect_pr_change)
  end
end

CTSectPrChange.register_class_with_id
