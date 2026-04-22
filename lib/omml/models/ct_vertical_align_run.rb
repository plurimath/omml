# frozen_string_literal: true

module Omml
  module Models
    class CTVerticalAlignRun < Lutaml::Model::Serializable
      attribute :val, :st_vertical_align_run

      xml do
        element "CT_VerticalAlignRun"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTVerticalAlignRun)
  end
end
