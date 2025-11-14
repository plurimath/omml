# frozen_string_literal: true
require "lutaml/model"

require_relative "token"
require_relative "token"
class STPresetColorVal < Token
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("aliceBlue"), super("antiqueWhite"), super("aqua"), super("aquamarine"), super("azure"), super("beige"), super("bisque"), super("black"), super("blanchedAlmond"), super("blue"), super("blueViolet"), super("brown"), super("burlyWood"), super("cadetBlue"), super("chartreuse"), super("chocolate"), super("coral"), super("cornflowerBlue"), super("cornsilk"), super("crimson"), super("cyan"), super("dkBlue"), super("dkCyan"), super("dkGoldenrod"), super("dkGray"), super("dkGreen"), super("dkKhaki"), super("dkMagenta"), super("dkOliveGreen"), super("dkOrange"), super("dkOrchid"), super("dkRed"), super("dkSalmon"), super("dkSeaGreen"), super("dkSlateBlue"), super("dkSlateGray"), super("dkTurquoise"), super("dkViolet"), super("deepPink"), super("deepSkyBlue"), super("dimGray"), super("dodgerBlue"), super("firebrick"), super("floralWhite"), super("forestGreen"), super("fuchsia"), super("gainsboro"), super("ghostWhite"), super("gold"), super("goldenrod"), super("gray"), super("green"), super("greenYellow"), super("honeydew"), super("hotPink"), super("indianRed"), super("indigo"), super("ivory"), super("khaki"), super("lavender"), super("lavenderBlush"), super("lawnGreen"), super("lemonChiffon"), super("ltBlue"), super("ltCoral"), super("ltCyan"), super("ltGoldenrodYellow"), super("ltGray"), super("ltGreen"), super("ltPink"), super("ltSalmon"), super("ltSeaGreen"), super("ltSkyBlue"), super("ltSlateGray"), super("ltSteelBlue"), super("ltYellow"), super("lime"), super("limeGreen"), super("linen"), super("magenta"), super("maroon"), super("medAquamarine"), super("medBlue"), super("medOrchid"), super("medPurple"), super("medSeaGreen"), super("medSlateBlue"), super("medSpringGreen"), super("medTurquoise"), super("medVioletRed"), super("midnightBlue"), super("mintCream"), super("mistyRose"), super("moccasin"), super("navajoWhite"), super("navy"), super("oldLace"), super("olive"), super("oliveDrab"), super("orange"), super("orangeRed"), super("orchid"), super("paleGoldenrod"), super("paleGreen"), super("paleTurquoise"), super("paleVioletRed"), super("papayaWhip"), super("peachPuff"), super("peru"), super("pink"), super("plum"), super("powderBlue"), super("purple"), super("red"), super("rosyBrown"), super("royalBlue"), super("saddleBrown"), super("salmon"), super("sandyBrown"), super("seaGreen"), super("seaShell"), super("sienna"), super("silver"), super("skyBlue"), super("slateBlue"), super("slateGray"), super("snow"), super("springGreen"), super("steelBlue"), super("tan"), super("teal"), super("thistle"), super("tomato"), super("turquoise"), super("violet"), super("wheat"), super("white"), super("whiteSmoke"), super("yellow"), super("yellowGreen")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_preset_color_val)
  end
end

STPresetColorVal.register_class_with_id
