/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

We would like to identify top performing sales reps, which are sales reps
associated with more than 200 orders. Create a table with the sales rep name,
the total number of orders, and a column with top or not depending on if they
have more than 200 orders. Place the top sales people first in your final table.
*/


SELECT s.name sales_rep,
       COUNT(*) orders_count,
       CASE WHEN COUNT(*) > 200 THEN 'Top'
            ELSE 'Not' END AS sales_rep_level
FROM orders o
JOIN accounts a
ON a.id = o.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY 1
ORDER BY 2 DESC ,1;


/*
It is worth mentioning that this assumes each name is unique - which has been
done a few times. We otherwise would want to break by the name and the id of
the table.
*/
