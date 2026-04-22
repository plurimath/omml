# frozen_string_literal: true

module Omml
  module Models
    class CTSdtRun < Lutaml::Model::Serializable
      attribute :sdt_pr, :ct_sdt_pr, collection: 0..1
      attribute :sdt_end_pr, :ct_sdt_end_pr, collection: 0..1
      attribute :sdt_content, :ct_sdt_content_run, collection: 0..1

      xml do
        element "CT_SdtRun"

        namespace Omml::Namespace

        sequence do
          map_element :sdtPr, to: :sdt_pr
          map_element :sdtEndPr, to: :sdt_end_pr
          map_element :sdtContent, to: :sdt_content
        end
      end
    end

    Omml::Configuration.register_model(CTSdtRun)
  end
end
