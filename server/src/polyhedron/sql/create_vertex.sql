INSERT INTO unit_vectors (x, y, z)
VALUES ($1, $2, $3)
RETURNING id, latitude, longitude;
