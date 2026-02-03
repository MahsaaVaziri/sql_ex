-- Write a query that finds students who do not take CS180.

SELECT s.student_no,student_name,e.course_no,course_title 
FROM students s,student_enrollment e, courses c
where s.student_no = e.student_no
AND e.course_no = c.course_no
AND e.course_no != 'CS180'

-- Write a query to find students who take CS110 or CS107 but not both.

SELECT s.student_no,student_name,e.course_no,course_title 
FROM students s,student_enrollment e, courses c
where s.student_no = e.student_no
AND e.course_no = c.course_no
AND e.course_no IN ('CS107','CS110')

-- Write a query to find students who take CS220 and no other courses.

SELECT s.student_no,student_name,e.course_no,course_title 
FROM students s,student_enrollment e, courses c
where s.student_no = e.student_no
AND e.course_no = c.course_no
AND e.course_no = 'CS220'

-- Write a query that finds those students who take at 
-- most 2 courses. Your query should exclude students that 
-- don't take any courses as well as those that take more 
-- than 2 course.

SELECT s.student_no, s.student_name, s.age

FROM students s, student_enrollment se

WHERE s.student_no = se.student_no

GROUP BY s.student_no, s.student_name, s.age

HAVING COUNT(*) <= 2
-- Write a query to find students who are older than at most two other students.
SELECT s1.*

FROM students s1

WHERE 2 >= (SELECT count(*)

                FROM students s2

                WHERE s2.age < s1.age)
