export type Token = string;

export function isToken(value: unknown): value is Token {
  if (typeof value !== "string") return false;
  if (value === "") return true;
  return value.split(" ").every((word) => word !== "" && !/[\t\n\f\r]/.test(word));
}

export function parseToken(value: string): Token {
  if (!isToken(value)) throw new TypeError("invalid OMML token");
  return value;
}

export const formatToken = parseToken;
export const parseTokenXml = parseToken;
export const formatTokenXml = formatToken;
