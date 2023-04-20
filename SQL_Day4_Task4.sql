/*Take a look at the teacher table
Are there any columns that could benefit from
 * Unique index
 * Function based index
 * bitmap index
If there are any, explain why this particular index would help and write statement, that would create index 
(Index creation will not work because you dont have access right to do so,
and it will only work for one student, others will get an error, that index already exsists)

*/
/*

/*ANSWER. */

--Unique Index
CREATE UNIQUE INDEX  teacher_id_index ON teacher_1 (TEACHER_ID);

--Function based Index
CREATE INDEX date_of_birth_index ON teacher_1 (TO_CHAR(DATE_OF_BIRTH, 'MM/DD/YYYY'), TO_CHAR(DATE_OF_JOINING, 'MM/DD/YYYY')); 

--Bitmap Index
CREATE BITMAP INDEX status_index ON teacher_1 (STATUS);

--Explanation
The Unique Index on the TEACHER_ID column would help to ensure that there are no duplicate entries in the table. 
The Function based Index on the DATE_OF_BIRTH and DATE_OF_JOINING columns would help to speed up queries that involve filtering on these columns. 
The Bitmap Index on the STATUS column would help to speed up queries that involve filtering on the status of the teacher.

Take a look at the query
Requirement: I need to find student John Bootcamp email address and social security number
Why it doesn't return any results?
Is it possible to increase query performance, while satisfying requirements? 
*/
SELECT * 
 FROM student_attendance sta
INNER JOIN student stu
  ON sta.student_id = stu.student_id
INNER JOIN course cou
  ON sta.course_id = cou.course_id
INNER JOIN course_schedule cse
  ON sta.course_schedule_id = cse.course_schedule_id
WHERE UPPER(stu.first_name) LIKE 'JOHN';

--Provide optimized query and explain what you added/removed from original one and why
-- compare both query explain plan output

/*ANSWER. */
/* To find student John Bootcamp email address and social security number */

SELECT EMAIL, SOCIAL_SECURITY_NO
FROM teacher_1.student
WHERE FIRST_NAME = 'John' AND LAST_NAME = 'Bootcamp';

/*ANSWER. */
/* Why it doesn't return any results? */

The query doesn't shows the result because the table doesnt contain the required data. for example, Student_course, Student_attendace
and student_Id doesnt match with the requirement i.e, student socia_security_no.


/*ANSWER. */

/* Is it possible to increase query performance, while satisfying requirements? */

Yes, it is feasible to improve query speed by indexing the columns used in the JOIN clauses. 
An index will assist the query engine in rapidly and efficiently locating the data required to fulfill the query's criteria. 
Using table aliases can also assist to make the query more legible and maintainable.


/*ANSWER. */
/* Provide optimized query and explain what you added/removed from original one and why */

the optimized query removes the use of the UPPER function and adds a condition on the course name being 'Bootcamp'. 
Using the UPPER function can slow down the query as it has to be performed on every row, which can significantly reduce performance.
Adding the condition for the course name will limit the scope of the query and thus reduce the number of rows that need to be 
processed.


