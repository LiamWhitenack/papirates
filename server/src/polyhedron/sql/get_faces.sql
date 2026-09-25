SELECT
    id,
    centroid
FROM faces
WHERE polyhedron = $1
ORDER BY id;
