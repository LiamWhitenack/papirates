import config
import context
import database
import gleam/io
import pog

pub fn main() {
  let config = config.load()
  let db_pool_name = database.start(config)
  let context = context.Context(config, db_pool_name)
  let db_conn = context.db_conn(context)

  let query = pog.query("SELECT 1")

  case pog.execute(query, db_conn) {
    Ok(_) -> io.println("Database connection OK")
    Error(_error) -> {
      io.println("Database connection failed")
      panic
    }
  }
}
