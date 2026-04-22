# frozen_string_literal: true

module Omml
  module Errors
    class XmlAdapterNotConfiguredError < BaseError
      def initialize
        super("XML adapter is not configured")
      end
    end
  end
end
