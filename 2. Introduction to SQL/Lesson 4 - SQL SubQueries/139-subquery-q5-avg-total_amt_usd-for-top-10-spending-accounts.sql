/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

Question 5:
What is the lifetime average amount spent in terms of total_amt_usd for the
top 10 total spending accounts?
*/

/*Do check the alternate solution/approach in the next query 140 and 154, 155 */

/*STEP1: Pull the top 10 most spent accounts list */

SELECT a.name AS name, SUM(o.total_amt_usd) AS total_spent
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

/*
Result:
Output 10 results

name	               total_spent
EOG Resources	          382873.30
Mosaic	                345618.59
IBM	                    326819.48
General Dynamics	      300694.79
Republic Services	      293861.14
Leucadia National	      291047.25
Arrow Electronics	      281018.36
Sysco	                  278575.64
Supervalu	              275288.30
Archer Daniels Midland	272672.84
*/

/*STEP2: Now we just have to obtain the average value for the above accounts*/
/*------------SOLUTION-------------*/

SELECT AVG(total_spent) avg_lifetime_value
FROM ( SELECT a.name AS name,
              SUM(o.total_amt_usd) AS total_spent
       FROM accounts a
       JOIN orders o
       ON o.account_id = a.id
       GROUP BY 1
       ORDER BY 2 DESC
       LIMIT 10 ) temp;

/*
Result:

avg_lifetime_value
304846.969000000000
*/
