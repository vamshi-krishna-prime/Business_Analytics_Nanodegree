/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:

Section 7: RANK()


Question:
create a RANK() for rows ordered by truncated occurred_at by month and
partitioned by account_id.
*/

SELECT account_id,
       DATE_PART('year', occurred_at) AS year,
       DATE_PART('month', occurred_at) AS month,
       RANK() OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month', occurred_at)) AS rank
FROM orders;

/*
Output 6912 results
account_id	year	month	rank
1001	2015	10	1
1001	2015	11	2
1001	2015	11	2
1001	2015	12	4
1001	2015	12	4
1001	2016	1	6
1001	2016	1	6
1001	2016	2	8
1001	2016	2	8
1001	2016	3	10
1001	2016	3	10
1001	2016	4	12
1001	2016	4	12
1001	2016	5	14
1001	2016	5	14
1001	2016	5	14
1001	2016	5	14
1001	2016	6	18
1001	2016	7	19
1001	2016	7	19
1001	2016	8	21
1001	2016	8	21
1001	2016	9	23
1001	2016	9	23
1001	2016	10	25
1001	2016	11	26
1001	2016	11	26
1001	2016	12	28
1011	2016	12	1
1021	2015	10	1
1021	2015	10	1
1021	2015	11	3
1021	2015	11	3
1021	2015	12	5
1021	2016	1	6
1021	2016	1	6
1021	2016	2	8
1021	2016	2	8
*/

/*
Notice the ranks are skipped based on repitition (rank 3, 5, .. are skipped)
this can be avoided by using DENSE_RANK() function. You can observe this
in the next query
*/
