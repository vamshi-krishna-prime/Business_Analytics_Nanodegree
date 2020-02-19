/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

WITH Statements:

The WITH statement is often called a Common Table Expression or CTE. Though
these expressions serve the exact same purpose as subqueries, they are more
common in practice, as they tend to be cleaner for a future reader to follow
the logic.
1. Queries which results only as tables can be used under 'WITH statements'.
2. 'WITH statements must be declared on top i.e; before using it.
*/

/*WITH statement general syntax: */

WITH table1 AS (
          SELECT *
          FROM web_events),

     table2 AS (
          SELECT *
          FROM accounts)


SELECT *
FROM table1
JOIN table2
ON table1.account_id = table2.id;
