// Canonical strings preserve BigDecimal's fractional .0 and signed zero.
use regex::Regex;
use serde::{Deserialize, Deserializer, Serialize, Serializer};
use std::sync::LazyLock;

const PORTABLE_DIGITS: usize = 10_000;
static DECIMAL: LazyLock<Regex> =
    LazyLock::new(|| Regex::new(r"^-?(?:0|[1-9][0-9]*)\.(?:0|[0-9]*[1-9])\z").unwrap());
static LEXICAL: LazyLock<Regex> = LazyLock::new(|| {
    Regex::new(r"^([+-]?)(?:([0-9](?:_?[0-9])*)(?:\.([0-9](?:_?[0-9])*)?)?|\.([0-9](?:_?[0-9])*))(?:[eEdD]([+-]?[0-9]+))?\z").unwrap()
});
static TRAILING_UNDERSCORE: LazyLock<Regex> =
    LazyLock::new(|| Regex::new(r"^([+-]?[0-9](?:_?[0-9])*)_\z").unwrap());

fn normalize(raw: &str) -> Result<Option<String>, &'static str> {
    let token = raw.trim_matches([' ', '\t', '\n', '\r', '\x0b', '\x0c']);
    if matches!(token, "NaN" | "Infinity" | "+Infinity" | "-Infinity") {
        return Err("nonfinite OMML coordinate");
    }
    let short = TRAILING_UNDERSCORE.captures(token);
    let token = short
        .as_ref()
        .and_then(|m| m.get(1))
        .map_or(token, |m| m.as_str());
    let Some(parts) = LEXICAL.captures(token) else {
        return Ok(None);
    };
    let whole = parts.get(2).map_or("", |m| m.as_str()).replace('_', "");
    let fraction = parts
        .get(3)
        .or_else(|| parts.get(4))
        .map_or("", |m| m.as_str())
        .replace('_', "");
    let mantissa = format!("{whole}{fraction}");
    let significant = mantissa.trim_start_matches('0');
    let prefix = if &parts[1] == "-" { "-" } else { "" };
    if significant.is_empty() {
        return Ok(Some(format!("{prefix}0.0")));
    }
    let exponent = parts
        .get(5)
        .map_or("0", |m| m.as_str())
        .parse::<i64>()
        .map_err(|_| "coordinate exceeds the portable decimal digit limit")?;
    let leading_zeroes = mantissa.len() - significant.len();
    let digits = significant.trim_end_matches('0');
    let len = digits.len() as i128;
    let position = whole.len() as i128 - leading_zeroes as i128 + exponent as i128;
    let output_digits = if position <= 0 {
        1 - position + len
    } else {
        position.max(len) + 1
    };
    if output_digits > PORTABLE_DIGITS as i128 {
        return Err("coordinate exceeds the portable decimal digit limit");
    }
    if position <= 0 {
        return Ok(Some(format!(
            "{prefix}0.{}{digits}",
            "0".repeat((-position) as usize)
        )));
    }
    let point = position as usize;
    if point >= digits.len() {
        return Ok(Some(format!(
            "{prefix}{digits}{}.0",
            "0".repeat(point - digits.len())
        )));
    }
    let (integer, fraction) = digits.split_at(point);
    Ok(Some(format!("{prefix}{integer}.{fraction}")))
}

fn xml_spelling(value: &str) -> String {
    let negative = value.starts_with('-');
    let (whole, fraction) = value.trim_start_matches('-').split_once('.').unwrap();
    let mantissa = format!("{whole}{fraction}");
    let significant = mantissa.trim_start_matches('0');
    if significant.is_empty() {
        return value.into();
    }
    let digits = significant.trim_end_matches('0');
    let exponent = whole.len() as isize - (mantissa.len() - significant.len()) as isize;
    let prefix = if negative { "-" } else { "" };
    format!("{prefix}0.{digits}e{exponent}")
}

fn bounded(value: &str, min: i64, max: i64) -> bool {
    if !DECIMAL.is_match(value) {
        return false;
    }
    let negative = value.starts_with('-');
    let (whole, fraction) = value.trim_start_matches('-').split_once('.').unwrap();
    if whole.len() + fraction.len() > PORTABLE_DIGITS || whole.len() > 14 {
        return false;
    }
    let magnitude = whole.parse::<i64>().unwrap();
    if magnitude == 0 && fraction == "0" {
        return true;
    }
    let limit = if negative { -min } else { max };
    magnitude < limit || (magnitude == limit && fraction == "0")
}

macro_rules! define_coordinate {
    ($module:ident, $name:ident, $min:expr, $max:expr) => {
        pub mod $module {
            use super::*;

            #[derive(Clone, Debug, PartialEq, Eq)]
            pub struct $name(String);

            impl $name {
                pub fn new(value: String) -> Result<Self, &'static str> {
                    if bounded(&value, $min, $max) {
                        Ok(Self(value))
                    } else {
                        Err("expected a canonical decimal within OMML bounds")
                    }
                }
            }
            impl Serialize for $name {
                fn serialize<S: Serializer>(&self, s: S) -> Result<S::Ok, S::Error> {
                    s.serialize_str(&self.0)
                }
            }
            impl<'de> Deserialize<'de> for $name {
                fn deserialize<D: Deserializer<'de>>(d: D) -> Result<Self, D::Error> {
                    Self::new(String::deserialize(d)?).map_err(serde::de::Error::custom)
                }
            }
            pub fn parse(raw: &str) -> Result<Option<$name>, &'static str> {
                normalize(raw)?.map($name::new).transpose()
            }
            pub fn format(value: &$name) -> Result<String, std::convert::Infallible> {
                Ok(xml_spelling(&value.0))
            }
        }
    };
}

define_coordinate!(
    st_coordinate,
    STCoordinate,
    -27_273_042_329_600,
    27_273_042_316_900
);
define_coordinate!(
    st_positive_coordinate,
    STPositiveCoordinate,
    0,
    27_273_042_316_900
);
