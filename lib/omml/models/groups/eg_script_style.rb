# frozen_string_literal: true

module Omml
  module Models
    class EGScriptStyle < Lutaml::Model::Serializable
      attribute :scr, :ct_script, collection: 0..1
      attribute :sty, :ct_style, collection: 0..1

      xml do
        type_name "EG_ScriptStyle"
        map_element :scr, to: :scr
        map_element :sty, to: :sty
      end
    end

    Omml::Configuration.register_model(EGScriptStyle)
  end
end
