CREATE TABLE board (
  num INT PRIMARY KEY AUTO_INCREMENT,
  writer VARCHAR(255),
  subject VARCHAR(255),
  content TEXT,
  pw VARCHAR(255),
  regDate DATETIME,
  views INT,
  ref INT,
  re_indent INT,
  re_indent INT,
  ip VARCHAR(255),
  imageFile VARCHAR(255)
);