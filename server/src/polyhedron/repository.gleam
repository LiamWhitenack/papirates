// server/src/polyhedron/repository.gleam

import error.{type DatabaseError, QueryError, RecordNotFound, UnexpectedNoRows}
import gleam/list
import gleam/option
import gleam/result
import other.{type PolyhedronID, PolyhedronID}
import pog
import polyhedron/sql
import spherical_shapes.{type SphericalPolyhedron, SphericalPolyhedron}

fn assert_not_none(x: option.Option(a)) -> a {
  case x {
    option.Some(value) -> value
    option.None -> panic
  }
}

pub fn all_polyhedrons(
  db_conn: pog.Connection,
) -> Result(List(PolyhedronID), DatabaseError) {
  let query_result =
    db_conn
    |> sql.all_polyhedrons
    |> result.map_error(QueryError)
  use pog.Returned(_, rows) <- result.map(query_result)
  let rows = list.filter(rows, fn(row) { row.readable_id |> option.is_some })
  use row <- list.map(rows)
  { PolyhedronID(id: row.id, readable_id: assert_not_none(row.readable_id)) }
}

pub fn create_polyhedron(
  db_conn: pog.Connection,
  input: SphericalPolyhedron,
) -> Result(SphericalPolyhedron, DatabaseError) {
  let query_faces_result =
    input.faces
    |> list.map(fn(face) {
      sql.create_face(db_conn, face.centroid)
      |> result.map_error(QueryError)
    })

  let query_polyhedron_result =
    sql.create_polyhedron(db_conn, input.id, input.readable_id)
    |> result.map_error(QueryError)
  use pog.Returned(_, rows) <- result.try(query_polyhedron_result)
  let row =
    rows
    |> list.first
    |> result.replace_error(UnexpectedNoRows)
  use row <- result.map(row)

  SphericalPolyhedron(id: row.id, name: row.readable_id)
}

pub fn get_polyhedron(
  db_conn: pog.Connection,
  id: Int,
) -> Result(Polyhedron, DatabaseError) {
  let query_result =
    sql.get_polyhedron(db_conn, id)
    |> result.map_error(QueryError)
  use pog.Returned(_, rows) <- result.try(query_result)
  let row =
    rows
    |> list.first
    |> result.replace_error(RecordNotFound)
  use row <- result.map(row)

  Polyhedron(
    id: row.id,
    name: row.name,
    description: row.description,
    completed: row.completed,
  )
}
