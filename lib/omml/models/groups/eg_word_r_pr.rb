# frozen_string_literal: true

module Omml
  module Models
    class EGWordRPr < Base
      attribute :word_r_pr, :ct_r_pr, collection: 0..1

      xml do
        type_name "EG_WordRPr"
        namespace Omml::WordprocessingNamespace
        map_element :rPr, to: :word_r_pr
      end
    end
  end
end
