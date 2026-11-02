# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

`omml` is a Ruby gem that parses and serializes OMML (Office Math Markup Language), the XML format used by Microsoft Word for mathematical equations. It is part of the [Plurimath](https://github.com/plurimath) ecosystem. Models are defined using `lutaml-model` (declarative XML serialization) with `ox` as the XML backend.

## Commands

```bash
bundle install          # Install dependencies
bundle exec rake        # Run specs + rubocop (default task)
bundle exec rspec       # Run all specs
bundle exec rspec spec/omml_spec.rb              # Run a single spec file
bundle exec rspec spec/omml_spec.rb:77           # Run a single test by line number
bundle exec rubocop     # Lint
```

## Architecture

### Entry point and parsing flow

`Omml.parse(xml_string)` → `Parser.parse` → parses XML via the adapter → resolves the root class (`OMath` or `OMathPara` based on root element name) → calls `.of_xml` to deserialize into a Lutaml model tree.

The top-level API is in `lib/omml.rb`. `Parser` in `lib/omml/parser.rb` handles the parsing pipeline.

### Type context system (`Omml::Configuration`)

`Configuration` manages a Lutaml `GlobalContext` (context ID `:omml`) that holds a registry of all model classes. The context is populated lazily on first parse via `populate_context!`, which eager-loads every model so its `inherited` hook fires and registers it.

Model IDs are derived from class names: prefix `CT`/`EG`/`ST` is stripped and snake-cased with the prefix (e.g., `CTOMath` → `:ct_o_math`).

Consumers (e.g. Uniword) register their own context via `Omml::Configuration.register_in(:consumer_id)`. This populates the consumer's type registry directly with all Omml types so OMML subtrees embedded in foreign-context models resolve without falling back through `:omml`. See `spec/omml/cross_context_spec.rb` for the contract.

### Model layer (`lib/omml/models/`)

All model loading is `autoload`-based. `lib/omml/models.rb` declares every class as an `autoload` on the `Omml::Models` module, plus an `eager_load!` helper that `populate_context!` invokes to trigger class definition (and thus registration).

Three categories of models:

- **Complex types** (`ct_*.rb`) and root element wrappers (`o_math.rb`, `o_math_para.rb`) — extend `Omml::Models::Base`, which provides:
  - `lutaml_default_register` returning `Omml::Configuration.context_id` (single source of truth), so consumers referencing Omml classes route serialization and parsing back to `:omml`.
  - An `inherited` hook that auto-registers each subclass with `Omml::Configuration`. No per-file `register_model` call is needed.
- **Simple types** (`simple_types/*.rb`) — enum/value types like `STJc`, `STOnOff`. Most extend `EnumString` or `Token`, both of which carry an `inherited` hook for auto-registration. A handful extend Lutaml types directly (`Lutaml::Model::Type::Integer`, `::Decimal`, `::Value`) and are registered explicitly. Three classes (`STAdjCoordinate`, `STHexColor`, `STLang`) include `Omml::Models::Registerable` because they resolve dependent types via a class-level register accessor.
- **Group models** (`groups/*.rb`) — shared compositional groups (e.g., `EGOMathElements`). These use `import_model_attributes` / `import_model_mappings` to compose attributes from other groups, implementing the OMML schema's choice/sequence patterns. Like complex types, they extend `Base`.

### Namespaces

- `Omml::Namespace` — the OMML namespace (`http://schemas.openxmlformats.org/officeDocument/2006/math`, prefix `m`). This is the canonical OMML namespace class; downstream consumers (Uniword, Plurimath) should reference it directly rather than redefine their own.
- `Omml::WordprocessingNamespace` — the Word ML namespace (prefix `w`), used for elements like `w:rPr` that appear inside OMML.

### Type substitutions (`TypeSubstitutions`)

Many OMML simple types are aliases for built-in Lutaml types (e.g., `STString` → `Lutaml::Model::Type::String`). These are registered as aliases in the context rather than as separate model classes.

## Testing

- `spec/omml_spec.rb` — unit tests for parsing, context management, and error handling
- `spec/omml_fixture_round_trip_spec.rb` — parses 279 OMML fixture files from `spec/fixtures/omml/`, round-trips them through parse → serialize, and compares the XML trees structurally (not string-equality). This is the primary correctness check.
- The round-trip spec expects exact XML structural fidelity: same elements, attributes, namespaces, text content, and child ordering.
- `spec/omml/lutaml_default_register_spec.rb` — asserts every `Serializable` subclass under `Omml::Models` carries `:omml` as its default register (mirrors the Mml gem's coverage spec).
- `spec/omml/cross_context_spec.rb` — proves embedded OMML parses correctly when a foreign-context parent references Omml types (the Uniword scenario).
- `spec/omml/opal_boot_spec.rb` — verifies the Opal boot file stays in sync with autoload declarations.

## Key conventions

- All models are in the `Omml::Models` module namespace
- New complex types or groups inherit `Omml::Models::Base`; new enum-like simple types inherit `EnumString` or `Token`. No `register_model` call is needed — `inherited` handles it.
- All internal library loading uses Ruby `autoload`, never `require_relative`
- No `instance_variable_set` / `instance_variable_get` / `send(:private_method)` / `respond_to?` — use public APIs and structural type checks (`is_a?`, `<`, `include?`)
- The XML adapter is resolved by lutaml-model's AdapterResolver (lazy auto-detection)
- Models use `ordered` and `sequence` blocks for XML mapping to preserve element order
- `render_empty: true` is used on elements that must be emitted even when empty
