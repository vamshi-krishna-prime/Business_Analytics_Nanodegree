/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:

Section 10: Aggregations in Windows


ALL AGGREGATIONS
*/

SELECT id,
       account_id,
       DATE_TRUNC('month', occurred_at) AS month,
       DENSE_RANK() OVER ( PARTITION BY account_id ORDER BY DATE_TRUNC('month', occurred_at)) AS dense_rank,
       SUM(standard_qty) OVER ( PARTITION BY account_id ORDER BY DATE_TRUNC('month', occurred_at)) AS sum_standard_qty,
       COUNT(standard_qty) OVER ( PARTITION BY account_id ORDER BY DATE_TRUNC('month', occurred_at)) AS count_standard_qty,
       AVG(standard_qty) OVER ( PARTITION BY account_id ORDER BY DATE_TRUNC('month', occurred_at)) AS avg_standard_qty,
       MIN(standard_qty) OVER ( PARTITION BY account_id ORDER BY DATE_TRUNC('month', occurred_at)) AS min_standard_qty,
       MAX(standard_qty) OVER ( PARTITION BY account_id ORDER BY DATE_TRUNC('month', occurred_at)) AS max_standard_qty
FROM orders;

/*
Output 6912 results
id	   account_id	  month	                    dense_rank	sum_standard_qty	count_standard_qty	avg_standard_qty	    min_standard_qty	max_standard_qty
1	      1001	      2015-10-01T00:00:00.000Z	1	          123	              1	                  123.0000000000000000	123	              123
4307	  1001	      2015-11-01T00:00:00.000Z	2	          819	              3	                  273.0000000000000000	123	              506
2	      1001	      2015-11-01T00:00:00.000Z	2	          819	              3	                  273.0000000000000000	123	              506
3	      1001	      2015-12-01T00:00:00.000Z	3	          1430	            5	                  286.0000000000000000	85	              526
4308	  1001	      2015-12-01T00:00:00.000Z	3	          1430	            5	                  286.0000000000000000	85	              526
4309	  1001	      2016-01-01T00:00:00.000Z	4	          2140	            7	                  305.7142857142857143	85	              566
4	      1001	      2016-01-01T00:00:00.000Z	4	          2140	            7	                  305.7142857142857143	85	              566
4310	  1001	      2016-02-01T00:00:00.000Z	5	          2721	            9	                  302.3333333333333333	85	              566
5	      1001	      2016-02-01T00:00:00.000Z	5	          2721	            9	                  302.3333333333333333	85	              566
6	      1001	      2016-03-01T00:00:00.000Z	6	          3322	           11	                  302.0000000000000000	85	              566
4311	  1001	      2016-03-01T00:00:00.000Z	6	          3322	           11	                  302.0000000000000000	85	              566
4312	  1001	      2016-04-01T00:00:00.000Z	7	          3920	           13	                  301.5384615384615385	85	              566
*/
