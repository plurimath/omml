# 07 — `lutaml_default_register` coverage spec

## What

`spec/omml/lutaml_default_register_spec.rb` — mirrors Mml's coverage spec.

```ruby
RSpec.describe "Omml::Models lutaml_default_register coverage" do
  before { Omml::Configuration.populate_context! }

  it "every Serializable subclass returns :omml" do
    classes = Omml::Models.constants
      .map { |c| Omml::Models.const_get(c) }
      .select { |c| c.is_a?(Class) && c < Lutaml::Model::Serializable }

    expect(classes).not_to be_empty

    wrong = classes.reject { |c| c.lutaml_default_register == :omml }
    expect(wrong).to be_empty,
                     "Classes with wrong default register: " \
                     "#{wrong.map { |c| "#{c.name}=#{c.lutaml_default_register}" }.join(', ')}"
  end

  it "includes inherited subclasses (CTBookmark via CTBookmarkRange)" do
    expect(Omml::Models::CTBookmark.lutaml_default_register).to eq(:omml)
    expect(Omml::Models::CTBookmarkRange.lutaml_default_register).to eq(:omml)
  end

  it "includes simple types via EnumString" do
    expect(Omml::Models::STJc.lutaml_default_register).to eq(:omml)
  end
end
```

## Why

- Catches any future model class that forgets to inherit `Base`
- Documents the contract: every Omml model carries `:omml`
- Mirrors Mml's proven pattern

## Verification

All three examples pass.
