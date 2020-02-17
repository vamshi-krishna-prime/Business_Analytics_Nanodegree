/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Which month did Parch & Posey have the greatest sales in terms of total dollars?
Are all months evenly represented by the dataset?
*/



SELECT DATE_PART('month', o.occurred_at) AS month, SUM(o.total_amt_usd) AS total_usd_spent
FROM orders o
GROUP BY 1
ORDER BY 2 DESC;

/*
Result:
month 	total_usd_spent
12	    3129411.98
10	    2427505.97
11	    2390033.75
9	      2017216.88
7	      1978731.15
8	      1918107.22
6	      1871118.52
3	      1659987.88
4	      1562037.74
5	      1537082.23
1	      1337661.87
2	      1312616.64
*/


/*
If we look further at the monthly data, we see that for 2013 and 2017 there is
only one month of sales for each of these years (12 for 2013 and 1 for 2017).
Therefore, neither of these are evenly represented. In order for this to be
'fair', we should remove the sales from 2013 and 2017. For the same reasons as
discussed above.

Solution:
*/

SELECT DATE_PART('month', o.occurred_at) AS month, SUM(o.total_amt_usd) AS total_usd_spent
FROM orders o
WHERE o.occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC;

/*
Result:
month	  total_usd_spent
12	      2752080.98
10	      2427505.97
11	      2390033.75
9	        2017216.88
7	        1978731.15
8	        1918107.22
6	        1871118.52
3	        1659987.88
4	        1562037.74
5	        1537082.23
2	        1312616.64
1	        1259510.44
*/
