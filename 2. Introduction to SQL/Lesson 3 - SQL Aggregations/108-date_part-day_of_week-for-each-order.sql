/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Display the day of the week for each order
*/



SELECT DATE_PART('dow', o.occurred_at) AS day_of_week, o.account_id, o.occurred_at, o.total
FROM orders o

/*
0 denotes the start of the week - Sunday
6 denoted the end if the week   - saturday

Also must use 'AS' when aliasing the date functions. like
DATE_PART('dow', o.occurred_at) AS day_of_week - valid
DATE_PART('dow', o.occurred_at) day_of_week    - invlid
*/
