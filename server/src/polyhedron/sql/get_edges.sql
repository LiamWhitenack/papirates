SELECT
    a,
    b
FROM edges
WHERE face = $1
ORDER BY a, b;
