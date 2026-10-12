# Pagila Lab 1: Basic SQL Queries

Academic SQL work by Timer Senarith for ALY6420 at Northeastern University. This project uses the Pagila DVD rental database to explore filtering, sorting, calculations, and grouped summaries.

## Tools

PostgreSQL 16, Neon, and DBeaver.

## SQL file

[View Lab1.sql](Lab1.sql)

## Objective

Translate specific questions about films, rentals, and payments into SQL queries, with attention to how conditions affect the returned records.

## Tasks

- Retrieve films with replacement costs above 20.00, ordered by cost descending and title ascending.
- Compare AND/OR conditions with and without parentheses for film ratings and rental duration.
- Select films lasting 75–105 minutes using BETWEEN.
- Filter G, PG, and PG-13 ratings using IN.
- Use LIKE to find titles starting with AGENT, four-character actor first names, and titles containing IRON.
- Identify missing rental return dates and count recorded return dates.
- Calculate a hypothetical 10% payment surcharge and show the top 15 amounts.
- Retrieve distinct film ratings.
- Display “No unit” for NULL address2 values using COALESCE.
- Correct aggregate filtering by using GROUP BY and HAVING.

## Analytical reasoning

The AND/OR comparison demonstrates why parentheses matter when combining conditions. Without parentheses, AND is evaluated before OR, which changes which films qualify.

The aggregate example distinguishes WHERE, which filters individual rows, from HAVING, which filters groups after aggregation.

Calculated surcharges and COALESCE values affect query output only. They do not update the stored data.

## Running the queries

1. Obtain the Pagila sample database distribution.
2. Create a PostgreSQL database locally or in Neon.
3. Load the schema first, followed by the sample data, using the tools required by the distribution. Use psql for scripts containing psql-specific commands.
4. Connect DBeaver to the database.
5. Open Lab1.sql and execute each question separately.

Recorded results in comments reflect the database instance used for the coursework. Other Pagila versions or modified data may produce different results.

## Skills demonstrated

Filtering, operator precedence, pattern matching, NULL handling, calculated columns, sorting, aggregation, and query debugging.

## Author

Timer Senarith
