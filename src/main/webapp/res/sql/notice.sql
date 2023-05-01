CREATE TABLE notice (
  num INT PRIMARY KEY AUTO_INCREMENT,
  writer VARCHAR(255),
  title VARCHAR(255),
  content TEXT,
  pw VARCHAR(255),
  regdate DATETIME,
  readcount INT,
  ip VARCHAR(255)
);