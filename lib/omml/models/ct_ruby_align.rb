# frozen_string_literal: true

module Omml
  module Models
    class CTRubyAlign < Lutaml::Model::Serializable
      attribute :val, :st_ruby_align

      xml do
        element "CT_RubyAlign"

        namespace Omml::Namespace

        map_attribute :val, to: :val
      end
    end

    Omml::Configuration.register_model(CTRubyAlign)
  end
end
