SELECT * FROM student LIMIT 20, 10;

SELECT * FROM class;

SELECT * FROM course LIMIT 20, 10;

SELECT * FROM day_course LIMIT 20, 10;

SELECT * FROM schedule LIMIT 20, 10;

SELECT * FROM student_course LIMIT 20, 10;


SELECT name, course_name, course_time FROM (SELECT course_id , name FROM
  (SELECT id, name FROM student LIMIT 20, 10) s , student_course
 WHERE s.id = student_course.student_id) sc, course WHERE course.id = sc.course_id;



select * from show_schedule ORDER BY name;
