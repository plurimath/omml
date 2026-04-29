# frozen_string_literal: true

require "spec_helper"

FIXTURE_PATHS = Dir[File.join(__dir__, "fixtures/omml/**/*.omml")].freeze

RSpec.describe Omml do
  def normalize_string(value)
    return value unless value.is_a?(String)

    normalized = value.dup
    unless normalized.encoding == Encoding::UTF_8
      normalized = normalized.force_encoding(Encoding::UTF_8)
    end

    normalized.unicode_normalize(:nfc)
  end

  def parse_xml(xml)
    Omml::Configuration.xml_adapter.parse(xml).root
  end

  def element_children(node)
    node.children.filter_map do |child|
      if child.element?
        child
      elsif child.text?
        text = normalize_string(child.text)
        next if text.strip.empty?

        text
      end
    end
  end

  def normalized_attributes(element)
    attributes = if element.attributes.respond_to?(:each_value)
                   element.attributes.each_value
                 else
                   element.attributes
                 end

    attributes.filter_map do |attribute|
      namespace = attribute.namespace&.uri if attribute.respond_to?(:namespace)

      [attribute.name, namespace, normalize_string(attribute.value)]
    end.sort_by { |name, namespace, _value| [name, namespace.to_s] }
  end

  def compare_xml_nodes(expected, actual, path)
    node_type_difference = compare_node_type(expected, actual, path)
    return node_type_difference if node_type_difference
    return compare_text_node(expected, actual, path) if expected.is_a?(String)

    compare_element_metadata(expected, actual, path) ||
      compare_child_nodes(expected, actual, path)
  end

  def compare_node_type(expected, actual, path)
    return if expected.is_a?(actual.class)

    "Expected #{path} to be a #{expected.class}, got #{actual.class}"
  end

  def compare_text_node(expected, actual, path)
    return unless expected.is_a?(String)

    normalized_expected = normalize_string(expected)
    normalized_actual = normalize_string(actual)
    return if normalized_expected == normalized_actual

    "Text mismatch at #{path}: expected #{normalized_expected.inspect}, " \
      "got #{normalized_actual.inspect}"
  end

  def compare_element_metadata(expected, actual, path)
    compare_element_name(expected, actual, path) ||
      compare_element_namespace(expected, actual, path) ||
      compare_element_attributes(expected, actual, path)
  end

  def compare_element_name(expected, actual, path)
    return if expected.name == actual.name

    "Element mismatch at #{path}: expected #{expected.name}, got #{actual.name}"
  end

  def compare_element_namespace(expected, actual, path)
    expected_namespace = expected.namespace&.uri
    actual_namespace = actual.namespace&.uri
    return if expected_namespace == actual_namespace

    "Namespace mismatch at #{path}: expected #{expected_namespace.inspect}, " \
      "got #{actual_namespace.inspect}"
  end

  def compare_element_attributes(expected, actual, path)
    expected_attributes = normalized_attributes(expected)
    actual_attributes = normalized_attributes(actual)
    return if expected_attributes == actual_attributes

    "Attribute mismatch at #{path}: expected #{expected_attributes.inspect}, " \
      "got #{actual_attributes.inspect}"
  end

  def compare_child_nodes(expected, actual, path)
    expected_children = element_children(expected)
    actual_children = element_children(actual)

    count_difference = compare_child_counts(expected_children, actual_children,
                                            path)
    return count_difference if count_difference

    expected_children.each_with_index do |expected_child, index|
      child_name = if expected_child.respond_to?(:element?)
                     expected_child.name
                   else
                     "text()"
                   end
      comparison = compare_xml_nodes(expected_child, actual_children[index],
                                     "#{path}/#{child_name}[#{index}]")
      return comparison if comparison
    end

    nil
  end

  def compare_child_counts(expected_children, actual_children, path)
    return if expected_children.length == actual_children.length

    "Child count mismatch at #{path}: expected #{expected_children.length}, " \
      "got #{actual_children.length}"
  end

  def xml_difference(expected_xml, actual_xml)
    expected_root = parse_xml(expected_xml)
    actual_root = parse_xml(actual_xml)

    compare_xml_nodes(expected_root, actual_root, "/#{expected_root.name}")
  end

  def expected_root_class(xml)
    case Omml.root_name(xml)
    when "oMath"
      Omml::Models::OMath
    when "oMathPara"
      Omml::Models::OMathPara
    else
      raise "Unsupported OMML fixture root"
    end
  end

  it "imports the full OMML fixture corpus" do
    expect(FIXTURE_PATHS).not_to be_empty
  end

  FIXTURE_PATHS.each do |fixture_path|
    relative_path = fixture_path.delete_prefix("#{__dir__}/")

    it "round-trips #{relative_path}" do
      expect_fixture_to_round_trip(fixture_path)
    end
  end

  def expect_fixture_to_round_trip(fixture_path)
    xml = File.read(fixture_path)
    parsed = Omml.parse(xml)
    serialized = parsed.to_xml(prefix: "m")
    diff = xml_difference(xml, serialized)

    expect(parsed).to be_a(expected_root_class(xml))
    expect(diff).to be_nil, diff
  end
end
