# 05 — Encapsulation cleanup

## What

Remove forbidden patterns from library and spec code:

### `lib/omml/configuration/model_registry.rb`

Current:
```ruby
def clear_cache(klass, register_id)
  klass.instance_variable_set(:@register, register_id)
  klass.clear_cache(register_id) if klass.respond_to?(:clear_cache)
end
```

Problem: `instance_variable_set` bypasses upstream's `set_register_context`
public method. `respond_to?` is duck typing.

Replace with: use upstream's public API. `Lutaml::Model::Serializable` has
`set_register_context(register_id)` which sets `@register` with a guard
against double-assignment. Call it directly. Remove the `respond_to?` check
since `clear_cache` is always defined on `Serializable` subclasses.

### `lib/omml/configuration/type_resolver.rb`

Current:
```ruby
def root_namespace_uri(root)
  return unless root.respond_to?(:namespace)
  root.namespace&.uri
end
```

Problem: `respond_to?` for duck typing on a parsed XML document.

Replace with: check the document adapter's actual type. The parsed document
root is either an `Ox::Element`, `Nokogiri::XML::Element`, or
`Moxml::Element` depending on adapter. Rather than branching on adapter,
trust the upstream contract: the root returned by `xml_adapter.parse` always
responds to `namespace`. If it doesn't, that's an upstream bug — let it
NoMethodError naturally.

If a nil-check is genuinely needed for the test scenario at
`spec/omml_spec.rb:122` (Struct-based fake), restructure the test to use a
real adapter output instead.

### `spec/omml_spec.rb`

Current lines 301-320 use:
- `Omml::Configuration.send(:register_models_in, custom_context)` — private send
- `Omml::Models::OMath.instance_variable_get(:@register)` — IVAR get

Replace with: exercise the public API. Either expose a public accessor for
the register a class is bound to, or assert via behavior (parse and verify
the round-trip works in the custom context).

## Why

- Global rule: "NEVER use `send` to call private methods"
- Global rule: "NEVER use `instance_variable_set` or `instance_variable_get`"
- Global rule: "NEVER use `respond_to?` for type checking"

## Verification

- `grep -rn "instance_variable_set\|instance_variable_get\|\.send(:\|respond_to?" lib/` returns empty (excluding legitimately-needed external API calls)
- All specs pass
