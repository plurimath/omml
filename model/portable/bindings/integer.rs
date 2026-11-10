// OMML Integer descendants use the Ruby LutaML caster for XML and write
// canonical integer strings through the portable JSON codec.
use regex::Regex;
use serde::{Deserialize, Deserializer, Serialize, Serializer};
use std::sync::LazyLock;

static OCTAL_LINE: LazyLock<Regex> = LazyLock::new(|| Regex::new(r"^0[0-7]+\z").unwrap());
static FLOAT_LINE: LazyLock<Regex> =
    LazyLock::new(|| Regex::new(r"(?i)^-?[0-9]+(\.[0-9]+)?(e-?[0-9]+)?\z").unwrap());
static DECIMAL: LazyLock<Regex> =
    LazyLock::new(|| Regex::new(r"^[+-]?(?:0[dD])?[0-9](?:_?[0-9])*\z").unwrap());
static OCTAL_PREFIX: LazyLock<Regex> =
    LazyLock::new(|| Regex::new(r"^([+-]?)([0-7](?:_?[0-7])*)").unwrap());
static FLOAT_TOKEN: LazyLock<Regex> =
    LazyLock::new(|| Regex::new(r"(?i)^[+-]?[0-9]+(?:\.[0-9]+)?(?:e[+-]?[0-9]+)?\z").unwrap());
static CANONICAL: LazyLock<Regex> =
    LazyLock::new(|| Regex::new(r"^(?:0|-?[1-9][0-9]*)\z").unwrap());

fn parse_xml_integer(raw: &str) -> Result<i128, &'static str> {
    let token = raw.trim_matches([' ', '\t', '\n', '\r', '\x0b', '\x0c']);
    if raw.split('\n').any(|line| OCTAL_LINE.is_match(line)) {
        let Some(parts) = OCTAL_PREFIX.captures(token) else {
            return Ok(0);
        };
        let digits = parts[2].replace('_', "");
        let value = i128::from_str_radix(&digits, 8).map_err(|_| "integer outside OMML bounds")?;
        return Ok(if &parts[1] == "-" { -value } else { value });
    }
    if raw.split('\n').any(|line| FLOAT_LINE.is_match(line)) {
        if !FLOAT_TOKEN.is_match(token) {
            return Err("invalid numeric XML value");
        }
        let number: f64 = token.parse().map_err(|_| "invalid numeric XML value")?;
        if !number.is_finite() {
            return Err("nonfinite numeric XML value");
        }
        return Ok(number.trunc() as i128);
    }
    if !DECIMAL.is_match(token) {
        return Err("invalid integer XML value");
    }
    let token = token.trim_start_matches(['+', '-']);
    let digits = token
        .strip_prefix("0d")
        .or_else(|| token.strip_prefix("0D"))
        .unwrap_or(token)
        .replace('_', "");
    let value = digits
        .parse::<i128>()
        .map_err(|_| "integer outside OMML bounds")?;
    Ok(
        if raw
            .trim_start_matches([' ', '\t', '\n', '\r', '\x0b', '\x0c'])
            .starts_with('-')
        {
            -value
        } else {
            value
        },
    )
}

macro_rules! define_bound {
    ($module:ident, $name:ident, $min:expr, $max:expr) => {
        pub mod $module {
            use super::*;
            #[derive(Clone, Debug, PartialEq, Eq)]
            pub struct $name(i128);
            impl $name {
                pub fn new(value: i128) -> Result<Self, &'static str> {
                    if ($min..=$max).contains(&value) {
                        Ok(Self(value))
                    } else {
                        Err("integer outside OMML bounds")
                    }
                }
            }
            impl Serialize for $name {
                fn serialize<S: Serializer>(&self, s: S) -> Result<S::Ok, S::Error> {
                    s.serialize_str(&self.0.to_string())
                }
            }
            impl<'de> Deserialize<'de> for $name {
                fn deserialize<D: Deserializer<'de>>(d: D) -> Result<Self, D::Error> {
                    let token = String::deserialize(d)?;
                    if !CANONICAL.is_match(&token) {
                        return Err(serde::de::Error::custom(
                            "expected a canonical integer string",
                        ));
                    }
                    let value = token.parse().map_err(serde::de::Error::custom)?;
                    Self::new(value).map_err(serde::de::Error::custom)
                }
            }
            pub fn parse(raw: &str) -> Result<Option<$name>, &'static str> {
                $name::new(parse_xml_integer(raw)?).map(Some)
            }
            pub fn format(value: &$name) -> Result<String, std::convert::Infallible> {
                Ok(value.0.to_string())
            }
        }
    };
}

define_bound!(unsigned_int, UnsignedInt, 0, 4_294_967_295);
define_bound!(unsigned_long, UnsignedLong, 0, 18_446_744_073_709_551_615);
define_bound!(st_integer2, STInteger2, -2, 2);
define_bound!(st_integer255, STInteger255, 1, 255);
define_bound!(st_spacing_rule, STSpacingRule, 0, 4);
define_bound!(st_text_scale, STTextScale, 0, 600);
