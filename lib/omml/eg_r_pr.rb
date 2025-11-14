# frozen_string_literal: true

require_relative "ct_r_pr"
class EGRPr < Lutaml::Model::Serializable
  attribute :r_pr, :ct_r_pr, collection: 0..1

  xml do
    no_root
    sequence do
      map_element :rPr, to: :r_pr
    end
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :eg_r_pr)
  end
end

EGRPr.register_class_with_id
