SELECT address,
	CASE
     	WHEN (MAX(age) - MIN(age)::NUMERIC / MAX(age)) % 1 = 0 
	 		THEN ROUND(MAX(age) - MIN(age)::NUMERIC / MAX(age), 0)
	 	WHEN ((MAX(age) - MIN(age)::NUMERIC / MAX(age)) % 1) * 100 % 10 = 0
	 		THEN ROUND(MAX(age) - MIN(age)::NUMERIC / MAX(age), 1)
		ELSE ROUND(MAX(age) - MIN(age)::NUMERIC / MAX(age), 2)
	END formula,
	CASE
     	WHEN AVG(age) % 1 = 0 THEN ROUND(AVG(age), 0)
	 	WHEN AVG(age) % 1 * 100 % 10 = 0 THEN ROUND(AVG(age), 1) 
		ELSE ROUND(AVG(age), 2)
	END average,
    MAX(age) - MIN(age)::NUMERIC / MAX(age) > AVG(age) comparison
FROM person
GROUP BY address
ORDER BY 1;