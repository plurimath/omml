# frozen_string_literal: true

module Omml
  module Errors
    class UnsupportedRootElementError < BaseError
      def initialize(root_name)
        super("Unsupported OMML root element: #{root_name}")
      end
    end
  end
end
