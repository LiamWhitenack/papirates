SELECT
    id,
    centroid_x,
    centroid_y,
    centroid_z,
    centroid_latitude,
    centroid_longitude
FROM faces
WHERE polyhedron = $1
ORDER BY id;