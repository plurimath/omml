# frozen_string_literal: true
require "lutaml/model"

class STCalendarType < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("gregorian"), super("hijri"), super("hebrew"), super("taiwan"), super("japan"), super("thai"), super("korea"), super("saka"), super("gregorianXlitEnglish"), super("gregorianXlitFrench")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_calendar_type)
  end
end

STCalendarType.register_class_with_id
