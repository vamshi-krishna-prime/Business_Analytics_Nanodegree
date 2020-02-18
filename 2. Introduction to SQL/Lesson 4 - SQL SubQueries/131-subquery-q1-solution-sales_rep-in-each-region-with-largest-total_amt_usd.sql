/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

Question 1:
Provide the name of the sales_rep in each region with the largest amount of
total_amt_usd sales.
*/

/*Do check out the solution involving WITH statements in 146, 147 query*/

/*Step by step Solution :
First, I wanted to find the total_amt_usd totals associated with each
sales rep, and I also wanted the region in which they were located. The query
below provided this information:
*/

SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
JOIN region r
ON r.id = s.region_id
GROUP BY 1,2
ORDER BY 3 DESC;

/*
Next, I pulled the max for each region, and then we can use this to pull
those rows in our final result.
*/

SELECT region_name, MAX(total_amt) total_amt
     FROM(SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
             FROM sales_reps s
             JOIN accounts a
             ON a.sales_rep_id = s.id
             JOIN orders o
             ON o.account_id = a.id
             JOIN region r
             ON r.id = s.region_id
             GROUP BY 1, 2) t1
     GROUP BY 1;

/*
Essentially, this is a JOIN of these two tables, where the region and
amount match.
*/

SELECT t3.rep_name, t3.region_name, t3.total_amt
FROM(SELECT region_name, MAX(total_amt) total_amt
     FROM(SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
             FROM sales_reps s
             JOIN accounts a
             ON a.sales_rep_id = s.id
             JOIN orders o
             ON o.account_id = a.id
             JOIN region r
             ON r.id = s.region_id
             GROUP BY 1, 2) t1
     GROUP BY 1) t2
JOIN (SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
     FROM sales_reps s
     JOIN accounts a
     ON a.sales_rep_id = s.id
     JOIN orders o
     ON o.account_id = a.id
     JOIN region r
     ON r.id = s.region_id
     GROUP BY 1,2
     ORDER BY 3 DESC) t3
ON t3.region_name = t2.region_name AND t3.total_amt = t2.total_amt;

/*
Result:
rep_name	           region_name	            total_amt
Earlie Schleusner	    Southeast	              1098137.72
Tia Amato	            Northeast	              1010690.60
Georgianna Chisholm	  West	                   886244.12
Charles Bidwell	      Midwest	                 675637.19
*/
