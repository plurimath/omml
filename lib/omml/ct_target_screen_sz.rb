# frozen_string_literal: true

require "lutaml/model"
require_relative "st_target_screen_sz"
class CTTargetScreenSz < Lutaml::Model::Serializable
  attribute :val, :st_target_screen_sz

  xml do
    root "TargetScreenSz"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_target_screen_sz)
  end
end

CTTargetScreenSz.register_class_with_id
