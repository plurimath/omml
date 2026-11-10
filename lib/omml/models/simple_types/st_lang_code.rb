# frozen_string_literal: true

module Omml
  module Models
    class STLangCode < HexBinary
    end
    Omml::Configuration.register_model(STLangCode, id: :st_lang_code)
  end
end
