/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 7 : SQL Advanced JOINs

Advanced JOINs:

Section 2: Types of JOINs

INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN
*/

/*
Venn diagrams, which are helpful for visualizing table joins, are provided
in the notes along with sample queries. Consider the circle on the left Table A
and the circle on the right Table B.
*/

/*-------------INNER JOIN--------------*/
SELECT column_name(s)
FROM Table_A
INNER JOIN Table_B ON Table_A.column_name = Table_B.column_name;



/*-------------LEFT JOIN--------------*/
SELECT column_name(s)
FROM Table_A
LEFT JOIN Table_B ON Table_A.column_name = Table_B.column_name;



/*-------------RIGHT JOIN--------------*/
SELECT column_name(s)
FROM Table_A
RIGHT JOIN Table_B ON Table_A.column_name = Table_B.column_name;



/*-----------FULL OUTER JOIN-----------*/
SELECT column_name(s)
FROM Table_A
FULL OUTER JOIN Table_B ON Table_A.column_name = Table_B.column_name;



/*---------(Full OUTER JOIN - INNER JOIN)---------*/
SELECT column_name(s)
FROM Table_A
FULL OUTER JOIN Table_B ON Table_A.column_name = Table_B.column_name;
WHERE Table_A.column_name IS NULL OR Table_B.column_name IS NULL
/*
The alternative is to use a
LEFT JOIN (with right side IS NULL) and a
RIGHT JOIN (with left side IS NULL) and do a UNION - sometimes this approach
is better because you can customize each individual join more obviously
(and add a derived column to indicate which side is found or whether it's
found in both and which one is going to win).
*/
