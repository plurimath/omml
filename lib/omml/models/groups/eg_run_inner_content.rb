# frozen_string_literal: true

module Omml
  module Models
    # Math run inner content. Per shared-math.xsd CT_R, the math schema
    # contributes only the `t` element (CT_Text) inside a math run; all
    # other run inner content (br, cr, tab, delText, etc.) belongs to
    # the WordprocessingML namespace via EGWordRunInnerContent.
    class EGRunInnerContent < Base
      choice(min: 1, max: 1) do
        attribute :t, :ct_text
      end

      xml do
        type_name "EG_RunInnerContent"
        map_element :t, to: :t, render_empty: true
      end
    end
  end
end
