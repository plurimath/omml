# frozen_string_literal: true

module Omml
  module Models
    # Math run inner content. Per shared-math.xsd CT_R, the math schema
    # contributes only the `t` element (CT_Text) inside a math run; all
    # other run inner content (br, cr, tab, delText, etc.) belongs to
    # the WordprocessingML namespace via EGWordRunInnerContent.
    #
    # CT_R's choice has maxOccurs="unbounded", so every attribute here is
    # a collection — multiple <m:t> can appear interleaved with
    # wordprocessing elements (<m:t>before<w:br/><m:t>after</m:t>).
    class EGRunInnerContent < Base
      choice(min: 1, max: 1) do
        attribute :t, :ct_text, collection: true
      end

      xml do
        type_name "EG_RunInnerContent"
        map_element :t, to: :t, render_empty: true
      end
    end
  end
end
