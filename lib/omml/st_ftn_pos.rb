# frozen_string_literal: true
require "lutaml/model"

class STFtnPos < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("pageBottom"), super("beneathText"), super("sectEnd"), super("docEnd")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_ftn_pos)
  end
end

STFtnPos.register_class_with_id
