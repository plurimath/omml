# frozen_string_literal: true
require "lutaml/model"

class STTblWidth < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("nil"), super("pct"), super("dxa"), super("auto")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_tbl_width)
  end
end

STTblWidth.register_class_with_id
