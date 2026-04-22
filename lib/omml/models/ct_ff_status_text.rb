# frozen_string_literal: true

module Omml
  module Models
    class CTFFStatusText < Lutaml::Model::Serializable
      attribute :type, :st_info_text_type
      attribute :val, :st_ff_status_text_val

      xml do
        element "CT_FFStatusText"

        namespace Omml::Namespace

        map_attribute :type, to: :type
        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTFFStatusText)
  end
end
