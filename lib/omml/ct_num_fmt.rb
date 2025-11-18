# frozen_string_literal: true

require "lutaml/model"
require_relative "st_number_format"
class CTNumFmt < Lutaml::Model::Serializable
  attribute :val, :st_number_format

  xml do
    root "NumFmt"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_num_fmt)
  end
end

CTNumFmt.register_class_with_id
