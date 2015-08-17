DROP VIEW show_schedule;

AlTER TABLE student_course DROP FOREIGN KEY FK_Reference_student_course_student;
AlTER TABLE student_course DROP FOREIGN KEY FK_Reference_student_course_course;
AlTER TABLE student DROP FOREIGN KEY FK_Reference_student_class;
AlTER TABLE student DROP FOREIGN KEY FK_Reference_student_schedule;
AlTER TABLE day_course DROP FOREIGN KEY FK_Reference_day_course_schedule;
AlTER TABLE day_course DROP FOREIGN KEY FK_Reference_day_course_day;
AlTER TABLE day_course DROP FOREIGN KEY FK_Reference_day_course_course;

DROP TABLE day_course;

DROP TABLE student_course;

DROP TABLE day;

DROP TABLE course;

DROP TABLE student;

DROP TABLE schedule;

DROP TABLE class;
