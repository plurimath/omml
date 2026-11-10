use serde::{Deserialize, Deserializer, Serialize, Serializer};

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Token(String);

impl Token {
    pub fn new(value: String) -> Result<Self, &'static str> {
        if value.is_empty()
            || value
                .split(' ')
                .all(|word| !word.is_empty() && !word.contains(['\t', '\n', '\x0c', '\r']))
        {
            Ok(Self(value))
        } else {
            Err("invalid OMML token")
        }
    }
}

impl Serialize for Token {
    fn serialize<S: Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        serializer.serialize_str(&self.0)
    }
}

impl<'de> Deserialize<'de> for Token {
    fn deserialize<D: Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        Self::new(String::deserialize(deserializer)?).map_err(serde::de::Error::custom)
    }
}
