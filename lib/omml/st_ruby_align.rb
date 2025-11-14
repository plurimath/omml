# frozen_string_literal: true
require "lutaml/model"

class STRubyAlign < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("center"), super("distributeLetter"), super("distributeSpace"), super("left"), super("right"), super("rightVertical")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_ruby_align)
  end
end

STRubyAlign.register_class_with_id
