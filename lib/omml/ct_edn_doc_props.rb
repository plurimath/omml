# frozen_string_literal: true

require_relative "ct_edn_props"
require_relative "ct_ftn_edn_sep_ref"
class CTEdnDocProps < CTEdnProps
  attribute :endnote, :ct_ftn_edn_sep_ref, collection: 0..3

  xml do
    root "EdnDocProps", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :endnote, to: :endnote
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_edn_doc_props)
  end
end

CTEdnDocProps.register_class_with_id
