# frozen_string_literal: true

require "spec_helper"
require "nokogiri"
require "tmpdir"
require "fileutils"

def portable_registry_available?
  require "lutaml/model/lml"
  defined?(Lutaml::Model::Lml::ValueDeclarations)
rescue LoadError => e
  raise unless e.path == "lutaml/model/lml"

  false
end

if portable_registry_available?
  RSpec.shared_examples "portable scalar declarations" do
    before do
      Omml::Models.eager_load!
      Omml::Configuration.populate_context!
    end

    def xml_tree(xml)
      root = Nokogiri::XML(xml, &:strict).root
      expect(root.children).to be_empty
      [[root.namespace&.href, root.name], attribute_tree(root)]
    end

    def attribute_tree(root)
      root.attribute_nodes.map do |attribute|
        [[attribute.namespace&.href, attribute.name], attribute.value]
      end.sort_by { |key, _| key.map(&:to_s) }
    end

    it "exports explicit source class identities and enum declarations" do
      bundle = described_class.export_bundle(Omml::Models::CTBr)
      expect(bundle.models.keys).to eq(["Omml::Models::CTBr@omml"])
      expect(bundle.value_types.keys).to eq(%w[
                                              Omml::Models::STBrClear@omml Omml::Models::STBrType@omml
                                            ])
      expect(described_class.enum_declarations.version).to eq(1)
      expect(described_class.native_bindings(bundle).values).to contain_exactly(
        Omml::Models::STBrClear, Omml::Models::STBrType
      )
    end

    it "preserves source enum values and qualified XML attribute QNames" do
      bundle = described_class.export_bundle(Omml::Models::CTBr)
      bindings = described_class.native_bindings(bundle)
      models = Lutaml::Model::Lml.import_bundle(bundle, type_bindings: bindings)
      imported = models.fetch("Omml::Models::CTBr@omml")
      cases = [{}] + Omml::Models::STBrType::VALUES.map do |value|
        { type: value }
      end + Omml::Models::STBrClear::VALUES.map do |value|
              { clear: value }
            end + [{ type: "page", clear: "all" }]
      cases.each do |input|
        original = Omml::Models::CTBr.new(input).to_xml(use_prefix: true)
        actual = imported.from_xml(original)
        expected = xml_tree(original)
        expect(xml_tree(actual.to_xml(use_prefix: true))).to eq(expected)
        input.each do |name, value|
          expect(actual.public_send(name)).to eq(value)
        end
      end
    end

    it "preserves native enum refusals" do
      bundle = described_class.export_bundle(Omml::Models::CTBr)
      bindings = described_class.native_bindings(bundle)
      models = Lutaml::Model::Lml.import_bundle(bundle, type_bindings: bindings)
      imported = models.fetch("Omml::Models::CTBr@omml")
      %i[type clear].each do |field|
        expect { imported.new(field => "unknown") }.to raise_error(Lutaml::Model::Type::InvalidValueError)
      end
    end

    it "declares only the unchanged closed String enum family" do
      registry = described_class.enum_declarations
      described_class::ENUM_TYPES.each do |name|
        klass = Omml::Models.const_get(name, false)
        base = klass < Omml::Models::EnumString ? Omml::Models::EnumString : Omml::Models::Token
        expect(klass.method(:cast).owner).to eq(base.method(:cast).owner)
        expect(klass.facets).to be_empty
        values = registry.fetch(klass).fetch("facets").fetch("enumeration")
        values.each do |value|
          expect(klass.cast(value)).to eq(value)
        end
        expect(klass.cast(nil)).to be_nil
        expect(values).to include("")
        expect { klass.cast("__not_a_portable_enum_value__") }.to raise_error(
          Lutaml::Model::Type::InvalidValueError,
        )
      end
    end

    it "requires named integer bindings and preserves the XML space QName" do
      data = described_class.model_declarations("scalar-subset-v1")
      types = data.fetch("value_types")
      integer = types.fetch("Omml::Models::UnsignedInt@omml")
      expect(integer.fetch("facets").fetch("source_binding_v1")).to be(true)

      text = data.fetch("models").fetch("Omml::Models::CTText@omml")
      rule = text.dig("mappings", "xml", "rules").find do |mapping|
        mapping.fetch("to") == "space"
      end
      expect(rule.fetch("namespace")).to include(
        "uri" => "http://www.w3.org/XML/1998/namespace", "prefix" => "xml",
      )
    end

    it "keeps unverified scalar families as explicit exporter refusals" do
      expect do
        described_class.export_bundle(Omml::Models::CTColor)
      end.to raise_error(Lutaml::Model::Lml::RejectedError) { |failure|
               expect(failure.reason).to eq(:unsupported_type)
             }
    end
  end

  describe_per_adapter "portable scalar declarations", subject: Omml::Portable
else
  RSpec.describe "portable scalar capability" do
    it "requires an explicit compatible framework" do
      expect { Omml::Portable.enum_declarations }.to raise_error(Omml::Portable::UnsupportedRuntime)
    end
  end
end

RSpec.describe Omml::Portable do
  it "loads the checksummed data without materializing models" do
    tree = described_class.model_declarations
    expect(tree.fetch("lml_bundle")).to eq(1)
    expect(tree.fetch("models").keys).to eq(["Omml::Models::CTBr@omml"])
    expect(tree.fetch("value_types").length).to eq(2)
  end

  it "refuses a corrupted packaged declaration" do
    Dir.mktmpdir("omml-declarations-") do |directory|
      FileUtils.cp(Dir.glob(File.join(described_class::DIRECTORY, "*.json")),
                   directory)
      File.open(File.join(directory, "enum-subset-v1.json"), "a") do |file|
        file.write(" ")
      end
      stub_const("Omml::Portable::DIRECTORY", directory)
      expect { described_class.model_declarations }.to raise_error(
        described_class::UnsupportedRuntime, /checksum mismatch/
      )
    end
  end
end
