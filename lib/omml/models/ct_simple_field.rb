# frozen_string_literal: true

module Omml
  module Models
    class CTSimpleField < Lutaml::Model::Serializable
      attribute :fld_data, :ct_text, collection: 0..1
      import_model_attributes :eg_p_content
      attribute :instr, :st_string
      attribute :fld_lock, :st_on_off
      attribute :dirty, :st_on_off

      xml do
        element "CT_SimpleField"

        namespace Omml::Namespace

        sequence do
          map_element :fldData, to: :fld_data
          import_model_mappings :eg_p_content
        end
        map_attribute :instr, to: :instr
        map_attribute :fldLock, to: :fld_lock
        map_attribute :dirty, to: :dirty
      end
    end

    Omml::Configuration.register_model(CTSimpleField)
  end
end
