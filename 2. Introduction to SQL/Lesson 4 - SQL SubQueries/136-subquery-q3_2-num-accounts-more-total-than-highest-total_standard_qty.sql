/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

Question 3:
How many accounts had more total purchases than total standard_qty paper of an
account throughout their lifetime as a customer?

Here total > highest_standard_qty of an account
*/

/*STEP1: List accounts with highest total standard qty purchases*/

SELECT o.account_id, SUM(o.standard_qty) AS total_standard_qty
FROM orders o
GROUP BY 1
ORDER BY 2 DESC;


/*STEP2: Extract the highest for the total standard qty purchase*/

SELECT MAX(total_standard_qty)
FROM ( SELECT o.account_id,
              SUM(o.standard_qty) AS total_standard_qty
       FROM orders o
       GROUP BY 1
       ORDER BY 2 DESC ) t1;

/*RESULT: 41617 */


/*STEP 3: Filter accounts with more total_qty than highest total_standard_qty*/

SELECT o.account_id AS filtered_accounts
FROM orders o
GROUP BY o.account_id
HAVING SUM(o.total) >  ( SELECT MAX(total_standard_qty)
                         FROM ( SELECT o.account_id,
                                       SUM(o.standard_qty) AS total_standard_qty
                                       FROM orders o
                                       GROUP BY 1
                                       ORDER BY 2 DESC ) t1
                        );

/*
Result:
account_id
1301
1871
4151
3411
4211
4161
*/


/*STEP4: ---------SOLUTION-----------------*/

SELECT COUNT(filtered_accounts) AS num_accounts
FROM ( SELECT o.account_id AS filtered_accounts
       FROM orders o
       GROUP BY o.account_id
       HAVING SUM(o.total) >  ( SELECT MAX(total_standard_qty)
                                FROM ( SELECT o.account_id,
                                              SUM(o.standard_qty) AS total_standard_qty
                                       FROM orders o
                                       GROUP BY 1
                                       ORDER BY 2 DESC ) t1
                              )
     ) t2

/*
Result: num_accounts    6
*/
