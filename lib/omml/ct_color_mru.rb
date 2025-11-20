# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_color_choice"
class CTColorMRU < Lutaml::Model::Serializable
  import_model_attributes :eg_color_choice

  xml do
    root "ColorMRU", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      import_model_mappings :eg_color_choice
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_color_mru)
  end
end

CTColorMRU.register_class_with_id
