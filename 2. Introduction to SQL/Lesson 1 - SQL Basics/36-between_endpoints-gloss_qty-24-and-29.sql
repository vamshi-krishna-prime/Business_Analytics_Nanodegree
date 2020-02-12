/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

When you use the BETWEEN operator in SQL, do the results include the values of
your endpoints, or not? Figure out the answer to this important question by
writing a query that displays the order date and gloss_qty data for all orders
where gloss_qty is between 24 and 29. Then look at your output to see if the
BETWEEN operator included the begin and end values or not.
*/


SELECT occurred_at, gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;


/*
Observation: yes the results include the endpoints 24 and 29. This means the
between endpoints are inclusive on both left and right ends.
So the BETWEEN statement in this query is equivalent to having written
"WHERE gloss_qty >= 24 AND gloss_qty <= 29."
*/
