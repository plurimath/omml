# frozen_string_literal: true

module Omml
  module Models
    # WordprocessingML empty marker type, parallel to CTEmpty (math).
    # Per OOXML schema, several elements inside a math run (`<m:r>`) are
    # WordprocessingML primitives with empty content model: `<w:cr/>`,
    # `<w:tab/>`, `<w:noBreakHyphen/>`, `<w:pgNum/>`, etc. These resolve
    # to the wordprocessing `CT_Empty`, not the math one.
    #
    # The container class (`EGWordRunInnerContent`) already declares the
    # wordprocessing namespace, but lutaml-model matches elements by the
    # TYPE's namespace during parsing. Without this parallel type,
    # math-namespaced CTEmpty won't match `<w:cr/>` and the element is
    # silently dropped.
    class CTWordprocessingEmpty < Base
      xml do
        element "CT_Empty"

        namespace Omml::WordprocessingNamespace
      end
    end
  end
end
