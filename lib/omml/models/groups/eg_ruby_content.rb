# frozen_string_literal: true

module Omml
  module Models
    class EGRubyContent < Lutaml::Model::Serializable
      choice(min: 1, max: 1) do
        attribute :r, :ct_r
        import_model_attributes :eg_run_level_elts
      end

      xml do
        type_name "EG_RubyContent"
        map_element :r, to: :r, render_empty: true
        import_model_mappings :eg_run_level_elts
      end
    end

    Omml::Configuration.register_model(EGRubyContent)
  end
end
