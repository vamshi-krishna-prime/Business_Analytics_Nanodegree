/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Imagine yourself in operatins at 'Parch & posey', ypu'd like to classify orders
into general groups based on order size to get more granular about inventory
planning. You can use a 'CASE' statement to define a number of outcomes by
including as many 'WHEN - THEN' statements as you'd like.
*/



SELECT account_id,
       occurred_at,
       total,
       CASE WHEN total > 500 THEN 'over 500'
            WHEN total > 300 AND total <= 500 THEN '301-500'
            WHEN total > 100 AND total <= 300 THEN '101-300'
            ELSE '100 or under' END AS total_group
FROM orders 
