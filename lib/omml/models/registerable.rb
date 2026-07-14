# frozen_string_literal: true

module Omml
  module Models
    # Mixed into simple-type classes that need to know their active register
    # when resolving dependent types (e.g. `STAdjCoordinate` delegates to
    # either `STCoordinate` or `STGeomGuideName` depending on the value).
    #
    # `Omml::Configuration.register_model` calls `register=` on classes that
    # include this module, mirroring the role of upstream's
    # `set_register_context` on `Lutaml::Model::Serializable`.
    module Registerable
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        attr_accessor :register
      end
    end
  end
end
