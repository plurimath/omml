# frozen_string_literal: true

module Omml
  module Models
    class CTPictureBase < Lutaml::Model::Serializable
      xml do
        element "CT_PictureBase"

        namespace Omml::Namespace
      end
    end

    Omml::Configuration.register_model(CTPictureBase)
  end
end
