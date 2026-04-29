# frozen_string_literal: true

module Omml
  module Models
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
        type_name "EG_RunLevelElts"
        map_element :proofErr, to: :proof_err
        map_element :permStart, to: :perm_start
        map_element :permEnd, to: :perm_end
        import_model_mappings :eg_range_markup_elements
        map_element :ins, to: :ins
        map_element :del, to: :del
        map_element :moveFrom, to: :move_from, render_empty: true
        map_element :moveTo, to: :move_to, render_empty: true
        import_model_mappings :eg_math_content
      end
    end

    Omml::Configuration.register_model(EGRunLevelElts)
  end
end
