/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

WITH Statements:

Question 2:
For the region with the largest sales total_amt_usd, how many total orders
were placed?
*/

/* Same question as 132,133 ; but Query using WITH statement */

/*STEP1: */

WITH max_region AS (SELECT r.name AS region,
                           SUM(o.total_amt_usd) AS total_usd
                    FROM orders o
                    JOIN accounts a
                    ON a.id = o.account_id
                    JOIN sales_reps s
                    ON a.sales_rep_id = s.id
                    JOIN region r
                    ON s.region_id = r.id
                    GROUP BY 1
                    ORDER BY 2 DESC
                    LIMIT 1)

SELECT r.name AS zone,
       COUNT(*) AS total_orders
FROM orders o
JOIN accounts a
ON o.account_id = a.id
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON s.region_id = r.id
WHERE r.name = (SELECT region
                FROM max_region)
GROUP BY 1;


/*
Result:
zone	         total_orders
Northeast	        2357
*/
