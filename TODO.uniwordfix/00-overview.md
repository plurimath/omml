# Uniwordfix — Plan & Overview

Goal: make `omml` cleanly consumable by Uniword (and any other OOXML
consumer). No redefinitions, no imperative mutation, no encapsulation
violations. Fully model-driven, declarative, autoload-based.

## Sequence

| # | File | Subject |
|---|---|---|
| 01 | revert-contributor-changes.md | Drop the two unstaged diffs that broke specs / used runtime hooks |
| 02 | models-base.md | Introduce `Omml::Models::Base` with declarative `lutaml_default_register` and `inherited` auto-registration |
| 03 | migrate-models.md | Change every model class to inherit `Base`; remove side-effect `register_model` calls |
| 04 | autoload-conversion.md | Replace `require_relative` chains with `autoload` declarations; add `eager_load!` for context populate |
| 05 | encapsulation-cleanup.md | Eliminate `instance_variable_set`, `respond_to?`, `send` from library and specs |
| 06 | register-in-api.md | Public `Omml::Configuration.register_in(consumer_id)` API for consumers |
| 07 | spec-coverage.md | `lutaml_default_register` coverage spec (mirrors Mml pattern) |
| 08 | spec-cross-context.md | Cross-context integration spec (embedded Omml in foreign parent) |
| 09 | spec-cleanup.md | Replace private-API reaching in existing specs with public API |
| 10 | claude-md-stale.md | Remove `CommonCode::RootModel` reference; document the new architecture |

## Principles enforced

- Single source of truth for register context (`Omml::Configuration.context_id`)
- Declarative class-level tagging (no `define_singleton_method`)
- Auto-registration via `inherited` hook (no per-file `register_model` calls)
- Autoload everywhere; no `require_relative` for internal library code
- Public API for cross-cutting concerns; no reaching into internals
- Real model instances in specs; no doubles; no `send`/`instance_variable_get`
