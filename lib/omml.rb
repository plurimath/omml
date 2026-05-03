# frozen_string_literal: true

require "lutaml/model"

module Omml
  class Error < StandardError; end

  autoload :VERSION, "omml/version"
  autoload :Configuration, "omml/configuration"
  autoload :Errors, "omml/errors"
  autoload :Models, "omml/models"
  autoload :Namespace, "omml/namespace"
  autoload :Parser, "omml/parser"
  autoload :TypeSubstitutions, "omml/type_substitutions"
  autoload :WordprocessingNamespace, "omml/wordprocessing_namespace"

  module_function

  def parse(input, context: nil)
    Parser.parse(
      string_input(input),
      context: context || Configuration.context_id,
    )
  end

  def root_name(input)
    Parser.root_name(string_input(input))
  end

  def string_input(input)
    return input if input.is_a?(String)

    raise ArgumentError, "Input must be a String"
  end

  private_class_method :string_input
end
