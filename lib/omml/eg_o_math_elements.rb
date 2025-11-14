# frozen_string_literal: true

require_relative "eg_o_math_math_elements"
require_relative "eg_run_level_elts"
class EGOMathElements < Lutaml::Model::Serializable
  choice(min: 1, max: 1) do
    import_model_attributes :eg_o_math_math_elements
    import_model_attributes :eg_run_level_elts
  end

  xml do
    no_root
    import_model_mappings :eg_o_math_math_elements
    import_model_mappings :eg_run_level_elts
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_o_math_elements)
  end
end

EGOMathElements.register_class_with_id
