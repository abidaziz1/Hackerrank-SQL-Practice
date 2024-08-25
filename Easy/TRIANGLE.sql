WITH RECURSIVE pattern(n) AS (
    SELECT 20 AS n
    UNION ALL
    SELECT n - 1
    FROM pattern
    WHERE n > 1
)
SELECT REPEAT('* ', n) AS stars
FROM pattern;
