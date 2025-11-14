# frozen_string_literal: true
require "lutaml/model"

class STProofErr < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("spellStart"), super("spellEnd"), super("gramStart"), super("gramEnd")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_proof_err)
  end
end

STProofErr.register_class_with_id
