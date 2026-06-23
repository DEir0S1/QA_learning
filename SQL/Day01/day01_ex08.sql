SELECT po.order_date, 
	p.name || ' (age:' || p.age || ')' person_information
FROM person_order po
NATURAL JOIN (SELECT id person_id, name, age FROM person) p
ORDER BY 1, 2;