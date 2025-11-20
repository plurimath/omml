# frozen_string_literal: true

require "lutaml/model"
require_relative "st_textbox_tight_wrap"
class CTTextboxTightWrap < Lutaml::Model::Serializable
  attribute :val, :st_textbox_tight_wrap

  xml do
    root "TextboxTightWrap", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_textbox_tight_wrap)
  end
end

CTTextboxTightWrap.register_class_with_id
