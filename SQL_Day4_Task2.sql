/* To show a list of teacher and their degrees in full degree name */
SELECT
    first_name,
    last_name,
    CASE
        WHEN education = 'Bsc'    THEN
            'Bachelor'
        WHEN education = 'M'      THEN
            'Master'
        WHEN education = 'Phd'    THEN
            'PhD'
        WHEN education = '(null)' THEN
            '(null)'
    END AS "Degree Name"
FROM
    teacher_1.teacher