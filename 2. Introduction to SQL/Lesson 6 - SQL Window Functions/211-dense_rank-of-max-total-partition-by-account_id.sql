/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:

Section 8: ROW_NUMBER() & RANK()


Question:
Ranking Total Paper Ordered by Account

Select the id, account_id, and total variable from the orders table, then
create a column called total_rank that ranks this total amount of paper
ordered (from highest to lowest) for each account using a partition. Your
final table should have these four columns.
*/

SELECT id,
       account_id,
       total,
       DENSE_RANK() OVER (PARTITION BY account_id ORDER BY total DESC) AS total_rank
FROM orders;

/*
Output6912 results
id	account_id	total	total_rank
4308	1001	1410	1
4309	1001	1405	2
4316	1001	1384	3
4317	1001	1347	4
4314	1001	1343	5
4307	1001	1321	6
4311	1001	1307	7
4310	1001	1280	8
4312	1001	1267	9
4313	1001	1254	10
4315	1001	1238	11
4318	1001	1205	12
14	1001	294	13
8	1001	293	14
2	1001	288	15
16	1001	269	16
7	1001	226	17
15	1001	210	18
12	1001	196	19
4	1001	176	20
6	1001	173	21
1	1001	169	22
5	1001	165	23
13	1001	158	24
10	1001	148	25
11	1001	137	26
3	1001	132	27
9	1001	129	28
17	1011	541	1
23	1021	578	1
21	1021	569	2
19	1021	558	3
18	1021	539	4
22	1021	515	5
20	1021	504	6
4319	1021	347	7
4322	1021	102	8
*/
