# frozen_string_literal: true

require 'lutaml/model'
require_relative 'omml/version'
# require_relative 'omml/ct_o_math_para'

module Omml
  class Error < StandardError; end
  REGISTER_ID = :omml

  def register_id
    @register_id ||= Lutaml::Model::Register.new(REGISTER_ID).id
  end
end
