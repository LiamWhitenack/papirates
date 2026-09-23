INSERT INTO faces (
    polyhedron,
    centroid_x,
    centroid_y,
    centroid_z
)
VALUES ($1, $2, $3, $4)
RETURNING id, centroid_latitude, centroid_longitude;