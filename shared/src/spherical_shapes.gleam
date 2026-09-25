pub type SphericalPolyhedron {
  SphericalPolyhedron(readable_id: String, faces: List(SphericalFace))
}

pub type SphericalFace {
  SphericalFace(centroid: SphericalVector, edges: List(SphericalEdge))
}

pub type SphericalEdge {
  SphericalEdge(
    readable_id: String,
    vertex_a: SphericalVector,
    vertex_b: SphericalVector,
  )
}

pub type SphericalVector {
  SphericalVector(
    x: Float,
    y: Float,
    z: Float,
    latitude: Float,
    longitude: Float,
  )
}
