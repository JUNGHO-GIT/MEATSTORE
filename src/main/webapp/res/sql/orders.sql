CREATE TABLE `orders` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(100) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `imageFile` varchar(100) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;