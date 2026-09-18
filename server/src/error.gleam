// server/src/error.gleam

import pog

pub type DatabaseError {
  UnexpectedNoRows
  RecordNotFound
  QueryError(pog.QueryError)
}
