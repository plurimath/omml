# frozen_string_literal: true
require "lutaml/model"

class STTblStyleOverrideType < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("wholeTable"), super("firstRow"), super("lastRow"), super("firstCol"), super("lastCol"), super("band1Vert"), super("band2Vert"), super("band1Horz"), super("band2Horz"), super("neCell"), super("nwCell"), super("seCell"), super("swCell")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_tbl_style_override_type)
  end
end

STTblStyleOverrideType.register_class_with_id
