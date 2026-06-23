SELECT m.pizza_name, pz.name pizzeria_name
FROM pizzeria pz
JOIN menu m ON m.pizzeria_id = pz.id
JOIN person_order po ON po.menu_id = m.id
JOIN (
	SELECT id FROM person
	WHERE name = 'Denis' OR name = 'Anna'
	) p ON p.id = po.person_id
ORDER BY 1, 2;