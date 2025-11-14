# frozen_string_literal: true

require_relative "ct_r"
require_relative "eg_run_level_elts"
class EGRubyContent < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    attribute :r, :ct_r
    import_model_attributes :eg_run_level_elts
  end

  xml do
    no_root
    map_element :r, to: :r
    import_model_mappings :eg_run_level_elts
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_ruby_content)
  end
end

EGRubyContent.register_class_with_id
