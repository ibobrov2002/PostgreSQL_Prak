WITH fff AS
	(SELECT departure_airport, count(*) AS departures
	FROM flights
	GROUP BY departure_airport)
SELECT airport_code, airport_name, city, coordinates, timezone, departures
FROM airports_data 
	JOIN fff ON airport_code = departure_airport
