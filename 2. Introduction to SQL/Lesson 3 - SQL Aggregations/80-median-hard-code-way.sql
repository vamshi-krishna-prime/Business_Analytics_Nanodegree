/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

you might be interested in how to calculate the MEDIAN. Though this is more
advanced than what we have covered so far try finding - what is the MEDIAN
total_usd spent on all orders? Note, this is more advanced than the topics we
have covered thus far to build a general solution, but we can hard code a
solution in the following way.
*/


SELECT *
FROM (SELECT total_amt_usd
      FROM orders
      ORDER BY total_amt_usd
      LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;


/*
Since there are 6912 orders - we want the average of the 3457 and 3456 order
amounts when ordered. This is the average of 2483.16 and 2482.55. This gives
the median of 2482.855. This obviously isn't an ideal way to compute. If we
obtain new orders, we would have to change the limit. SQL didn't even calculate
the median for us. The above used a SUBQUERY, but you could use any method to
find the two necessary values, and then you just need the average of them.
*/
