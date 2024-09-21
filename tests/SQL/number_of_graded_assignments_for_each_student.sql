-- Write query to get number of graded assignments for each student:
SELECT ID, COUNT(*)
FROM ASSIGNMENTS
WHERE ID = 1
AND STATE = 'GRADED'