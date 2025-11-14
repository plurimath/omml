# frozen_string_literal: true

require_relative "ct_decimal_number"
require_relative "ct_num_restart"
class EGFtnEdnNumProps < Lutaml::Model::Serializable
  attribute :num_start, :ct_decimal_number, collection: 0..1
  attribute :num_restart, :ct_num_restart, collection: 0..1

  xml do
    no_root
    sequence do
      map_element :numStart, to: :num_start
      map_element :numRestart, to: :num_restart
    end
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_ftn_edn_num_props)
  end
end

EGFtnEdnNumProps.register_class_with_id
