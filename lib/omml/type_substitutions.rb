# frozen_string_literal: true

module Omml
  module TypeSubstitutions
    # This module is the small translation table between OOXML schema names and
    # the Ruby types OMML actually uses at runtime.
    #
    # Generated model classes register themselves with Omml::Configuration, but
    # OOXML also has simple-type names that are schema ids rather than concrete
    # generated model classes. Lutaml resolves attributes through the active
    # type context by those schema ids. Without these aliases, parsing can fail
    # on a known schema name such as `st_string` or
    # `st_unsigned_decimal_number` even though the correct Ruby type exists.
    #
    # Keeping those aliases in this small module preserves the class-owned
    # registration flow for real models, avoids no-op wrapper classes for every
    # redundant simple type, and keeps the schema-id compatibility layer visible
    # in one place. The targets are lambdas so loading this file does not force
    # the model manifest to load before context population asks for the aliases.
    GROUPED_ALIASES = [
      {
        aliases: %i[long],
        target: -> { Lutaml::Model::Type::Decimal },
      },
      {
        aliases: %i[st_date_time],
        target: -> { Lutaml::Model::Type::DateTime },
      },
      {
        aliases: %i[
          st_decimal_number
          st_position_offset
          st_signed_hps_measure
          st_signed_twips_measure
        ],
        target: -> { Lutaml::Model::Type::Integer },
      },
      {
        aliases: %i[
          st_char
          st_ff_help_text_val
          st_ff_name
          st_ff_status_text_val
          st_macro_name
          st_relationship_id
          st_string
        ],
        target: -> { Lutaml::Model::Type::String },
      },
      {
        aliases: %i[
          st_drawing_element_id
          st_twips_measure
          st_un_signed_integer
          st_wrap_distance
        ],
        target: -> { Omml::Models::UnsignedInt },
      },
      {
        aliases: %i[
          st_eighth_point_measure
          st_hps_measure
          st_point_measure
          st_unsigned_decimal_number
        ],
        target: -> { Omml::Models::UnsignedLong },
      },
      {
        aliases: %i[
          st_short_hex_number
          st_uchar_hex_number
        ],
        target: -> { Omml::Models::HexBinary },
      },
    ].freeze

    module_function

    def each_alias
      GROUPED_ALIASES.each do |entry|
        target = entry.fetch(:target).call

        entry.fetch(:aliases).each do |type_name|
          yield type_name, target
        end
      end
    end
  end
end
