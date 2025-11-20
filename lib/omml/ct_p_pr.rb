# frozen_string_literal: true

require_relative "ct_p_pr_base"
require_relative "ct_para_r_pr"
require_relative "ct_sect_pr"
require_relative "ct_p_pr_change"
class CTPPr < CTPPrBase
  attribute :r_pr, :ct_para_r_pr, collection: 0..1
  attribute :sect_pr, :ct_sect_pr, collection: 0..1
  attribute :p_pr_change, :ct_p_pr_change, collection: 0..1

  xml do
    root "PPr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :rPr, to: :r_pr
      map_element :sectPr, to: :sect_pr
      map_element :pPrChange, to: :p_pr_change
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_p_pr)
  end
end

CTPPr.register_class_with_id
