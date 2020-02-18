/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

Question 4:
For the customer that spent the most (in total over their lifetime as a
customer) total_amt_usd, how many web_events did they have for each channel?
*/

/*Do check out the solution involving WITH statements in 152, 153 query*/

/*Here, we first want to pull the customer with the most spent in
lifetime value. */

SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY 3 DESC
LIMIT 1;

/*Now, we want to look at the number of events on each channel this company
had, which we can match with just the id. */
/*------------------SOLUTION--------------------*/

SELECT a.name, w.channel, COUNT(*)
FROM accounts a
JOIN web_events w
ON a.id = w.account_id AND a.id =  (SELECT id
                     FROM (SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
                           FROM orders o
                           JOIN accounts a
                           ON a.id = o.account_id
                           GROUP BY a.id, a.name
                           ORDER BY 3 DESC
                           LIMIT 1) inner_table)
GROUP BY 1, 2
ORDER BY 3 DESC;

/*I added an ORDER BY for no real reason, and the account name to assure I
was only pulling from one account. */

/*
Result: 6 results
name	              channel	    count
EOG Resources	      direct	     44
EOG Resources	      organic	     13
EOG Resources	      adwords	     12
EOG Resources	      facebook	   11
EOG Resources	      twitter	      5
EOG Resources	      banner	      4
*/
