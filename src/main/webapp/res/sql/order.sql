CREATE TABLE orderlist (
  ordno INT PRIMARY KEY AUTO_INCREMENT,
  pro_no INT,
  quantity INT,
  orddate DATETIME,
  state VARCHAR(255),
  userid VARCHAR(255),
  FOREIGN KEY (userid) REFERENCES member(id)
);