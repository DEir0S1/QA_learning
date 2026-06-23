COMMENT ON TABLE person_discounts
	IS 'Таблица хранит персональные скидки для клиентов в разных пиццериях. Скидка зависит от количества заказов клиента в конкретной пиццерии.';

COMMENT ON COLUMN person_discounts.id 
	IS 'Уникальный идентификатор записи (первичный ключ)';

COMMENT ON COLUMN person_discounts.person_id 
	IS 'Идентификатор клиента (внешний ключ к таблице person)';

COMMENT ON COLUMN person_discounts.pizzeria_id 
	IS 'Идентификатор пиццерии (внешний ключ к таблице pizzeria)';
	
COMMENT ON COLUMN person_discounts.discount 
	IS 'Размер персональной скидки в процентах (от 0 до 100). Значение по умолчанию 0.';