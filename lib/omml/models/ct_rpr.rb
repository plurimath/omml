# frozen_string_literal: true

module Omml
  module Models
    class CTRPR < Lutaml::Model::Serializable
      attribute :lit, :ct_on_off, collection: 0..1
      choice(min: 1, max: 1) do
        attribute :nor, :ct_on_off, collection: 0..1
        import_model_attributes :eg_script_style
      end
      attribute :brk, :ct_manual_break, collection: 0..1
      attribute :aln, :ct_on_off, collection: 0..1

      xml do
        element "CT_RPR"

        namespace Omml::Namespace

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
    end

    Omml::Configuration.register_model(CTRPR)
  end
end
