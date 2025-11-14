# frozen_string_literal: true

require_relative "ct_track_change"
require_relative "eg_content_run_content"
require_relative "eg_o_math_math_elements"
class CTRunTrackChange < CTTrackChange
  choice(min: 0, max: Float::INFINITY) do
    import_model_attributes :eg_content_run_content
    import_model_attributes :eg_o_math_math_elements
  end

  xml do
    root "RunTrackChange"

    import_model_mappings :eg_content_run_content
    import_model_mappings :eg_o_math_math_elements
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_run_track_change)
  end
end

CTRunTrackChange.register_class_with_id
