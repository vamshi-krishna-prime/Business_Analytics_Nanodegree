/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 7 : SQL Performance Tuning

Advanced JOINs:

Section 17: Performance Tunning - EXPLAIN
*/

EXPLAIN
SELECT a.name,
       COUNT(*) AS web_events
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC;

/*
QUERY PLAN
Sort (cost=351.10..351.97 rows=351 width=22)
Sort Key: (count(*)) DESC
-> HashAggregate (cost=332.75..336.26 rows=351 width=22)
Group Key: a.name
-> Hash Join (cost=12.90..287.38 rows=9073 width=14)
Hash Cond: (w.account_id = a.id)
-> Seq Scan on web_events w (cost=0.00..149.73 rows=9073 width=4)
-> Hash (cost=8.51..8.51 rows=351 width=18)
-> Seq Scan on accounts a (cost=0.00..8.51 rows=351 width=18)
*/

/*
The above query plan is executed from bottom to top. That is 'Seq Scan on
accounts' is executed before 'Seq Scan on web_events'.

The first line (last step of plan, as it is listed from bottom to top), denotes
the time taken for execution and resulting table size. Observe the time cost.
*/

/* --------------Performance Tuned-------------*/

EXPLAIN
WITH web_events_count AS (
  SELECT account_id,
         COUNT(*) AS web_events
  FROM web_events w
  GROUP BY 1
)

SELECT a.id,
       w.web_events
FROM accounts a
JOIN web_events_count w
ON a.id = w.account_id
ORDER BY 2 DESC;

/*
QUERY PLAN
Sort (cost=238.19..239.07 rows=351 width=12)
Sort Key: w.web_events DESC
CTE web_events_count
-> HashAggregate (cost=195.10..198.61 rows=351 width=12)
Group Key: w_1.account_id
-> Seq Scan on web_events w_1 (cost=0.00..149.73 rows=9073 width=4)
-> Hash Join (cost=12.90..24.74 rows=351 width=12)
Hash Cond: (w.account_id = a.id)
-> CTE Scan on web_events_count w (cost=0.00..7.02 rows=351 width=12)
-> Hash (cost=8.51..8.51 rows=351 width=4)
-> Seq Scan on accounts a (cost=0.00..8.51 rows=351 width=4)
*/

/* Observe that the time cost is reduced by little. If working with huge
dataset, performance tunning has a huge impact on time cost (significantly
reduced)*/
