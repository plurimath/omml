# frozen_string_literal: true

module Omml
  module Models
    class CTXAlign < Lutaml::Model::Serializable
      attribute :val, :st_x_align

      xml do
        element "CT_XAlign"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTXAlign)
  end
end
