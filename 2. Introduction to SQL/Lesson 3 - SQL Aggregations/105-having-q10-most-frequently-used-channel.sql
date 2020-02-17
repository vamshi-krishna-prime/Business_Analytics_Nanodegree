/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Which channel was most frequently used by most accounts?
*/



SELECT a.id id, a.name company, w.channel channel, COUNT(*) use_of_channel
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 10;


/*
Answer:
All of the top 10 are 'direct' channel.
*/
