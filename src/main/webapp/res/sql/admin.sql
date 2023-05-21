CREATE TABLE `admin` (
  `adminId` varchar(255) NOT NULL,
  `adminPw` varchar(255) NOT NULL,
  `adminName` varchar(255) NOT NULL,
  `regDate` datetime NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;