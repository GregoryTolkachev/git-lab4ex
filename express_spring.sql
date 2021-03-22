-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.14-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for express_spring
CREATE DATABASE IF NOT EXISTS `express_spring` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `express_spring`;

-- Dumping structure for table express_spring.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table express_spring.accounts: ~1 rows (approximately)
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`id`, `username`, `password`, `email`) VALUES
	(1, 'test', 'test', 'test@test.com');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;

-- Dumping structure for table express_spring.blog
CREATE TABLE IF NOT EXISTS `blog` (
  `blogId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '0',
  `userId` int(11) unsigned NOT NULL DEFAULT 0,
  `content` text NOT NULL,
  `dateAdded` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`blogId`),
  KEY `FK_blog_user` (`userId`),
  CONSTRAINT `FK_blog_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table express_spring.blog: ~2 rows (approximately)
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` (`blogId`, `title`, `userId`, `content`, `dateAdded`) VALUES
	(1, 'test 1', 8, '<strong>test</strong', '2021-03-15 11:38:04'),
	(2, 'test 2', 1, 'test', '2021-03-15 11:38:21');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;

-- Dumping structure for table express_spring.image
CREATE TABLE IF NOT EXISTS `image` (
  `imageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imageFile` varchar(40) NOT NULL,
  `description` text NOT NULL,
  `dateModified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`imageID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table express_spring.image: ~6 rows (approximately)
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` (`imageID`, `imageFile`, `description`, `dateModified`) VALUES
	(1, 'e0a08901ae798ec6a1ecdbf46ab046f3.jpg', 'A frog on a leaf!', '2021-02-25 09:52:13'),
	(2, 'd07139ee166aaa9e33175280d305ba3f.jpg', '', '2021-02-25 09:59:49'),
	(3, '55b5f5487b7f37b6d3d431fc8d8a9d5a.jpg', '', '2021-02-25 10:01:04'),
	(4, '1767ec70a389b72b0b6c0ffcfbdb156f.jpg', '', '2021-02-25 10:03:07'),
	(5, 'd725fc06d3a9d5c76b0f01df1909bd6e.jpg', 'some frog', '2021-02-25 10:05:45'),
	(6, '05676b7c2bc9fcce2704b3d06c2b59c0.jpg', 'a wise newfoundland dog!', '2021-02-25 10:21:48');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;

-- Dumping structure for table express_spring.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `menuID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL,
  `cssID` varchar(12) NOT NULL,
  `dateModified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`menuID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table express_spring.menu: ~3 rows (approximately)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`menuID`, `name`, `cssID`, `dateModified`) VALUES
	(1, 'main', 'main', '2021-02-23 08:51:23'),
	(2, 'side', 'side', '2021-03-10 10:47:14'),
	(3, 'footer', 'footer', '2021-03-12 09:10:01');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Dumping structure for table express_spring.menuitem
CREATE TABLE IF NOT EXISTS `menuitem` (
  `menuItemID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menuID` int(10) unsigned NOT NULL,
  `html` text NOT NULL,
  `link` varchar(32) NOT NULL,
  `target` varchar(16) NOT NULL DEFAULT '_self',
  `sort` int(11) NOT NULL,
  `dateModified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`menuItemID`),
  KEY `menuID` (`menuID`),
  CONSTRAINT `menuitem_ibfk_1` FOREIGN KEY (`menuID`) REFERENCES `menu` (`menuID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table express_spring.menuitem: ~6 rows (approximately)
/*!40000 ALTER TABLE `menuitem` DISABLE KEYS */;
INSERT INTO `menuitem` (`menuItemID`, `menuID`, `html`, `link`, `target`, `sort`, `dateModified`) VALUES
	(1, 1, 'Home', 'home', '_self', 0, '2021-03-10 10:28:16'),
	(2, 1, 'Contact Us', 'contact', '_self', 0, '2021-03-10 10:28:23'),
	(3, 2, 'Copyright Policy', 'copyright', '_self', -1, '2021-03-12 09:11:45'),
	(4, 3, 'Google!', 'http://www.google.ca', '_blank', 1, '2021-03-12 09:10:14'),
	(5, 1, 'Upload Image', 'upload', '_self', 1, '2021-03-10 10:28:54'),
	(6, 1, 'Gallery', 'gallery', '_self', -1, '2021-03-10 10:28:50');
/*!40000 ALTER TABLE `menuitem` ENABLE KEYS */;

-- Dumping structure for table express_spring.page
CREATE TABLE IF NOT EXISTS `page` (
  `pageID` int(11) NOT NULL AUTO_INCREMENT,
  `pageKey` varchar(32) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `lastUserID` int(10) unsigned NOT NULL,
  `dateModified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`pageID`),
  UNIQUE KEY `pageKey` (`pageKey`),
  KEY `FK_page_user` (`lastUserID`),
  CONSTRAINT `FK_page_user` FOREIGN KEY (`lastUserID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table express_spring.page: ~7 rows (approximately)
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` (`pageID`, `pageKey`, `title`, `content`, `lastUserID`, `dateModified`) VALUES
	(1, 'home', 'Home', '<p class="content">hy\r\n    The narrator begins with a discussion on the nature of grown-ups and their inability to perceive especially important things. As a test to determine if a grown-up is enlightened and like a child, he shows them a picture that he drew at the age of 6 depicting a snake which has eaten an elephant. The grown-ups always reply that the picture depicts a hat, and so he knows to talk of "reasonable" things to them, rather than fanciful.\r\n</p>\r\n<p class="content">\r\n    The narrator becomes an aircraft pilot, and, one day, his plane crashes in the Sahara, far from civilisation. He has eight days of water supply and must fix his aeroplane to be saved.\r\n\r\nIn the middle of the desert, the narrator is unexpectedly greeted by a young boy who is nicknamed "the little prince". The prince has golden hair, a loveable laugh, and will repeat questions until they are answered.\r\n\r\n</p>\r\n<p class="content">\r\n    Upon encountering the narrator, the little prince asks him to draw a sheep. The narrator first shows him his old picture of the elephant inside the snake, which, to the narrator\'s surprise, the prince interprets correctly. After three failed attempts at drawing a sheep, the frustrated narrator simply draws a box (crate), claiming that the sheep the prince wants is inside the box. There were three holes in the box. Again, to the narrator\'s surprise, the prince exclaims that this was exactly the drawing he wanted.\r\n\r\n</p>\r\n<p class="content">\r\nThe prince begins by describing life on his tiny home planet: in effect, a house-sized asteroid known as "B 612" on Earth. The asteroid\'s most prominent features are three minuscule volcanoes (two active, and one dormant or extinct) as well as a variety of plants\r\n</p>\r\n<p class="content" id="lastp">\r\nThe prince describes spending his earlier days cleaning the volcanoes and weeding unwanted seeds and sprigs that infest his planet\'s soil; in particular, pulling out baobab trees that are constantly on the verge of overrunning the surface. If the baobabs are not rooted out the moment they are recognised, it may be put off until it is too late and the tree has grown too large to remove, its roots having a catastrophic effect on the tiny planet.\r\n\r\n   The prince tells of his love for a vain and silly rose that began growing on the asteroid\'s surface some time ago. The rose is given to pretension, exaggerating ailments to gain attention and have the prince care for her. The prince says he nourished the rose and tended to her, making a screen or glass globe to protect her from the cold wind, watering her, and keeping off the caterpillars.\r\n\r\nAlthough the prince fell in love with the rose, he also began to feel that she was taking advantage of him and he resolved to leave the planet to explore the rest of the universe. Upon their goodbyes, the rose is serious and apologises that she failed to show she loved him and that they had both been silly. She wishes him well and turns down his desire to leave her in the glass globe, saying she will protect herself.\r\n</p>', 1, '2021-03-19 18:54:48'),
	(2, 'contact', 'Contact Us', '<a href="mailto:rhymes_greg@hotmail.com">Email</a>', 8, '2021-03-19 18:57:55'),
	(3, 'upload', 'Upload a File!', 'upload_image.php', 1, '2021-03-12 09:52:22'),
	(4, 'gallery', 'Pictures', '<img src="https://1acgtt12xmhd5laxc2saim4d-wpengine.netdna-ssl.com/wp-content/uploads/2020/04/21333414_web1_200420-CRM-earth-day-EARTHDAY_1.jpg" / style="width:40vw"> ', 8, '2021-03-19 19:03:59'),
	(5, 'copyright', 'Our Copyright Policy', '<h1>Greg\'s stuff!</h1>', 1, '2021-03-19 19:04:41'),
	(6, 'bob', 'dfgd', 'Text', 1, '2021-03-19 19:05:11'),
	(7, 'test', 'dfgd', 'Text', 8, '2021-03-19 19:05:33');
/*!40000 ALTER TABLE `page` ENABLE KEYS */;

-- Dumping structure for table express_spring.user
CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `passHash` varchar(256) NOT NULL,
  `cookieHash` varchar(256) NOT NULL,
  `dateModified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`userID`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table express_spring.user: ~3 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userID`, `username`, `passHash`, `cookieHash`, `dateModified`) VALUES
	(1, 'bob', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'mDMc6Q158tpuW5+vn+ZFoosNap0VrO+Q30EMyl5ntn0=', '2021-03-11 11:32:12'),
	(6, 'fhfgy', '550bd0e77e819081c9aa89043382aee9cb341730', '89553c275a3c947762ec7354d19b04eecb41e71c', '2021-02-24 09:08:29'),
	(8, 'luke', 'zM9S89A8UHLuZKE290/FayfgTxX/5dHSd9WKsY2Usyc=', '0FNl9MUv1/vDZwPrtFUIMCJ/1P/Z4ektuU5e7l5vMUI=', '2021-03-12 09:16:44');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
