# frozen_string_literal: true

require_relative "ct_hdr_ftr_ref"
class EGHdrFtrReferences < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :header_reference, :ct_hdr_ftr_ref, collection: 0..1
    attribute :footer_reference, :ct_hdr_ftr_ref, collection: 0..1
  end

  xml do
    no_root
    map_element :headerReference, to: :header_reference
    map_element :footerReference, to: :footer_reference
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_hdr_ftr_references)
  end
end

EGHdrFtrReferences.register_class_with_id
