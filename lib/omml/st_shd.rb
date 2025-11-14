# frozen_string_literal: true
require "lutaml/model"

class STShd < Lutaml::Model::Type::String
  def self.cast(value, options = {})
    return if value.nil?

    options[:values] = [super("nil"), super("clear"), super("solid"), super("horzStripe"), super("vertStripe"), super("reverseDiagStripe"), super("diagStripe"), super("horzCross"), super("diagCross"), super("thinHorzStripe"), super("thinVertStripe"), super("thinReverseDiagStripe"), super("thinDiagStripe"), super("thinHorzCross"), super("thinDiagCross"), super("pct5"), super("pct10"), super("pct12"), super("pct15"), super("pct20"), super("pct25"), super("pct30"), super("pct35"), super("pct37"), super("pct40"), super("pct45"), super("pct50"), super("pct55"), super("pct60"), super("pct62"), super("pct65"), super("pct70"), super("pct75"), super("pct80"), super("pct85"), super("pct87"), super("pct90"), super("pct95")]
    super(value, options)
  end

  def self.register
    @register ||= Lutaml::Model::GlobalRegister.lookup(Omml.register_id)
  end

  def self.register_class_with_id
    register.register_model(self, id: :st_shd)
  end
end

STShd.register_class_with_id
