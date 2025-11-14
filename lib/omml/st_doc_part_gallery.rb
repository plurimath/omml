# frozen_string_literal: true
require "lutaml/model"

class STDocPartGallery < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("placeholder"), super("any"), super("default"), super("docParts"), super("coverPg"), super("eq"), super("ftrs"), super("hdrs"), super("pgNum"), super("tbls"), super("watermarks"), super("autoTxt"), super("txtBox"), super("pgNumT"), super("pgNumB"), super("pgNumMargins"), super("tblOfContents"), super("bib"), super("custQuickParts"), super("custCoverPg"), super("custEq"), super("custFtrs"), super("custHdrs"), super("custPgNum"), super("custTbls"), super("custWatermarks"), super("custAutoTxt"), super("custTxtBox"), super("custPgNumT"), super("custPgNumB"), super("custPgNumMargins"), super("custTblOfContents"), super("custBib"), super("custom1"), super("custom2"), super("custom3"), super("custom4"), super("custom5")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_doc_part_gallery)
  end
end

STDocPartGallery.register_class_with_id
