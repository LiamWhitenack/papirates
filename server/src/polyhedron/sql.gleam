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
  AllPolyhedronsRow(id: String, readable_id: Option(String))
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
    use readable_id <- decode.field(1, decode.optional(decode.string))
    decode.success(AllPolyhedronsRow(id:, readable_id:))
  }

  "SELECT
    id,
    readable_id
FROM polyhedrons
"
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
  arg_1: Int,
  arg_2: Int,
  arg_3: Int,
) -> Result(pog.Returned(Nil), pog.QueryError) {
  let decoder = decode.map(decode.dynamic, fn(_) { Nil })

  "INSERT INTO edges (face, a, b)
VALUES ($1, $2, $3);
"
  |> pog.query
  |> pog.parameter(pog.int(arg_1))
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
  CreateFaceRow(id: Int)
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
  arg_2: Int,
) -> Result(pog.Returned(CreateFaceRow), pog.QueryError) {
  let decoder = {
    use id <- decode.field(0, decode.int)
    decode.success(CreateFaceRow(id:))
  }

  "INSERT INTO faces (
    polyhedron,
    centroid
)
VALUES ($1, $2)
RETURNING id;
"
  |> pog.query
  |> pog.parameter(pog.text(arg_1))
  |> pog.parameter(pog.int(arg_2))
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

  "INSERT INTO polyhedrons (id, readable_id)
VALUES ($1, $2);
"
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
  CreateVertexRow(id: Int, latitude: Float, longitude: Float)
}

/// Runs the `create_vertex` query
/// defined in `./src/polyhedron/sql/create_vertex.sql`.
///
/// > 🐿️ This function was generated automatically using v4.7.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn create_vertex(
  db: pog.Connection,
  arg_1: Float,
  arg_2: Float,
  arg_3: Float,
) -> Result(pog.Returned(CreateVertexRow), pog.QueryError) {
  let decoder = {
    use id <- decode.field(0, decode.int)
    use latitude <- decode.field(1, decode.float)
    use longitude <- decode.field(2, decode.float)
    decode.success(CreateVertexRow(id:, latitude:, longitude:))
  }

  "INSERT INTO unit_vectors (x, y, z)
VALUES ($1, $2, $3)
RETURNING id, latitude, longitude;
"
  |> pog.query
  |> pog.parameter(pog.float(arg_1))
  |> pog.parameter(pog.float(arg_2))
  |> pog.parameter(pog.float(arg_3))
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
  face: Int,
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
WHERE face = $1
ORDER BY a, b;
"
  |> pog.query
  |> pog.parameter(pog.int(face))
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
  GetFacesRow(id: Int, centroid: Int)
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
    use centroid <- decode.field(1, decode.int)
    decode.success(GetFacesRow(id:, centroid:))
  }

  "SELECT
    id,
    centroid
FROM faces
WHERE polyhedron = $1
ORDER BY id;
"
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
  GetPolyhedronRow(id: String, readable_id: Option(String))
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
    use readable_id <- decode.field(1, decode.optional(decode.string))
    decode.success(GetPolyhedronRow(id:, readable_id:))
  }

  "SELECT
    id,
    readable_id
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
    latitude: Float,
    longitude: Float,
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
) -> Result(pog.Returned(GetVerticesRow), pog.QueryError) {
  let decoder = {
    use id <- decode.field(0, decode.int)
    use x <- decode.field(1, decode.float)
    use y <- decode.field(2, decode.float)
    use z <- decode.field(3, decode.float)
    use latitude <- decode.field(4, decode.float)
    use longitude <- decode.field(5, decode.float)
    decode.success(GetVerticesRow(id:, x:, y:, z:, latitude:, longitude:))
  }

  "SELECT
    id,
    x,
    y,
    z,
    latitude,
    longitude
FROM unit_vectors
ORDER BY id;
"
  |> pog.query
  |> pog.returning(decoder)
  |> pog.execute(db)
}
