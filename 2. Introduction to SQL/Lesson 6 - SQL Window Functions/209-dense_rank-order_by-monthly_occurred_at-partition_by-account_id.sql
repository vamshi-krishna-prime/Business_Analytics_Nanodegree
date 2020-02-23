/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:

Section 7: DENSE_RANK()


Question:
create a DENSE_RANK() for rows ordered by truncated occurred_at by month and
partitioned by account_id.
*/

SELECT account_id,
       DATE_PART('year', occurred_at) AS year,
       DATE_PART('month', occurred_at) AS month,
       DENSE_RANK() OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month', occurred_at)) AS dense_rank
FROM orders;

/*
Output 6912 results
account_id	year	month	dense_rank
1001	2015	10	1
1001	2015	11	2
1001	2015	11	2
1001	2015	12	3
1001	2015	12	3
1001	2016	1	4
1001	2016	1	4
1001	2016	2	5
1001	2016	2	5
1001	2016	3	6
1001	2016	3	6
1001	2016	4	7
1001	2016	4	7
1001	2016	5	8
1001	2016	5	8
1001	2016	5	8
1001	2016	5	8
1001	2016	6	9
1001	2016	7	10
1001	2016	7	10
1001	2016	8	11
1001	2016	8	11
1001	2016	9	12
1001	2016	9	12
1001	2016	10	13
1001	2016	11	14
1001	2016	11	14
1001	2016	12	15
1011	2016	12	1
1021	2015	10	1
1021	2015	10	1
1021	2015	11	2
1021	2015	11	2
1021	2015	12	3
1021	2016	1	4
1021	2016	1	4
*/
