// server/test/test_config.gleam

import config.{type Config}
import envoy

pub fn load() -> Config {
  let assert Ok(db_name) = envoy.get("TEST_DB_NAME")
  config.Config(..config.load(), db_name:)
}
