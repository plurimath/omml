# frozen_string_literal: true

module Omml
  module Models
    class CTOMathArgPr < Base
      attribute :arg_sz, :ct_integer2, collection: 0..1

      xml do
        element "CT_OMathArgPr"

        namespace Omml::Namespace

        sequence do
          map_element :argSz, to: :arg_sz
        end
      end
    end
  end
end
