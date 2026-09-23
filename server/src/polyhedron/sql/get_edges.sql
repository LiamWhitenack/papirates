SELECT
    a,
    b
FROM edges
WHERE polyhedron = $1
ORDER BY a, b;