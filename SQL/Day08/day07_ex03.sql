WITH orders_count AS (
    SELECT pz.name, COUNT(*) AS count
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    GROUP BY pz.name
),
visits_count AS (
    SELECT pz.name, COUNT(*) AS count
    FROM person_visits pv
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY pz.name
)
SELECT 
    COALESCE(o.name, v.name) name,
    COALESCE(o.count, 0) + COALESCE(v.count, 0) AS total_count
FROM orders_count o
FULL JOIN visits_count v USING(name)
ORDER BY 2 DESC, 1;