
-- SELECT TEACHER_ID, COUNT(*) AS ASSIGMENT_COUNT
-- FROM ASSIGNMENTS
-- WHERE TEACHER_ID IS NOT NULL
-- AND STATE = 'GRADED'
-- ORDER BY ASSIGMENT_COUNT DESC

WITH GradedAssignments AS (
    SELECT teacher_id, COUNT(*) AS graded_count
    FROM assignments
    WHERE state = 'GRADED'
    GROUP BY teacher_id
),
MaxGradedTeacher AS (
    SELECT teacher_id
    FROM GradedAssignments
    ORDER BY graded_count DESC
    LIMIT 1
)
SELECT COUNT(*) AS grade_a_count
FROM assignments
WHERE teacher_id = (SELECT teacher_id FROM MaxGradedTeacher)
AND state = 'GRADED'
AND grade = 'A';
