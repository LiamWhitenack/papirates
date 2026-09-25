import gleam/dynamic/decode.{type Decoder}
import spherical_shapes.{
  type SphericalEdge, type SphericalFace, type SphericalPolyhedron,
  type SphericalVector, SphericalEdge, SphericalFace, SphericalPolyhedron,
  SphericalVector,
}

pub fn spherical_polyhedron_decoder() -> Decoder(SphericalPolyhedron) {
  use readable_id <- decode.field("readable_id", decode.string)
  use faces <- decode.field("faces", decode.list(face_input_decoder()))

  decode.success(SphericalPolyhedron(readable_id:, faces:))
}

fn face_input_decoder() -> Decoder(SphericalFace) {
  use centroid <- decode.field("centroid", spherical_vector_decoder())
  use edges <- decode.field("edges", decode.list(spherical_edge_decoder()))

  decode.success(SphericalFace(centroid:, edges:))
}

fn spherical_edge_decoder() -> Decoder(SphericalEdge) {
  use readable_id <- decode.field("name", decode.string)
  use vertex_a <- decode.field("vertex_a", unit_vector_input_decoder())
  use vertex_b <- decode.field("vertex_b", unit_vector_input_decoder())

  decode.success(SphericalEdge(readable_id:, vertex_a:, vertex_b:))
}

fn spherical_vector_decoder() -> Decoder(SphericalVector) {
  use x <- decode.field("x", decode.float)
  use y <- decode.field("y", decode.float)
  use z <- decode.field("z", decode.float)
  use latitude <- decode.field("latitude", decode.float)
  use longitude <- decode.field("longitude", decode.float)

  decode.success(SphericalVector(x:, y:, z:, latitude:, longitude:))
}

fn unit_vector_input_decoder() -> Decoder(SphericalVector) {
  use x <- decode.field("x", decode.float)
  use y <- decode.field("y", decode.float)
  use z <- decode.field("z", decode.float)
  use latitude <- decode.field("latitude", decode.float)
  use longitude <- decode.field("longitude", decode.float)

  decode.success(SphericalVector(x:, y:, z:, latitude:, longitude:))
}
