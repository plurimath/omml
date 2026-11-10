// Canonical strings preserve BigDecimal's fractional .0 and signed zero.
const portableDigits = 10_000;
const decimal = /^(-)?(?:0|[1-9][0-9]*)\.(?:0|[0-9]*[1-9])(?![\s\S])/;
const lexical = /^([+-]?)(?:(\d(?:_?\d)*)(?:\.(\d(?:_?\d)*)?)?|\.(\d(?:_?\d)*))(?:[eEdD]([+-]?\d+))?(?![\s\S])/;
const trailingUnderscore = /^([+-]?\d(?:_?\d)*)_(?![\s\S])/;

function normalize(raw: string): string | null {
  const token = raw.replace(/^[\t\n\r\f\v ]+|[\t\n\r\f\v ]+$/g, "");
  if (/^(?:NaN|[+-]?Infinity)(?![\s\S])/.test(token)) throw new RangeError("nonfinite OMML coordinate");
  const short = trailingUnderscore.exec(token);
  const parts = lexical.exec(short?.[1] ?? token);
  if (!parts) return null;
  const [, sign, wholeRaw, fractionAfterWhole, fractionOnly, exponent] = parts;
  const whole = (wholeRaw ?? "").replaceAll("_", "");
  const fraction = (fractionAfterWhole ?? fractionOnly ?? "").replaceAll("_", "");
  const mantissa = whole + fraction;
  const significant = mantissa.replace(/^0+/, "");
  const prefix = sign === "-" ? "-" : "";
  if (significant.length === 0) return prefix + "0.0";
  const leadingZeroes = mantissa.length - significant.length;
  const digits = significant.replace(/0+$/, "");
  const position = BigInt(whole.length - leadingZeroes) + BigInt(exponent ?? "0");
  const length = BigInt(digits.length);
  const outputDigits = position <= 0n ? 1n - position + length : (position > length ? position : length) + 1n;
  if (outputDigits > BigInt(portableDigits)) throw new RangeError("coordinate exceeds the portable decimal digit limit");
  const point = Number(position);
  if (point <= 0) return prefix + "0." + "0".repeat(-point) + digits;
  if (point >= digits.length) return prefix + digits + "0".repeat(point - digits.length) + ".0";
  return prefix + digits.slice(0, point) + "." + digits.slice(point);
}

function xmlSpelling(value: string): string {
  const negative = value.startsWith("-");
  const [whole, fraction] = (negative ? value.slice(1) : value).split(".") as [string, string];
  const mantissa = whole + fraction;
  const significant = mantissa.replace(/^0+/, "");
  if (significant.length === 0) return value;
  const digits = significant.replace(/0+$/, "");
  const exponent = whole.length - (mantissa.length - significant.length);
  return (negative ? "-" : "") + "0." + digits + "e" + exponent;
}

function coordinate(min: bigint, max: bigint) {
  const is = (value: unknown): value is string => {
    if (typeof value !== "string" || !decimal.test(value)) return false;
    const negative = value.startsWith("-");
    const [whole, fraction] = (negative ? value.slice(1) : value).split(".") as [string, string];
    if (whole.length + fraction.length > portableDigits || whole.length > 14) return false;
    const magnitude = BigInt(whole);
    if (magnitude === 0n && fraction === "0") return true;
    const limit = negative ? -min : max;
    return magnitude < limit || (magnitude === limit && fraction === "0");
  };
  const parse = (value: string): string => {
    if (!is(value)) throw new RangeError("expected a canonical decimal within OMML bounds");
    return value;
  };
  const parseXml = (raw: string): string | null => {
    const value = normalize(raw);
    return value === null ? null : parse(value);
  };
  const formatXml = (value: string): string => xmlSpelling(parse(value));
  return { is, parse, parseXml, formatXml };
}

export type STCoordinate = string;
const signed = coordinate(-27_273_042_329_600n, 27_273_042_316_900n);
export const { is: isSTCoordinate, parse: parseSTCoordinate, parseXml: parseSTCoordinateXml, formatXml: formatSTCoordinateXml } = signed;
export const formatSTCoordinate = parseSTCoordinate;

export type STPositiveCoordinate = string;
const positive = coordinate(0n, 27_273_042_316_900n);
export const { is: isSTPositiveCoordinate, parse: parseSTPositiveCoordinate, parseXml: parseSTPositiveCoordinateXml, formatXml: formatSTPositiveCoordinateXml } = positive;
export const formatSTPositiveCoordinate = parseSTPositiveCoordinate;
