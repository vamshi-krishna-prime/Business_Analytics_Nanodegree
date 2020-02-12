/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Use the web_events table to find all information regarding individuals who
were contacted via the organic or adwords channels, and started their account
at any point in 2016, sorted from newest to oldest.
*/


SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;


/*
You will notice that using BETWEEN is tricky for dates! While BETWEEN is
generally inclusive of endpoints, it assumes the time is at 00:00:00
(i.e. midnight) for dates. This is the reason why we set the right-side
endpoint of the period at '2017-01-01'.
*/
