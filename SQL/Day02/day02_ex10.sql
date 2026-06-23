SELECT p1.name person_name1,
	p2.name person_name2,
	p1.address common_address
FROM person p1
CROSS JOIN person p2
WHERE p1.address = p2.address AND p1.name < p2.name
ORDER BY 1, 2, 3;