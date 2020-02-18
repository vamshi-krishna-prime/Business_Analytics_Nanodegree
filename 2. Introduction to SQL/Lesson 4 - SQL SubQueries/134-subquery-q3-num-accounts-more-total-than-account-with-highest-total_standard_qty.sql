/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 4 : SQL SubQueries

Question 3:
How many accounts had more total purchases than the account name which has
bought the most standard_qty paper throughout their lifetime as a customer?
*/

/*Do check out the solution in the next query 135 and 150, 151 */

/* STEP1: Filter the account with most standard_qty purchase through out
the lifetime and display its total purchases over time. */

SELECT o.account_id,
       SUM(o.standard_qty) AS total_standard_qty,
       SUM(o.total) AS total_order_qty
FROM orders o
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

/*Result:
account_id	     total_standard_qty	     total_order_qty
4161	                 41617	                44750
*/

/*STEP2: Extract the value of total_order_qty from the account with highest
total_standard_qty purchase */

SELECT total_order_qty
FROM ( SELECT o.account_id,
              SUM(o.standard_qty) AS total_standard_qty,
              SUM(o.total) AS total_order_qty
       FROM orders o
       GROUP BY 1
       ORDER BY 2 DESC
       LIMIT 1
     ) AS t1;

/*Result: total_order_qty = 44750 */

/*STEP3: Filter the accounts with total_order_qty greaer than the value of
total_order_qty from the account with highest total_standard_qty purchase*/

SELECT o.account_id AS filtered_accounts
FROM orders o
GROUP BY 1
HAVING SUM(o.total) > ( SELECT total_order_qty
                        FROM ( SELECT o.account_id,
                                      SUM(o.standard_qty) AS total_standard_qty,
                                      SUM(o.total) AS total_order_qty
                               FROM orders o
                               GROUP BY 1
                               ORDER BY 2 DESC
                               LIMIT 1
                             ) AS t1
                      );

/*Result:
filtered_accounts
1301
4151
4211
*/

/*STEP4: Count the filtered accounts */

/*------------------------SOLUTION---------------------------*/

SELECT COUNT(*) AS filtered_accounts_count
FROM ( SELECT o.account_id AS filtered_accounts
       FROM orders o
       GROUP BY 1
       HAVING SUM(o.total) > ( SELECT total_order_qty
                               FROM ( SELECT o.account_id,
                                             SUM(o.standard_qty) AS total_standard_qty,
                                             SUM(o.total) AS total_order_qty
                                      FROM orders o
                                      GROUP BY 1
                                      ORDER BY 2 DESC
                                      LIMIT 1
                                    ) t1
                             )
     ) t2;


/*
Result:
filtered_accounts_count
3
*/
