# frozen_string_literal: true

module Omml
  module Models
    class CTFType < Base
      attribute :val, :st_f_type

      xml do
        element "CT_FType"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end
  end
end
