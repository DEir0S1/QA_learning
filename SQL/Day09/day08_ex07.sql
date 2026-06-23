BEGIN; -- Выполняется в 1-ой, потом во 2-ой сессии

UPDATE pizzeria
SET rating = 1 WHERE id = 1; -- В 1-ой сессии

UPDATE pizzeria
SET rating = 2 WHERE id = 2; -- Во 2-ой сессии

UPDATE pizzeria
SET rating = 1 WHERE id = 2; -- В 1-ой сессии, ждёт коммита 2-ой сессии 

UPDATE pizzeria
SET rating = 2 WHERE id = 1; -- Во 2-ой сессии, блокируется, а с 1-ой ОК

COMMIT; -- Подтверждаем коммит в 1-ой сессии

ROLLBACK; -- Разблокируем 2-ю сессию

SELECT * FROM pizzeria
WHERE id = 1 OR id = 2; /* Чисто для проверки записи, т.к не обязательно
заблокируется именно 2-я сессия, всё зависит на какой сессии обнаружится
deadlock первым. На скриншотах заблокировалась именно 2-я сессия */