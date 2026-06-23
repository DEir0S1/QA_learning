WITH g_count AS (
	SELECT pz.name,
		COUNT(CASE WHEN p.gender = 'female' THEN 1 END) f_count,
		COUNT(CASE WHEN p.gender = 'male' THEN 1 END) m_count
	FROM person_order po
	JOIN person p ON po.person_id = p.id
	JOIN menu m ON po.menu_id = m.id
	JOIN pizzeria pz ON m.pizzeria_id = pz.id
	GROUP BY pz.name
)
SELECT name FROM g_count
WHERE m_count = 0
UNION
SELECT name FROM g_count
WHERE f_count = 0
ORDER BY 1;