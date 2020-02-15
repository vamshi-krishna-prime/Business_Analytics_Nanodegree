/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 2 : SQL Joins

Make a LEFT JOIN to the 'Country' and 'State' table provided in the
SQL section, lesson 2, section 17.
Display 'countryid', 'countryName' and 'stateName'
*/



SEELECT c.countryid, c.countryName, s.stateName
FROM Country c
LEFT JOIN State s
ON c.countryid = s.countryid;
