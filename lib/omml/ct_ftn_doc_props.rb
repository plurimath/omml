# frozen_string_literal: true

require_relative "ct_ftn_props"
require_relative "ct_ftn_edn_sep_ref"
class CTFtnDocProps < CTFtnProps
  attribute :footnote, :ct_ftn_edn_sep_ref, collection: 0..3

  xml do
    root "FtnDocProps", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :footnote, to: :footnote
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ftn_doc_props)
  end
end

CTFtnDocProps.register_class_with_id
