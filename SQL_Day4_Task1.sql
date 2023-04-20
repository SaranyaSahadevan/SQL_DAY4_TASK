/* To display list of students and their average test grade, show their rank based on average grade

Best student should be at the top of the list using one of the RANK functions*/

SELECT
    first_name,
    last_name,
    AVG(test_grade) AS average_grade,
    RANK()
    OVER(
        ORDER BY
            AVG(test_grade) DESC
    )               AS grade_ranking
FROM
    teacher_1.student
    LEFT JOIN teacher_1.student_grade ON teacher_1.student.student_id = teacher_1.student_grade.student_id
GROUP BY
    first_name,
    last_name
ORDER BY
    grade_ranking ASC;