# 06 — `Omml::Configuration.register_in` public API

## What

Add to `lib/omml/configuration/context_registry.rb`:

```ruby
def register_in(consumer_id, fallback_to: nil)
  populate_context!
  Lutaml::Model::GlobalContext.create_context(
    id: consumer_id.to_sym,
    registry: Lutaml::Model::TypeRegistry.new,
    fallback_to: Array(fallback_to || [:default, context_id]),
  )
end
```

## Why

Consumers (Uniword) currently need to know:
- That `populate_context!` must run first
- The `Lutaml::Model::GlobalContext.create_context` API
- The right fallback chain (`[:default, :omml]`)

That's too much internal knowledge. `register_in(:uniword)` does it all.

The fallback chain `[:default, context_id]` lets consumer types resolve via
`:default` first (so consumer-defined types take precedence), then Omml
types via `:omml`. Order is overridable for advanced consumers.

## Usage

```ruby
# In Uniword boot
Omml::Configuration.register_in(:uniword)

# Then parse
DocumentRoot.from_xml(xml, register: :uniword)
```

## Verification

- New spec: register a `:test_consumer` context, parse embedded OMML,
  assert resolution works end-to-end
