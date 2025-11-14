# frozen_string_literal: true
require "lutaml/model"

class STNumberFormat < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("decimal"), super("upperRoman"), super("lowerRoman"), super("upperLetter"), super("lowerLetter"), super("ordinal"), super("cardinalText"), super("ordinalText"), super("hex"), super("chicago"), super("ideographDigital"), super("japaneseCounting"), super("aiueo"), super("iroha"), super("decimalFullWidth"), super("decimalHalfWidth"), super("japaneseLegal"), super("japaneseDigitalTenThousand"), super("decimalEnclosedCircle"), super("decimalFullWidth2"), super("aiueoFullWidth"), super("irohaFullWidth"), super("decimalZero"), super("bullet"), super("ganada"), super("chosung"), super("decimalEnclosedFullstop"), super("decimalEnclosedParen"), super("decimalEnclosedCircleChinese"), super("ideographEnclosedCircle"), super("ideographTraditional"), super("ideographZodiac"), super("ideographZodiacTraditional"), super("taiwaneseCounting"), super("ideographLegalTraditional"), super("taiwaneseCountingThousand"), super("taiwaneseDigital"), super("chineseCounting"), super("chineseLegalSimplified"), super("chineseCountingThousand"), super("koreanDigital"), super("koreanCounting"), super("koreanLegal"), super("koreanDigital2"), super("vietnameseCounting"), super("russianLower"), super("russianUpper"), super("none"), super("numberInDash"), super("hebrew1"), super("hebrew2"), super("arabicAlpha"), super("arabicAbjad"), super("hindiVowels"), super("hindiConsonants"), super("hindiNumbers"), super("hindiCounting"), super("thaiLetters"), super("thaiNumbers"), super("thaiCounting")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_number_format)
  end
end

STNumberFormat.register_class_with_id
