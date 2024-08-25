WITH RECURSIVE pattern(n) AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM pattern
    WHERE n < 20
)
SELECT REPEAT('* ', n) AS stars
FROM pattern;
