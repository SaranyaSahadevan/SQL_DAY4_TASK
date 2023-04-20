/* To display a list of students and their grades.

In list, add field that would indicate that the test grade is bad when grade <4,

average if the grade is between 5 and 7, and if grade higher than that, then the grade is great. */

SELECT
    first_name,
    last_name,
    test_grade,
    CASE
        WHEN test_grade < 4             THEN
            'Bad'
        WHEN test_grade BETWEEN 5 AND 7 THEN
            'Average'
        ELSE
            'Great'
    END AS grade
FROM
         teacher_1.student s
    INNER JOIN teacher_1.student_grade g ON s.student_id = g.student_id;