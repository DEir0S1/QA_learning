SELECT object_name
FROM
	(SELECT name object_name, 1 sort
	FROM person

	UNION ALL

	SELECT pizza_name object_name, 2 sort
	FROM menu) combo
ORDER BY sort, 1;