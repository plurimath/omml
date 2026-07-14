# frozen_string_literal: true

module Omml
  module Models
    class EGRPr < Base
      attribute :r_pr, :ct_r_pr, collection: 0..1

      xml do
        type_name "EG_RPr"
        namespace Omml::WordprocessingNamespace
        map_element :rPr, to: :r_pr
      end
    end
  end
end
