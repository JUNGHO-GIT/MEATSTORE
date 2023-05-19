CREATE TABLE orderlist (
  ordno INT PRIMARY KEY AUTO_INCREMENT,
  pro_no INT,
  quantity INT,
  orddate DATETIME,
  state VARCHAR(255),
  id VARCHAR(255),
  FOREIGN KEY (id) REFERENCES member(id)
);