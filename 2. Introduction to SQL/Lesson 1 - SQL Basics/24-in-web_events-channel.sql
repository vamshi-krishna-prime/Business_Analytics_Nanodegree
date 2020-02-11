/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Use the 'web_events' table to find all information regarding individuals who
were contacted via the 'channel' of 'organic' or 'adwords'.
Also order the result to displayig 'adwords' first.
*/


SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords')
ORDER BY channel;
