/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

Question 3:
How many accounts had more total purchases than the account name which has
bought the most standard_qty paper throughout their lifetime as a customer?
*/

/*Do check out the solution involving WITH statements in 150, 151 query*/

/* First, we want to find the account that had the most standard_qty paper.
The query here pulls that account, as well as the total amount: */

SELECT a.name account_name, SUM(o.standard_qty) total_std, SUM(o.total) total
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

/* Now, I want to use this to pull all the accounts with more total sales: */

SELECT a.name
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY 1
HAVING SUM(o.total) > (SELECT total
                      FROM (SELECT a.name act_name,
                                   SUM(o.standard_qty) tot_std,
                                   SUM(o.total) total
                            FROM accounts a
                            JOIN orders o
                            ON o.account_id = a.id
                            GROUP BY 1
                            ORDER BY 2 DESC
                            LIMIT 1) sub);

/* This is now a list of all the accounts with more total orders. We can
get the count with just another simple subquery. */

SELECT COUNT(*)
FROM (SELECT a.name
       FROM orders o
       JOIN accounts a
       ON a.id = o.account_id
       GROUP BY 1
       HAVING SUM(o.total) > (SELECT total
                              FROM (SELECT a.name act_name,
                                           SUM(o.standard_qty) tot_std,
                                           SUM(o.total) total
                                    FROM accounts a
                                    JOIN orders o
                                    ON o.account_id = a.id
                                    GROUP BY 1
                                    ORDER BY 2 DESC
                                    LIMIT 1) inner_tab)
     ) counter_tab;

/*
Result: count 3
*/
