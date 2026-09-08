# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

namespace :spec do
  xml_adapters = %w[nokogiri ox oga].freeze

  desc "Run the suite once per XML adapter (#{xml_adapters.join(', ')})"
  task :adapters do
    failed = xml_adapters.reject do |adapter|
      puts "\n== XML adapter: #{adapter} =="
      system({ "OMML_XML_ADAPTER" => adapter }, "bundle", "exec", "rspec")
    end

    abort "Failing adapters: #{failed.join(', ')}" if failed.any?
  end
end

task default: %i[spec rubocop]
