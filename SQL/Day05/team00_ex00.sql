CREATE TABLE cities 
(
    point1 CHAR(1),
	point2 CHAR(1),
    cost INT
);

INSERT INTO cities 
VALUES
    ('a', 'b', 10),('a', 'c', 15),('a', 'd', 20),
    ('b', 'a', 10),('b', 'c', 35),('b', 'd', 25),
    ('c', 'a', 15),('c', 'b', 35),('c', 'd', 30),
    ('d', 'a', 20),('d', 'b', 25),('d', 'c', 30);

WITH RECURSIVE tour AS (
	SELECT point1 AS start,
		ARRAY[point1::TEXT, point2::TEXT] AS route,
		point2 AS last,
		cost total_cost,
		2 AS iter
	FROM cities
	WHERE point1 = 'a'
	UNION ALL
	SELECT t.start,
		t.route || c.point2,  /* Записывает в массив город */
		c.point2,
		t.total_cost + c.cost,
		t.iter + 1 /* Счётчик итерации */
	FROM tour t
	JOIN cities c ON t.last = c.point1 /* Проверка что последий город предыдущей итерации равен началу новой*/
		AND c.point2 != ALL(t.route) /* Проверка что текущего города нет в массиве */
	WHERE t.iter < 4 /* Условие цикла */
),
full_tour AS( /* Последняя итерация */
	SELECT t.total_cost + c.cost total_cost,
	t.route || t.start full_route
	FROM tour t
	JOIN cities c ON t.last = c.point1 AND c.point2 = t.start /* Проверка что город 'а' */
	WHERE t.iter = 4
)
SELECT total_cost,
	'{' || array_to_string(full_route, ',') || '}' AS tour
FROM full_tour
ORDER BY 1, 2;