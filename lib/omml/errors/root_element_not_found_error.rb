# frozen_string_literal: true

module Omml
  module Errors
    class RootElementNotFoundError < BaseError
      def initialize
        super("Unable to determine OMML root element")
      end
    end
  end
end
