# frozen_string_literal: true

require "lutaml/model"
require_relative "st_integer255"
class CTManualBreak < Lutaml::Model::Serializable
  attribute :aln_at, :st_integer255

  xml do
    root "ManualBreak"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :alnAt, to: :aln_at
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_manual_break)
  end
end

CTManualBreak.register_class_with_id
