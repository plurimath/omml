# frozen_string_literal: true

# Opal entry point for omml.
#
# Under MRI, lib/omml.rb uses autoload for lazy loading. Under Opal,
# autoload does not lazy-execute, so this boot file eager-requires every
# autoloaded entry point. The order respects dependencies:
#   - omml.rb first to set up autoloads
#   - Namespace/constants before models (models reference them)
#   - Configuration before models (per-file register_model side-effects)
#   - Models before Parser (Parser uses Configuration.registry which is
#     populated by per-file register_model calls during model loading)
#
# Consumers (e.g. plurimath-js) add `-r omml/opal` to their Opal compile
# command.

require "lutaml/model"

require "omml"
require "omml/version"
require "omml/namespace"
require "omml/wordprocessing_namespace"

require "omml/configuration"
require "omml/configuration/adapter"
require "omml/configuration/context_registry"
require "omml/configuration/model_registry"
require "omml/configuration/type_resolver"

require "omml/errors"
require "omml/errors/base_error"
require "omml/errors/invalid_xml_error"
require "omml/errors/missing_context_error"
require "omml/errors/root_element_not_found_error"
require "omml/errors/unsupported_root_element_error"
require "omml/errors/xml_adapter_not_configured_error"

require "omml/type_substitutions"

# Models: lib/omml/models.rb eager-requires the entire model tree via
# require_relative, so a single require pulls in all 250+ model files.
require "omml/models"

require "omml/parser"
