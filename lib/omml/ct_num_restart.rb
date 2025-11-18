# frozen_string_literal: true

require "lutaml/model"
require_relative "st_restart_number"
class CTNumRestart < Lutaml::Model::Serializable
  attribute :val, :st_restart_number

  xml do
    root "NumRestart"
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    map_attribute :val, to: :val
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_num_restart)
  end
end

CTNumRestart.register_class_with_id
