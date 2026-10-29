# 10 — Update stale CLAUDE.md

## What

`CLAUDE.md` currently references:

> Root element wrappers (`o_math.rb`, `o_math_para.rb`) extend
> `CommonCode::RootModel` and use `omml_root_element` to declare themselves
> as XML root elements with the OMML namespace.

No `CommonCode::RootModel` module or `omml_root_element` method exists in
the codebase. The wrappers extend `Lutaml::Model::Serializable` directly
(will become `Omml::Models::Base` after TODO 02).

## Fix

Update the CLAUDE.md "Model layer" section to reflect:

- All Omml model classes (CT*, ST*, EG*, root wrappers) inherit from
  `Omml::Models::Base`
- `Base` declares `lutaml_default_register :omml` declaratively
- `Base.inherited` auto-registers each subclass with `Omml::Configuration`
- No per-file `register_model` call is needed

Also document:

- The `Omml::Configuration.register_in(consumer_id)` public API
- The autoload-based loading in `lib/omml/models.rb`
- The cross-context contract (proven by `spec/omml/cross_context_spec.rb`)

## Why

Stale docs mislead future contributors. CLAUDE.md is the entry point for
AI-assisted work on this repo — accuracy matters.
