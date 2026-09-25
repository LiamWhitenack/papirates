INSERT INTO faces (
    polyhedron,
    centroid
)
VALUES ($1, $2)
RETURNING id;
