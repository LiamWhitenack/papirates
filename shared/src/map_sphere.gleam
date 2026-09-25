import cartesian_shapes.{type Edge, type Face, type Polyhedron, type UnitVector}
import gleam/list
import gleam_community/maths
import spherical_shapes.{
  type SphericalEdge, type SphericalFace, type SphericalPolyhedron,
  type SphericalVector, SphericalEdge, SphericalFace, SphericalPolyhedron,
  SphericalVector,
}

fn assert_ok(result: Result(a, Nil)) -> a {
  case result {
    Ok(value) -> value
    Error(_) -> panic
  }
}

pub fn latitude(vector: UnitVector) -> Float {
  90.0 -. { maths.acos(vector.z) |> assert_ok }
}

pub fn longitude(vector: UnitVector) -> Float {
  maths.atan2(vector.y, vector.x) *. 180.0 /. 3.141592653589793
}

pub fn to_polyhedron_input(polyhedron: Polyhedron) -> SphericalPolyhedron {
  SphericalPolyhedron(
    readable_id: polyhedron.readable_id,
    faces: list.map(polyhedron.faces, to_spherical_face),
  )
}

fn to_spherical_face(face: Face) -> SphericalFace {
  SphericalFace(
    centroid: to_spherical_vector(face.centroid),
    edges: list.map(face.edges, to_edge_input),
  )
}

fn to_edge_input(edge: Edge) -> SphericalEdge {
  SphericalEdge(
    readable_id: edge.readable_id,
    vertex_a: to_spherical_vector(edge.vertex_a),
    vertex_b: to_spherical_vector(edge.vertex_b),
  )
}

fn to_spherical_vector(unit_vector: UnitVector) -> SphericalVector {
  SphericalVector(
    x: unit_vector.x,
    y: unit_vector.y,
    z: unit_vector.z,
    latitude: latitude(unit_vector),
    longitude: longitude(unit_vector),
  )
}
