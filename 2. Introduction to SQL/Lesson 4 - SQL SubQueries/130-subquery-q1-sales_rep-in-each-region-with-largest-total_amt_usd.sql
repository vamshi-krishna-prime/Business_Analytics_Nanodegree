/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

Question 1:
Provide the name of the sales_rep in each region with the largest amount of
total_amt_usd sales.
*/

/*Do check out the solution in the next query 131 and 146, 147 */

SELECT t2.region,
       t3.salesman,
       t2.max_sales

FROM ( SELECT region,
              MAX(total_sales) AS max_sales
       FROM ( SELECT r.name AS region,
                     s.name AS salesman,
                     SUM(o.total_amt_usd) AS total_sales
              FROM orders o
              JOIN accounts a
              ON o.account_id = a.id
              JOIN sales_reps s
              ON a.sales_rep_id = s.id
              JOIN region r
              ON s.region_id = r.id
              GROUP BY 1,2
              ORDER BY 3 DESC
            ) t1
       GROUP BY 1
     ) t2

JOIN ( SELECT r.name AS region,
              s.name AS salesman,
              SUM(o.total_amt_usd) AS total_sales
       FROM orders o
       JOIN accounts a
       ON o.account_id = a.id
       JOIN sales_reps s
       ON a.sales_rep_id = s.id
       JOIN region r
       ON s.region_id = r.id
       GROUP BY 1,2
       ORDER BY 3 DESC
     ) t3

ON (t2.region = t3.region) AND (t2.max_sales = t3.total_sales)
ORDER BY 3 DESC;


/*
Result:

region	             salesman	               max_sales

Southeast	      Earlie Schleusner	          1098137.72
Northeast	      Tia Amato	                  1010690.60
West	          Georgianna Chisholm	        886244.12
Midwest	        Charles Bidwell	            675637.19
*/
