/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

WITH Statements:

Question 4:
For the customer that spent the most (in total over their lifetime as a
customer) total_amt_usd, how many web_events did they have for each channel?
*/

/* Same question as 137,138 ; but Query using WITH statement */

/*STEP1: */

WITH customer AS (SELECT a.name AS name,
                         SUM(o.total) AS total_spent
                  FROM orders o
                  JOIN accounts a
                  ON a.id = o.account_id
                  GROUP BY 1
                  ORDER BY 2 DESC
                  LIMIT 1)

SELECT a.name AS name,
       w.channel AS channel,
       COUNT(*) AS num_events
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = (SELECT name
                FROM customer)
GROUP BY 1, 2
ORDER BY 2 DESC;

/*
Result:
name                channel       num_events
EOG Resources       direct          44
EOG Resources       organic         13
EOG Resources       adwords         12
EOG Resources       facebook        11
EOG Resources       twitter          5
EOG Resources       banner           4
*/
