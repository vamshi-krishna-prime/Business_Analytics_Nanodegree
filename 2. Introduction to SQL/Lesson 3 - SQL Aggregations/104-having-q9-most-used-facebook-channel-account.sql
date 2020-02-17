/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Which account used facebook most as a channel?
*/



SELECT a.id id, a.name company, w.channel channel, COUNT(w.channel) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC, id
LIMIT 1;

/*
Answer:
id	   company	         channel	     use_of_channel
1851	 Gilead Sciences	 facebook	     16

Given Solution:
*/

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 1;

/*
Note: This query above (both) only works if there are no ties for the account that
used facebook the most. It is a best practice to use a larger limit number
first such as 3 or 5 to see if there are ties before using LIMIT 1.
*/

/*
Also sometimes facebook might be used by two companies same number of times. So,
do use LIMIT 4 or 5 to check the possibel clash scenario.
*/
