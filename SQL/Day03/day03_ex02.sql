SELECT m.pizza_name, m.price, pz.name pizzeria_name
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN (SELECT id FROM menu
	WHERE id NOT IN (SELECT menu_id FROM person_order)
	) um ON m.id = um.id
ORDER BY 1, 2;