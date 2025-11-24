# frozen_string_literal: true

RSpec.describe Omml do
  describe "#parse" do
    subject(:formula) { Omml.parse(input) }

    Dir.glob(File.join("spec", "fixtures", "**", "*")).each.with_index(1) do |filepath, index|
      next if File.directory?(filepath)

      context "contains example ##{sprintf('%02d', index)} from file: #{File.basename(filepath, ".omml")}" do
        let(:input) { File.read(filepath) }

        it "round-trips correctly" do
          expect(formula.to_xml).to be_equivalent_to(input)
        end
      end
    end
  end
end
