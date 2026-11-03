
-- Problem: Ollivander's Wand Selection
-- Platform: HackerRank
--
-- Objective:
-- Find the cheapest non-evil wand for each age and power
-- combination.
--
-- Tables Used:
-- 1. Wands: id, code, coins_needed, power
-- 2. Wands_Property: code, age, is_evil
--
-- Concepts:
-- INNER JOIN, subquery, MIN(), GROUP BY, filtering, ORDER BY

SELECT
    w.id,
    wp.age,
    w.coins_needed,
    w.power
FROM Wands w
JOIN Wands_Property wp
    ON w.code = wp.code
WHERE wp.is_evil = 0
  AND w.coins_needed = (
      SELECT MIN(w2.coins_needed)
      FROM Wands w2
      JOIN Wands_Property wp2
          ON w2.code = wp2.code
      WHERE wp2.is_evil = 0
        AND wp2.age = wp.age
        AND w2.power = w.power
  )
ORDER BY
    w.power DESC,
    wp.age DESC;

