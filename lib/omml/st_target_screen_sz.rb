# frozen_string_literal: true
require "lutaml/model"

class STTargetScreenSz < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("544x376"), super("640x480"), super("720x512"), super("800x600"), super("1024x768"), super("1152x882"), super("1152x900"), super("1280x1024"), super("1600x1200"), super("1800x1440"), super("1920x1200")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_target_screen_sz)
  end
end

STTargetScreenSz.register_class_with_id
