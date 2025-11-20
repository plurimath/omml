# frozen_string_literal: true

require_relative "ct_tc_pr_inner"
require_relative "ct_tc_pr_change"
class CTTcPr < CTTcPrInner
  attribute :tc_pr_change, :ct_tc_pr_change, collection: 0..1

  xml do
    root "TcPr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :tcPrChange, to: :tc_pr_change
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tc_pr)
  end
end

CTTcPr.register_class_with_id
