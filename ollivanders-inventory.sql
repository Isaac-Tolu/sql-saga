-- Source
-- https://www.hackerrank.com/challenges/harry-potter-and-wands/

WITH ranked_wands AS (
  SELECT 
    w.id, 
    wp.age, 
    w.coins_needed, 
    w.power,
    row_number() OVER (
      PARTITION BY wp.age, w.power
      ORDER BY w.coins_needed
    ) AS rn
  FROM wands w INNER JOIN wands_property wp
    ON w.code = wp.code
  WHERE wp.is_evil = 0
)
SELECT rw.id, rw.age, rw.coins_needed, rw.power
FROM ranked_wands rw
WHERE rw.rn = 1
ORDER BY rw.power DESC, rw.age DESC;