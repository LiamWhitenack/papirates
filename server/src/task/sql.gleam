//// This module contains the code to run the sql queries defined in
//// `./src/task/sql`.
//// > 🐿️ This module was generated automatically using v4.7.0 of
//// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
////

import gleam/dynamic/decode
import gleam/time/timestamp.{type Timestamp}
import pog

/// A row you get from running the `all_tasks` query
/// defined in `./src/task/sql/all_tasks.sql`.
///
/// > 🐿️ This type definition was generated automatically using v4.7.0 of the
/// > [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub type AllTasksRow {
  AllTasksRow(
    id: Int,
    name: String,
    description: String,
    completed: Bool,
    created_at: Timestamp,
    updated_at: Timestamp,
  )
}

/// server/src/task/sql/all_tasks.sql
///
/// > 🐿️ This function was generated automatically using v4.7.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn all_tasks(
  db: pog.Connection,
) -> Result(pog.Returned(AllTasksRow), pog.QueryError) {
  let decoder = {
    use id <- decode.field(0, decode.int)
    use name <- decode.field(1, decode.string)
    use description <- decode.field(2, decode.string)
    use completed <- decode.field(3, decode.bool)
    use created_at <- decode.field(4, pog.timestamp_decoder())
    use updated_at <- decode.field(5, pog.timestamp_decoder())
    decode.success(AllTasksRow(
      id:,
      name:,
      description:,
      completed:,
      created_at:,
      updated_at:,
    ))
  }

  "-- server/src/task/sql/all_tasks.sql

SELECT
  id,
  name,
  description,
  completed,
  created_at,
  updated_at
FROM tasks
ORDER BY created_at DESC, id DESC"
  |> pog.query
  |> pog.returning(decoder)
  |> pog.execute(db)
}

/// Runs the `create_task` query
/// defined in `./src/task/sql/create_task.sql`.
///
/// > 🐿️ This function was generated automatically using v4.7.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn create_task(
  db: pog.Connection,
) -> Result(pog.Returned(Nil), pog.QueryError) {
  let decoder = decode.map(decode.dynamic, fn(_) { Nil })

  ""
  |> pog.query
  |> pog.returning(decoder)
  |> pog.execute(db)
}

/// server/src/task/sql/delete_task.sql
///
/// > 🐿️ This function was generated automatically using v4.7.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn delete_task(
  db: pog.Connection,
  id: Int,
) -> Result(pog.Returned(Nil), pog.QueryError) {
  let decoder = decode.map(decode.dynamic, fn(_) { Nil })

  "-- server/src/task/sql/delete_task.sql

DELETE FROM tasks
WHERE id = $1"
  |> pog.query
  |> pog.parameter(pog.int(id))
  |> pog.returning(decoder)
  |> pog.execute(db)
}

/// A row you get from running the `get_task` query
/// defined in `./src/task/sql/get_task.sql`.
///
/// > 🐿️ This type definition was generated automatically using v4.7.0 of the
/// > [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub type GetTaskRow {
  GetTaskRow(
    id: Int,
    name: String,
    description: String,
    completed: Bool,
    created_at: Timestamp,
    updated_at: Timestamp,
  )
}

/// server/src/task/sql/get_task.sql
///
/// > 🐿️ This function was generated automatically using v4.7.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn get_task(
  db: pog.Connection,
  id: Int,
) -> Result(pog.Returned(GetTaskRow), pog.QueryError) {
  let decoder = {
    use id <- decode.field(0, decode.int)
    use name <- decode.field(1, decode.string)
    use description <- decode.field(2, decode.string)
    use completed <- decode.field(3, decode.bool)
    use created_at <- decode.field(4, pog.timestamp_decoder())
    use updated_at <- decode.field(5, pog.timestamp_decoder())
    decode.success(GetTaskRow(
      id:,
      name:,
      description:,
      completed:,
      created_at:,
      updated_at:,
    ))
  }

  "-- server/src/task/sql/get_task.sql

SELECT
  id,
  name,
  description,
  completed,
  created_at,
  updated_at
FROM tasks
WHERE id = $1"
  |> pog.query
  |> pog.parameter(pog.int(id))
  |> pog.returning(decoder)
  |> pog.execute(db)
}

/// A row you get from running the `update_task` query
/// defined in `./src/task/sql/update_task.sql`.
///
/// > 🐿️ This type definition was generated automatically using v4.7.0 of the
/// > [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub type UpdateTaskRow {
  UpdateTaskRow(
    id: Int,
    name: String,
    description: String,
    completed: Bool,
    created_at: Timestamp,
    updated_at: Timestamp,
  )
}

/// server/src/task/sql/update_task.sql
///
/// > 🐿️ This function was generated automatically using v4.7.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn update_task(
  db: pog.Connection,
  id: Int,
  arg_2: String,
  arg_3: String,
  arg_4: Bool,
) -> Result(pog.Returned(UpdateTaskRow), pog.QueryError) {
  let decoder = {
    use id <- decode.field(0, decode.int)
    use name <- decode.field(1, decode.string)
    use description <- decode.field(2, decode.string)
    use completed <- decode.field(3, decode.bool)
    use created_at <- decode.field(4, pog.timestamp_decoder())
    use updated_at <- decode.field(5, pog.timestamp_decoder())
    decode.success(UpdateTaskRow(
      id:,
      name:,
      description:,
      completed:,
      created_at:,
      updated_at:,
    ))
  }

  "-- server/src/task/sql/update_task.sql

UPDATE tasks
SET
  name = $2,
  description = $3,
  completed = $4,
  updated_at = NOW()
WHERE id = $1
RETURNING
  id,
  name,
  description,
  completed,
  created_at,
  updated_at"
  |> pog.query
  |> pog.parameter(pog.int(id))
  |> pog.parameter(pog.text(arg_2))
  |> pog.parameter(pog.text(arg_3))
  |> pog.parameter(pog.bool(arg_4))
  |> pog.returning(decoder)
  |> pog.execute(db)
}
