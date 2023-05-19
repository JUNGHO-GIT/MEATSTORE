CREATE TABLE cart (
  pro_no INT NOT NULL,
  code VARCHAR(50) NOT NULL,
  name VARCHAR(100) NOT NULL,
  price INT NOT NULL,
  quantity INT NOT NULL,
  image VARCHAR(200) NOT NULL,
  PRIMARY KEY (pro_no)
);