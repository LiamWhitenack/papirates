pub type Polyhedron {
  Polyhedron(id: String, readable_id: String, faces: List(Face))
}

pub type Face {
  Face(edges: List(Edge), centroid: UnitVector)
}

pub type Edge {
  Edge(readable_id: String, vertex_a: UnitVector, vertex_b: UnitVector)
}

pub type UnitVector {
  UnitVector(x: Float, y: Float, z: Float)
}
