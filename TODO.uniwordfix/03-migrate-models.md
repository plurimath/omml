# 03 — Migrate every model to inherit `Base`

## What

For every model file under `lib/omml/models/`:

1. Change `< Lutaml::Model::Serializable` to `< Base` (or `< Omml::Models::Base`)
2. Delete the trailing `Omml::Configuration.register_model(...)` call
3. Delete the `id:` parameter where present (derivation handles it)

For `EnumString` descendants (`ST*`):
1. Inheritance unchanged (`< EnumString`)
2. Delete the trailing `Omml::Configuration.register_model(...)` call

For root wrappers `OMath` and `OMathPara`:
1. Change to `< Base`
2. Delete `Omml::Configuration.register_model(OMath, id: :o_math)` — derivation produces `:o_math` from "OMath" via snake_case, so explicit ID is redundant. Same for `OMathPara`.

## Why

- Removes ~250 lines of boilerplate registration calls
- Single registration path via `Base.inherited` / `EnumString.inherited`
- Adding a new model = adding a file with `class CTNew < Base` — done

## How

Script-based mechanical edit across 249 files. Manual inspection of:
- Files with inheritance from another model (`CTBookmarkRange < CTMarkupRange`)
  — these propagate `inherited` through the chain automatically
- Files with `EnumString` parent (ST* types)
- Root wrappers `OMath`, `OMathPara`

## Verification

After migration:
- `Omml::Configuration.registered_models.keys.size` == 249 (same as before)
- Full spec suite passes (306 examples)
- Round-trip corpus unaffected
