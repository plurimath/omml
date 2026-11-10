# frozen_string_literal: true

require "spec_helper"

RSpec.shared_examples "OMML native scalar aliases" do
  before do
    Omml::Models.eager_load!
    Omml::Configuration.populate_context!
  end

  def scalar_xml(element, value)
    %(<m:#{element} xmlns:m="#{Omml::Namespace.uri}" m:val="#{value}"/>)
  end

  it "resolves color aliases and preserves ordered native cast behavior" do
    color = Omml::Models::CTColor
    expect(color.new(val: "auto").val).to eq("auto")
    expect(color.from_xml(scalar_xml("CT_Color", "")).val).to eq("")
    expect do
      color.from_xml(scalar_xml("CT_Color", "AABBCC"))
    end.to raise_error(Lutaml::Model::Type::InvalidValueError)
    register = Omml::Configuration.context_id
    rgb = Lutaml::Model::GlobalContext.resolve_type(:st_hex_color_rgb, register)
    expect(rgb).to eq(Omml::Models::STHexColorRGB)
  end

  it "resolves the original language code alias in constructors and XML" do
    [
      [Omml::Models::CTLang, "CT_Lang"],
      [Omml::Models::CTLanguage, "CT_Language"],
    ].each do |model, element|
      expect(model.new(val: "en-US").val).to eq("en-US")
      expect(model.from_xml(scalar_xml(element, "ja-JP")).val).to eq("ja-JP")
    end
  end
end

describe_per_adapter "OMML native scalar aliases"
