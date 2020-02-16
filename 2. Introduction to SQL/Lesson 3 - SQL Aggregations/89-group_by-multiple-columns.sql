/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 3 : SQL Aggregations

Find number of web events occurred, grouped by account id and channel
*/



SELECT account_id, channel, COUNT(id) events
FROM web_events
GROUP BY account_id, channel
ORDER BY account_id, channel;

/*
GROUP BY - Expert Tips

1. The order of column names in your GROUP BY clause doesn’t matter—the results
will be the same regardless. If we run the same query and reverse the order in
the GROUP BY clause, you can see we get the same results.

2. As with ORDER BY, you can substitute numbers for column names in the
GROUP BY clause. It’s generally recommended to do this only when you’re
grouping many columns, or if something else is causing the text in the
GROUP BY clause to be excessively long.

3. A reminder here that any column that is not within an aggregation must
show up in your GROUP BY statement. If you forget, you will likely get an
error. However, in the off chance that your query does work, you might not
like the results!
*/
