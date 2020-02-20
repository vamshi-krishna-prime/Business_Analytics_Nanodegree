/*
SQL practice in Udacity's Business Analytics Nanodegree Program
SQL > Lesson 5 > SQL - Data cleaning

LEFT & RIGHT Quizzes

Question 2:
There is much debate about how much the name (or even the first letter of a
company name) matters. Use the accounts table to pull the first letter of each
company name to see the distribution of company names that begin with each
letter (or number).
*/

SELECT LEFT(UPPER(name), 1) AS first_letter, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC, 1;

/*
26 Results:
first_letter	num_companies
A	37
C	37
P	27
M	22
D	17
S	17
T	17
B	16
E	16
L	16
H	15
N	15
G	14
U	13
F	12
W	12
R	8
I	7
J	7
K	7
O	7
V	7
X	2
3	1
Q	1
Y	1
*/
