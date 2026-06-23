SELECT m.pizza_name, pz.name pizzeria_name, m.price
FROM (
	SELECT * FROM menu
	WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
	) m
JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1, 2