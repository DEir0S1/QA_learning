SELECT p.name, m.pizza_name, m.price,
	CASE
		WHEN m.price * (100 - pd.discount) / 100 % 1 = 0 THEN (m.price * (100 - pd.discount) / 100)::int
		ELSE (m.price * (100 - pd.discount) / 100)::numeric(5,2)
	END discount_price,
	pz.name pizzeria_name
FROM person_order po
JOIN person p ON po.person_id = p.id
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN person_discounts pd ON pd.person_id = p.id AND pd.pizzeria_id = pz.id
ORDER BY p.name, m.pizza_name;