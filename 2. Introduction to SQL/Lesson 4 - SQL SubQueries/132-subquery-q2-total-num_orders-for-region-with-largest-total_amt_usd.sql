/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

Question 2:
For the region with the largest (sum) of sales total_amt_usd, how many
total (count) orders were placed?
*/

/*
A smaller solution is provided in the next query 133 and 148, 149 */

/*STEP 1:Find total sales in every region*/
SELECT r.name region, SUM(o.total_amt_usd) AS total_amt
FROM orders o
JOIN accounts a
ON o.account_id = a.id
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON s.region_id = r.id
GROUP BY 1
ORDER BY 2 DESC;

/*Result:
region	       total_amt
Northeast	      7744405.36
Southeast	      6458497.00
West	          5925122.96
Midwest	        3013486.51
*/

/*STEP2: Extract the Max total sales*/

SELECT MAX(total_amt)
FROM ( SELECT r.name region,
              SUM(o.total_amt_usd) AS total_amt
       FROM orders o
       JOIN accounts a
       ON o.account_id = a.id
       JOIN sales_reps s
       ON a.sales_rep_id = s.id
       JOIN region r
       ON s.region_id = r.id
       GROUP BY 1
       ORDER BY 2 DESC ) t1

/*
Result = 7744405.36
*/

/*STRP3: Join the above two queries to extract the region with largest
total sales*/

SELECT t3.region
FROM ( SELECT r.name region,
              SUM(o.total_amt_usd) AS total_amt
       FROM orders o
       JOIN accounts a
       ON o.account_id = a.id
       JOIN sales_reps s
       ON a.sales_rep_id = s.id
       JOIN region r
       ON s.region_id = r.id
       GROUP BY 1
       ORDER BY 2 DESC ) t3

JOIN ( SELECT MAX(total_amt) AS max_total_amt
       FROM ( SELECT r.name region,
                     SUM(o.total_amt_usd) AS total_amt
              FROM orders o
              JOIN accounts a
              ON o.account_id = a.id
              JOIN sales_reps s
              ON a.sales_rep_id = s.id
              JOIN region r
              ON s.region_id = r.id
              GROUP BY 1
              ORDER BY 2 DESC ) t1
      ) t2

ON t2.max_total_amt = t3.total_amt;

/*
Result: Northeast
*/


/*STEP4: */
/*---------------SOLUTION STARTS-------------------*/

SELECT r.name AS region, COUNT(*) AS orders_count
FROM orders o
JOIN accounts a
ON o.account_id = a.id
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON s.region_id = r.id
WHERE r.name = (SELECT t3.region
                FROM ( SELECT r.name region,
                              SUM(o.total_amt_usd) AS total_amt
                       FROM orders o
                       JOIN accounts a
                       ON o.account_id = a.id
                       JOIN sales_reps s
                       ON a.sales_rep_id = s.id
                       JOIN region r
                       ON s.region_id = r.id
                       GROUP BY 1
                       ORDER BY 2 DESC ) t3

                JOIN ( SELECT MAX(total_amt) AS max_total_amt
                       FROM ( SELECT r.name region,
                                     SUM(o.total_amt_usd) AS total_amt
                              FROM orders o
                              JOIN accounts a
                              ON o.account_id = a.id
                              JOIN sales_reps s
                              ON a.sales_rep_id = s.id
                              JOIN region r
                              ON s.region_id = r.id
                              GROUP BY 1
                              ORDER BY 2 DESC ) t1
                      ) t2

                ON t2.max_total_amt = t3.total_amt
                )
GROUP BY 1;


/*
Reslut:
region	       orders_count
Northeast	        2357
*/

/*---------------SOLUTION ENDS-------------------*/


/*
Lets check the result with a trail query:
*/

SELECT r.name AS region, COUNT(*) AS orders_count
FROM orders o
JOIN accounts a
ON o.account_id = a.id
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON s.region_id = r.id
WHERE r.name = 'Northeast'
GROUP BY 1;

/*
Result:
region	     orders_count
Northeast	      2357
*/
