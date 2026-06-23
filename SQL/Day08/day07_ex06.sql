SELECT pz.name,
	COUNT(*) count_of_orders,
	CASE
		WHEN AVG(m.price) % 1 = 0 THEN ROUND(AVG(m.price),0)
		ELSE ROUND(AVG(m.price),2)
	END average_price,
	MAX(m.price) max_price,
	MIN(m.price) min_price
FROM person_order po
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY pz.name
ORDER BY 1;