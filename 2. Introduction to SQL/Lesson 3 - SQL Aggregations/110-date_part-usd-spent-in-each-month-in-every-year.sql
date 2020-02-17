/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

List the usd spent in each month in every individual year
*/



SELECT DATE_PART('year', o.occurred_at) AS year, DATE_PART('month', o.occurred_at) AS month, SUM(o.total_amt_usd) AS total_usd_spent
FROM orders o
GROUP BY 1, 2
ORDER BY 1, 2;

/*
Result:
year	month	 total_usd_spent
2013	12	     377331.00
2014	1	       286140.27
2014	2	       349721.34
2014	3	       341512.32
2014	4	       344893.99
2014	5	       319210.40
2014	6	       297655.65
2014	7	       289128.19
2014	8	       366685.41
2014	9	       299968.38
2014	10	     495333.59
2014	11	     311893.88
2014	12	     366963.12
2015	1	       347804.30
2015	2	       333688.01
2015	3	       519403.40
2015	4	       451753.57
2015	5	       390830.84
2015	6	       420906.13
2015	7	       461895.49
2015	8	       463754.33
2015	9	       510848.57
2015	10     	 554190.81
2015	11	     682094.25
2015	12	     614835.24
2016	1	       625565.87
2016	2	       629207.29
2016	3	       799072.16
2016	4	       765390.18
2016	5	       827040.99
2016	6	       1152556.74
2016	7	       1227707.47
2016	8	       1087667.48
2016	9	       1206399.93
2016	10	     1377981.57
2016	11	     1396045.62
2016	12	     1770282.62
2017	1	       78151.43
*/
