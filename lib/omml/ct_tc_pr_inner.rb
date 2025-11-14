# frozen_string_literal: true

require_relative "ct_tc_pr_base"
require_relative "eg_cell_markup_elements"
class CTTcPrInner < CTTcPrBase
  import_model_attributes :eg_cell_markup_elements

  xml do
    root "TcPrInner"

    sequence do
      import_model_mappings :eg_cell_markup_elements
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_tc_pr_inner)
  end
end

CTTcPrInner.register_class_with_id
