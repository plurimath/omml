# frozen_string_literal: true

require "spec_helper"

RSpec.shared_examples "anchor simple positioning" do
  before { Omml::Configuration.populate_context! }

  let(:model) { Omml::Models::CTAnchor }
  let(:register) { Omml::Configuration.context_id }

  {
    "true" => true,
    "0" => false,
    nil => nil,
  }.each do |lexical_flag, flag|
    it "round-trips the coordinate point independently of #{lexical_flag.inspect}" do
      attribute = lexical_flag ? %( m:simplePos="#{lexical_flag}") : ""
      xml = <<~XML
        <m:CT_Anchor xmlns:m="#{Omml::Namespace.uri}"#{attribute}>
          <m:simplePos m:x="125" m:y="-250"/>
        </m:CT_Anchor>
      XML
      anchor = model.from_xml(xml, register: register)

      expect(anchor.simple_pos).to eq(flag)
      expect(anchor.simple_position).to be_a(Omml::Models::CTPoint2D)
      expect([anchor.simple_position.x, anchor.simple_position.y]).to eq([125, -250])

      output = anchor.to_xml(register: register)
      reparsed = model.from_xml(output, register: register)
      expect(reparsed.simple_pos).to eq(flag)
      expect(reparsed.simple_position).to be_a(Omml::Models::CTPoint2D)
      expect([reparsed.simple_position.x, reparsed.simple_position.y]).to eq([125, -250])
    end
  end
end

describe_per_adapter "anchor simple positioning", subject: Omml::Models::CTAnchor
