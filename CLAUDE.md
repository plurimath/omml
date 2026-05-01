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

`Configuration` manages a Lutaml `GlobalContext` (context ID `:omml`) that holds a registry of all model classes. Models are registered via `Omml::Configuration.register_model(Class)` at load time, and the context is populated lazily on first parse. Custom contexts can be created for downstream libraries (e.g., Plurimath) that fall back to the OMML context.

Model IDs are derived from class names: prefix `CT`/`EG`/`ST` is stripped and snake-cased with the prefix (e.g., `CTOMath` → `:ct_o_math`).

### Model layer (`lib/omml/models/`)

Three categories of models, all extending `Lutaml::Model::Serializable`:

- **Complex types** (`ct_*.rb`) — represent OMML schema complex types. Each defines attributes and XML element mappings, and self-registers via `Omml::Configuration.register_model`.
- **Simple types** (`simple_types/*.rb`) — enum/value types like `STJc`, `STOnOff`. These wrap string values with validation.
- **Group models** (`groups/*.rb`) — shared compositional groups (e.g., `EGOMathElements`). These use `import_model_attributes` / `import_model_mappings` to compose attributes from other groups, implementing the OMML schema's choice/sequence patterns.

Root element wrappers (`o_math.rb`, `o_math_para.rb`) extend `CommonCode::RootModel` and use `omml_root_element` to declare themselves as XML root elements with the OMML namespace.

### Namespaces

- `Omml::Namespace` — the OMML namespace (`http://schemas.openxmlformats.org/officeDocument/2006/math`, prefix `m`)
- `Omml::WordprocessingNamespace` — the Word ML namespace (prefix `w`), used for elements like `w:rPr` that appear inside OMML

### Type substitutions (`TypeSubstitutions`)

Many OMML simple types are aliases for built-in Lutaml types (e.g., `STString` → `Lutaml::Model::Type::String`). These are registered as aliases in the context rather than as separate model classes.

## Testing

- `spec/omml_spec.rb` — unit tests for parsing, context management, and error handling
- `spec/fixture_round_trip_spec.rb` — parses 279 OMML fixture files from `spec/fixtures/omml/`, round-trips them through parse → serialize, and compares the XML trees structurally (not string-equality). This is the primary correctness check.
- The round-trip spec expects exact XML structural fidelity: same elements, attributes, namespaces, text content, and child ordering.

## Key conventions

- All models are in the `Omml::Models` module namespace
- The XML adapter defaults to `:ox` (MRI) or `:oga` (Opal)
- Models use `ordered` and `sequence` blocks for XML mapping to preserve element order
- `render_empty: true` is used on elements that must be emitted even when empty
