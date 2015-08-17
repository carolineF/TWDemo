CREATE TABLE day(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  dayName VARCHAR(6) NOT NULL
);

CREATE TABLE course(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  courseName VARCHAR(20) NOT NULL,
  courseTime TIME
);

CREATE TABLE schedule(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE student(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(10) NOT NULL,
  sex VARCHAR(2) DEFAULT '男',
  classId INT,
  scheduleId INT
);

CREATE TABLE class(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  className VARCHAR(20)
);

CREATE TABLE studentCourse(
  studentId INT,
  courseId INT
);

CREATE TABLE dayCourse(
  scheduleId INT,
  dayId INT,
  courseId INT
);


ALTER TABLE studentCourse ADD CONSTRAINT FK_Reference_1 FOREIGN KEY (studentId)
  REFERENCES student (id) ON DELETE restrict ON UPDATE restrict;

ALTER TABLE studentCourse ADD CONSTRAINT FK_Reference_2 FOREIGN KEY (courseId)
  REFERENCES course (id) ON DELETE restrict ON UPDATE restrict;

ALTER TABLE student ADD CONSTRAINT FK_Reference_3 FOREIGN KEY (classId)
  REFERENCES class (id) ON DELETE restrict ON UPDATE restrict;

ALTER TABLE student ADD CONSTRAINT FK_Reference_4 FOREIGN KEY (scheduleId)
  REFERENCES schedule (id) ON DELETE restrict ON UPDATE restrict;

ALTER TABLE dayCourse ADD CONSTRAINT FK_Reference_5 FOREIGN KEY (scheduleId)
  REFERENCES schedule (id) ON DELETE restrict ON UPDATE restrict;

ALTER TABLE dayCourse ADD CONSTRAINT FK_Reference_6 FOREIGN KEY (dayId)
  REFERENCES day (id) ON DELETE restrict ON UPDATE restrict;

ALTER TABLE dayCourse ADD CONSTRAINT FK_Reference_7 FOREIGN KEY (courseId)
  REFERENCES course (id) ON DELETE restrict ON UPDATE restrict;
