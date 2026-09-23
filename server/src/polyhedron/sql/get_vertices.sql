SELECT
    id,
    x,
    y,
    z,
    latitude,
    longitude
FROM vertices
WHERE polyhedron = $1
ORDER BY id;