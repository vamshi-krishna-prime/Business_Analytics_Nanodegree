/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

Question 5:
What is the individual lifetime average amount spent in terms of total_amt_usd
for the top 10 total spending accounts?
*/

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

/*STEP2: Extract names from the top 10 spent accounts list*/

SELECT name
FROM ( SELECT a.name AS name,
              SUM(o.total_amt_usd) AS total_spent
       FROM accounts a
       JOIN orders o
       ON o.account_id = a.id
       GROUP BY 1
       ORDER BY 2 DESC
       LIMIT 10 ) t1;

/*
Result:

name
EOG Resources
Mosaic
IBM
General Dynamics
Republic Services
Leucadia National
Arrow Electronics
Sysco
Supervalu
Archer Daniels Midland
*/

/*STEP3: */
/*-------------SOLUTION---------------*/

SELECT a.name AS name, AVG(o.total_amt_usd) AS Avg_total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
WHERE a.name IN ( SELECT name
                  FROM ( SELECT a.name AS name,
                                SUM(o.total_amt_usd) AS total_spent
                         FROM accounts a
                         JOIN orders o
                         ON o.account_id = a.id
                         GROUP BY 1
                         ORDER BY 2 DESC
                         LIMIT 10 ) t1
                )
GROUP BY 1
ORDER BY 2 DESC;

/*
Result:
Output    10 results

name	                         avg_total_spent
EOG Resources	                 6175.3758064516129032
Republic Services	             5877.2228000000000000
IBM	                           5446.9913333333333333
Mosaic	                       5236.6453030303030303
General Dynamics	             4555.9816666666666667
Arrow Electronics	             4194.3038805970149254
Archer Daniels Midland	       4131.4066666666666667
Leucadia National	             4099.2570422535211268
Sysco	                         4096.7005882352941176
Supervalu	                     4048.3573529411764706
*/
