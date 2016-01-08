/*

SQLyog Ultimate v8.6 Beta2
MySQL - 5.5.24-log : Database - news_portal

*********************************************************************

*/



/*!40101 SET NAMES utf8 */;



/*!40101 SET SQL_MODE=''*/;



/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`news_portal` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;



USE `news_portal`;



/*Table structure for table `categories` */



DROP TABLE IF EXISTS `categories`;



CREATE TABLE `categories` (
  `idcategory` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT 'web',
  `edit_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_by` varchar(80) COLLATE utf8_bin DEFAULT 'web',
  PRIMARY KEY (`idcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



/*Data for the table `categories` */



insert  into `categories`(`idcategory`,`title`,`description`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (1,'Economy','Economy news from all around the world','2015-08-02 14:12:51','web','0000-00-00 00:00:00','web');

insert  into `categories`(`idcategory`,`title`,`description`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (2,'Sports','Are you a sports fanatic?','2015-08-02 14:13:10','web','0000-00-00 00:00:00','web');

insert  into `categories`(`idcategory`,`title`,`description`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (3,'Technology','All the cutting edge technology news','2015-08-02 14:13:34','web','0000-00-00 00:00:00','web');

insert  into `categories`(`idcategory`,`title`,`description`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (4,'World','What\'s going on out there?','2015-08-02 14:13:51','web','0000-00-00 00:00:00','web');



/*Table structure for table `post_categories` */



DROP TABLE IF EXISTS `post_categories`;



CREATE TABLE `post_categories` (
  `idpost_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpost` int(10) unsigned NOT NULL,
  `idcategory` int(10) unsigned NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT 'web',
  `edit_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_by` varchar(80) COLLATE utf8_bin DEFAULT 'web',
  PRIMARY KEY (`idpost_category`),
  KEY `FK_post_categories_post` (`idpost`),
  KEY `FK_post_categories_category` (`idcategory`),
  CONSTRAINT `FK_post_categories_category` FOREIGN KEY (`idcategory`) REFERENCES `categories` (`idcategory`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_post_categories_post` FOREIGN KEY (`idpost`) REFERENCES `posts` (`idpost`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



/*Data for the table `post_categories` */



insert  into `post_categories`(`idpost_category`,`idpost`,`idcategory`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (2,4,2,'2015-08-02 15:14:33','web','0000-00-00 00:00:00','web');

insert  into `post_categories`(`idpost_category`,`idpost`,`idcategory`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (3,5,3,'2015-08-02 16:28:51','1','0000-00-00 00:00:00','web');

insert  into `post_categories`(`idpost_category`,`idpost`,`idcategory`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (4,6,4,'2015-08-02 16:30:04','1','0000-00-00 00:00:00','web');

insert  into `post_categories`(`idpost_category`,`idpost`,`idcategory`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (5,2,1,'2015-08-02 17:11:19','web','0000-00-00 00:00:00','web');

insert  into `post_categories`(`idpost_category`,`idpost`,`idcategory`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (7,8,3,'2015-08-03 01:15:49','2','0000-00-00 00:00:00','web');

insert  into `post_categories`(`idpost_category`,`idpost`,`idcategory`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (8,9,4,'2015-08-03 01:16:49','2','0000-00-00 00:00:00','web');

insert  into `post_categories`(`idpost_category`,`idpost`,`idcategory`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (9,10,1,'2015-08-03 01:20:43','1','0000-00-00 00:00:00','web');

insert  into `post_categories`(`idpost_category`,`idpost`,`idcategory`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (10,11,2,'2015-08-03 01:21:07','1','0000-00-00 00:00:00','web');

insert  into `post_categories`(`idpost_category`,`idpost`,`idcategory`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (12,13,1,'2015-08-03 01:22:04','1','0000-00-00 00:00:00','web');

insert  into `post_categories`(`idpost_category`,`idpost`,`idcategory`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (13,14,3,'2015-08-03 01:22:21','1','0000-00-00 00:00:00','web');

insert  into `post_categories`(`idpost_category`,`idpost`,`idcategory`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (14,15,1,'2015-08-03 01:35:19','1','0000-00-00 00:00:00','web');



/*Table structure for table `post_tags` */



DROP TABLE IF EXISTS `post_tags`;



CREATE TABLE `post_tags` (
  `idpost_tag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpost` int(10) unsigned NOT NULL,
  `idtag` int(10) unsigned NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT 'web',
  `edit_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_by` varchar(80) COLLATE utf8_bin DEFAULT 'web',
  PRIMARY KEY (`idpost_tag`),
  KEY `FK_post_tags_post` (`idpost`),
  KEY `FK_post_tags_tag` (`idtag`),
  CONSTRAINT `FK_post_tags_tag` FOREIGN KEY (`idtag`) REFERENCES `tags` (`idtag`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_post_tags_post` FOREIGN KEY (`idpost`) REFERENCES `posts` (`idpost`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



/*Data for the table `post_tags` */



insert  into `post_tags`(`idpost_tag`,`idpost`,`idtag`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (4,2,3,'2015-08-02 15:11:51','web','0000-00-00 00:00:00','web');

insert  into `post_tags`(`idpost_tag`,`idpost`,`idtag`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (5,4,4,'2015-08-02 15:14:33','web','0000-00-00 00:00:00','web');

insert  into `post_tags`(`idpost_tag`,`idpost`,`idtag`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (6,5,5,'2015-08-02 16:28:51','1','0000-00-00 00:00:00','web');

insert  into `post_tags`(`idpost_tag`,`idpost`,`idtag`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (7,5,6,'2015-08-02 16:28:51','1','0000-00-00 00:00:00','web');

insert  into `post_tags`(`idpost_tag`,`idpost`,`idtag`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (8,6,7,'2015-08-02 16:30:04','1','0000-00-00 00:00:00','web');

insert  into `post_tags`(`idpost_tag`,`idpost`,`idtag`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (11,8,10,'2015-08-03 01:15:49','2','0000-00-00 00:00:00','web');

insert  into `post_tags`(`idpost_tag`,`idpost`,`idtag`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (12,9,2,'2015-08-03 01:16:49','2','0000-00-00 00:00:00','web');

insert  into `post_tags`(`idpost_tag`,`idpost`,`idtag`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (13,11,8,'2015-08-03 01:21:07','1','0000-00-00 00:00:00','web');

insert  into `post_tags`(`idpost_tag`,`idpost`,`idtag`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (14,15,3,'2015-08-03 01:35:19','1','0000-00-00 00:00:00','web');

insert  into `post_tags`(`idpost_tag`,`idpost`,`idtag`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (15,15,1,'2015-08-03 01:35:19','1','0000-00-00 00:00:00','web');



/*Table structure for table `posts` */



DROP TABLE IF EXISTS `posts`;



CREATE TABLE `posts` (
  `idpost` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iduser` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `body` text COLLATE utf8_bin NOT NULL,
  `image` varchar(255) COLLATE utf8_bin NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT 'web',
  `edit_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_by` varchar(80) COLLATE utf8_bin DEFAULT 'web',
  PRIMARY KEY (`idpost`),
  KEY `FK_posts_user` (`iduser`),
  CONSTRAINT `FK_posts_user` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



/*Data for the table `posts` */



insert  into `posts`(`idpost`,`iduser`,`title`,`body`,`image`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (2,1,'Interesting dummy news item','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse imperdiet, velit sit amet molestie luctus, tellus metus dictum purus, sit amet pretium massa orci at metus. Etiam elementum fermentum vulputate. Nunc accumsan mauris quis odio elementum, maximus bibendum erat congue. Nunc consequat nisi a accumsan placerat. Pellentesque laoreet at tellus ac tincidunt. Ut maximus, nisi nec eleifend tempor, justo magna imperdiet nunc, vel dictum nisl eros non leo. In dapibus egestas turpis ut suscipit. Mauris aliquam egestas ligula, id efficitur mi ultrices ac. Duis urna velit, gravida at imperdiet at, blandit et justo. In faucibus vel nulla porttitor suscipit. Duis ultrices porttitor felis quis ultricies. Curabitur pellentesque, sem a malesuada tincidunt, velit leo dapibus mauris, ut ornare augue metus nec ipsum. Donec pharetra odio nec pretium luctus. Phasellus varius eget mauris a vestibulum. Donec ut lacinia mauris. Aliquam vitae ipsum elementum, hendrerit tellus vel, iaculis nibh.\r\n\r\nInteger rhoncus eget est non vehicula. In tellus dolor, sodales eu gravida ut, pharetra id lectus. Pellentesque tristique volutpat est commodo scelerisque. Vivamus luctus maximus lacus at fringilla. Aliquam id ligula venenatis, viverra augue vitae, cursus ante. Pellentesque vitae augue viverra, scelerisque sem ac, pretium neque. Vestibulum enim neque, tempus non ligula viverra, gravida placerat nibh. Nullam luctus varius tincidunt. Integer tempus laoreet placerat. Sed in augue eu diam volutpat scelerisque. Phasellus ut dolor sed erat facilisis dictum quis sit amet sapien. Nullam lobortis diam eget dapibus tristique. Sed at leo est. Maecenas sit amet mollis mauris. Etiam porttitor ligula id lectus interdum, sed ornare purus consectetur. Mauris feugiat nisl a urna pharetra, eget egestas ante fermentum.\r\n\r\nMorbi id sem at sem hendrerit tincidunt. Ut id euismod sem. Integer scelerisque enim vel metus placerat, a feugiat enim ornare. Morbi et hendrerit lorem, ut accumsan lacus. Vivamus aliquam molestie dignissim. Aliquam interdum consequat tortor in efficitur. Phasellus bibendum pretium nisl non laoreet. Nulla non neque dignissim risus vestibulum tincidunt. Integer pretium tincidunt urna, in consectetur sem sagittis dignissim.','fc940d1d16cc6ff28f97fa4dcd0859ef.jpg','2015-08-02 15:09:54','web','0000-00-00 00:00:00','web');

insert  into `posts`(`idpost`,`iduser`,`title`,`body`,`image`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (4,1,'Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse imperdiet, velit sit amet molestie luctus, tellus metus dictum purus, sit amet pretium massa orci at metus. Etiam elementum fermentum vulputate. Nunc accumsan mauris quis odio elementum, maximus bibendum erat congue. Nunc consequat nisi a accumsan placerat. Pellentesque laoreet at tellus ac tincidunt. Ut maximus, nisi nec eleifend tempor, justo magna imperdiet nunc, vel dictum nisl eros non leo. In dapibus egestas turpis ut suscipit. Mauris aliquam egestas ligula, id efficitur mi ultrices ac. Duis urna velit, gravida at imperdiet at, blandit et justo. In faucibus vel nulla porttitor suscipit. Duis ultrices porttitor felis quis ultricies. Curabitur pellentesque, sem a malesuada tincidunt, velit leo dapibus mauris, ut ornare augue metus nec ipsum. Donec pharetra odio nec pretium luctus. Phasellus varius eget mauris a vestibulum. Donec ut lacinia mauris. Aliquam vitae ipsum elementum, hendrerit tellus vel, iaculis nibh.\r\n\r\nInteger rhoncus eget est non vehicula. In tellus dolor, sodales eu gravida ut, pharetra id lectus. Pellentesque tristique volutpat est commodo scelerisque. Vivamus luctus maximus lacus at fringilla. Aliquam id ligula venenatis, viverra augue vitae, cursus ante. Pellentesque vitae augue viverra, scelerisque sem ac, pretium neque. Vestibulum enim neque, tempus non ligula viverra, gravida placerat nibh. Nullam luctus varius tincidunt. Integer tempus laoreet placerat. Sed in augue eu diam volutpat scelerisque. Phasellus ut dolor sed erat facilisis dictum quis sit amet sapien. Nullam lobortis diam eget dapibus tristique. Sed at leo est. Maecenas sit amet mollis mauris. Etiam porttitor ligula id lectus interdum, sed ornare purus consectetur. Mauris feugiat nisl a urna pharetra, eget egestas ante fermentum.\r\n\r\nMorbi id sem at sem hendrerit tincidunt. Ut id euismod sem. Integer scelerisque enim vel metus placerat, a feugiat enim ornare. Morbi et hendrerit lorem, ut accumsan lacus. Vivamus aliquam molestie dignissim. Aliquam interdum consequat tortor in efficitur. Phasellus bibendum pretium nisl non laoreet. Nulla non neque dignissim risus vestibulum tincidunt. Integer pretium tincidunt urna, in consectetur sem sagittis dignissim.','e1c7c82a13ee7328dbc83ba712d3cebb.jpg','2015-08-02 15:14:33','web','0000-00-00 00:00:00','web');

insert  into `posts`(`idpost`,`iduser`,`title`,`body`,`image`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (5,1,'New milestone in space technology','Sed convallis nunc quis felis commodo, eget ornare magna dignissim. Cras felis tellus, mollis id nisl a, hendrerit tincidunt sapien. Phasellus lectus nulla, aliquam eu egestas eget, fermentum porta felis. Etiam non convallis quam. Donec pellentesque ac libero a ornare. Vivamus sollicitudin rutrum nibh, nec pulvinar lectus mollis quis. Sed aliquet tristique elementum. Donec rhoncus elit lacus, eu sodales nulla mattis non. Nam molestie neque sit amet nulla porttitor sodales. Fusce eleifend non metus a pretium. Curabitur sed facilisis orci. Phasellus sollicitudin, ligula non tristique vestibulum, diam enim molestie orci, sed porta risus felis nec libero. Duis efficitur diam vel libero eleifend lobortis.\r\n\r\nIn hac habitasse platea dictumst. Fusce at massa augue. Nunc maximus non velit sit amet commodo. Vivamus condimentum risus dolor, vel semper lectus ultricies at. In quis nisi eleifend, laoreet augue at, porttitor tortor. Pellentesque purus libero, mattis vel magna a, rhoncus scelerisque turpis. Mauris sagittis elit ac rutrum commodo. Duis sit amet nulla nec augue porttitor sodales. Cras quis bibendum neque, in accumsan sapien. Duis facilisis molestie arcu, at ultricies odio posuere non.\r\n\r\nPhasellus iaculis enim dui, eu vestibulum mi elementum sit amet. Suspendisse ut odio odio. Aliquam ante dolor, luctus ut vestibulum nec, porta at dolor. Fusce pretium vitae nisi non vehicula. Suspendisse ac rhoncus odio. Mauris aliquam libero velit. Vestibulum consequat elit tortor, id tincidunt nisi venenatis et. Cras congue ante tristique, vulputate nulla non, efficitur nibh. Vestibulum sodales est vel orci maximus scelerisque. Nulla placerat congue cursus. Donec tempus id risus vel commodo. Nullam ornare ullamcorper urna, interdum laoreet est efficitur id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\r\n\r\nProin lacinia erat in lorem feugiat, id vulputate ante efficitur. Sed eget rhoncus dolor, at laoreet purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris condimentum lorem eget dui iaculis, sit amet pellentesque risus porttitor. Pellentesque ornare felis arcu, sed vehicula sapien porta vel. Ut a fermentum metus. Donec nec tincidunt sem. Vivamus et turpis in ex pulvinar suscipit. Maecenas eget nunc consectetur, aliquam risus vel, posuere dolor.','8bae3d185031e7a374a8a1430a6b120c.jpg','2015-08-02 16:28:50','web','0000-00-00 00:00:00','web');

insert  into `posts`(`idpost`,`iduser`,`title`,`body`,`image`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (6,1,'Recent world news','Sed convallis nunc quis felis commodo, eget ornare magna dignissim. Cras felis tellus, mollis id nisl a, hendrerit tincidunt sapien. Phasellus lectus nulla, aliquam eu egestas eget, fermentum porta felis. Etiam non convallis quam. Donec pellentesque ac libero a ornare. Vivamus sollicitudin rutrum nibh, nec pulvinar lectus mollis quis. Sed aliquet tristique elementum. Donec rhoncus elit lacus, eu sodales nulla mattis non. Nam molestie neque sit amet nulla porttitor sodales. Fusce eleifend non metus a pretium. Curabitur sed facilisis orci. Phasellus sollicitudin, ligula non tristique vestibulum, diam enim molestie orci, sed porta risus felis nec libero. Duis efficitur diam vel libero eleifend lobortis.\r\n\r\nPhasellus iaculis enim dui, eu vestibulum mi elementum sit amet. Suspendisse ut odio odio. Aliquam ante dolor, luctus ut vestibulum nec, porta at dolor. Fusce pretium vitae nisi non vehicula. Suspendisse ac rhoncus odio. Mauris aliquam libero velit. Vestibulum consequat elit tortor, id tincidunt nisi venenatis et. Cras congue ante tristique, vulputate nulla non, efficitur nibh. Vestibulum sodales est vel orci maximus scelerisque. Nulla placerat congue cursus. Donec tempus id risus vel commodo. Nullam ornare ullamcorper urna, interdum laoreet est efficitur id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\r\n\r\nProin lacinia erat in lorem feugiat, id vulputate ante efficitur. Sed eget rhoncus dolor, at laoreet purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris condimentum lorem eget dui iaculis, sit amet pellentesque risus porttitor. Pellentesque ornare felis arcu, sed vehicula sapien porta vel. Ut a fermentum metus. Donec nec tincidunt sem. Vivamus et turpis in ex pulvinar suscipit. Maecenas eget nunc consectetur, aliquam risus vel, posuere dolor.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae nulla massa. Mauris a nisl at nibh auctor ultricies eget vel est. Mauris pulvinar mi dapibus consequat malesuada. Phasellus quis velit magna. Suspendisse dictum feugiat vestibulum. Quisque tempus sit amet mi vel rhoncus. Nulla blandit ut leo et tincidunt. Suspendisse feugiat turpis nec imperdiet euismod. Quisque arcu justo, luctus luctus erat in, faucibus vulputate nisl. Quisque convallis scelerisque augue, eu suscipit neque maximus ut. Pellentesque id interdum ex. Cras lacinia egestas libero id fringilla.','b5a853912c131ac654b2b6050b08e0bc.jpg','2015-08-02 16:30:04','web','0000-00-00 00:00:00','web');

insert  into `posts`(`idpost`,`iduser`,`title`,`body`,`image`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (8,2,'Lorem ipsum dolor sit amet news item','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer laoreet commodo tincidunt. Phasellus posuere venenatis metus, eget accumsan ipsum consequat vel. Etiam finibus venenatis justo eget lacinia. Vivamus pellentesque volutpat urna, eget consectetur ex cursus in. Aenean ac ex eu lacus interdum accumsan. Nam tincidunt enim a orci condimentum sollicitudin. Aenean commodo varius malesuada. Pellentesque sit amet lacus nisl. Nulla vitae metus nec purus tristique malesuada. Phasellus a elit blandit, lobortis mauris eu, hendrerit massa.\r\n\r\nEtiam tristique egestas dui nec vulputate. Cras neque erat, volutpat et ante quis, auctor bibendum elit. Donec luctus euismod felis, eget tempus lacus consectetur id. Nam dictum quis mi quis bibendum. Mauris ac dapibus neque. Donec pellentesque mollis convallis. Pellentesque consectetur est sit amet enim ullamcorper, et feugiat velit elementum. Vivamus felis lorem, consectetur quis cursus pulvinar, convallis quis mauris. Sed ornare purus lectus, et tempus erat tincidunt ullamcorper. Phasellus nec risus id leo tincidunt condimentum. Nullam tempus hendrerit purus sagittis eleifend. Quisque eget justo ut lorem rhoncus fringilla. Mauris commodo sed dui eu dapibus. Mauris turpis nulla, tincidunt in pretium sed, mattis vel augue. Proin facilisis neque turpis, nec aliquet justo iaculis vel.\r\n\r\nNullam augue lectus, varius eu ex venenatis, tempus dignissim dui. Donec vel odio non elit pulvinar commodo quis ac orci. Suspendisse fringilla a lorem at tempus. Proin porttitor massa vitae lorem aliquet semper. Integer enim sem, efficitur ut lacinia id, dictum sed est. Quisque egestas ac dolor vitae efficitur. Proin cursus, lectus vel pharetra eleifend, est ipsum tristique elit, in vehicula augue ante ut lorem. Nulla hendrerit commodo eros aliquet consequat. Sed in efficitur eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eleifend malesuada lacinia. Etiam interdum, orci ut venenatis feugiat, augue magna gravida mauris, vehicula sodales ante tortor vel mauris. Proin sagittis, est a commodo commodo, nulla ante lobortis ex, eu hendrerit urna metus tristique risus. Vivamus faucibus eget nibh vitae faucibus. Donec ac felis rutrum, vehicula odio in, fringilla ligula. Nam sodales ante ex, eu aliquet neque interdum vitae.','c1050385dac6f8d7b0cf37981b81a845.jpg','2015-08-03 01:15:49','web','0000-00-00 00:00:00','web');

insert  into `posts`(`idpost`,`iduser`,`title`,`body`,`image`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (9,2,'Another interesting news title','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer laoreet commodo tincidunt. Phasellus posuere venenatis metus, eget accumsan ipsum consequat vel. Etiam finibus venenatis justo eget lacinia. Vivamus pellentesque volutpat urna, eget consectetur ex cursus in. Aenean ac ex eu lacus interdum accumsan. Nam tincidunt enim a orci condimentum sollicitudin. Aenean commodo varius malesuada. Pellentesque sit amet lacus nisl. Nulla vitae metus nec purus tristique malesuada. Phasellus a elit blandit, lobortis mauris eu, hendrerit massa.\r\n\r\nEtiam tristique egestas dui nec vulputate. Cras neque erat, volutpat et ante quis, auctor bibendum elit. Donec luctus euismod felis, eget tempus lacus consectetur id. Nam dictum quis mi quis bibendum. Mauris ac dapibus neque. Donec pellentesque mollis convallis. Pellentesque consectetur est sit amet enim ullamcorper, et feugiat velit elementum. Vivamus felis lorem, consectetur quis cursus pulvinar, convallis quis mauris. Sed ornare purus lectus, et tempus erat tincidunt ullamcorper. Phasellus nec risus id leo tincidunt condimentum. Nullam tempus hendrerit purus sagittis eleifend. Quisque eget justo ut lorem rhoncus fringilla. Mauris commodo sed dui eu dapibus. Mauris turpis nulla, tincidunt in pretium sed, mattis vel augue. Proin facilisis neque turpis, nec aliquet justo iaculis vel.\r\n\r\nNullam augue lectus, varius eu ex venenatis, tempus dignissim dui. Donec vel odio non elit pulvinar commodo quis ac orci. Suspendisse fringilla a lorem at tempus. Proin porttitor massa vitae lorem aliquet semper. Integer enim sem, efficitur ut lacinia id, dictum sed est. Quisque egestas ac dolor vitae efficitur. Proin cursus, lectus vel pharetra eleifend, est ipsum tristique elit, in vehicula augue ante ut lorem. Nulla hendrerit commodo eros aliquet consequat. Sed in efficitur eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eleifend malesuada lacinia. Etiam interdum, orci ut venenatis feugiat, augue magna gravida mauris, vehicula sodales ante tortor vel mauris. Proin sagittis, est a commodo commodo, nulla ante lobortis ex, eu hendrerit urna metus tristique risus. Vivamus faucibus eget nibh vitae faucibus. Donec ac felis rutrum, vehicula odio in, fringilla ligula. Nam sodales ante ex, eu aliquet neque interdum vitae.','dedb6903df819546f95758444e9aece6.jpg','2015-08-03 01:16:48','web','0000-00-00 00:00:00','web');

insert  into `posts`(`idpost`,`iduser`,`title`,`body`,`image`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (10,1,'Test news item for economy','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer laoreet commodo tincidunt. Phasellus posuere venenatis metus, eget accumsan ipsum consequat vel. Etiam finibus venenatis justo eget lacinia. Vivamus pellentesque volutpat urna, eget consectetur ex cursus in. Aenean ac ex eu lacus interdum accumsan. Nam tincidunt enim a orci condimentum sollicitudin. Aenean commodo varius malesuada. Pellentesque sit amet lacus nisl. Nulla vitae metus nec purus tristique malesuada. Phasellus a elit blandit, lobortis mauris eu, hendrerit massa.\r\n\r\nEtiam tristique egestas dui nec vulputate. Cras neque erat, volutpat et ante quis, auctor bibendum elit. Donec luctus euismod felis, eget tempus lacus consectetur id. Nam dictum quis mi quis bibendum. Mauris ac dapibus neque. Donec pellentesque mollis convallis. Pellentesque consectetur est sit amet enim ullamcorper, et feugiat velit elementum. Vivamus felis lorem, consectetur quis cursus pulvinar, convallis quis mauris. Sed ornare purus lectus, et tempus erat tincidunt ullamcorper. Phasellus nec risus id leo tincidunt condimentum. Nullam tempus hendrerit purus sagittis eleifend. Quisque eget justo ut lorem rhoncus fringilla. Mauris commodo sed dui eu dapibus. Mauris turpis nulla, tincidunt in pretium sed, mattis vel augue. Proin facilisis neque turpis, nec aliquet justo iaculis vel.\r\n\r\nNullam augue lectus, varius eu ex venenatis, tempus dignissim dui. Donec vel odio non elit pulvinar commodo quis ac orci. Suspendisse fringilla a lorem at tempus. Proin porttitor massa vitae lorem aliquet semper. Integer enim sem, efficitur ut lacinia id, dictum sed est. Quisque egestas ac dolor vitae efficitur. Proin cursus, lectus vel pharetra eleifend, est ipsum tristique elit, in vehicula augue ante ut lorem. Nulla hendrerit commodo eros aliquet consequat. Sed in efficitur eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eleifend malesuada lacinia. Etiam interdum, orci ut venenatis feugiat, augue magna gravida mauris, vehicula sodales ante tortor vel mauris. Proin sagittis, est a commodo commodo, nulla ante lobortis ex, eu hendrerit urna metus tristique risus. Vivamus faucibus eget nibh vitae faucibus. Donec ac felis rutrum, vehicula odio in, fringilla ligula. Nam sodales ante ex, eu aliquet neque interdum vitae.','87cb4f851dd57cf637e999b598af3fd6.jpg','2015-08-03 01:20:43','web','0000-00-00 00:00:00','web');

insert  into `posts`(`idpost`,`iduser`,`title`,`body`,`image`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (11,1,'Another test news','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer laoreet commodo tincidunt. Phasellus posuere venenatis metus, eget accumsan ipsum consequat vel. Etiam finibus venenatis justo eget lacinia. Vivamus pellentesque volutpat urna, eget consectetur ex cursus in. Aenean ac ex eu lacus interdum accumsan. Nam tincidunt enim a orci condimentum sollicitudin. Aenean commodo varius malesuada. Pellentesque sit amet lacus nisl. Nulla vitae metus nec purus tristique malesuada. Phasellus a elit blandit, lobortis mauris eu, hendrerit massa.\r\n\r\nEtiam tristique egestas dui nec vulputate. Cras neque erat, volutpat et ante quis, auctor bibendum elit. Donec luctus euismod felis, eget tempus lacus consectetur id. Nam dictum quis mi quis bibendum. Mauris ac dapibus neque. Donec pellentesque mollis convallis. Pellentesque consectetur est sit amet enim ullamcorper, et feugiat velit elementum. Vivamus felis lorem, consectetur quis cursus pulvinar, convallis quis mauris. Sed ornare purus lectus, et tempus erat tincidunt ullamcorper. Phasellus nec risus id leo tincidunt condimentum. Nullam tempus hendrerit purus sagittis eleifend. Quisque eget justo ut lorem rhoncus fringilla. Mauris commodo sed dui eu dapibus. Mauris turpis nulla, tincidunt in pretium sed, mattis vel augue. Proin facilisis neque turpis, nec aliquet justo iaculis vel.\r\n\r\nNullam augue lectus, varius eu ex venenatis, tempus dignissim dui. Donec vel odio non elit pulvinar commodo quis ac orci. Suspendisse fringilla a lorem at tempus. Proin porttitor massa vitae lorem aliquet semper. Integer enim sem, efficitur ut lacinia id, dictum sed est. Quisque egestas ac dolor vitae efficitur. Proin cursus, lectus vel pharetra eleifend, est ipsum tristique elit, in vehicula augue ante ut lorem. Nulla hendrerit commodo eros aliquet consequat. Sed in efficitur eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eleifend malesuada lacinia. Etiam interdum, orci ut venenatis feugiat, augue magna gravida mauris, vehicula sodales ante tortor vel mauris. Proin sagittis, est a commodo commodo, nulla ante lobortis ex, eu hendrerit urna metus tristique risus. Vivamus faucibus eget nibh vitae faucibus. Donec ac felis rutrum, vehicula odio in, fringilla ligula. Nam sodales ante ex, eu aliquet neque interdum vitae.','3ad37c710061a2afaf43da7d751a10c5.jpg','2015-08-03 01:21:07','web','0000-00-00 00:00:00','web');

insert  into `posts`(`idpost`,`iduser`,`title`,`body`,`image`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (13,1,'Dummy news to make it more than ten','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer laoreet commodo tincidunt. Phasellus posuere venenatis metus, eget accumsan ipsum consequat vel. Etiam finibus venenatis justo eget lacinia. Vivamus pellentesque volutpat urna, eget consectetur ex cursus in. Aenean ac ex eu lacus interdum accumsan. Nam tincidunt enim a orci condimentum sollicitudin. Aenean commodo varius malesuada. Pellentesque sit amet lacus nisl. Nulla vitae metus nec purus tristique malesuada. Phasellus a elit blandit, lobortis mauris eu, hendrerit massa.\r\n\r\nEtiam tristique egestas dui nec vulputate. Cras neque erat, volutpat et ante quis, auctor bibendum elit. Donec luctus euismod felis, eget tempus lacus consectetur id. Nam dictum quis mi quis bibendum. Mauris ac dapibus neque. Donec pellentesque mollis convallis. Pellentesque consectetur est sit amet enim ullamcorper, et feugiat velit elementum. Vivamus felis lorem, consectetur quis cursus pulvinar, convallis quis mauris. Sed ornare purus lectus, et tempus erat tincidunt ullamcorper. Phasellus nec risus id leo tincidunt condimentum. Nullam tempus hendrerit purus sagittis eleifend. Quisque eget justo ut lorem rhoncus fringilla. Mauris commodo sed dui eu dapibus. Mauris turpis nulla, tincidunt in pretium sed, mattis vel augue. Proin facilisis neque turpis, nec aliquet justo iaculis vel.\r\n\r\nNullam augue lectus, varius eu ex venenatis, tempus dignissim dui. Donec vel odio non elit pulvinar commodo quis ac orci. Suspendisse fringilla a lorem at tempus. Proin porttitor massa vitae lorem aliquet semper. Integer enim sem, efficitur ut lacinia id, dictum sed est. Quisque egestas ac dolor vitae efficitur. Proin cursus, lectus vel pharetra eleifend, est ipsum tristique elit, in vehicula augue ante ut lorem. Nulla hendrerit commodo eros aliquet consequat. Sed in efficitur eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eleifend malesuada lacinia. Etiam interdum, orci ut venenatis feugiat, augue magna gravida mauris, vehicula sodales ante tortor vel mauris. Proin sagittis, est a commodo commodo, nulla ante lobortis ex, eu hendrerit urna metus tristique risus. Vivamus faucibus eget nibh vitae faucibus. Donec ac felis rutrum, vehicula odio in, fringilla ligula. Nam sodales ante ex, eu aliquet neque interdum vitae.','13d1e5723f65b47bcda6bf0b6dadfb79.jpg','2015-08-03 01:22:04','web','0000-00-00 00:00:00','web');

insert  into `posts`(`idpost`,`iduser`,`title`,`body`,`image`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (14,1,'Another news','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer laoreet commodo tincidunt. Phasellus posuere venenatis metus, eget accumsan ipsum consequat vel. Etiam finibus venenatis justo eget lacinia. Vivamus pellentesque volutpat urna, eget consectetur ex cursus in. Aenean ac ex eu lacus interdum accumsan. Nam tincidunt enim a orci condimentum sollicitudin. Aenean commodo varius malesuada. Pellentesque sit amet lacus nisl. Nulla vitae metus nec purus tristique malesuada. Phasellus a elit blandit, lobortis mauris eu, hendrerit massa.\r\n\r\nEtiam tristique egestas dui nec vulputate. Cras neque erat, volutpat et ante quis, auctor bibendum elit. Donec luctus euismod felis, eget tempus lacus consectetur id. Nam dictum quis mi quis bibendum. Mauris ac dapibus neque. Donec pellentesque mollis convallis. Pellentesque consectetur est sit amet enim ullamcorper, et feugiat velit elementum. Vivamus felis lorem, consectetur quis cursus pulvinar, convallis quis mauris. Sed ornare purus lectus, et tempus erat tincidunt ullamcorper. Phasellus nec risus id leo tincidunt condimentum. Nullam tempus hendrerit purus sagittis eleifend. Quisque eget justo ut lorem rhoncus fringilla. Mauris commodo sed dui eu dapibus. Mauris turpis nulla, tincidunt in pretium sed, mattis vel augue. Proin facilisis neque turpis, nec aliquet justo iaculis vel.\r\n\r\nNullam augue lectus, varius eu ex venenatis, tempus dignissim dui. Donec vel odio non elit pulvinar commodo quis ac orci. Suspendisse fringilla a lorem at tempus. Proin porttitor massa vitae lorem aliquet semper. Integer enim sem, efficitur ut lacinia id, dictum sed est. Quisque egestas ac dolor vitae efficitur. Proin cursus, lectus vel pharetra eleifend, est ipsum tristique elit, in vehicula augue ante ut lorem. Nulla hendrerit commodo eros aliquet consequat. Sed in efficitur eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eleifend malesuada lacinia. Etiam interdum, orci ut venenatis feugiat, augue magna gravida mauris, vehicula sodales ante tortor vel mauris. Proin sagittis, est a commodo commodo, nulla ante lobortis ex, eu hendrerit urna metus tristique risus. Vivamus faucibus eget nibh vitae faucibus. Donec ac felis rutrum, vehicula odio in, fringilla ligula. Nam sodales ante ex, eu aliquet neque interdum vitae.','379e99ee725266b4f20ca09730809e77.jpg','2015-08-03 01:22:21','web','0000-00-00 00:00:00','web');

insert  into `posts`(`idpost`,`iduser`,`title`,`body`,`image`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (15,1,'Another test news item','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer laoreet commodo tincidunt. Phasellus posuere venenatis metus, eget accumsan ipsum consequat vel. Etiam finibus venenatis justo eget lacinia. Vivamus pellentesque volutpat urna, eget consectetur ex cursus in. Aenean ac ex eu lacus interdum accumsan. Nam tincidunt enim a orci condimentum sollicitudin. Aenean commodo varius malesuada. Pellentesque sit amet lacus nisl. Nulla vitae metus nec purus tristique malesuada. Phasellus a elit blandit, lobortis mauris eu, hendrerit massa.\r\n\r\nEtiam tristique egestas dui nec vulputate. Cras neque erat, volutpat et ante quis, auctor bibendum elit. Donec luctus euismod felis, eget tempus lacus consectetur id. Nam dictum quis mi quis bibendum. Mauris ac dapibus neque. Donec pellentesque mollis convallis. Pellentesque consectetur est sit amet enim ullamcorper, et feugiat velit elementum. Vivamus felis lorem, consectetur quis cursus pulvinar, convallis quis mauris. Sed ornare purus lectus, et tempus erat tincidunt ullamcorper. Phasellus nec risus id leo tincidunt condimentum. Nullam tempus hendrerit purus sagittis eleifend. Quisque eget justo ut lorem rhoncus fringilla. Mauris commodo sed dui eu dapibus. Mauris turpis nulla, tincidunt in pretium sed, mattis vel augue. Proin facilisis neque turpis, nec aliquet justo iaculis vel.\r\n\r\nNullam augue lectus, varius eu ex venenatis, tempus dignissim dui. Donec vel odio non elit pulvinar commodo quis ac orci. Suspendisse fringilla a lorem at tempus. Proin porttitor massa vitae lorem aliquet semper. Integer enim sem, efficitur ut lacinia id, dictum sed est. Quisque egestas ac dolor vitae efficitur. Proin cursus, lectus vel pharetra eleifend, est ipsum tristique elit, in vehicula augue ante ut lorem. Nulla hendrerit commodo eros aliquet consequat. Sed in efficitur eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eleifend malesuada lacinia. Etiam interdum, orci ut venenatis feugiat, augue magna gravida mauris, vehicula sodales ante tortor vel mauris. Proin sagittis, est a commodo commodo, nulla ante lobortis ex, eu hendrerit urna metus tristique risus. Vivamus faucibus eget nibh vitae faucibus. Donec ac felis rutrum, vehicula odio in, fringilla ligula. Nam sodales ante ex, eu aliquet neque interdum vitae.','7150fd0c30dad701609e72ab70185fe3.jpg','2015-08-03 01:35:18','web','0000-00-00 00:00:00','web');



/*Table structure for table `profiles` */



DROP TABLE IF EXISTS `profiles`;



CREATE TABLE `profiles` (
  `idprofile` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iduser` int(10) unsigned NOT NULL,
  `first_name` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT 'web',
  `edit_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_by` varchar(80) COLLATE utf8_bin DEFAULT 'web',
  PRIMARY KEY (`idprofile`),
  KEY `unique_iduser` (`iduser`),
  CONSTRAINT `FK_profiles_users` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



/*Data for the table `profiles` */



insert  into `profiles`(`idprofile`,`iduser`,`first_name`,`last_name`,`display_name`,`gravatar_email`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (1,1,'Ashiqur','Rahman','Rony','ashiquebd@gmail.com','2015-08-01 02:51:05','web','0000-00-00 00:00:00','web');

insert  into `profiles`(`idprofile`,`iduser`,`first_name`,`last_name`,`display_name`,`gravatar_email`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (2,2,'John','Doe','John','ashiquebd@gmail.com','2015-08-03 01:12:21','web','0000-00-00 00:00:00','web');



/*Table structure for table `tags` */



DROP TABLE IF EXISTS `tags`;



CREATE TABLE `tags` (
  `idtag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT 'web',
  `edit_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_by` varchar(80) COLLATE utf8_bin DEFAULT 'web',
  PRIMARY KEY (`idtag`),
  UNIQUE KEY `unique_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



/*Data for the table `tags` */



insert  into `tags`(`idtag`,`title`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (1,'news','2015-08-02 14:38:11','web','0000-00-00 00:00:00','web');

insert  into `tags`(`idtag`,`title`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (2,'world','2015-08-02 14:38:11','web','0000-00-00 00:00:00','web');

insert  into `tags`(`idtag`,`title`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (3,'economy','2015-08-02 15:09:54','web','0000-00-00 00:00:00','web');

insert  into `tags`(`idtag`,`title`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (4,'sport','2015-08-02 15:14:33','web','0000-00-00 00:00:00','web');

insert  into `tags`(`idtag`,`title`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (5,'space','2015-08-02 16:28:50','1','0000-00-00 00:00:00','web');

insert  into `tags`(`idtag`,`title`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (6,'science','2015-08-02 16:28:51','1','0000-00-00 00:00:00','web');

insert  into `tags`(`idtag`,`title`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (7,'war','2015-08-02 16:30:04','1','0000-00-00 00:00:00','web');

insert  into `tags`(`idtag`,`title`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (8,'sports','2015-08-03 01:14:55','2','0000-00-00 00:00:00','web');

insert  into `tags`(`idtag`,`title`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (9,'lorem','2015-08-03 01:14:55','2','0000-00-00 00:00:00','web');

insert  into `tags`(`idtag`,`title`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (10,'technology','2015-08-03 01:15:49','2','0000-00-00 00:00:00','web');



/*Table structure for table `users` */



DROP TABLE IF EXISTS `users`;



CREATE TABLE `users` (
  `iduser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `code` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` varchar(80) CHARACTER SET latin1 NOT NULL DEFAULT 'web',
  `edit_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_by` varchar(80) CHARACTER SET latin1 DEFAULT 'web',
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



/*Data for the table `users` */



insert  into `users`(`iduser`,`email`,`password`,`code`,`status`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (1,'mosrur@gmail.com','cc03e747a6afbbcbf8be7668acfebee5','7dbff75ae15cd0ea7bfc3ca16c4f33cc',1,'2015-08-01 01:48:58','web','2015-07-31 21:19:27','web');

insert  into `users`(`iduser`,`email`,`password`,`code`,`status`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (2,'ashique.bd@gmail.com','cc03e747a6afbbcbf8be7668acfebee5','35367ceb7f3407415758d005595402c4',1,'2015-08-03 01:10:25','web','2015-08-02 19:13:32','web');

insert  into `users`(`iduser`,`email`,`password`,`code`,`status`,`add_date`,`added_by`,`edit_date`,`edited_by`) values (3,'a.shiquebd@gmail.com','cc03e747a6afbbcbf8be7668acfebee5','f3e4617f035724c8876c8908f4d36d1c',1,'2015-08-03 01:30:24','web','2015-08-02 19:33:18','web');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

