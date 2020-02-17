/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Which accounts used facebook as a channel to contact customers more
than 6 times?
*/



SELECT a.id id, a.name company, w.channel channel, COUNT(*) contacts
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6
ORDER BY contants DESC, a.id;


/*
Answer:
 46 results
*/

/*
Important Note:
'w.channel' must be in 'GROUP BY' even though it is used in the 'WHERE' clause

Given Solution:
*/

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY use_of_channel;
