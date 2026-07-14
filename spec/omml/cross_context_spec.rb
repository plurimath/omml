# frozen_string_literal: true

require "spec_helper"

# Reproduces the Uniword scenario: a foreign-context parent class that
# references Omml model types as attributes. Parsed XML contains OMML
# subtrees that must resolve through `:omml` even though the parent
# context is the consumer's own.
RSpec.describe "cross-context embedding (Uniword scenario)", :cross_context do # rubocop:disable RSpec/DescribeClass
  let(:consumer_context_id) { :test_consumer }
  let(:consumer_container_class) do
    Class.new(Lutaml::Model::Serializable) do
      attribute :o_math, "Omml::Models::CTOMath", collection: true

      xml do
        element "container"
        map_element "oMath", to: :o_math
      end
    end
  end
  let(:xml_with_omml) do
    <<~XML
      <container xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math">
        <m:oMath>
          <m:r>
            <m:t>x</m:t>
          </m:r>
        </m:oMath>
      </container>
    XML
  end
  let(:fraction_xml) do
    <<~XML
      <container xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math">
        <m:oMath>
          <m:f>
            <m:num>
              <m:r><m:t>1</m:t></m:r>
            </m:num>
            <m:den>
              <m:r><m:t>2</m:t></m:r>
            </m:den>
          </m:f>
        </m:oMath>
      </container>
    XML
  end

  before { Omml::Configuration.register_in(consumer_context_id) }

  after do
    Omml::Configuration.reset_context!(id: consumer_context_id)
    Omml::Configuration.populate_context!
  end

  it "parses an Omml subtree embedded in a foreign-context parent" do
    parsed = consumer_container_class.from_xml(
      xml_with_omml,
      register: consumer_context_id,
    )

    omath = parsed.o_math.first
    expect(omath).to be_a(Omml::Models::CTOMath)
    expect(omath.r.first.t.content).to eq("x")
  end

  it "round-trips embedded OMML through the consumer context" do
    parsed = consumer_container_class.from_xml(
      xml_with_omml,
      register: consumer_context_id,
    )

    serialized = parsed.to_xml(register: consumer_context_id)
    reparsed = consumer_container_class.from_xml(
      serialized,
      register: consumer_context_id,
    )

    expect(reparsed.o_math.first.r.first.t.content).to eq("x")
  end

  it "resolves sibling type symbols inside the Omml subtree" do
    parsed = consumer_container_class.from_xml(
      fraction_xml,
      register: consumer_context_id,
    )

    fraction = parsed.o_math.first.f.first
    expect(fraction).to be_a(Omml::Models::CTF)
    expect(fraction.num.r.first.t.content).to eq("1")
    expect(fraction.den.r.first.t.content).to eq("2")
  end
end
