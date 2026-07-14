# frozen_string_literal: true

module Omml
  module Models
    class CTRel < Base
      attribute :id, :st_relationship_id

      xml do
        element "CT_Rel"

        namespace Omml::Namespace

        map_attribute :id, to: :id
      end
    end
  end
end
