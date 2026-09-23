INSERT INTO vertices (polyhedron, x, y, z)
VALUES ($1, $2, $3, $4)
RETURNING id, latitude, longitude;