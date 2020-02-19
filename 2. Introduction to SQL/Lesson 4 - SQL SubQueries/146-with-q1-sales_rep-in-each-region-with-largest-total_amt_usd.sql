/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

WITH Statements:

Question 1:
Provide the name of the sales_rep in each region with the largest amount of
total_amt_usd sales.
*/

/* Same question as 130,131 ; but Query using WITH statement */

/*STEP1: */

WITH total_sales AS (SELECT s.name AS name,
                            r.name AS region,
                            SUM(o.total_amt_usd) AS total_sales_usd
                     FROM orders o
                     JOIN accounts a
                     ON a.id = o.account_id
                     JOIN sales_reps s
                     ON a.sales_rep_id = s.id
                     JOIN region r
                     ON s.region_id = r.id
                     GROUP BY 1, 2
                     ORDER BY 3 DESC),

       max_sales AS (SELECT region,
                            MAX(total_sales_usd) AS max_sales_usd
                     FROM total_sales
                     GROUP BY 1
                     ORDER BY 2)

/*STEP2: */

SELECT total_sales.region, total_sales.name, max_sales.max_sales_usd
FROM total_sales
JOIN max_sales
ON total_sales.region = max_sales.region AND total_sales.total_sales_usd = max_sales.max_sales_usd
ORDER BY 3 DESC;


/*
Result:
region	           name	           max_sales_usd
Southeast	    Earlie Schleusner	    1098137.72
Northeast	    Tia Amato	            1010690.60
West	        Georgianna Chisholm	   886244.12
Midwest	      Charles Bidwell	       675637.19
*/
