# frozen_string_literal: true

require_relative "ct_script"
require_relative "ct_style"
class EGScriptStyle < Lutaml::Model::Serializable
  attribute :scr, :ct_script, collection: 0..1
  attribute :sty, :ct_style, collection: 0..1

  xml do
    no_root
    sequence do
      map_element :scr, to: :scr
      map_element :sty, to: :sty
    end
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_script_style)
  end
end

EGScriptStyle.register_class_with_id
