WITH person_seq AS (
    SELECT 
        id,
        (SELECT COUNT(*) FROM person p2 WHERE p2.id <= p1.id) seq
    FROM person p1
)
INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT 
    (SELECT MAX(id) FROM person_order) + seq,
    id,
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
    '2022-02-25'
FROM person_seq;