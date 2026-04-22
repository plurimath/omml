# frozen_string_literal: true

module Omml
  module Models
    class CTNonVisualGraphicFrameProperties < Lutaml::Model::Serializable
      attribute :graphic_frame_locks, :ct_graphical_object_frame_locking,
                collection: 0..1
      attribute :ext_lst, :ct_office_art_extension_list, collection: 0..1

      xml do
        element "CT_NonVisualGraphicFrameProperties"

        namespace Omml::Namespace

        sequence do
          map_element :graphicFrameLocks, to: :graphic_frame_locks
          map_element :extLst, to: :ext_lst
        end
      end
    end

    Omml::Configuration.register_model(CTNonVisualGraphicFrameProperties)
  end
end
