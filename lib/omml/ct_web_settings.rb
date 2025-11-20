# frozen_string_literal: true

require "lutaml/model"
require_relative "ct_frameset"
require_relative "ct_divs"
require_relative "ct_string"
require_relative "ct_on_off"
require_relative "ct_decimal_number"
require_relative "ct_target_screen_sz"
class CTWebSettings < Lutaml::Model::Serializable
  attribute :frameset, :ct_frameset, collection: 0..1
  attribute :divs, :ct_divs, collection: 0..1
  attribute :encoding, :ct_string, collection: 0..1
  attribute :optimize_for_browser, :ct_on_off, collection: 0..1
  attribute :rely_on_vml, :ct_on_off, collection: 0..1
  attribute :allow_png, :ct_on_off, collection: 0..1
  attribute :do_not_rely_on_css, :ct_on_off, collection: 0..1
  attribute :do_not_save_as_single_file, :ct_on_off, collection: 0..1
  attribute :do_not_organize_in_folder, :ct_on_off, collection: 0..1
  attribute :do_not_use_long_file_names, :ct_on_off, collection: 0..1
  attribute :pixels_per_inch, :ct_decimal_number, collection: 0..1
  attribute :target_screen_sz, :ct_target_screen_sz, collection: 0..1
  attribute :save_smart_tags_as_xml, :ct_on_off, collection: 0..1

  xml do
    root "WebSettings", ordered: true
    namespace "http://schemas.openxmlformats.org/officeDocument/2006/math", "m"

    sequence do
      map_element :frameset, to: :frameset
      map_element :divs, to: :divs
      map_element :encoding, to: :encoding
      map_element :optimizeForBrowser, to: :optimize_for_browser
      map_element :relyOnVML, to: :rely_on_vml
      map_element :allowPNG, to: :allow_png
      map_element :doNotRelyOnCSS, to: :do_not_rely_on_css
      map_element :doNotSaveAsSingleFile, to: :do_not_save_as_single_file
      map_element :doNotOrganizeInFolder, to: :do_not_organize_in_folder
      map_element :doNotUseLongFileNames, to: :do_not_use_long_file_names
      map_element :pixelsPerInch, to: :pixels_per_inch
      map_element :targetScreenSz, to: :target_screen_sz
      map_element :saveSmartTagsAsXml, to: :save_smart_tags_as_xml
    end
  end

  def self.register
    Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :ct_web_settings)
  end
end

CTWebSettings.register_class_with_id
