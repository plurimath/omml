# frozen_string_literal: true

require "spec_helper"

RSpec.describe Omml do
  let(:o_math_xml) do
    <<~XML
      <m:oMath xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math">
        <m:r>
          <m:t>x</m:t>
        </m:r>
      </m:oMath>
    XML
  end

  let(:o_math_para_xml) do
    <<~XML
      <m:oMathPara xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math">
        <m:oMath>
          <m:r>
            <m:t>y</m:t>
          </m:r>
        </m:oMath>
      </m:oMathPara>
    XML
  end

  let(:o_math_xml_with_prolog) do
    <<~XML
      <?xml version="1.0" encoding="UTF-8"?>
      <!-- leading comment -->
      <m:oMath xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math">
        <m:r>
          <m:t>x</m:t>
        </m:r>
      </m:oMath>
    XML
  end

  let(:o_math_para_with_wordprocessing_flags_xml) do
    <<~XML
      <m:oMathPara xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
                   xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
        <m:oMath>
          <m:nary>
            <m:naryPr>
              <m:ctrlPr>
                <w:rPr>
                  <w:b/>
                  <w:i w:val="0"/>
                </w:rPr>
              </m:ctrlPr>
            </m:naryPr>
            <m:e>
              <m:r>
                <m:t>x</m:t>
              </m:r>
            </m:e>
          </m:nary>
        </m:oMath>
      </m:oMathPara>
    XML
  end

  def wordprocessing_run_properties(parsed)
    parsed.o_math.first
      .nary.first
      .nary_pr.first
      .ctrl_pr.first
      .r_pr.first
  end

  it "has a version number" do
    expect(Omml::VERSION).not_to be_nil
  end

  it "resolves the XML adapter from global configuration" do
    expect(Omml::Configuration.xml_adapter).not_to be_nil
  end

  it "parses with the globally configured adapter" do
    expect(described_class.parse(o_math_xml)).to be_a(Omml::Models::OMath)
  end

  it "parses oMath roots into the handwritten wrapper" do
    parsed = described_class.parse(o_math_xml)

    expect(parsed).to be_a(Omml::Models::OMath)
    expect(parsed.r.first.t.content).to eq("x")
    expect(parsed.to_xml(prefix: "m")).to include("<m:oMath")
    expect(parsed.to_xml(prefix: "m")).to include("<m:t>x</m:t>")
  end

  it "parses roots with leading declarations and comments" do
    parsed = described_class.parse(o_math_xml_with_prolog)

    expect(parsed).to be_a(Omml::Models::OMath)
    expect(parsed.r.first.t.content).to eq("x")
  end

  it "preserves wordprocessing on-off run properties under ctrlPr" do
    parsed = described_class.parse(o_math_para_with_wordprocessing_flags_xml)
    r_pr = wordprocessing_run_properties(parsed)
    serialized = parsed.to_xml(prefix: "m")
    reparsed = described_class.parse(serialized)
    reparsed_r_pr = wordprocessing_run_properties(reparsed)

    expect(r_pr.b.first).to be_a(Omml::Models::CTWordprocessingOnOff)
    expect(r_pr.i.first).to be_a(Omml::Models::CTWordprocessingOnOff)
    expect(r_pr.i.first.val).to eq("0")
    expect(serialized).to include('w:val="0"')
    expect(reparsed_r_pr.b.first).to be_a(Omml::Models::CTWordprocessingOnOff)
    expect(reparsed_r_pr.i.first.val).to eq("0")
  end

  it "detects the root name from the parsed document" do
    expect(described_class.root_name(o_math_xml_with_prolog)).to eq("oMath")
    expect(described_class.root_name(o_math_para_xml)).to eq("oMathPara")
  end

  it "raises a specific error for documents without a root element" do
    document = Struct.new(:root).new(nil)

    expect do
      Omml::Configuration.root_name_from_document(document)
    end.to raise_error(
      Omml::Errors::RootElementNotFoundError,
      "Unable to determine OMML root element",
    )
  end

  it "raises a specific error for unsupported root elements" do
    xml = <<~XML
      <m:somethingElse xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"/>
    XML

    expect do
      described_class.parse(xml)
    end.to raise_error(
      Omml::Errors::UnsupportedRootElementError,
      "Unsupported OMML root element: somethingElse",
    )
  end

  it "rejects supported root names outside the OMML namespace" do
    wrong_namespace_xml = <<~XML
      <m:oMath xmlns:m="http://example.com/not-omml"/>
    XML
    unqualified_xml = "<oMath/>"

    [wrong_namespace_xml, unqualified_xml].each do |xml|
      expect do
        described_class.parse(xml)
      end.to raise_error(
        Omml::Errors::UnsupportedRootElementError,
        "Unsupported OMML root element: oMath",
      )
    end
  end

  it "rejects unsupported input objects" do
    string_like_input = Class.new do
      def to_str
        "<m:oMath/>"
      end
    end.new

    expect do
      described_class.parse(Object.new)
    end.to raise_error(
      ArgumentError,
      "Input must be a String",
    )

    expect do
      described_class.parse(string_like_input)
    end.to raise_error(
      ArgumentError,
      "Input must be a String",
    )
  end

  it "resolves generated schema types with prefixed ids" do
    Omml::Configuration.populate_context!

    expect(Omml::Configuration.resolve_type(:ct_o_math)).to eq(Omml::Models::CTOMath)
    expect(Omml::Configuration.resolve_type(:ct_o_math_para_pr)).to eq(Omml::Models::CTOMathParaPr)
    expect(Omml::Configuration.resolve_type(:eg_o_math_elements)).to eq(Omml::Models::EGOMathElements)
    expect(Omml::Configuration.resolve_type(:long)).to eq(Lutaml::Model::Type::Decimal)
    expect(Omml::Configuration.resolve_type(:st_adj_coordinate)).to eq(Omml::Models::STAdjCoordinate)
    expect(Omml::Configuration.resolve_type(:st_ff_name)).to eq(Lutaml::Model::Type::String)
    expect(Omml::Configuration.resolve_type(:st_geom_guide_name)).to eq(Omml::Models::STGeomGuideName)
    expect(Omml::Configuration.resolve_type(:st_string)).to eq(Lutaml::Model::Type::String)
    resolved_type = Omml::Configuration.resolve_type(
      :st_unsigned_decimal_number,
    )
    expect(resolved_type).to eq(Omml::Models::UnsignedLong)
  end

  it "yields each type substitution alias exactly once" do
    aliases = []
    targets = []

    Omml::TypeSubstitutions.each_alias do |type_name, target|
      aliases << type_name
      targets << target
    end

    expect(aliases).not_to be_empty
    expect(aliases).to eq(aliases.uniq)
    expect(aliases).to include(:long, :st_string, :st_unsigned_decimal_number)
    expect(targets).to all(respond_to(:name))
  end

  it "repopulates the default context after a reset" do
    Omml::Configuration.reset_context!

    expect(described_class.parse(o_math_xml)).to be_a(Omml::Models::OMath)
    expect(Omml::Configuration.resolve_type(:o_math)).to eq(Omml::Models::OMath)
  end

  it "treats create_context for the default context as a rebuild" do
    Omml::Configuration.reset_context!

    context = Omml::Configuration.create_context(id: Omml::Configuration.context_id)

    expect(context.id).to eq(Omml::Configuration.context_id)
    expect(Omml::Configuration.resolve_type(:o_math)).to eq(Omml::Models::OMath)
  end

  it "rejects default context customization through create_context" do
    expected_message = "create_context cannot customize the default " \
                       ":omml context; use populate_context! to rebuild it."

    expect do
      Omml::Configuration.create_context(
        id: Omml::Configuration.context_id,
        registry: Lutaml::Model::TypeRegistry.new,
      )
    end.to raise_error(
      ArgumentError,
      expected_message,
    )
  end

  it "casts adjusted coordinates as coordinates or guide names" do
    Omml::Configuration.populate_context!

    type = Omml::Configuration.resolve_type(:st_adj_coordinate)

    expect(type.cast("123")).to eq(BigDecimal("123"))
    expect(type.cast("guideName")).to eq("guideName")
  end

  it "casts simple types without mutating caller options" do
    Omml::Configuration.populate_context!

    examples = {
      Omml::Models::HexBinary => "0A",
      Omml::Models::STCoordinate => "1",
      Omml::Models::STHint => "default",
      Omml::Models::STInteger2 => "1",
      Omml::Models::STInteger255 => "2",
      Omml::Models::STPositiveCoordinate => "1",
      Omml::Models::STSpacingRule => "1",
      Omml::Models::STTextScale => "100",
      Omml::Models::Token => "token",
      Omml::Models::UnsignedInt => "1",
      Omml::Models::UnsignedLong => "1",
    }

    examples.each do |type, value|
      options = {}

      type.cast(value, options)

      expect(options).to eq({})
    end
  end

  it "creates custom contexts that fall back to the OMML context" do
    Omml::Configuration.create_context(id: :custom_omml)

    parsed = described_class.parse(o_math_xml, context: :custom_omml)

    expect(parsed).to be_a(Omml::Models::OMath)
  end

  it "requires custom contexts to be created explicitly" do
    expected_message = "OMML context :missing_omml is not available. " \
                       "Create or populate it explicitly before use."

    expect do
      described_class.parse(o_math_xml, context: :missing_omml)
    end.to raise_error(
      Omml::Error,
      expected_message,
    )
  end

  it "registers schema models against the context being populated" do
    custom_context_id = :isolated_omml
    Omml::Configuration.populate_context!
    custom_context = Omml::Configuration.create_context(id: custom_context_id,
                                                        fallback_to: [])

    Omml::Configuration.send(:register_models_in, custom_context)

    registered_context = Omml::Models::OMath.instance_variable_get(:@register)
    resolved_type = Omml::Configuration.resolve_type(
      :o_math,
      context: custom_context_id,
    )

    expect(registered_context).to eq(custom_context_id)
    expect(resolved_type).to eq(Omml::Models::OMath)
  ensure
    Omml::Configuration.reset_context!(id: custom_context_id)
    Omml::Configuration.populate_context!
  end
end
