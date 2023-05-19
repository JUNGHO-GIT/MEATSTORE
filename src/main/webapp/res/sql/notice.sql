CREATE TABLE notice (
  num INT PRIMARY KEY AUTO_INCREMENT,
  writer VARCHAR(255),
  subject VARCHAR(255),
  content TEXT,
  pw VARCHAR(255),
  regdate DATETIME,
  views INT,
  ip VARCHAR(255)
);