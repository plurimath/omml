# 01 — Revert contributor's two unstaged changes

## What

Two unstaged edits on `feat/opal-boot-and-workflow` need to go:

1. `lib/omml/namespace.rb` — added `element_form_default :qualified`
2. `lib/omml/configuration/model_registry.rb` — added `define_singleton_method(:lutaml_default_register)` runtime hook

## Why

- The namespace change breaks 86 of 306 round-trip specs. Real-world OMML
  documents mix prefixed and unqualified locals (`<br/>` inside `<m:r>`).
  Forcing `:qualified` emits `<m:br/>` and breaks fidelity.
- The runtime hook is imperative mutation that bypasses lutaml-model's
  intended inheritance pattern. It hardcodes `:omml` instead of using
  `context_id`. Replaced declaratively in step 02.

## How

`git checkout -- lib/omml/namespace.rb lib/omml/configuration/model_registry.rb`

## Verification

`bundle exec rspec` returns to 306 examples, 0 failures.
