# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_on_off"
require_relative "eg_script_style"
require_relative "ct_manual_break"
class CTRPR < Lutaml::Model::Serializable
  attribute :lit, :ct_on_off, collection: 0..1
  choice(min: 1, max: 1) do
    attribute :nor, :ct_on_off, collection: 0..1
    import_model_attributes :eg_script_style
  end
  attribute :brk, :ct_manual_break, collection: 0..1
  attribute :aln, :ct_on_off, collection: 0..1

  xml do
    root "rPr", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :lit, to: :lit
      map_element :nor, to: :nor
      sequence do
        import_model_mappings :eg_script_style
      end
      map_element :brk, to: :brk
      map_element :aln, to: :aln
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_rpr)
  end
end

CTRPR.register_class_with_id
