# sql-sakilla-projects
# SQL Portfolio - Sakila Database Analysis

This repository contains advanced SQL queries analyzing the **Sakila** sample database. 

## Queries included:
- **VIP Customers Analysis (`vip_customers_analysis.sql`)**: Complex query using multi-table `INNER JOIN`s (`customer` -> `address` -> `city` -> `country`), derived tables (`AS total`), aggregate functions (`SUM`, `AVG`), and nested subqueries in the `HAVING` clause to identify top-spending customers above the database average.
