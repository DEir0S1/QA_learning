BEGIN; -- Выполняется в 1-ой, потом во 2-ой сессии

SELECT SUM(rating) FROM pizzeria; -- В 1-ой сессии

INSERT INTO pizzeria (id, name, rating)
VALUES (10, 'Kazan Pizza', 5); -- Делаем во 2-ой сессии

COMMIT; -- Подтверждаем коммит во 2-ой сессии

SELECT SUM(rating) FROM pizzeria; -- В 1-ой сессии

COMMIT; -- в 1-ой сессии

SELECT SUM(rating) FROM pizzeria; -- В 1-ой сессии и во 2-ой