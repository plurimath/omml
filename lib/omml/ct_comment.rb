# frozen_string_literal: true

require_relative "ct_track_change"
require_relative "eg_block_level_elts"
require_relative "st_string"
class CTComment < CTTrackChange
  import_model_attributes :eg_block_level_elts
  attribute :initials, :st_string

  xml do
    root "Comment"

    sequence do
      import_model_mappings :eg_block_level_elts
    end
    map_attribute :initials, to: :initials
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_comment)
  end
end

CTComment.register_class_with_id
