# frozen_string_literal: true
require "lutaml/model"

class STAnnotationVMerge < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("cont"), super("rest")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_annotation_v_merge)
  end
end

STAnnotationVMerge.register_class_with_id
