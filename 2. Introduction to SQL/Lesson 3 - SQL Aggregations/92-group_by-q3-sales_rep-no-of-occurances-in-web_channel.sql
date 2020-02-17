/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Determine the number of times a particular channel was used in the web_events
table for each sales rep. Your final table should have three columns - the name
of the sales rep, the channel, and the number of occurrences. Order your table
with the highest number of occurrences first.
*/



SELECT s.name sales_rep, w.channel channel, COUNT(w.channel) num_events
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
JOIN sales_rep s
ON s.id = a.sales_rep_id
GROUP BY sales_rep, channel
ORDER BY num_events DESC;
