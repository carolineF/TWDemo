 DELETE expect FROM student expect INNER JOIN (SELECT * FROM student LIMIT 30,10)
  result on expect.id = result.id;
