# frozen_string_literal: true

module Omml
  module Models
    class CTManualBreak < Lutaml::Model::Serializable
      attribute :aln_at, :st_integer255

      xml do
        element "CT_ManualBreak"

        namespace Omml::Namespace

        map_attribute :alnAt, to: :aln_at
      end
    end

    Omml::Configuration.register_model(CTManualBreak)
  end
end
