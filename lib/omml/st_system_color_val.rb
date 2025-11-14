# frozen_string_literal: true
require "lutaml/model"

require_relative "token"
require_relative "token"
class STSystemColorVal < Token
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("scrollBar"), super("background"), super("activeCaption"), super("inactiveCaption"), super("menu"), super("window"), super("windowFrame"), super("menuText"), super("windowText"), super("captionText"), super("activeBorder"), super("inactiveBorder"), super("appWorkspace"), super("highlight"), super("highlightText"), super("btnFace"), super("btnShadow"), super("grayText"), super("btnText"), super("inactiveCaptionText"), super("btnHighlight"), super("3dDkShadow"), super("3dLight"), super("infoText"), super("infoBk"), super("hotLight"), super("gradientActiveCaption"), super("gradientInactiveCaption"), super("menuHighlight"), super("menuBar")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_system_color_val)
  end
end

STSystemColorVal.register_class_with_id
