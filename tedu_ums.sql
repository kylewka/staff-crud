/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.49 : Database - ssm_crud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm_crud` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm_crud`;

/*Table structure for table `tbl_dept` */

DROP TABLE IF EXISTS `tbl_dept`;

CREATE TABLE `tbl_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_dept` */

insert  into `tbl_dept`(`dept_id`,`dept_name`) values (1,'开发部'),(2,'测试部');

/*Table structure for table `tbl_emp` */

DROP TABLE IF EXISTS `tbl_emp`;

CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `emp_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `gender` char(2) DEFAULT NULL COMMENT '性别',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `d_id` int(11) DEFAULT NULL COMMENT '外键关联',
  PRIMARY KEY (`emp_id`),
  KEY `fk_emp_dept` (`d_id`),
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`d_id`) REFERENCES `tbl_dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_emp` */

insert  into `tbl_emp`(`emp_id`,`emp_name`,`gender`,`email`,`d_id`) values (1,'4912f0','F','4912f0@funs.com',2),(2,'3bfa91','M','3bfa91@funs.com',1),(3,'af65a2','M','af65a2@funs.com',1),(4,'c51b23','F','c51b23@funs.com',2),(5,'10ec54','M','10ec54@funs.com',1),(6,'ba68c5','M','ba68c5@funs.com',1),(7,'ef1536','F','ef1536@funs.com',2),(8,'ec63b7','M','ec63b7@funs.com',1),(9,'818c58','M','818c58@funs.com',1),(10,'461299','F','461299@funs.com',2),(11,'e243610','M','e243610@funs.com',1),(12,'a98b811','M','a98b811@funs.com',1),(13,'e130a12','F','e130a12@funs.com',2),(14,'a456613','M','a456613@funs.com',1),(15,'7afc914','M','7afc914@funs.com',1),(16,'9873515','F','9873515@funs.com',2),(17,'405ac16','M','405ac16@funs.com',1),(18,'e42ef17','M','e42ef17@funs.com',1),(19,'daf4418','F','daf4418@funs.com',2),(20,'b20e519','M','b20e519@funs.com',1),(21,'b296320','M','b296320@funs.com',1),(22,'8c19121','F','8c19121@funs.com',2),(23,'2dcc922','M','2dcc922@funs.com',1),(24,'ef9f623','M','ef9f623@funs.com',1),(25,'3811e24','F','3811e24@funs.com',2),(26,'1028225','M','1028225@funs.com',1),(27,'1c42626','M','1c42626@funs.com',1),(28,'855f027','F','855f027@funs.com',2),(29,'a0a5228','M','a0a5228@funs.com',1),(30,'d304929','M','d304929@funs.com',1),(31,'9ff0030','F','9ff0030@funs.com',2),(32,'73b1631','M','73b1631@funs.com',1),(33,'ee16932','M','ee16932@funs.com',1),(34,'f144433','F','f144433@funs.com',2),(35,'dc8aa34','M','dc8aa34@funs.com',1),(36,'522fd35','M','522fd35@funs.com',1),(37,'6107036','F','6107036@funs.com',2),(38,'8ca6737','M','8ca6737@funs.com',1),(39,'25fb238','M','25fb238@funs.com',1),(40,'b968539','F','b968539@funs.com',2),(41,'5b09a40','M','5b09a40@funs.com',1),(42,'d648241','M','d648241@funs.com',1),(43,'1ac0e42','F','1ac0e42@funs.com',2),(44,'ec85643','M','ec85643@funs.com',1),(45,'0e51144','M','0e51144@funs.com',1),(46,'e3bd945','F','e3bd945@funs.com',2),(47,'bb5f246','M','bb5f246@funs.com',1),(48,'bdf1e47','M','bdf1e47@funs.com',1),(49,'643d748','F','643d748@funs.com',2),(50,'0d3e849','M','0d3e849@funs.com',1),(51,'ef11750','M','ef11750@funs.com',1),(52,'1ba2951','F','1ba2951@funs.com',2),(53,'a062152','M','a062152@funs.com',1),(54,'55c5753','M','55c5753@funs.com',1),(55,'00bf154','F','00bf154@funs.com',2),(56,'d3f6955','M','d3f6955@funs.com',1),(57,'f8eab56','M','f8eab56@funs.com',1),(58,'0bebc57','F','0bebc57@funs.com',2),(59,'c352958','M','c352958@funs.com',1),(60,'fbda559','M','fbda559@funs.com',1),(61,'0200960','F','0200960@funs.com',2),(62,'918fe61','M','918fe61@funs.com',1),(63,'0d10d62','M','0d10d62@funs.com',1),(64,'d999863','F','d999863@funs.com',2),(65,'35df564','M','35df564@funs.com',1),(66,'0f5cb65','M','0f5cb65@funs.com',1),(67,'eef1066','F','eef1066@funs.com',2),(68,'f754b67','M','f754b67@funs.com',1),(69,'5966968','M','5966968@funs.com',1),(70,'a323869','F','a323869@funs.com',2),(71,'0460470','M','0460470@funs.com',1),(72,'b8b0b71','M','b8b0b71@funs.com',1),(73,'24f7b72','F','24f7b72@funs.com',2),(74,'7bc9773','M','7bc9773@funs.com',1),(75,'99e4a74','M','99e4a74@funs.com',1),(76,'0984575','F','0984575@funs.com',2),(77,'b0fea76','M','b0fea76@funs.com',1),(78,'1f8f677','M','1f8f677@funs.com',1),(79,'c424a78','F','c424a78@funs.com',2),(80,'bf12c79','M','bf12c79@funs.com',1),(81,'1f5c180','M','1f5c180@funs.com',1),(82,'2c67781','F','2c67781@funs.com',2),(83,'4453382','M','4453382@funs.com',1),(84,'3b36883','M','3b36883@funs.com',1),(85,'2df2584','F','2df2584@funs.com',2),(86,'5423785','M','5423785@funs.com',1),(87,'d625486','M','d625486@funs.com',1),(88,'f6efc87','F','f6efc87@funs.com',2),(89,'a0d1788','M','a0d1788@funs.com',1),(90,'53bf989','M','53bf989@funs.com',1),(91,'ebd1290','F','ebd1290@funs.com',2),(92,'feadd91','M','feadd91@funs.com',1),(93,'6f7d692','M','6f7d692@funs.com',1),(94,'5606e93','F','5606e93@funs.com',2),(95,'3adf194','M','3adf194@funs.com',1),(96,'66a4195','M','66a4195@funs.com',1),(97,'8452b96','F','8452b96@funs.com',2),(98,'8b1f597','M','8b1f597@funs.com',1),(99,'641dc98','M','641dc98@funs.com',1),(100,'d0ad599','F','d0ad599@funs.com',2),(101,'63b99100','M','63b99100@funs.com',1),(102,'ebe59101','M','ebe59101@funs.com',1),(103,'c8f8f102','F','c8f8f102@funs.com',2),(104,'a2c8b103','M','a2c8b103@funs.com',1),(105,'e0241104','M','e0241104@funs.com',1),(106,'854f2105','F','854f2105@funs.com',2),(107,'be3ed106','M','be3ed106@funs.com',1),(108,'48d18107','M','48d18107@funs.com',1),(109,'d4193108','F','d4193108@funs.com',2),(110,'60036109','M','60036109@funs.com',1),(111,'49946110','M','49946110@funs.com',1),(112,'a6b83111','F','a6b83111@funs.com',2),(113,'fe4c8112','M','fe4c8112@funs.com',1),(114,'c70f1113','M','c70f1113@funs.com',1),(115,'83a48114','F','83a48114@funs.com',2),(116,'2c56e115','M','2c56e115@funs.com',1),(117,'be64b116','M','be64b116@funs.com',1),(118,'22bd1117','F','22bd1117@funs.com',2),(119,'995d4118','M','995d4118@funs.com',1),(120,'a33a4119','M','a33a4119@funs.com',1),(121,'0f705120','F','0f705120@funs.com',2),(122,'fa53d121','M','fa53d121@funs.com',1),(123,'9710f122','M','9710f122@funs.com',1),(124,'8d77a123','F','8d77a123@funs.com',2),(125,'35d74124','M','35d74124@funs.com',1),(126,'02d8b125','M','02d8b125@funs.com',1),(127,'ae013126','F','ae013126@funs.com',2),(128,'c1a26127','M','c1a26127@funs.com',1),(129,'8df0f128','M','8df0f128@funs.com',1),(130,'b338f129','F','b338f129@funs.com',2),(131,'1e843130','M','1e843130@funs.com',1),(132,'76761131','M','76761131@funs.com',1),(133,'c874d132','F','c874d132@funs.com',2),(134,'f0515133','M','f0515133@funs.com',1),(135,'fc043134','M','fc043134@funs.com',1),(136,'64382135','F','64382135@funs.com',2),(137,'7639b136','M','7639b136@funs.com',1),(138,'a24c7137','M','a24c7137@funs.com',1),(139,'eb4fc138','F','eb4fc138@funs.com',2),(140,'1a154139','M','1a154139@funs.com',1),(141,'faba2140','M','faba2140@funs.com',1),(142,'0f314141','F','0f314141@funs.com',2),(143,'20632142','M','20632142@funs.com',1),(144,'54677143','M','54677143@funs.com',1),(145,'12dbd144','F','12dbd144@funs.com',2),(146,'7912f145','M','7912f145@funs.com',1),(147,'6b0ac146','M','6b0ac146@funs.com',1),(148,'837ff147','F','837ff147@funs.com',2),(149,'21ec8148','M','21ec8148@funs.com',1),(150,'3d69f149','M','3d69f149@funs.com',1),(151,'0cca7150','F','0cca7150@funs.com',2),(152,'f41ac151','M','f41ac151@funs.com',1),(153,'40acb152','M','40acb152@funs.com',1),(154,'04fae153','F','04fae153@funs.com',2),(155,'17bfb154','M','17bfb154@funs.com',1),(156,'96f20155','M','96f20155@funs.com',1),(157,'84753156','F','84753156@funs.com',2),(158,'260d5157','M','260d5157@funs.com',1),(159,'118d8158','M','118d8158@funs.com',1),(160,'4fb56159','F','4fb56159@funs.com',2),(161,'abfaf160','M','abfaf160@funs.com',1),(162,'5e02a161','M','5e02a161@funs.com',1),(163,'85471162','F','85471162@funs.com',2),(164,'dbe4c163','M','dbe4c163@funs.com',1),(165,'ef14d164','M','ef14d164@funs.com',1),(166,'14b15165','F','14b15165@funs.com',2),(167,'e8e1e166','M','e8e1e166@funs.com',1),(168,'0ea9a167','M','0ea9a167@funs.com',1),(169,'af66d168','F','af66d168@funs.com',2),(170,'0f0ef169','M','0f0ef169@funs.com',1),(171,'8c247170','M','8c247170@funs.com',1),(172,'22870171','F','22870171@funs.com',2),(173,'aea73172','M','aea73172@funs.com',1),(174,'b1a82173','M','b1a82173@funs.com',1),(175,'a3149174','F','a3149174@funs.com',2),(176,'6b01f175','M','6b01f175@funs.com',1),(177,'c2dc3176','M','c2dc3176@funs.com',1),(178,'c408b177','F','c408b177@funs.com',2),(179,'9c90f178','M','9c90f178@funs.com',1),(180,'cfa51179','M','cfa51179@funs.com',1),(181,'49172180','F','49172180@funs.com',2),(182,'658d4181','M','658d4181@funs.com',1),(183,'0ac6a182','M','0ac6a182@funs.com',1),(184,'5fd7f183','F','5fd7f183@funs.com',2),(185,'4d938184','M','4d938184@funs.com',1),(186,'c435b185','M','c435b185@funs.com',1),(187,'325dd186','F','325dd186@funs.com',2),(188,'6866f187','M','6866f187@funs.com',1),(189,'95b91188','M','95b91188@funs.com',1),(190,'ec6df189','F','ec6df189@funs.com',2),(191,'215c9190','M','215c9190@funs.com',1),(192,'e76a9191','M','e76a9191@funs.com',1),(193,'b9b11192','F','b9b11192@funs.com',2),(194,'89747193','M','89747193@funs.com',1),(195,'a2eb6194','M','a2eb6194@funs.com',1),(196,'a721b195','F','a721b195@funs.com',2),(197,'2fb6d196','M','2fb6d196@funs.com',1),(198,'b8d73197','M','b8d73197@funs.com',1),(199,'e0114198','F','e0114198@funs.com',2);

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`id`,`username`,`password`) values (1,'kylewka','123456'),(9,'admin','123456');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
