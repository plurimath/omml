# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_rpr"
require_relative "eg_r_pr"
require_relative "eg_run_inner_content"
require_relative "ct_text"
class CTR < Lutaml::Model::Serializable
  attribute :r_pr, :ct_rpr, collection: 0..1
  import_model_attributes :eg_r_pr
  choice(min: 0, max: Float::INFINITY) do
    import_model_attributes :eg_run_inner_content
    attribute :t, :ct_text, collection: 0..1
  end

  xml do
    root "R"

    sequence do
      map_element :rPr, to: :r_pr
      import_model_mappings :eg_r_pr
      import_model_mappings :eg_run_inner_content
      map_element :t, to: :t
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_r)
  end
end

CTR.register_class_with_id
