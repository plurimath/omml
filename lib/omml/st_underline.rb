# frozen_string_literal: true
require "lutaml/model"

class STUnderline < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("single"), super("words"), super("double"), super("thick"), super("dotted"), super("dottedHeavy"), super("dash"), super("dashedHeavy"), super("dashLong"), super("dashLongHeavy"), super("dotDash"), super("dashDotHeavy"), super("dotDotDash"), super("dashDotDotHeavy"), super("wave"), super("wavyHeavy"), super("wavyDouble"), super("none")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_underline)
  end
end

STUnderline.register_class_with_id
