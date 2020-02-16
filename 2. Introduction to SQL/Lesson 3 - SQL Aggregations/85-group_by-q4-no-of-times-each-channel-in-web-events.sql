/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Find the total number of times each type of channel from the web_events was
used. Your final table should have two columns - the channel and the number of
times the channel was used.
*/



SELECT w.channel channel_name, COUNT(*) channel_count
FROM web_events w
GROUP BY w.channel
ORDER BY w.channel;

/*
If NULL values are present in the channel list, they are also displayed along
with the count
*/


SELECT w.channel channel_name, COUNT(w.channel) channel_count
FROM web_events w
GROUP BY w.channel
ORDER BY w.channel;

/*
If above query is used then Null values (null channels) are skipped. So, first
query is more correct compared to second query
*/
