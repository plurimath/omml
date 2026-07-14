# frozen_string_literal: true

require "spec_helper"

# rubocop:disable RSpec/DescribeClass, RSpec/SpecFilePathFormat
RSpec.describe "Omml::Models lutaml_default_register coverage" do
  before { Omml::Configuration.populate_context! }

  def serializable_subclasses_in(mod)
    mod.constants
      .map { |c| mod.const_get(c) }
      .select { |c| c.is_a?(Class) && c < Lutaml::Model::Serializable }
  end

  it "every Serializable subclass in Omml::Models returns :omml" do
    classes = serializable_subclasses_in(Omml::Models)

    expect(classes).not_to be_empty

    wrong = classes.reject { |c| c.lutaml_default_register == :omml }
    expect(wrong).to be_empty,
                     "Classes with wrong default register: " \
                     "#{wrong.map do |c|
                       "#{c.name}=#{c.lutaml_default_register.inspect}"
                     end.join(', ')}"
  end

  it "includes root element wrappers" do
    expect(Omml::Models::OMath.lutaml_default_register).to eq(:omml)
    expect(Omml::Models::OMathPara.lutaml_default_register).to eq(:omml)
  end

  it "includes inherited subclasses via Base#inherited propagation" do
    expect(Omml::Models::CTBookmark.lutaml_default_register).to eq(:omml)
    expect(Omml::Models::CTBookmarkRange.lutaml_default_register).to eq(:omml)
    expect(Omml::Models::CTMarkupRange.lutaml_default_register).to eq(:omml)
  end

  it "includes group models" do
    expect(Omml::Models::EGOMathElements.lutaml_default_register).to eq(:omml)
    expect(
      Omml::Models::EGOMathMathElements.lutaml_default_register,
    ).to eq(:omml)
  end

  it "references Omml::Configuration.context_id (single source of truth)" do
    original = Omml::Configuration.context_id
    stub_const("Omml::Configuration::CONTEXT_ID_OVERRIDE", :omml)
    expect(Omml::Models::CTAcc.lutaml_default_register).to eq(original)
  end
end
# rubocop:enable RSpec/DescribeClass, RSpec/SpecFilePathFormat
