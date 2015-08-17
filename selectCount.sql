SELECT class_name, COUNT(*) FROM
  (SELECT class_name FROM (SELECT * FROM class LIMIT 20, 10) c,student
  WHERE c.id = student.class_id) s group by s.class_name ;
