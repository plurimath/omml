# frozen_string_literal: true

require "lutaml/model"
require_relative "eg_ruby_content"
class CTRubyContent < Lutaml::Model::Serializable
  import_model_attributes :eg_ruby_content

  xml do
    root "RubyContent"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    import_model_mappings :eg_ruby_content
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_ruby_content)
  end
end

CTRubyContent.register_class_with_id
