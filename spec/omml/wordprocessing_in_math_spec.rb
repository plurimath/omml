# frozen_string_literal: true

require "spec_helper"

# Focused spec for wordprocessing-in-math: elements that belong to the
# WordprocessingML namespace but appear inside math runs (<m:r>). Per
# shared-math.xsd CT_R, these come from <xsd:group ref="w:EG_RunInnerContent" />
# and must round-trip without data loss.
RSpec.describe "wordprocessing-in-math elements" do
  let(:namespaces) do
    'xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" ' \
      'xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"'
  end

  def wrap(element)
    "<m:oMath #{namespaces}><m:r>#{element}</m:r></m:oMath>"
  end

  def run_of(xml)
    Omml.parse(xml).r.first
  end

  describe "br (CT_Br — has type/clear attributes)" do
    it "parses <w:br/> into a CTBr instance" do
      r = run_of(wrap("<w:br/>"))

      expect(r.br).to be_a(Omml::Models::CTBr)
    end

    it "preserves type and clear attributes" do
      r = run_of(wrap('<w:br w:type="page" w:clear="all"/>'))

      expect(r.br.type).to eq("page")
      expect(r.br.clear).to eq("all")
    end

    it "round-trips through serialize and re-parse" do
      parsed = Omml.parse(wrap('<w:br w:type="page"/>'))
      serialized = parsed.to_xml(prefix: "m")
      reparsed = Omml.parse(serialized)

      expect(reparsed.r.first.br).to be_a(Omml::Models::CTBr)
      expect(reparsed.r.first.br.type).to eq("page")
    end
  end

  describe "empty marker elements (CT_WordprocessingEmpty)" do
    %w[cr tab noBreakHyphen pgNum separator continuationSeparator
       annotationRef].each do |name|
      it "parses <w:#{name}/> without data loss" do
        attribute_name = name
          .gsub(/([A-Z])/, '_\1')
          .downcase
          .sub(/^_/, "")
          .to_sym
        r = run_of(wrap("<w:#{name}/>"))
        value = r.public_send(attribute_name)

        # Collections default to empty array; populated means parsed OK
        expect(Array(value).size).to eq(1), lambda {
          "expected #{attribute_name} to receive one <w:#{name}/>, " \
            "got #{value.inspect}"
        }
        expect(Array(value).first).to be_a(Omml::Models::CTWordprocessingEmpty)
      end
    end
  end

  describe "text elements (CT_WordprocessingText)" do
    %w[delText instrText delInstrText].each do |name|
      it "parses <w:#{name}> with text content" do
        attribute_name = name
          .gsub(/([A-Z])/, '_\1')
          .downcase
          .sub(/^_/, "")
          .to_sym
        r = run_of(wrap("<w:#{name}>payload-#{name}</w:#{name}>"))
        value = r.public_send(attribute_name)

        expect(value).to be_a(Omml::Models::CTWordprocessingText)
        expect(value.content).to eq("payload-#{name}")
      end
    end

    it "preserves xml:space attribute on delText" do
      r = run_of(wrap('<w:delText xml:space="preserve">  spaced  </w:delText>'))

      expect(r.del_text.space).to eq("preserve")
      expect(r.del_text.content).to eq("  spaced  ")
    end
  end

  describe "round-trip fidelity" do
    it "round-trips a complex run with multiple wordprocessing children" do
      xml = wrap("<w:cr/><w:t>x</w:t><w:tab/><m:t>y</m:t>")
      parsed = Omml.parse(xml)
      serialized = parsed.to_xml(prefix: "m")
      reparsed = Omml.parse(serialized)

      r = reparsed.r.first
      expect(r.cr.size).to eq(1)
      expect(r.tab.size).to eq(1)
      expect(r.t.content).to eq("y")
    end
  end

  describe "programmatic construction" do
    it "builds a CTR with CTBr and serializes to wordprocessing namespace" do
      br = Omml::Models::CTBr.new(type: "page")
      r = Omml::Models::CTR.new(br: br)

      # The TYPE namespace determines the element's namespace URI.
      # CTBr is in wordprocessing, so the element URI must be wordprocessing
      # regardless of the prefix the serializer chooses to emit.
      xml = r.to_xml(prefix: "m")
      expect(xml).to include("http://schemas.openxmlformats.org/wordprocessingml/2006/main")
      expect(xml).to include("br")
    end
  end
end
