WITH RECURSIVE tour AS (
	SELECT point1 AS start,
		ARRAY[point1::TEXT, point2::TEXT] AS route,
		point2 AS last,
		cost total_cost,
		2 AS iter
	FROM cities
	WHERE point1 = 'a'
	UNION ALL
	SELECT t.start, t.route || c.point2,
		c.point2, t.total_cost + c.cost,
		t.iter + 1
	FROM tour t
	JOIN cities c ON t.last = c.point1 
		AND c.point2 != ALL(t.route)
	WHERE t.iter < 4
),
full_tour AS(
	SELECT t.total_cost + c.cost total_cost,
	t.route || t.start full_route
	FROM tour t
	JOIN cities c ON t.last = c.point1 AND c.point2 = t.start
	WHERE t.iter = 4
)
/* Всё то же самое */
SELECT total_cost,
	'{' || array_to_string(full_route, ',') || '}' AS tour
FROM full_tour
WHERE total_cost = (SELECT MIN(total_cost) FROM full_tour)
	OR total_cost = (SELECT MAX(total_cost) FROM full_tour)
/* Можно и без WHERE, т.к. в любом случае маршрутов всего 6 в задаче */
ORDER BY 1, 2;