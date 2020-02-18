/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

Question 4:
For the customer that spent the most (in total over their lifetime as a
customer) total_amt_usd, how many web_events did they have for each channel?
*/

/*Do check the alternate solution/approach in the next query 138 and 152, 153 */

/*STEP1: Display the most spent customer list */

SELECT a.name AS company, SUM(o.total_amt_usd) AS total_spent
FROM orders o
JOIN accounts a
ON o.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC;

/*STEP2: Extract the highest spent customer name */

SELECT company
FROM ( SELECT a.name AS company, SUM(o.total_amt_usd) AS total_spent
       FROM orders o
       JOIN accounts a
       ON o.account_id = a.id
       GROUP BY 1
       ORDER BY 2 DESC ) t1
LIMIT 1;

/*Result:
company
EOG Resources
*/

/*STEP3: Find the count of web_events in each channel related to the most
spent customer */
/*-----------------SOLUTION---------------*/

SELECT a.name AS name,
       w.channel AS channel,
       COUNT(*) AS events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE a.name = ( SELECT company
                 FROM ( SELECT a.name AS company,
                               SUM(o.total_amt_usd) AS total_spent
                        FROM orders o
                        JOIN accounts a
                        ON o.account_id = a.id
                        GROUP BY 1
                        ORDER BY 2 DESC ) t1
                 LIMIT 1
               )
GROUP BY 1, 2
ORDER BY 1, 2;

/*
Result: 6 results
name	            channel	    events
EOG Resources	    adwords	      12
EOG Resources	    banner	       4
EOG Resources	    direct	      44
EOG Resources	    facebook	    11
EOG Resources	    organic	      13
EOG Resources	    twitter	       5
*/
