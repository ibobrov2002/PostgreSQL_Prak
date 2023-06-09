SELECT a.aircraft_code,
	a.model,
	count(*) AS all,
	count(CASE
		 WHEN s.fare_conditions = 'Economy' THEN 1
		 ELSE NULL
		 END) AS economy,
	count(CASE
		 WHEN s.fare_conditions = 'Comfort' THEN 1
		 ELSE NULL
		 END) AS comfort,
	count(CASE
		 WHEN s.fare_conditions = 'Business' THEN 1
		 ELSE NULL
		 END) AS business
FROM aircrafts_data a
	JOIN seats s ON a.aircraft_code = s.aircraft_code
	GROUP BY a.aircraft_code;
