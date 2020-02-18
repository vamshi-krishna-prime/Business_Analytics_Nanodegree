/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

The previous didn't account for the middle, nor the dollar amount associated
with the sales. Management decides they want to see these characteristics
represented as well. We would like to identify top performing sales reps,
which are sales reps associated with more than 200 orders or more than
750000 in total sales. The middle group has any rep with more than 150 orders
or 500000 in sales. Create a table with the sales rep name, the total number
of orders, total sales across all orders, and a column with top, middle, or
low depending on this criteria. Place the top sales people based on dollar
amount of sales first in your final table. You might see a few upset sales
people by this criteria!
*/


SELECT s.name sales_rep,
       COUNT(*) num_orders,
       SUM(o.total_amt_usd) total_sales_usd,
       CASE WHEN COUNT(*) > 200 OR SUM(o.total_amt_usd) > 750000 THEN 'Top'
            WHEN (COUNT(*) > 150 AND COUNT(*) <= 200) OR (SUM(o.total_amt_usd) > 500000 AND SUM(o.total_amt_usd) <= 750000) THEN 'Middle'
            ELSE 'Low' END AS sales_rep_category
FROM orders o
JOIN accounts a
ON a.id = o.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY 1
ORDER BY 3 DESC, 1;


/*
This is more detailed than given solution

Given Solution:
*/

SELECT s.name, COUNT(*), SUM(o.total_amt_usd) total_spent,
     CASE WHEN COUNT(*) > 200 OR SUM(o.total_amt_usd) > 750000 THEN 'top'
     WHEN COUNT(*) > 150 OR SUM(o.total_amt_usd) > 500000 THEN 'middle'
     ELSE 'low' END AS sales_rep_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY 3 DESC;

/*
You might see a few upset sales people by this criteria!
for instance:
sales_rep	    num_orders	   total_sales_usd	    sales_rep_category
Earlie Schleusner	335	          1098137.72	             Top
Tia Amato	        267	          1010690.60	             Top
Vernita Plump	    299	           934212.93	             Top

You can observe that Vernita Plump has more orders but less usd compared to
Tia Amato
*/
