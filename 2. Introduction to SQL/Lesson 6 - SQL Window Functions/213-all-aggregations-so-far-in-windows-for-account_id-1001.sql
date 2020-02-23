/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:

Section 10: Aggregations in Windows


ALL AGGREGATIONS
*/

SELECT id,
       account_id,
       occurred_at,
       DENSE_RANK() OVER ( PARTITION BY account_id ORDER BY DATE_TRUNC('month', occurred_at)) AS dense_rank,
       COUNT(standard_qty) OVER ( PARTITION BY account_id ORDER BY occurred_at) AS count_standard_qty,
       SUM(standard_qty) OVER ( PARTITION BY account_id ORDER BY occurred_at) AS sum_standard_qty,
       AVG(standard_qty) OVER ( PARTITION BY account_id ORDER BY occurred_at) AS avg_standard_qty,
       MIN(standard_qty) OVER ( PARTITION BY account_id ORDER BY occurred_at) AS min_standard_qty,
       MAX(standard_qty) OVER ( PARTITION BY account_id ORDER BY occurred_at) AS max_standard_qty
FROM orders
WHERE account_id = 1001;

/*
Output 28 results

id	account_id	occurred_at	          dense_rank	count_standard_qty	sum_standard_qty	avg_standard_qty	      min_standard_qty	max_standard_qty
1	    1001	2015-10-06T17:31:14.000Z	1	          1	                    123	              123.0000000000000000	123	              123
4307	1001	2015-11-05T03:25:21.000Z	2	          2	                    629	              314.5000000000000000	123	              506
2	    1001	2015-11-05T03:34:33.000Z	2	          3	                    819	              273.0000000000000000	123	              506
4308	1001	2015-12-04T04:01:09.000Z	3	          4	                   1345	              336.2500000000000000	123	              526
3	    1001	2015-12-04T04:21:55.000Z	3	          5	                   1430	              286.0000000000000000	85	              526
4309	1001	2016-01-02T00:59:09.000Z	4	          6	                   1996	              332.6666666666666667	85	              566
4	    1001	2016-01-02T01:18:24.000Z	4	          7	                   2140	              305.7142857142857143	85	              566
4310	1001	2016-02-01T19:07:32.000Z	5	          8	                   2613	              326.6250000000000000	85	              566
5	    1001	2016-02-01T19:27:27.000Z	5 	        9	                   2721	              302.3333333333333333	85	              566
6	    1001	2016-03-02T15:29:32.000Z	6	          10	                 2824	              282.4000000000000000	85	              566
4311	1001	2016-03-02T15:40:29.000Z	6	          11	                 3322	              302.0000000000000000	85	              566
4312	1001	2016-04-01T11:15:27.000Z	7	          12	                 3819	              318.2500000000000000	85	              566
7	    1001	2016-04-01T11:20:18.000Z	7	          13	                 3920	              301.5384615384615385	85	              566
4313	1001	2016-05-01T15:40:04.000Z	8	          14	                 4403	              314.5000000000000000	85	              566
8	    1001	2016-05-01T15:55:51.000Z	8	          15	                 4498	              299.8666666666666667	85	              566
4314	1001	2016-05-31T21:09:48.000Z	8	          16	                 5029	              314.3125000000000000	85	              566
9	    1001	2016-05-31T21:22:48.000Z	8	          17	                 5120	              301.1764705882352941	85	              566
10	  1001	2016-06-30T12:32:05.000Z	9	          18	                 5214	              289.6666666666666667	85	              566
4315	1001	2016-07-30T03:21:57.000Z	10	        19	                 5671	              298.4736842105263158	85	              566
11	  1001	2016-07-30T03:26:30.000Z	10	        20	                 5772	              288.6000000000000000	85	              566
4316	1001	2016-08-28T06:50:58.000Z	11	        21	                 6329	              301.3809523809523810	85	              566
12	  1001	2016-08-28T07:13:39.000Z	11	        22	                 6453	              293.3181818181818182	85	              566
4317	1001	2016-09-26T23:22:47.000Z	12	        23	                 6960	              302.6086956521739130	85	              566
13	  1001	2016-09-26T23:28:25.000Z	12	        24	                 7064	              294.3333333333333333	85	              566
14	  1001	2016-10-26T20:31:30.000Z	13	        25	                 7161	              286.4400000000000000	85	              566
4318	1001	2016-11-25T23:19:37.000Z	14	        26	                 7646	              294.0769230769230769	85	              566
15	  1001	2016-11-25T23:21:32.000Z	14	        27	                 7773	              287.8888888888888889	85	              566
16	  1001	2016-12-24T05:53:13.000Z	15	        28	                 7896	              282.0000000000000000	85	              566
*/
