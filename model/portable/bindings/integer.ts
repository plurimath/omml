// OMML Integer descendants call LutaML's Ruby integer caster with fixed bounds.
// Keep XML coercion distinct from the canonical portable JSON integer strings.
const octalLine = /^0[0-7]+(?![\s\S])/;
const floatLine = /^-?\d+(\.\d+)?(e-?\d+)?(?![\s\S])/i;
const decimal = /^[+-]?(?:0[dD])?\d(?:_?\d)*(?![\s\S])/;
const octalPrefix = /^([+-]?)([0-7](?:_?[0-7])*)/;
const floatToken = /^[+-]?\d+(?:\.\d+)?(?:e[+-]?\d+)?(?![\s\S])/i;
const canonical = /^(?:0|-?[1-9]\d*)(?![\s\S])/;
const trimRuby = (value: string): string => value.replace(/^[\t\n\r\f\v ]+|[\t\n\r\f\v ]+$/g, "");

function fromXml(raw: string): bigint {
  const token = trimRuby(raw);
  if (raw.split("\n").some((line) => octalLine.test(line))) {
    const match = octalPrefix.exec(token);
    if (!match) return 0n;
    const value = BigInt("0o" + match[2]!.replaceAll("_", ""));
    return match[1] === "-" ? -value : value;
  }
  if (raw.split("\n").some((line) => floatLine.test(line))) {
    if (!floatToken.test(token)) throw new TypeError("invalid numeric XML value");
    const value = Number(token);
    if (!Number.isFinite(value)) throw new RangeError("nonfinite numeric XML value");
    return BigInt(Math.trunc(value));
  }
  if (!decimal.test(token)) throw new TypeError("invalid integer XML value");
  return BigInt(token.replace(/^(\+|-)?0[dD]/, "$1").replaceAll("_", ""));
}

function bound(min: bigint, max: bigint) {
  const is = (value: unknown): value is bigint => typeof value === "bigint" && value >= min && value <= max;
  const requireBound = (value: bigint): bigint => {
    if (!is(value)) throw new RangeError("integer outside OMML bounds");
    return value;
  };
  return {
    is,
    parse: (token: string): bigint => {
      if (!canonical.test(token)) throw new TypeError("expected a canonical integer string");
      return requireBound(BigInt(token));
    },
    parseXml: (token: string): bigint => requireBound(fromXml(token)),
    format: (value: bigint): string => requireBound(value).toString(),
  };
}

export type UnsignedInt = bigint;
const uint = bound(0n, 4_294_967_295n);
export const {is: isUnsignedInt, parse: parseUnsignedInt, parseXml: parseUnsignedIntXml, format: formatUnsignedInt} = uint;
export const formatUnsignedIntXml = formatUnsignedInt;

export type UnsignedLong = bigint;
const ulong = bound(0n, 18_446_744_073_709_551_615n);
export const {is: isUnsignedLong, parse: parseUnsignedLong, parseXml: parseUnsignedLongXml, format: formatUnsignedLong} = ulong;
export const formatUnsignedLongXml = formatUnsignedLong;

export type STInteger2 = bigint;
const int2 = bound(-2n, 2n);
export const {is: isSTInteger2, parse: parseSTInteger2, parseXml: parseSTInteger2Xml, format: formatSTInteger2} = int2;
export const formatSTInteger2Xml = formatSTInteger2;

export type STInteger255 = bigint;
const int255 = bound(1n, 255n);
export const {is: isSTInteger255, parse: parseSTInteger255, parseXml: parseSTInteger255Xml, format: formatSTInteger255} = int255;
export const formatSTInteger255Xml = formatSTInteger255;

export type STSpacingRule = bigint;
const spacing = bound(0n, 4n);
export const {is: isSTSpacingRule, parse: parseSTSpacingRule, parseXml: parseSTSpacingRuleXml, format: formatSTSpacingRule} = spacing;
export const formatSTSpacingRuleXml = formatSTSpacingRule;

export type STTextScale = bigint;
const scale = bound(0n, 600n);
export const {is: isSTTextScale, parse: parseSTTextScale, parseXml: parseSTTextScaleXml, format: formatSTTextScale} = scale;
export const formatSTTextScaleXml = formatSTTextScale;
