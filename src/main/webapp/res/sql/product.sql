CREATE TABLE `product` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `content` text NOT NULL,
  `comp` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `ref` int(11) NOT NULL DEFAULT '1',
  `re_step` int(11) NOT NULL DEFAULT '0',
  `re_indent` int(11) NOT NULL DEFAULT '0',
  `imageFile` varchar(255) NOT NULL,
  `regDate` datetime NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;