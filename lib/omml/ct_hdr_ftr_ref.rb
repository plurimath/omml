# frozen_string_literal: true

require_relative "ct_rel"
require_relative "st_hdr_ftr"
class CTHdrFtrRef < CTRel
  attribute :type, :st_hdr_ftr

  xml do
    root "HdrFtrRef", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :type, to: :type
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_hdr_ftr_ref)
  end
end

CTHdrFtrRef.register_class_with_id
