/*
Problem:
Find each continent and its average city population,
rounded down to the nearest integer.
 
Concepts: 
INNER JOIN, AVG(), FLOOR(), GROUP BY
*/

SELECT
    COUNTRY.Continent,
    FLOOR(AVG(CITY.Population)) AS average_population
FROM CITY
INNER JOIN COUNTRY
    ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;
