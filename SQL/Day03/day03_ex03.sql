WITH g_count AS (
	SELECT pz.name,
		COUNT(CASE WHEN p.gender = 'female' THEN 1 END) f_count,
		COUNT(CASE WHEN p.gender = 'male' THEN 1 END) m_count
	FROM person_visits pv
	JOIN person p ON pv.person_id = p.id
	JOIN pizzeria pz ON pv.pizzeria_id = pz.id
	GROUP BY pz.name
)
SELECT name FROM g_count
WHERE f_count > m_count
UNION ALL
SELECT name FROM g_count
WHERE m_count > f_count
ORDER BY 1;