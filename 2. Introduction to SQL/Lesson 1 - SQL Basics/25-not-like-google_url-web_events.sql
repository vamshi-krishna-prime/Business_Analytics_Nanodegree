/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 1 : SQL Basics

Imagine yourself as the 'Digital Marketing Manager' at 'Parch and Posey'
company. Identify the web traffic that came other than any 'Google' page.
Also display, id, account_id, occurred_at and channel columns in the
'web_events' table.

Hint: links are listed under 'referrer_url' column in the 'web_events' table.
*/


SELECT id, account_id, occurred_at, channel, referrer_url
FROM web_events
WHERE referrer_url NOT LIKE '%google%';
