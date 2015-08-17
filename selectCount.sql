SELECT class_name, COUNT(*) FROM
  (SELECT class_name FROM class,student
  WHERE class.id = student.class_id) s group by s.class_name ;

SELECT class_name, sex, COUNT(*) FROM
  (SELECT class_name, sex FROM class,student
  WHERE class.id = student.class_id) s group by s.class_name, s.sex;
