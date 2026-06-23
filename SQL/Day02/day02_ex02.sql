SELECT COALESCE (p.name, '-') person_name,
	pv.visit_date,
	COALESCE (pz.name, '-') pizzeria_name
FROM person p
FULL OUTER JOIN (
    SELECT * FROM person_visits 
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
	) pv ON p.id = pv.person_id 
FULL OUTER JOIN pizzeria pz ON pz.id = pv.pizzeria_id
ORDER BY 1, 2, 3;