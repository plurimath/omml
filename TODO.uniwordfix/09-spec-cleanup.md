# 09 — Spec cleanup

## What

`spec/omml_spec.rb` line 301-320 — "registers schema models against the
context being populated" — uses:

```ruby
Omml::Configuration.send(:register_models_in, custom_context)
Omml::Models::OMath.instance_variable_get(:@register)
```

Both violate global rules (private send, IVAR get).

## Fix

Restructure the spec to exercise public API:

1. Drop the private `register_models_in` call — instead use the public
   `register_in(custom_context_id)` API (new from TODO 06). It performs the
   same registration via the public path.
2. Drop the `instance_variable_get(:@register)` — instead assert via
   behavior: parse a document in the custom context and verify the OMML
   types resolve.

Alternatively, expose a public reader if behavior-based testing is
insufficient. Prefer behavior-based.

## Why

- Private methods are private for a reason
- IVAR access breaks encapsulation
- Tests should verify behavior, not implementation

## Verification

Updated spec passes without using `send` or `instance_variable_get`.
