/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

Imagine yourself as a Sales Manager at 'Parch and Posey' company. Write a query
to know all the orders occurred at the same month as the Parch and Posey's first
order ever.
*/


SELECT *
FROM orders o
WHERE DATE_TRUNC('month', o.occurred_at) =
( SELECT DATE_TRUNC('month', MIN(o.occurred_at))
FROM orders o )
ORDER BY o.occurred_at;

/*99 results*/

/*
Subqueries Part II:
In the first subquery you wrote, you created a table that you could then query
again in the FROM statement. However, if you are only returning a single value,
you might use that value in a logical statement like WHERE, HAVING, or even
SELECT - the value could be nested within a CASE statement.

Expert Tip:
1. Note that you should not include an alias when you write a subquery in a
conditional statement. This is because the subquery is treated as an
individual value (or set of values in the IN case) rather than as a table.

2. Also, notice the query here compared a single value. If we returned an entire
column IN would need to be used to perform a logical argument. If we are
returning an entire table, then we must use an ALIAS for the table, and
perform additional logic on the entire table.
*/
