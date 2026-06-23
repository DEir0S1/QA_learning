SELECT id object_id,
	name object_name
FROM person

UNION ALL

SELECT id, pizza_name
FROM menu
ORDER BY 1, 2;