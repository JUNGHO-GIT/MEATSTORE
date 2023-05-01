CREATE TABLE member (
  id VARCHAR(255) PRIMARY KEY,
  pw VARCHAR(255),
  name VARCHAR(255),
  email VARCHAR(255),
  tel VARCHAR(255),
  zipcode VARCHAR(255),
  addr VARCHAR(255),
  addr2 VARCHAR(255),
  regdate DATETIME,
  adminid VARCHAR(255),
  adminpw VARCHAR(255)
);