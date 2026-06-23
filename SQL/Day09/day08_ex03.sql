BEGIN; -- Выполняется в 1-ой, потом во 2-ой сессии

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- В 1-ой сессии

UPDATE pizzeria
SET rating = 3.6 WHERE name = 'Pizza Hut'; -- Делаем во 2-ой сессии

COMMIT; -- Подтверждаем коммит во 2-ой сессии

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- В 1-ой сессии

COMMIT; -- в 1-ой сессии

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- В 1-ой сессии и во 2-ой