# frozen_string_literal: true

RSpec.describe Omml do
  describe "#parse" do
    subject(:formula) { Omml.parse(input) }

    context "contains example #01" do
      let(:input) do
        <<~OMML
          <m:oMathPara xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math">
            <m:oMath>
              <m:r>
                <m:t>dy</m:t>
              </m:r>
            </m:oMath>
          </m:oMathPara>
        OMML
      end

      it "round-trips correctly" do
        expect(formula.to_xml).to be_equivalent_to(input)
      end
    end

    context "contains example #02" do
      let(:input) do
        <<~OMML
          <m:oMathPara xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
            <m:oMath>
              <m:nary>
                <m:naryPr>
                  <m:limLoc m:val="subSup"/>
                  <m:ctrlPr>
                    <w:rPr>
                      <w:rFonts w:ascii="Cambria Math" w:hAnsi="Cambria Math"/>
                      <w:i/>
                    </w:rPr>
                  </m:ctrlPr>
                </m:naryPr>
                <m:sub>
                  <m:r>
                    <m:t>2</m:t>
                  </m:r>
                </m:sub>
                <m:sup>
                  <m:r>
                    <m:t>1</m:t>
                  </m:r>
                </m:sup>
                <m:e>
                  <m:r>
                    <m:t>3</m:t>
                  </m:r>
                </m:e>
              </m:nary>
            </m:oMath>
          </m:oMathPara>
        OMML
      end

      it "round-trips correctly" do
        expect(formula.to_xml).to be_equivalent_to(input)
      end
    end

    context "contains example #03" do
      let(:input) do
        <<~OMML
          <m:oMathPara xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
            <m:oMath>
              <m:r>
                <m:rPr>
                  <m:sty m:val="p"/>
                </m:rPr>
                <m:t>&#x3b1;</m:t>
              </m:r>
              <m:r>
                <m:rPr>
                  <m:sty m:val="p"/>
                </m:rPr>
                <m:t>&#x3b1;</m:t>
              </m:r>
              <m:r>
                <m:rPr>
                  <m:sty m:val="p"/>
                </m:rPr>
                <m:t>&#x3b1;</m:t>
              </m:r>
            </m:oMath>
          </m:oMathPara>
        OMML
      end

      it "round-trips correctly" do
        expect(formula.to_xml).to be_equivalent_to(input)
      end
    end

    context "contains example #04" do
      let(:input) do
        <<~OMML
          <m:oMathPara xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
            <m:oMath>
              <m:nary>
                <m:naryPr>
                  <m:limLoc m:val="undOvr"/>
                  <m:ctrlPr>
                    <w:rPr>
                      <w:rFonts w:ascii="Cambria Math" w:hAnsi="Cambria Math"/>
                      <w:i/>
                    </w:rPr>
                  </m:ctrlPr>
                </m:naryPr>
                <m:sub>
                  <m:r>
                    <m:t>2</m:t>
                  </m:r>
                </m:sub>
                <m:sup/>
                <m:e>
                  <m:r>
                    <m:t>3</m:t>
                  </m:r>
                </m:e>
              </m:nary>
            </m:oMath>
          </m:oMathPara>
        OMML
      end

      it "round-trips correctly" do
        expect(formula.to_xml).to be_equivalent_to(input)
      end
    end
  end
end
