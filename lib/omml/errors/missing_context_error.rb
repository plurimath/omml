# frozen_string_literal: true

module Omml
  module Errors
    class MissingContextError < BaseError
      def initialize(id)
        super(build_message(id.to_sym))
      end

      private

      def build_message(id)
        if id == :omml
          "OMML context :omml is not populated. " \
            "Call Omml::Configuration.populate_context! first."
        else
          "OMML context :#{id} is not available. " \
            "Create or populate it explicitly before use."
        end
      end
    end
  end
end
