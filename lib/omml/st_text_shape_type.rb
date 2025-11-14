# frozen_string_literal: true
require "lutaml/model"

require_relative "token"
require_relative "token"
class STTextShapeType < Token
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("textNoShape"), super("textPlain"), super("textStop"), super("textTriangle"), super("textTriangleInverted"), super("textChevron"), super("textChevronInverted"), super("textRingInside"), super("textRingOutside"), super("textArchUp"), super("textArchDown"), super("textCircle"), super("textButton"), super("textArchUpPour"), super("textArchDownPour"), super("textCirclePour"), super("textButtonPour"), super("textCurveUp"), super("textCurveDown"), super("textCanUp"), super("textCanDown"), super("textWave1"), super("textWave2"), super("textDoubleWave1"), super("textWave4"), super("textInflate"), super("textDeflate"), super("textInflateBottom"), super("textDeflateBottom"), super("textInflateTop"), super("textDeflateTop"), super("textDeflateInflate"), super("textDeflateInflateDeflate"), super("textFadeRight"), super("textFadeLeft"), super("textFadeUp"), super("textFadeDown"), super("textSlantUp"), super("textSlantDown"), super("textCascadeUp"), super("textCascadeDown")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_text_shape_type)
  end
end

STTextShapeType.register_class_with_id
