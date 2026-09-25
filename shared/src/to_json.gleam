// shared/src/polyhedron.gleam

import gleam/json.{type Json}
import spherical_shapes.{
  type SphericalEdge, type SphericalFace, type SphericalVector,
}

pub fn face_input_to_json(face: SphericalFace) -> Json {
  json.object([
    // #("id", json.int(face.id)),
    #("centroid", spherical_vector_to_json(face.centroid)),
    #("edges", json.array(face.edges, spherical_edge_to_json)),
  ])
}

pub fn spherical_edge_to_json(edge: SphericalEdge) -> Json {
  json.object([
    // #("id", json.int(edge.id)),
    #("name", json.string(edge.readable_id)),
    #("vertex_a", spherical_vector_to_json(edge.vertex_a)),
    #("vertex_b", spherical_vector_to_json(edge.vertex_b)),
  ])
}

pub fn spherical_vector_to_json(unit_vector: SphericalVector) -> Json {
  json.object([
    // #("id", json.int(unit_vector.id)),
    #("x", json.float(unit_vector.x)),
    #("y", json.float(unit_vector.y)),
    #("z", json.float(unit_vector.z)),
  ])
}
