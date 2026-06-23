SELECT DISTINCT po.order_date actual_date, p.name person_name
FROM person_order po
JOIN person p ON po.person_id = p.id
WHERE (po.order_date, po.person_id) IN (
	SELECT visit_date, person_id
	FROM person_visits
)
ORDER BY 1, 2 DESC;