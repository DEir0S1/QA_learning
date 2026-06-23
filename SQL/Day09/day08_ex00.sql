BEGIN; -- Выполняется в 1-ой сессии

UPDATE pizzeria
SET rating = 5 WHERE name = 'Pizza Hut'; -- Делаем в 1-ой сессии

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; /* Поочерёдно выполняем
сначала в 1-ой сессии, потом во 2-ой для проверки */

COMMIT; -- Подтверждаем коммит в 1-ой сессии

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Во 2-ой сессии