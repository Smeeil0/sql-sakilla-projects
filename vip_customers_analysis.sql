-- ==========================================================
-- Project / Projekt: SQL Data Analysis - Sakila Database
-- Description / Opis: 
--   EN: Identification of VIP customers whose total spending exceeds 
--       the average customer spending across the entire database.
--       Uses multi-table joins, derived tables, and nested subqueries.
--   PL: Identyfikacja klientów VIP, których łączne wydatki przekraczają 
--       średnią wartość wydatków klientów w całej bazie danych.
--       Wykorzystuje wiele złączeń, tabele pochodne oraz podzapytania.
-- ==========================================================

SELECT customer.customer_id, customer.first_name, customer.last_name, 
country.country, total.spent
FROM customer

INNER JOIN address
ON customer.address_id = address.address_id

INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id

INNER JOIN(
    SELECT payment.customer_id, SUM(payment.amount) as spent
    FROM payment
    GROUP BY customer_id
) as total
ON customer.customer_id = total.customer_id

GROUP BY customer.customer_id
HAVING total.spent > (
    SELECT avg(sum2) 
    FROM (
        SELECT SUM(payment.amount) as sum2 
        FROM payment 
        GROUP BY payment.customer_id
    ) as total2
)

ORDER BY spent DESC
LIMIT 5;
