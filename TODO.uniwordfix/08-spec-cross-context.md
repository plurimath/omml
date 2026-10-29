# 08 — Cross-context integration spec

## What

`spec/omml/cross_context_spec.rb` — proves embedded Omml-in-foreign-parent
works end-to-end via `register_in`.

```ruby
RSpec.describe "cross-context embedding (Uniword scenario)" do
  before do
    Omml::Configuration.register_in(:test_consumer)
  end

  after do
    Omml::Configuration.reset_context!(id: :test_consumer)
  end

  let(:consumer_class) do
    Class.new(Lutaml::Model::Serializable) do
      attribute :o_math, "Omml::Models::CTOMath", collection: true

      xml do
        element "container"
        map_element "oMath", to: :o_math
      end
    end
  end

  let(:xml) do
    <<~XML
      <container xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math">
        <m:oMath>
          <m:r><m:t>x</m:t></m:r>
        </m:oMath>
      </container>
    XML
  end

  it "parses Omml embedded in a foreign-context parent" do
    parsed = consumer_class.from_xml(xml, register: :test_consumer)
    expect(parsed.o_math.first.r.first.t.first.content).to eq("x")
  end

  it "round-trips through the consumer context" do
    parsed = consumer_class.from_xml(xml, register: :test_consumer)
    serialized = parsed.to_xml(register: :test_consumer)
    expect(serialized).to include("<m:t>x</m:t>")
  end
end
```

## Why

- This is THE spec that proves the cross-context contract works
- Without it, the contributor's earlier claim was unverified
- Reproduces the actual Uniword scenario (Paragraph referencing Omml types)

## Known limitation

If `lutaml-model` 0.8.0 (currently pinned via Gemfile github override) doesn't
fully consult `lutaml_default_register` during parsing, this spec may fail
with "Attribute 'acc' not found". That's an upstream bug; pin to 0.8.17 or
file an issue upstream. Document the expected behavior in the spec comment.
