# frozen_string_literal: true
require "lutaml/model"

class STChapterSep < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("hyphen"), super("period"), super("colon"), super("emDash"), super("enDash")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_chapter_sep)
  end
end

STChapterSep.register_class_with_id
