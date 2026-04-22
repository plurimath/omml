# frozen_string_literal: true

module Omml
  module Models
    class CTRuby < Lutaml::Model::Serializable
      attribute :ruby_pr, :ct_ruby_pr
      attribute :rt, :ct_ruby_content
      attribute :ruby_base, :ct_ruby_content

      xml do
        element "CT_Ruby"

        namespace Omml::Namespace

        sequence do
          map_element :rubyPr, to: :ruby_pr, render_empty: true
          map_element :rt, to: :rt, render_empty: true
          map_element :rubyBase, to: :ruby_base, render_empty: true
        end
      end
    end

    Omml::Configuration.register_model(CTRuby)
  end
end
