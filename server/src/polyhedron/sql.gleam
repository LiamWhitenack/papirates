//// This module contains the code to run the sql queries defined in
//// `./src/polyhedron/sql`.
//// > 🐿️ This module was generated automatically using v4.7.0 of
//// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
////

import gleam/dynamic/decode
import gleam/option.{type Option}
import pog

/// A row you get from running the `all_polyhedrons` query
/// defined in `./src/polyhedron/sql/all_polyhedrons.sql`.
///
/// > 🐿️ This type definition was generated automatically using v4.7.0 of the
/// > [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub type AllPolyhedronsRow {
  AllPolyhedronsRow(id: String, name: Option(String))
}

/// Runs the `all_polyhedrons` query
/// defined in `./src/polyhedron/sql/all_polyhedrons.sql`.
///
/// > 🐿️ This function was generated automatically using v4.7.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn all_polyhedrons(
  db: pog.Connection,
) -> Result(pog.Returned(AllPolyhedronsRow), pog.QueryError) {
  let decoder = {
    use id <- decode.field(0, decode.string)
    use name <- decode.field(1, decode.optional(decode.string))
    decode.success(AllPolyhedronsRow(id:, name:))
  }

  "SELECT id, name
FROM polyhedrons
WHERE name IS NOT NULL"
  |> pog.query
  |> pog.returning(decoder)
  |> pog.execute(db)
}

/// Runs the `create_edge` query
/// defined in `./src/polyhedron/sql/create_edge.sql`.
///
/// > 🐿️ This function was generated automatically using v4.7.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn create_edge(
  db: pog.Connection,
  arg_1: String,
  arg_2: Int,
  arg_3: Int,
) -> Result(pog.Returned(Nil), pog.QueryError) {
  let decoder = decode.map(decode.dynamic, fn(_) { Nil })

  "INSERT INTO edges (polyhedron, a, b)
VALUES ($1, $2, $3);"
  |> pog.query
  |> pog.parameter(pog.text(arg_1))
  |> pog.parameter(pog.int(arg_2))
  |> pog.parameter(pog.int(arg_3))
  |> pog.returning(decoder)
  |> pog.execute(db)
}

/// A row you get from running the `create_face` query
/// defined in `./src/polyhedron/sql/create_face.sql`.
///
/// > 🐿️ This type definition was generated automatically using v4.7.0 of the
/// > [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub type CreateFaceRow {
  CreateFaceRow(
    id: Int,
    centroid_latitude: Option(Float),
    centroid_longitude: Option(Float),
  )
}

/// Runs the `create_face` query
/// defined in `./src/polyhedron/sql/create_face.sql`.
///
/// > 🐿️ This function was generated automatically using v4.7.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn create_face(
  db: pog.Connection,
  arg_1: String,
  arg_2: Float,
  arg_3: Float,
  arg_4: Float,
) -> Result(pog.Returned(CreateFaceRow), pog.QueryError) {
  let decoder = {
    use id <- decode.field(0, decode.int)
    use centroid_latitude <- decode.field(1, decode.optional(decode.float))
    use centroid_longitude <- decode.field(2, decode.optional(decode.float))
    decode.success(CreateFaceRow(id:, centroid_latitude:, centroid_longitude:))
  }

  "INSERT INTO faces (
    polyhedron,
    centroid_x,
    centroid_y,
    centroid_z
)
VALUES ($1, $2, $3, $4)
RETURNING id, centroid_latitude, centroid_longitude;"
  |> pog.query
  |> pog.parameter(pog.text(arg_1))
  |> pog.parameter(pog.float(arg_2))
  |> pog.parameter(pog.float(arg_3))
  |> pog.parameter(pog.float(arg_4))
  |> pog.returning(decoder)
  |> pog.execute(db)
}

/// Runs the `create_polyhedron` query
/// defined in `./src/polyhedron/sql/create_polyhedron.sql`.
///
/// > 🐿️ This function was generated automatically using v4.7.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn create_polyhedron(
  db: pog.Connection,
  arg_1: String,
  arg_2: String,
) -> Result(pog.Returned(Nil), pog.QueryError) {
  let decoder = decode.map(decode.dynamic, fn(_) { Nil })

  "INSERT INTO polyhedrons (id, name)
VALUES ($1, $2);"
  |> pog.query
  |> pog.parameter(pog.text(arg_1))
  |> pog.parameter(pog.text(arg_2))
  |> pog.returning(decoder)
  |> pog.execute(db)
}

/// A row you get from running the `create_vertex` query
/// defined in `./src/polyhedron/sql/create_vertex.sql`.
///
/// > 🐿️ This type definition was generated automatically using v4.7.0 of the
/// > [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub type CreateVertexRow {
  CreateVertexRow(id: Int, latitude: Option(Float), longitude: Option(Float))
}

/// Runs the `create_vertex` query
/// defined in `./src/polyhedron/sql/create_vertex.sql`.
///
/// > 🐿️ This function was generated automatically using v4.7.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn create_vertex(
  db: pog.Connection,
  arg_1: String,
  arg_2: Float,
  arg_3: Float,
  arg_4: Float,
) -> Result(pog.Returned(CreateVertexRow), pog.QueryError) {
  let decoder = {
    use id <- decode.field(0, decode.int)
    use latitude <- decode.field(1, decode.optional(decode.float))
    use longitude <- decode.field(2, decode.optional(decode.float))
    decode.success(CreateVertexRow(id:, latitude:, longitude:))
  }

  "INSERT INTO vertices (polyhedron, x, y, z)
VALUES ($1, $2, $3, $4)
RETURNING id, latitude, longitude;"
  |> pog.query
  |> pog.parameter(pog.text(arg_1))
  |> pog.parameter(pog.float(arg_2))
  |> pog.parameter(pog.float(arg_3))
  |> pog.parameter(pog.float(arg_4))
  |> pog.returning(decoder)
  |> pog.execute(db)
}

/// A row you get from running the `get_edges` query
/// defined in `./src/polyhedron/sql/get_edges.sql`.
///
/// > 🐿️ This type definition was generated automatically using v4.7.0 of the
/// > [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub type GetEdgesRow {
  GetEdgesRow(a: Int, b: Int)
}

/// Runs the `get_edges` query
/// defined in `./src/polyhedron/sql/get_edges.sql`.
///
/// > 🐿️ This function was generated automatically using v4.7.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn get_edges(
  db: pog.Connection,
  polyhedron: String,
) -> Result(pog.Returned(GetEdgesRow), pog.QueryError) {
  let decoder = {
    use a <- decode.field(0, decode.int)
    use b <- decode.field(1, decode.int)
    decode.success(GetEdgesRow(a:, b:))
  }

  "SELECT
    a,
    b
FROM edges
WHERE polyhedron = $1
ORDER BY a, b;"
  |> pog.query
  |> pog.parameter(pog.text(polyhedron))
  |> pog.returning(decoder)
  |> pog.execute(db)
}

/// A row you get from running the `get_faces` query
/// defined in `./src/polyhedron/sql/get_faces.sql`.
///
/// > 🐿️ This type definition was generated automatically using v4.7.0 of the
/// > [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub type GetFacesRow {
  GetFacesRow(
    id: Int,
    centroid_x: Float,
    centroid_y: Float,
    centroid_z: Float,
    centroid_latitude: Option(Float),
    centroid_longitude: Option(Float),
  )
}

/// Runs the `get_faces` query
/// defined in `./src/polyhedron/sql/get_faces.sql`.
///
/// > 🐿️ This function was generated automatically using v4.7.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn get_faces(
  db: pog.Connection,
  polyhedron: String,
) -> Result(pog.Returned(GetFacesRow), pog.QueryError) {
  let decoder = {
    use id <- decode.field(0, decode.int)
    use centroid_x <- decode.field(1, decode.float)
    use centroid_y <- decode.field(2, decode.float)
    use centroid_z <- decode.field(3, decode.float)
    use centroid_latitude <- decode.field(4, decode.optional(decode.float))
    use centroid_longitude <- decode.field(5, decode.optional(decode.float))
    decode.success(GetFacesRow(
      id:,
      centroid_x:,
      centroid_y:,
      centroid_z:,
      centroid_latitude:,
      centroid_longitude:,
    ))
  }

  "SELECT
    id,
    centroid_x,
    centroid_y,
    centroid_z,
    centroid_latitude,
    centroid_longitude
FROM faces
WHERE polyhedron = $1
ORDER BY id;"
  |> pog.query
  |> pog.parameter(pog.text(polyhedron))
  |> pog.returning(decoder)
  |> pog.execute(db)
}

/// A row you get from running the `get_polyhedron` query
/// defined in `./src/polyhedron/sql/get_polyhedron.sql`.
///
/// > 🐿️ This type definition was generated automatically using v4.7.0 of the
/// > [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub type GetPolyhedronRow {
  GetPolyhedronRow(id: String, name: Option(String))
}

/// Runs the `get_polyhedron` query
/// defined in `./src/polyhedron/sql/get_polyhedron.sql`.
///
/// > 🐿️ This function was generated automatically using v4.7.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn get_polyhedron(
  db: pog.Connection,
  arg_1: String,
) -> Result(pog.Returned(GetPolyhedronRow), pog.QueryError) {
  let decoder = {
    use id <- decode.field(0, decode.string)
    use name <- decode.field(1, decode.optional(decode.string))
    decode.success(GetPolyhedronRow(id:, name:))
  }

  "SELECT
    id,
    name
FROM polyhedrons
WHERE id = $1;





"
  |> pog.query
  |> pog.parameter(pog.text(arg_1))
  |> pog.returning(decoder)
  |> pog.execute(db)
}

/// A row you get from running the `get_vertices` query
/// defined in `./src/polyhedron/sql/get_vertices.sql`.
///
/// > 🐿️ This type definition was generated automatically using v4.7.0 of the
/// > [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub type GetVerticesRow {
  GetVerticesRow(
    id: Int,
    x: Float,
    y: Float,
    z: Float,
    latitude: Option(Float),
    longitude: Option(Float),
  )
}

/// Runs the `get_vertices` query
/// defined in `./src/polyhedron/sql/get_vertices.sql`.
///
/// > 🐿️ This function was generated automatically using v4.7.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn get_vertices(
  db: pog.Connection,
  polyhedron: String,
) -> Result(pog.Returned(GetVerticesRow), pog.QueryError) {
  let decoder = {
    use id <- decode.field(0, decode.int)
    use x <- decode.field(1, decode.float)
    use y <- decode.field(2, decode.float)
    use z <- decode.field(3, decode.float)
    use latitude <- decode.field(4, decode.optional(decode.float))
    use longitude <- decode.field(5, decode.optional(decode.float))
    decode.success(GetVerticesRow(id:, x:, y:, z:, latitude:, longitude:))
  }

  "SELECT
    id,
    x,
    y,
    z,
    latitude,
    longitude
FROM vertices
WHERE polyhedron = $1
ORDER BY id;"
  |> pog.query
  |> pog.parameter(pog.text(polyhedron))
  |> pog.returning(decoder)
  |> pog.execute(db)
}
