CREATE TABLE IF NOT EXISTS day(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  day_name VARCHAR(6) NOT NULL
);

CREATE TABLE IF NOT EXISTS course(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  course_name VARCHAR(20) NOT NULL,
  course_time TIME
);

CREATE TABLE IF NOT EXISTS schedule(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE IF NOT EXISTS student(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(10) NOT NULL,
  sex VARCHAR(2) DEFAULT '男',
  class_id INT,
  schedule_id INT
);

CREATE TABLE IF NOT EXISTS class(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  class_name VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS student_course(
  student_id INT,
  course_id INT
);

CREATE TABLE IF NOT EXISTS day_course(
  schedule_id INT,
  day_id INT,
  course_id INT
);


ALTER TABLE student_course ADD CONSTRAINT FK_Reference_student_course_student FOREIGN KEY (student_id)
  REFERENCES student (id) ON DELETE restrict ON UPDATE restrict;

ALTER TABLE student_course ADD CONSTRAINT FK_Reference_student_course_course FOREIGN KEY (course_id)
  REFERENCES course (id) ON DELETE restrict ON UPDATE restrict;

ALTER TABLE student ADD CONSTRAINT FK_Reference_student_class FOREIGN KEY (class_id)
  REFERENCES class (id) ON DELETE restrict ON UPDATE restrict;

ALTER TABLE student ADD CONSTRAINT FK_Reference_student_schedule FOREIGN KEY (schedule_id)
  REFERENCES schedule (id) ON DELETE restrict ON UPDATE restrict;

ALTER TABLE day_course ADD CONSTRAINT FK_Reference_day_course_schedule FOREIGN KEY (schedule_id)
  REFERENCES schedule (id) ON DELETE restrict ON UPDATE restrict;

ALTER TABLE day_course ADD CONSTRAINT FK_Reference_day_course_day FOREIGN KEY (day_id)
  REFERENCES day (id) ON DELETE restrict ON UPDATE restrict;

ALTER TABLE day_course ADD CONSTRAINT FK_Reference_day_course_course FOREIGN KEY (course_id)
  REFERENCES course (id) ON DELETE restrict ON UPDATE restrict;
