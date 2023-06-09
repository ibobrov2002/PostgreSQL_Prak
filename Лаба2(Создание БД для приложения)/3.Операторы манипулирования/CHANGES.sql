UPDATE accounts SET number_units=round((100-10)*number_units/(SELECT sum(number_units) FROM accounts 
	    							WHERE service='gas' AND id_housing=(SELECT id FROM housing WHERE apartment=1 AND house=2)))
	WHERE id_housing=(SELECT id FROM housing WHERE apartment=1 AND house=2) AND service='gas';

--Изменить текущий счётчик по электричеству в квартире 1 дом 1 на счётчик модели Energy meter CE 101 R5.1 145 M6

UPDATE counters SET id_type=(SELECT id_type FROM counter_types WHERE model='Energy meter CE 101 R5.1 145 M6'), istallation_date=CURRENT_DATE
	WHERE id_housing = (SELECT id FROM housing WHERE apartment=1 and house=1) 
	AND id_type IN (SELECT id_type FROM counter_types WHERE service='electricity')	
	
--Удаление строки с долгом определённой квартиры за определённый месяц по определённой услуге (эквивалент оплате)
DELETE FROM accounts 
	WHERE id_housing=(SELECT id FROM housing WHERE apartment=1 AND house=1) 
	AND month=1 AND year=2021 AND service='gas'
	
--Удаление вида услуги gas(Эквивалент тому, что данная услуга домоуправнением больше не контролируется) должно понести за собой удаление соответсвующих строк в accounts и counter_types
DELETE FROM service_type WHERE service='gas'
