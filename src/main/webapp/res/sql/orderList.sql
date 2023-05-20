CREATE TABLE orderlist (
  ordno INT PRIMARY KEY AUTO_INCREMENT,
  num INT,
  quantity INT,
  orddate DATETIME,
  state VARCHAR(255),
  id VARCHAR(255),
  FOREIGN KEY (id) REFERENCES member(id)
);