# 02 — Introduce `Omml::Models::Base`

## What

New file `lib/omml/models/base.rb`:

```ruby
module Omml
  module Models
    class Base < Lutaml::Model::Serializable
      def self.inherited(subclass)
        super
        Omml::Configuration.register_model(subclass)
      end

      def self.lutaml_default_register
        Omml::Configuration.context_id
      end
    end
  end
end
```

`EnumString` also gains an `inherited` hook so `ST*` types auto-register:

```ruby
class EnumString < Lutaml::Model::Type::String
  def self.inherited(subclass)
    super
    Omml::Configuration.register_model(subclass)
  end
  # ...
end
```

## Why

- Declarative: each model class self-documents via inheritance
- Single source of truth: `context_id` referenced, not hardcoded `:omml`
- OCP: adding a new model = adding a file, no other code changes
- DRY: no per-file `register_model` boilerplate
- Matches Mml's proven pattern (with one improvement: auto-registration
  via `inherited` removes Mml's centralized registration block)

## Note on `lutaml_default_register` for `EnumString`

Upstream's `Register.resolve_for_child` only consults `lutaml_default_register`
for `Serializable` subclasses (register.rb:98-100). `EnumString` extends
`Type::String`, so the method is never called on it. No need to declare it.

## Verification

- `Omml::Models::CTAcc.lutaml_default_register == :omml`
- `Omml::Models::STJc` auto-registers without explicit `register_model` call
- `Omml::Models::CTBookmark < CTBookmarkRange` — auto-registers through chain
