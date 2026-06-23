SELECT m.pizza_name, pz.name pizzeria_name
FROM menu m
JOIN pizzeria pz ON pz.id = m.pizzeria_id;

SET enable_seqscan = off;

EXPLAIN ANALYZE
SELECT m.pizza_name, pz.name pizzeria_name
FROM menu m
JOIN pizzeria pz ON pz.id = m.pizzeria_id;

SET enable_seqscan = on;