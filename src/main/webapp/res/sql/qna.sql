CREATE TABLE `qna` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `writer` varchar(255) NOT NULL,
  `pw` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `ref` int(11) NOT NULL DEFAULT '1',
  `re_step` int(11) NOT NULL DEFAULT '0',
  `re_indent` int(11) NOT NULL DEFAULT '0',
  `regDate` datetime NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;