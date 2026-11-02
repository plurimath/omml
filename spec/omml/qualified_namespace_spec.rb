# frozen_string_literal: true

require "spec_helper"

# Asserts every Omml-owned namespace class carries the OOXML schema's
# elementFormDefault="qualified" declaration. Without this, the serializer
# emits unprefixed children when models are nested inside foreign-context
# parents (Uniword's <w:p> in :default) and Word rejects the file.
RSpec.describe "Omml namespace element_form_default coverage" do
  describe Omml::Namespace do
    it "declares element_form_default :qualified" do
      expect(described_class.element_form_default).to eq(:qualified)
    end

    it "declares attribute_form_default :qualified" do
      expect(described_class.attribute_form_default).to eq(:qualified)
    end

    it "uses the math namespace URI" do
      expect(described_class.uri)
        .to eq("http://schemas.openxmlformats.org/officeDocument/2006/math")
    end

    it "uses prefix_default 'm'" do
      expect(described_class.prefix_default).to eq("m")
    end
  end

  describe Omml::WordprocessingNamespace do
    it "declares element_form_default :qualified" do
      expect(described_class.element_form_default).to eq(:qualified)
    end

    it "declares attribute_form_default :qualified" do
      expect(described_class.attribute_form_default).to eq(:qualified)
    end

    it "uses the wordprocessing namespace URI" do
      expect(described_class.uri)
        .to eq("http://schemas.openxmlformats.org/wordprocessingml/2006/main")
    end

    it "uses prefix_default 'w'" do
      expect(described_class.prefix_default).to eq("w")
    end
  end
end
