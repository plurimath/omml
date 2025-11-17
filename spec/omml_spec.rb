# frozen_string_literal: true

RSpec.describe Omml do
  describe "#parse" do
    context "contains simple OMML value" do
      let(:input) do
        <<~OMML
          <m:oMathPara>
            <m:oMath>
              <m:r>
                <m:t>dy</m:t>
              </m:r>
            </m:oMath>
          </m:oMathPara>
        OMML
      end

      it "parses correctly" do
        expect(Omml.parse(input)).not_to be_nil
      end
    end
  end
end
