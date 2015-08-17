
DROP PROCEDURE IF EXISTS class_insert;

DELIMITER //

CREATE PROCEDURE class_insert(IN loop_times INT) BEGIN DECLARE i INT DEFAULT 0;

WHILE i < loop_times DO SET i = i + 1;

INSERT INTO class (class_name) VALUES(CONCAT(i ,'班'));

END WHILE;
END//

DELIMITER ;

CALL class_insert(5);



DROP PROCEDURE IF EXISTS schedule_insert;

DELIMITER //

CREATE PROCEDURE schedule_insert(IN loop_times INT) BEGIN DECLARE i INT DEFAULT 0;

WHILE i < loop_times DO SET i = i + 1;

INSERT INTO schedule () VALUES();

END WHILE;
END//

DELIMITER ;

CALL schedule_insert(50);


INSERT INTO day(day_name)VALUES('星期一');
INSERT INTO day(day_name)VALUES('星期二');
INSERT INTO day(day_name)VALUES('星期三');
INSERT INTO day(day_name)VALUES('星期四');
INSERT INTO day(day_name)VALUES('星期五');
INSERT INTO day(day_name)VALUES('星期六');
INSERT INTO day(day_name)VALUES('星期日');



DROP PROCEDURE IF EXISTS course_insert;

DELIMITER //

CREATE PROCEDURE course_insert(IN loop_times INT) BEGIN
DECLARE i INT DEFAULT 0;
DECLARE name VARCHAR(20);
DECLARE hour TIME;

WHILE i < loop_times DO SET i = i + 1;

CASE i%4
WHEN 0 THEN SET hour = '8:00';
WHEN 1 THEN SET hour = '10:00';
WHEN 2 THEN SET hour = '14:00';
WHEN 3 THEN SET hour = '16:00';
END CASE;

CASE FLOOR(i/4)
WHEN 0 THEN SET name = '高等数学';
WHEN 1 THEN SET name = '数据结构';
WHEN 2 THEN SET name = '大学物理';
WHEN 3 THEN SET name = '大学英语';
WHEN 4 THEN SET name = '模拟电路';
WHEN 5 THEN SET name = '数字电路';
WHEN 6 THEN SET name = '传感器';
WHEN 7 THEN SET name = '单片机';
WHEN 8 THEN SET name = '数字信号处理';
WHEN 9 THEN SET name = '形势政策';
WHEN 10 THEN SET name = '微机原理';
WHEN 11 THEN SET name = '线性代数';
WHEN 12 THEN SET name = '概率论';
ELSE SET name = 'C语言';
END CASE;

INSERT INTO course (course_name, course_time) VALUES(name, hour);

END WHILE;
END//

DELIMITER ;

CALL course_insert(50);



DROP PROCEDURE IF EXISTS student_insert;

DELIMITER //

CREATE PROCEDURE student_insert(IN loop_times INT) BEGIN DECLARE i INT DEFAULT 0;
DECLARE stuSex VARCHAR(2);

WHILE i < loop_times DO SET i = i + 1;

IF i%2 > 0 THEN SET stuSex = '男';
ELSE SET stuSex = '女';
END IF;

INSERT INTO student (name, sex, class_id, schedule_id) VALUES(CONCAT('学生', i), stuSex, i%5+1, i);

END WHILE;
END//

DELIMITER ;

CALL student_insert(50);



DROP PROCEDURE IF EXISTS student_course_insert;

DELIMITER //

CREATE PROCEDURE student_course_insert(IN loop_times INT) BEGIN
DECLARE i INT DEFAULT 0;
DECLARE studentId INT ;
DECLARE courseId INT ;

WHILE i < loop_times DO SET i = i + 1;
SET studentId = Rand()*loop_times;
SET courseId = Rand()*loop_times;

IF studentId < 1
THEN SET studentId = 1;
END IF;

IF courseId < 1
THEN SET courseId = 1;
END IF;

INSERT INTO student_course (student_id, course_id) VALUES(studentId, courseId);

END WHILE;
END//

DELIMITER ;

CALL student_course_insert(50);



DROP PROCEDURE IF EXISTS day_course_insert;

DELIMITER //

CREATE PROCEDURE day_course_insert(IN loop_times INT) BEGIN DECLARE i INT DEFAULT 0;

WHILE i < loop_times DO SET i = i + 1;

INSERT INTO day_course (schedule_id, day_id, course_id) VALUES(i, i%7+1, loop_times-i+1);

END WHILE;
END//

DELIMITER ;

CALL day_course_insert(50);
