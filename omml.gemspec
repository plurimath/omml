# frozen_string_literal: true

require_relative "lib/omml/version"

Gem::Specification.new do |spec|
  spec.name = "omml"
  spec.version = Omml::VERSION
  spec.authors = ["Ribose Inc."]
  spec.email = ["open.source@ribose.com"]

  spec.summary = "OMML (Office Math Markup Language) parser by Plurimath."
  spec.description = <<~DESCRIPTION
    OMML (Office Math Markup Language) parser and builder used in Plurimath.
  DESCRIPTION

  spec.homepage = "https://github.com/plurimath/omml"
  spec.license = "BSD-2-Clause"

  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  # Specify which files should be added to the gem when it is released.
  # `git ls-files -z` loads files that have been added to git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "lutaml-model", ">= 0.8.0", "< 1.0"
  spec.add_dependency "moxml", ">= 0.1.18", "< 0.2"
  spec.add_dependency "oga", "~> 3.4"
  spec.add_dependency "ox", "~> 2.14"

  spec.metadata["rubygems_mfa_required"] = "true"
end
