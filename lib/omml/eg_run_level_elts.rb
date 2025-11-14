# frozen_string_literal: true

require_relative "ct_proof_err"
require_relative "ct_perm_start"
require_relative "ct_perm"
require_relative "eg_range_markup_elements"
require_relative "ct_run_track_change"
require_relative "eg_math_content"
class EGRunLevelElts < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :proof_err, :ct_proof_err, collection: 0..1
    attribute :perm_start, :ct_perm_start, collection: 0..1
    attribute :perm_end, :ct_perm, collection: 0..1
    import_model_attributes :eg_range_markup_elements
    attribute :ins, :ct_run_track_change, collection: 0..1
    attribute :del, :ct_run_track_change, collection: 0..1
    attribute :move_from, :ct_run_track_change
    attribute :move_to, :ct_run_track_change
    import_model_attributes :eg_math_content
  end

  xml do
    no_root
    map_element :proofErr, to: :proof_err
    map_element :permStart, to: :perm_start
    map_element :permEnd, to: :perm_end
    import_model_mappings :eg_range_markup_elements
    map_element :ins, to: :ins
    map_element :del, to: :del
    map_element :moveFrom, to: :move_from
    map_element :moveTo, to: :move_to
    import_model_mappings :eg_math_content
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_run_level_elts)
  end
end

EGRunLevelElts.register_class_with_id
