BEGIN; -- Выполняется в 1-ой, потом во 2-ой сессии

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; /* Выполняется в 1-ой,
потом во 2-ой сессии */

UPDATE pizzeria
SET rating = 4 WHERE name = 'Pizza Hut'; -- Делаем в 1-ой сессии

UPDATE pizzeria
SET rating = 3.6 WHERE name = 'Pizza Hut'; /* Делаем во 2-ой сессии,
должна зависнуть*/

COMMIT; -- Подтверждаем коммит в 1-ой сессии, потом во 2-ой

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; /* Выполняется в 1-ой,
потом во 2-ой сессии */