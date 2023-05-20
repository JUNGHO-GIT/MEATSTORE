CREATE TABLE product (
  num INT PRIMARY KEY AUTO_INCREMENT,
  code VARCHAR(255),
  name VARCHAR(255),
  price INT,
  stock INT,
  detail TEXT,
  comp VARCHAR(255),
  regDate DATETIME,
  image VARCHAR(255)
);