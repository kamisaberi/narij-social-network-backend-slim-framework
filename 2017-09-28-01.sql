/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : NARIJ_00005

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2017-09-28 05:48:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for Comments
-- ----------------------------
DROP TABLE IF EXISTS `Comments`;
CREATE TABLE `Comments` (
  `CommentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Content` text COLLATE utf8_persian_ci NOT NULL,
  `Member` bigint(20) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Object` bigint(20) NOT NULL DEFAULT '0',
  `ObjectType` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `Parent` bigint(20) NOT NULL DEFAULT '0',
  `Situation` varchar(255) COLLATE utf8_persian_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`CommentId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Comments
-- ----------------------------
INSERT INTO `Comments` VALUES ('1', 'نلسنیلابنسن لبنتسسب نیتا بنتسیا سنتاس بنتسیاسنب تاسبنت اسنتا سنتیس ابنا', '1', '2016-04-30 01:02:39', '1', 'Product', '0', '3');
INSERT INTO `Comments` VALUES ('2', 'این متن برای تست می باشد', '3', '2016-04-30 01:02:39', '1', 'Article', '0', '1');
INSERT INTO `Comments` VALUES ('3', 'سشینلشسیناسشیتی انشتیا نتسیا نشتسای نتشاسنت اشنستیا شش\r\nی\r\nی \r\nشس\r\n ش\r\nی ش\r\n', '1', '2016-04-30 01:02:39', '2', 'News', '0', '1');
INSERT INTO `Comments` VALUES ('4', 'یشسی\r\nسش\r\nشسی\r\nشس\r\nیشس\r\nی\r\nی\r\nشی\r\nشس\r\nی\r\nشس', '2', '2016-04-30 01:02:39', '26', 'VideoPost', '0', '3');
INSERT INTO `Comments` VALUES ('5', 'این تست است<div>هها ها <span style=\"font-weight: bold; background-color: rgb(255, 0, 0);\">هاهاهاهاهاها</span></div>', '5', '2016-04-30 01:02:39', '1', 'Product', '0', '2');
INSERT INTO `Comments` VALUES ('6', '<p>dsdwe e</p><p> w</p><p>r</p><p> we</p><p>rw</p><p>er </p><p>wer</p><p><br></p>', '1', '2016-04-30 01:02:39', '1', 'Product', '0', '3');
INSERT INTO `Comments` VALUES ('7', '<p>ewrrwerewr wer we', '1', '2016-04-30 01:02:39', '1', 'Article', '0', '2');
INSERT INTO `Comments` VALUES ('8', '<p>rewrrwerewr wer wer we rwer wer wer </p>', '1', '2016-04-30 01:02:39', '3', 'Course', '0', '3');
INSERT INTO `Comments` VALUES ('9', '<p><span style=\"font-size: 24px;\">rwer wer wer wer wwer </span></p>', '1', '2016-04-30 01:02:39', '1', 'Article', '0', '3');
INSERT INTO `Comments` VALUES ('10', '<p>frrew ert ert erter ert ert er er</p>', '1', '2016-04-30 01:02:39', '1', 'Article', '0', '1');
INSERT INTO `Comments` VALUES ('11', '<p>erer wer wer wer we</p>', '1', '2016-04-30 01:02:39', '1', 'Product', '0', '3');
INSERT INTO `Comments` VALUES ('12', '<p>sads a as asd asd asd ada </p>', '1', '2016-04-30 01:02:39', '1', 'Product', '0', '1');
INSERT INTO `Comments` VALUES ('13', '<p>لللللللللللللللللللللللللللللللللللللللللللللللللللللللللللللللللللللللللللللللللللل</p>', '1', '2016-04-30 01:02:39', '1', 'Product', '0', '2');
INSERT INTO `Comments` VALUES ('14', '<p>بیب یسب سی سیس یسب سیب سییس یب سیی یبس سییب </p>', '1', '2016-04-30 01:02:39', '1', 'Article', '0', '1');
INSERT INTO `Comments` VALUES ('18', 'dsfdsf df dsf dsf sdf dsf dsf sdf ', '1', '2016-04-30 01:02:39', '1', 'Article', '0', '1');
INSERT INTO `Comments` VALUES ('19', 'dsfdsf df dsf dsf sdf dsf dsf sdf ', '1', '2016-04-30 01:02:39', '1', 'Article', '0', '1');
INSERT INTO `Comments` VALUES ('20', '<p>fddsf sf sf sdfsdf sdf </p>', '1', '2016-04-30 01:02:39', '1', 'Article', '0', '1');
INSERT INTO `Comments` VALUES ('21', '<p>asdasdsad</p>', '1', '2016-04-30 01:02:39', '1', 'Article', '0', '1');
INSERT INTO `Comments` VALUES ('22', '<p>ererwer</p>', '1', '2016-04-30 01:02:39', '1', 'Article', '0', '2');
INSERT INTO `Comments` VALUES ('24', '<p>شسیس شی شسی شسی شسی شسی شسی سشی سش یشس</p>', '1', '2016-04-30 01:02:39', '1', 'Article', '0', '3');
INSERT INTO `Comments` VALUES ('25', '<p>asddas</p>', '1', '2016-04-30 01:02:39', '1', 'Article', '0', '2');
INSERT INTO `Comments` VALUES ('28', '<p>asdsad as dasd asd asdasd asd asd asd asd aasd asd as</p>', '1', '2016-04-30 01:03:21', '1', 'Article', '0', '3');
INSERT INTO `Comments` VALUES ('29', '<p>ccccccccccccccccccccc</p>', '1', '2016-04-30 02:25:03', '1', 'Article', '0', '3');
INSERT INTO `Comments` VALUES ('30', '<p>dsadsa asd asd asd asd </p>', '1', '2016-05-01 04:18:30', '1', 'Product', '0', '3');
INSERT INTO `Comments` VALUES ('31', '<p>csdsad asd asd ad asd asd ad asd asd asd </p>', '1', '2016-05-04 02:23:50', '4', 'News', '0', '2');
INSERT INTO `Comments` VALUES ('32', '<p>dsdsad asd asd as sad asd </p>', '1', '2016-05-04 02:26:39', '1', 'Article', '0', '2');
INSERT INTO `Comments` VALUES ('33', '<p>fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</p>', '1', '2016-05-04 02:31:07', '4', 'News', '0', '2');
INSERT INTO `Comments` VALUES ('34', '<p>ewerwe wer werwe werwer wr wer wr  werewr wer ewr </p>', '1', '2016-05-04 02:33:35', '4', 'News', '0', '2');
INSERT INTO `Comments` VALUES ('35', '<p>sdas sad asd asd asd asd asd we wqwq eqw ewq weqw wq we qda,sjdhsa ajhdskj hakjd hsakjdh akjhd akjhdkjsdha kjhkjsh </p>', '1', '2016-05-04 02:35:12', '3', 'Course', '0', '1');
INSERT INTO `Comments` VALUES ('36', '<p>asdsd sads dad sad </p><p>sa</p><p> </p><p>sd </p><p>a</p><p>sd </p><p>asd</p><p><br></p>', '1', '2016-05-04 02:35:23', '3', 'Course', '0', '2');
INSERT INTO `Comments` VALUES ('37', '<p>w erew wer ew rewr ewr wer ewr wer wer er werwer were wer wewer </p>', '1', '2016-05-04 02:36:39', '3', 'Course', '0', '1');
INSERT INTO `Comments` VALUES ('38', '<p>dsad sd a</p><p>sd</p><p>a s</p><p>as</p><p>d </p>', '1', '2016-05-04 02:38:03', '26', 'VideoPost', '0', '2');

-- ----------------------------
-- Table structure for CommentSituations
-- ----------------------------
DROP TABLE IF EXISTS `CommentSituations`;
CREATE TABLE `CommentSituations` (
  `CommentSituationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `Description` varchar(500) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`CommentSituationId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of CommentSituations
-- ----------------------------
INSERT INTO `CommentSituations` VALUES ('1', 'Panding', '-');
INSERT INTO `CommentSituations` VALUES ('2', 'Allowed', '-');
INSERT INTO `CommentSituations` VALUES ('3', 'Denied', '-');

-- ----------------------------
-- Table structure for Follows
-- ----------------------------
DROP TABLE IF EXISTS `Follows`;
CREATE TABLE `Follows` (
  `FollowId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Member` bigint(20) NOT NULL,
  `Object` bigint(20) NOT NULL,
  `ObjectType` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `Situation` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `Time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`FollowId`)
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Follows
-- ----------------------------
INSERT INTO `Follows` VALUES ('302', '410', '411', 'Member', 'Confirm', '2017-09-21 00:40:55.761508');
INSERT INTO `Follows` VALUES ('303', '410', '415', 'Member', 'Confirm', '2017-09-21 00:40:56.392377');
INSERT INTO `Follows` VALUES ('304', '415', '410', 'Member', 'Confirm', '2017-09-21 00:40:56.897264');
INSERT INTO `Follows` VALUES ('305', '416', '411', 'Member', 'Confirm', '2017-09-21 00:40:57.384565');
INSERT INTO `Follows` VALUES ('306', '412', '413', 'Member', 'Confirm', '2017-09-21 00:40:57.840626');
INSERT INTO `Follows` VALUES ('308', '410', '412', 'Member', 'Confirm', '2017-09-21 00:40:58.402153');
INSERT INTO `Follows` VALUES ('309', '413', '412', 'Member', 'Confirm', '2017-09-21 00:40:58.898252');
INSERT INTO `Follows` VALUES ('310', '413', '414', 'Member', 'Confirm', '2017-09-21 00:40:59.399233');
INSERT INTO `Follows` VALUES ('311', '415', '411', 'Member', 'Confirm', '2017-09-21 00:41:00.142399');
INSERT INTO `Follows` VALUES ('331', '416', '410', 'Member', 'Confirm', '2017-09-21 00:42:33.058882');

-- ----------------------------
-- Table structure for FollowSituations
-- ----------------------------
DROP TABLE IF EXISTS `FollowSituations`;
CREATE TABLE `FollowSituations` (
  `FollowSituationId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FollowSituationId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of FollowSituations
-- ----------------------------
INSERT INTO `FollowSituations` VALUES ('1', 'Request');
INSERT INTO `FollowSituations` VALUES ('2', 'Confirm');
INSERT INTO `FollowSituations` VALUES ('3', 'Reject');

-- ----------------------------
-- Table structure for Friendships
-- ----------------------------
DROP TABLE IF EXISTS `Friendships`;
CREATE TABLE `Friendships` (
  `FriendshipId` bigint(20) NOT NULL AUTO_INCREMENT,
  `MemberOne` bigint(20) NOT NULL,
  `MemberTwo` bigint(20) NOT NULL,
  `FriendshipSituation` bigint(20) NOT NULL,
  PRIMARY KEY (`FriendshipId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Friendships
-- ----------------------------
INSERT INTO `Friendships` VALUES ('17', '1', '5', '1');
INSERT INTO `Friendships` VALUES ('18', '1', '3', '3');
INSERT INTO `Friendships` VALUES ('19', '1', '2', '3');
INSERT INTO `Friendships` VALUES ('20', '2', '3', '3');
INSERT INTO `Friendships` VALUES ('21', '3', '5', '3');
INSERT INTO `Friendships` VALUES ('22', '4', '20', '2');
INSERT INTO `Friendships` VALUES ('23', '18', '1', '3');
INSERT INTO `Friendships` VALUES ('24', '17', '1', '1');

-- ----------------------------
-- Table structure for FriendshipSituations
-- ----------------------------
DROP TABLE IF EXISTS `FriendshipSituations`;
CREATE TABLE `FriendshipSituations` (
  `FriendshipSituationId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `Description` varchar(2000) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`FriendshipSituationId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of FriendshipSituations
-- ----------------------------
INSERT INTO `FriendshipSituations` VALUES ('1', 'RequestedFromMemberOne', '-');
INSERT INTO `FriendshipSituations` VALUES ('2', 'RejectedFromMemberTwo', '-');
INSERT INTO `FriendshipSituations` VALUES ('3', 'FriendshipStablished', '-');
INSERT INTO `FriendshipSituations` VALUES ('4', 'RefusedBySender', '-');

-- ----------------------------
-- Table structure for Grades
-- ----------------------------
DROP TABLE IF EXISTS `Grades`;
CREATE TABLE `Grades` (
  `GradeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Member` bigint(20) NOT NULL,
  `Object` bigint(20) NOT NULL,
  `ObjectType` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `Value` float NOT NULL,
  `Date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`GradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Grades
-- ----------------------------
INSERT INTO `Grades` VALUES ('302', '1', '2', 'Member', '0', '2016-05-22 08:53:14.000000');
INSERT INTO `Grades` VALUES ('303', '2', '1', 'Member', '0', '2016-05-22 08:53:20.000000');
INSERT INTO `Grades` VALUES ('304', '1', '18', 'Member', '0', '2016-05-22 08:53:26.000000');
INSERT INTO `Grades` VALUES ('305', '1', '6', 'Member', '0', '2016-05-22 08:53:33.000000');
INSERT INTO `Grades` VALUES ('306', '5', '1', 'Member', '0', '2016-05-22 08:53:39.000000');
INSERT INTO `Grades` VALUES ('308', '1', '20', 'Member', '0', '2016-05-22 08:54:10.000000');
INSERT INTO `Grades` VALUES ('309', '2', '3', 'Member', '0', '2016-05-22 08:54:19.000000');
INSERT INTO `Grades` VALUES ('310', '3', '4', 'Member', '0', '2016-05-22 08:54:50.000000');
INSERT INTO `Grades` VALUES ('311', '15', '1', 'Member', '0', '2016-05-22 08:55:32.000000');
INSERT INTO `Grades` VALUES ('312', '14', '1', 'Member', '0', '2016-05-22 08:55:37.000000');
INSERT INTO `Grades` VALUES ('313', '13', '1', 'Member', '0', '2016-05-22 08:55:54.000000');
INSERT INTO `Grades` VALUES ('314', '1', '19', 'Member', '0', '2016-05-22 08:56:10.000000');
INSERT INTO `Grades` VALUES ('315', '30', '1', 'Member', '0', '2016-05-22 08:57:15.000000');
INSERT INTO `Grades` VALUES ('316', '29', '1', 'Member', '0', '2016-05-22 08:57:20.000000');
INSERT INTO `Grades` VALUES ('317', '1', '25', 'Member', '0', '2016-05-22 08:57:24.000000');
INSERT INTO `Grades` VALUES ('318', '1', '26', 'Member', '0', '2016-05-23 14:43:37.000000');
INSERT INTO `Grades` VALUES ('319', '25', '108', 'Member', '0', '2016-05-23 01:19:36.000000');
INSERT INTO `Grades` VALUES ('321', '1', '7', 'Member', '0', '2016-06-03 18:46:50.000000');
INSERT INTO `Grades` VALUES ('322', '1', '13', 'Member', '0', '2016-06-03 18:46:58.000000');
INSERT INTO `Grades` VALUES ('323', '1', '94', 'Member', '0', '2016-06-03 18:47:00.000000');
INSERT INTO `Grades` VALUES ('324', '1', '98', 'Member', '0', '2016-06-03 18:47:00.000000');
INSERT INTO `Grades` VALUES ('325', '1', '23', 'Member', '0', '2016-06-03 18:47:01.000000');
INSERT INTO `Grades` VALUES ('326', '1', '22', 'Member', '0', '2016-06-03 18:47:08.000000');
INSERT INTO `Grades` VALUES ('327', '1', '10', 'Member', '0', '2016-06-03 18:47:08.000000');
INSERT INTO `Grades` VALUES ('328', '1', '21', 'Member', '0', '2016-06-03 18:47:09.000000');
INSERT INTO `Grades` VALUES ('329', '1', '24', 'Member', '0', '2016-06-08 05:06:06.000000');
INSERT INTO `Grades` VALUES ('330', '1', '15', 'Member', '0', '2016-06-08 05:06:07.000000');

-- ----------------------------
-- Table structure for Keywords
-- ----------------------------
DROP TABLE IF EXISTS `Keywords`;
CREATE TABLE `Keywords` (
  `KeywordId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`KeywordId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Keywords
-- ----------------------------
INSERT INTO `Keywords` VALUES ('39', 'casdadsa');
INSERT INTO `Keywords` VALUES ('40', 'dsas');
INSERT INTO `Keywords` VALUES ('41', 'sdfdsfdsf');

-- ----------------------------
-- Table structure for Likes
-- ----------------------------
DROP TABLE IF EXISTS `Likes`;
CREATE TABLE `Likes` (
  `LikeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Value` tinyint(4) NOT NULL,
  `Member` bigint(20) NOT NULL,
  `Post` bigint(20) NOT NULL,
  `Date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `Token` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`LikeId`)
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Likes
-- ----------------------------
INSERT INTO `Likes` VALUES ('385', '1', '1', '8', '2016-07-03 11:10:44.182150', '');

-- ----------------------------
-- Table structure for Logins
-- ----------------------------
DROP TABLE IF EXISTS `Logins`;
CREATE TABLE `Logins` (
  `LoginId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Description` varchar(2000) DEFAULT NULL,
  `LoginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Token` varchar(255) DEFAULT NULL,
  `Member` bigint(20) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LoginId`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Logins
-- ----------------------------
INSERT INTO `Logins` VALUES ('2', '410  logged in', '2017-09-19 02:49:24', 'b8da3a17a8350e993d92af6919b7b169a97ccc2c539b704a7ab5c3f4b3a978b0ce5c8ba47a437d53027d5f359eb83027757ee37d4530c7aff217794868fa9471', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('3', '410  logged in', '2017-09-19 02:49:54', 'b9788ac0eea14a4905f573d0b2979fd8cc76e8c28a4000bc9683492d2d090bf73534fd21ef8e44d669ed4b97fa58921f2f796b6fedfba436f58989a7cab70a5a', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('4', '410  logged in', '2017-09-19 02:50:36', '619d231e4218ff45ebccc816a473a3a393330515ed529d9c2b62dde597e80ac3fa7145588a392c65d7a69d1f5461ed7fd2d54b820a333511f80940076cb38eaa', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('5', '410  logged in', '2017-09-19 02:51:27', '407523da0fe8abb6dc532c7abad5125037ee688ff44e4d19299a6dba3bb473b3a2339029926ab025b26eec197fb7fefc9d2e669442387d03fb200ae7567dd214', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('6', '410  logged in', '2017-09-19 06:18:32', '698c6335187925abf065294341e87d402796e69eb9dbf2c504917f972f9a2693103fabff976c6e316617cdb999ecde7499b8f5934e13a74c34fb85e13b2d7ac4', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('7', '410  logged in', '2017-09-19 22:33:04', '05779493d63a9105d72bacd31bf9a5db89b17338f88c2ce27dcbbe9bc78084d497746aa53d00674fc226286928ded97be4ab12e79379ce74af3aad7f6d872782', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('8', '410  logged in', '2017-09-19 22:35:37', 'a28fefae781391a240e1ae3b6beb4ecac92b8a8d563ce5e6df31551060b0e4230fb1f64311b5d17411bbea5f0c9c6eb7750a3b023160b686d3e274c4a95af311', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('9', '410  logged in', '2017-09-19 22:44:13', '815d4639acde8ab6eb0acd13f406441cbdb0892ee0ce71f4bb8f7a1d165f8b085077fc10e3b34f36fb2c8a6c78e4b961c4010b1a934dcb701d0f8e12c053ac69', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('10', '410  logged in', '2017-09-19 22:48:25', '3e284c6883db8352daebe1fecaddbeb0d0f1ef867dd7aa9a67adb1330e18efba31e524e62a53c96b5341088e0e23351317e1ee88723538c47b8df42c3216d6d7', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('11', '410  logged in', '2017-09-19 23:00:14', 'a0f97d0e69a234285ecc63a22e968095d1ca8a31b8b66e5272a190926c1032613ea3dde3d32f5c887bcfcf6fa6e7fdd21c99d433d8f96685b2bc8bd273b9d724', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('12', '410  logged in', '2017-09-19 23:01:39', 'a0fa3ed8e7a0db2a12a09693bb19620d06d4933b6d1e564dcd8fac126fe362c7d76dd2fd844d98fce60d7d04e2a1c9ee4720ce0f817cca2e682b4f1a53e2ef2d', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('13', '410  logged in', '2017-09-19 23:02:42', '5b9d3edb97e83818b394f6489518aee43775c85a5313d56a67a533542b99359c04afc2c94245e66de74b38707cc1d4f1b64e4665c1f27ccc98ac9cdb04fee6d5', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('14', '410  logged in', '2017-09-19 23:07:26', '37c64af68ca4a64e8793560100d3e5c8e9666ea2a0c3572a02b4bccae1e01b8a294c773b4b1f11433406eca06db1c1f688bbe7882af15565ca7d0a14138362cd', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('15', '410  logged in', '2017-09-19 23:09:26', 'e7ccd7bda69528dd7770718815e8b5a0eb1d96d3d6ea72c6727f72353ed54214e0981d3c6dca34f56471fddbe3398ba837d0f87d8c0e64f9e8999f32fea9d842', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('16', '410  logged in', '2017-09-19 23:11:54', 'bdb6a2eeb1893409a2c3f4a1ddfdd91f0cdd3cfa99734433212e6a9e1bef394417aa35626a2ede14a27ec31f124f591941b72a24cfb10196da03a5e6bbd0695b', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('17', '410  logged in', '2017-09-19 23:14:56', 'ee3d967c6b055f59618b11684c6be559bea6239f185b45a64a55b4c871c0a03fa74abec5cc644a1a1bfb852ff5e1f2eb207a2fb5d7e17028dbeadb0862e4a81b', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('18', '410  logged in', '2017-09-19 23:17:27', '2c8b10f2d050a9069d6d357989cdb6e401378b1a68740e2a99eec37104e16baa6c657b96345c6e30b724cc6591bb60d237fc91bf4a1af09db5539ec40b3db394', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('19', '410  logged in', '2017-09-19 23:57:31', 'a03dcff7937cf0fcbb37b569b9dd795b8b40cebc602ef9085a5169d254f0aed4ca72cf01297f05fc6f7c90a9f90823db3c94af23d4cfd25ebb0d877bd46946e1', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('20', '410  logged in', '2017-09-20 00:09:49', '673597eeceae155c2b4831fd25ba503d6f94d8ea147abbe2366769b182af8aa3a9b66575607b611f0b41dec76f55aab0b931c8a650faf3e15de896c2b13320bd', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('21', '410  logged in', '2017-09-20 00:11:03', '60fff6aa7df83153ff68fc520f931fdb73e6941349da7b0d7a626ab51c220b296d8fe7c3a92d6721d5aaac444dc6eea9ed38c97f89e5648e7a92d201e3bd7522', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('22', '410  logged in', '2017-09-20 00:37:13', 'a0e51e013c115b9477b5634b7164a53741fa79c0ef14f3b71c371e6dd8cd48729eb14a6b10b6e111772a12fd24dad1730ebb754c55160b76a7ce7f3adb4f54bf', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('23', '410  logged in', '2017-09-20 00:38:50', '5416159c3626fab9783a0304e8f94e7b22e042d427caf1180e0333a3cc175d9f61f2da502e7ede24a52eea34e49b9b7176e48c74a1a7094d9d7b60620ac36a52', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('24', '410  logged in', '2017-09-20 00:40:51', '30eeb8f6415e04021afc6b76b4648918d53d3cc25958d10d2ba45f0f659c9df79132e8e1b6bba226363256bb984599bca78e56cb65329db05794d9b8c3384131', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('25', '410  logged in', '2017-09-20 08:07:34', '2e08209aedbb46425812ae578c324ef108bfb0b7c4c2e35307dd26740a461b3d1f33b41b0987028aabd4cf4462941aa7fc8fbfc836ed401d785adba4e78f6bf2', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('26', '410  logged in', '2017-09-20 08:08:12', '2eeb584d6e7a308ce5c0190c779b847fd41ca516a9057e7e9bb170456f8b96251b77c57b0033da0689c36df285dab22a256c3c43b4797c7dcf2ea517f977fa3c', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('27', '410  logged in', '2017-09-20 08:10:04', '08b1f3c789651f4b67c81fccaae515b48954919218ff14acd0b2d1343b523fa47b0d0f1a322d128b90f89bd54b141e8059915d4b83eeb2468cc46b889a077534', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('28', '410  logged in', '2017-09-20 08:12:31', 'c626c536220da26c9d9d2d7f31be3192b04b1723e8cfa478d0e13aa3d8791701d2e3840aa81e92780a99510ed841b2ce2949552a5f59b3eee4c464da28615b0b', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('29', '410  logged in', '2017-09-20 08:17:52', 'b6b942fd782b11cf962d3dfdd8cbdc8178b5b6556b98e6b5bbca2dedebbce6b54ae4d22a4e21ee8c620be319d8d3ab92d3834e69fc2d0680b5d77d4d8ff80729', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('30', '410  logged in', '2017-09-20 08:20:20', 'b7c741bd903f3125186e82b631741788ce7b751fb47cbff62b52980883eb4a00ed11171405c0969b0a6cc8a9f53a7266080eb3489d2251d6611debdea57c6ebe', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('31', '410  logged in', '2017-09-20 08:24:51', 'bc0c03e0f9dd8aaa22c64259ab468baac697f96a5844748e629242b0e0fd98b3611567dc79a26048e9e3f3cdadb9d81cce524528eea28050215fa5a6815029f3', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('32', '410  logged in', '2017-09-20 08:50:17', '30e3963e6d4fdb2afac49cfa600ab4fde3dba6b03fc86bb26529eb151f6a1659119ea9b7899498f42fe9ce5d31be39f8abe2ac6470eb7d51665fdd1a857e2df9', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('33', '410  logged in', '2017-09-20 09:22:54', '97f193b1c046510185c026eda8bcebca81531c997d5dbe418eb243a0a9f66c6a7cb591120afa4533f1052d058642425680a3f1707788f6037120b046d3641908', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('34', '410  logged in', '2017-09-20 09:23:30', '73d96b8f8239d8ba9273d167e3af2be79fbb922ac6f59bfd84463169dd5ee37cda0a36b1d5ab916a364e977e0b1e7a2e90e46aa31b35a8175477f67be15df4f7', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('35', '410  logged in', '2017-09-20 09:27:38', '9acd8bacc8cbf8e4870e5d2a4521b28bd14777927bc0414e21d300ca90d23e34a87904b20fdce2f550188a7868582fc993bce34b285bc733ad1bdc81f296b8f6', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('36', '410  logged in', '2017-09-20 09:32:49', '4593fa8292c43cd584fee502ebbaaa03bb1eeee8bce4bdb7937dfd9e889fcdfacb27af0fb0536fe5b49b6c545cd26dcf42d031fcb302fd25101c1f484d2bb9cc', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('37', '410  logged in', '2017-09-20 09:35:53', 'd9a79c48fac9f666410ad00dcaf04309a7b5805d65b4443689d13c6fb1c38c24def934697548426dd20aae8a093a7c154be20a2bdc30895ececb9a18b8297958', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('38', '410  logged in', '2017-09-20 09:37:02', 'ee89af46a688fc0fc50756276ff6d898af0e0f1cec281739dc8bd516bf25e5e31ea7612eb06b0a0a2f2b24b3d21b770b3453d01a2ac7ddd016471182cb63d3c6', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('39', '410  logged in', '2017-09-20 09:38:40', 'fd682dbe935734034f625cf275f19c32e4de760dab91a38374097f4d747f205b30843cdd01feb75037b3318bf754a1069d6a7c739c8931bcc5a977cf90c814d9', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('40', '410  logged in', '2017-09-20 09:41:04', 'f873bd223a13bb420ab489af835962734a61a915b39e801594a6c24d8db9284353336aa9514e5c5466e92f9b9ea2c40b9251f8cf5c670ee66d97d8b0689b79c0', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('41', '410  logged in', '2017-09-20 09:44:41', 'a8b7b3314dc9e26e2a7beed4a491ca86d3b3ee8eb0ecc467668931aa085b4f44fd72d698a0560e31cfb5836b99723bce8ff0ae46d2563b0b16a0ceb6bce29f01', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('42', '410  logged in', '2017-09-20 10:24:28', '344b7efdc5c0d494660e5df3fcd030b48c4a64f17aa380861af97054d57c972098c546734847b30cd7c5cd32ac70c7097da63f2bb3f240337ba00eb512b274d3', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('43', '410  logged in', '2017-09-20 10:28:26', 'a6aa7b2e7f709173cab6e2a32524b3f96bcbd34ce298ba8e069cad8b7688c315a0066313a4e970c0b9fb6c943a9950a1d68920dcaedd79c3c3d5916b822d6b7c', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('44', '410  logged in', '2017-09-21 08:45:38', '160f247af18b9928cd144bef66e08f42a334c0d9f46e49251a80d298f097a8dfcef7ea9c8983ea5d542346d0e93f63365b4fac44064238992117bff35a5bc41d', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('45', '410  logged in', '2017-09-21 08:47:16', 'c57c69c6c5c7010ac2995ed0a4a38be5d530f087d2b8509191f7c088aa72ec29a36868fbf69d9d1dee0358c8f45be7cd7b5eee8225aab10364e9c9ade8927f1b', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('46', '410  logged in', '2017-09-21 09:39:27', '2e661ea061fdc31bcb777fa63f545450acc10fdfd8cf921293a72c71a46b13c82371f8cc7fd3ec93b42ec376ec4e2631e62786c18eaf9c837d6466a8f8fa50a7', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('47', '410  logged in', '2017-09-21 10:06:00', '9a5bd1d990bb16641c7e72936b4f430bda326e93fae340d1606a259105468c78e9a00d2a90bfa05ac1bdf2966225efb4dfc321c2169780ba92d348b519c2050e', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('48', '410  logged in', '2017-09-21 11:11:18', 'ff8b61d0ef35fa77016ab5d22d59edbf88e0f40e954ab38d55b56af15810872f30f2b5ce7d7754f2f390b6ef0bd33396e68445d4d8e58bf60d4f1f51824709b4', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('49', '410  logged in', '2017-09-21 11:13:01', 'cf2005a3e5de8c91c96b3b283c82a650c4ffeba9cbd379696d38f36301b398ce895a14da67e3ad7bd214aec9eb908aa497ed4b9ab11f5aadd46ddba228702d61', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('50', '410  logged in', '2017-09-21 11:47:39', '04a58c56d1ec4c234716d70602ca4354c113a229b954d964e44dbdedb94440d17f019c382c6306ecefebec288e97a011ad02ff5544e66300f2afe7c8df23fff9', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('51', '410  logged in', '2017-09-21 12:28:14', '08ebceb040956d343a667812bc7ad035328f354328a3bfe4fee7a81a4e257b9ca09faa29989f3cd1ea20fe9bd9d01ae52375d746e7c98e3cec9fd260a5153dca', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('52', '410  logged in', '2017-09-22 01:10:29', 'eb6a79e3f8ee9a8b01d97226a51f0643d3b9549f87d9ea7ad8c023ce9773afa0831a5ae74ed3a08a6a52be20a1dba37a224064630c24e171fd0be4c2fcd697de', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('53', '410  logged in', '2017-09-22 01:11:47', '34bcb652d019920a38033be055a008f1926eeef17160c2e37b7d376a318308eb0756282569fdc2cfeb814d8de4d9c0b336bb1570ad050e4ba020e78e28e8a049', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('54', '410  logged in', '2017-09-22 01:13:23', '7b21ba63e45700ac49cbb18f1aa5d42a0871498bcc3075e41b6a8b300ade44c8e292082aab1bfd324f612190b007365698de46b7d8c86dd815d224e0df00e65a', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('55', '410  logged in', '2017-09-22 01:16:12', 'eab057b7799826444f1e8f0621db2ba75331fec203837036a016b493d49c605950a8f9e3e42ea1f0aa894feb620864736c580d7a695bcfcca235a16929285275', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('56', '410  logged in', '2017-09-22 01:17:44', '40c29860eb5d927795d852c109c3789d484784a9a492857000ce35d2be2e3474f34b6ddb3b75cd64d990e441db97ffb3b1b1b2fc94538f04ebe3579721f4e012', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('57', '410  logged in', '2017-09-22 01:18:58', 'ac5a7eab224d16e30f6c4afdee62b0db9c3d1248f5c05351d538895e1df65f105c53cb7375a1df326d8610b1032d42bdd264d70c4d10600849ec1c6cb4e1cd5f', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('58', '410  logged in', '2017-09-22 01:22:12', '0adf0e2e83aa5a96b427430c7f2cadbf02d537dbdde7fbebf1b83eddc1372a8686f0071de6bf6df070dcb7e93f4729555a012faa1c336bd1569bd6af4a945cfc', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('59', '410  logged in', '2017-09-22 01:24:20', '4ec2fdc91ede8c35cfa35250c480d43a03b2855000107bae614a7901aef1b4bf4177755207108d898ac6a3e2efba84dfe45fd19fe6e7e2389fe0bc236a1ab627', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('60', '410  logged in', '2017-09-22 01:33:44', '5f215ec4f0462a8fd86afa125688db434769e495e1eeee9f4088285d0ad73b8f082211a5649a6d37b6ddd262eff60d56b1e792530b6418e80898d9a24ddcd995', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('61', '410  logged in', '2017-09-22 03:10:28', '5fb702c3e5b96c9a5541c7b404d017f9ec8ed340eed2acae951f38430c7d69a63812b7d9e2e02e42181c58117b5aeb55c14dd746cbd9ea5fb713a96d616159cb', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('62', '410  logged in', '2017-09-22 05:08:03', '098e7ab7b79437cbf65132b1263ef8c84126a31e7b92e619df2e9e0bbc842c5909ac2bffd68e44f20ade109a5931e8c6563e3a8ad84bd428a5ad8ca2f782f0dd', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('63', '410  logged in', '2017-09-22 05:22:22', 'b500d05379f5ae320f5d7b867c1afae6f5406bf62d6b38818943b05c202e8e28fb66105472b57c1402a92ac2ad92bf10822706ec18888f4f1e25c74db05d364a', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('64', '410  logged in', '2017-09-23 07:44:30', '8750cd8f0d01b847ba166fdc4dc3063c966030217dc331b24084ab0cdb6d08fe124bedb716cc7b9e6d659f47b84a83f0a58060d4b281d3a6b0bf02ed190307f2', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('65', '410  logged in', '2017-09-23 08:07:26', '3ba4364582cff2c6dcdc4b978cfafd18aa28d86258f5817b58b47d8c93c6850568f5213201ee6a0f9a938fe008bd58f13aa8692155baa9cd2386c01bef0d138c', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('66', '410  logged in', '2017-09-23 08:09:09', 'f25bbb3d155389cf450cad1f01524bfa788d02e8b8b83f055dcaca8571f76736f65da0a6334a94b3020155984788fcac72cc4d14ebe5370c2e429407fccd2811', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('67', '410  logged in', '2017-09-23 08:14:53', '5cd6adb56f84f5900d0232a932cc238b16d9b972de8964dd2b63955d3df2a7f7176b3546d27d05aa9fd74680ad7fd43be49e6f707969f20e4b13b79eae347ff2', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('68', '410  logged in', '2017-09-23 08:15:20', '937cfec29e735ec2394831f5f24e3ad80758098aa90564fd1ac4b1375ca3fc295c97f6c16af7f056b904df487279ac70de90a961c1772d5cec107146e8d0633a', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('69', '410  logged in', '2017-09-23 08:16:37', 'e42768ac662f47bcda9346aa34f563a8a5fd3e674a2eb748a819cd00c25efdbd89a88576b31e3bf460f84f76b5fffbdc7a8a4cc35dfcec02ad2e29de1a39e0e3', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('70', '410  logged in', '2017-09-23 08:31:11', 'e8d27c9f7bbb2014226d97a45ec60fb31e9f4f114d8c1c3a876506dac767ddc9b3a8fee64b8094b83db5c094c7152572dda4cea37bf4c2dc39be02b08eb05403', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('71', '410  logged in', '2017-09-23 08:36:49', 'b9a2412e52d2827e36e4a89213706efd524669bff073115375b3942eda5aeb9921c3159d1bff44fd45dc3b7f06fb548babfdeacfaa0cfd3c02a1d56935ffdf4c', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('72', '410  logged in', '2017-09-23 08:37:05', 'bbe39bfe2ebbceaa3c3bf6f62b864b76d21570c7a83f89433d45d3b4cffd24b71ee2e4d21b5fd14dca0a5078b07ea8e5b673892fa4e8b77353e865aa3449c090', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('73', '410  logged in', '2017-09-23 08:40:42', '8f390069b830cceac622a2830dbe29ed29c25d0228c90e0aa050f344a2679c72dc99bb5a2cc51fb8567a51c5ae1bb782ed5bbc7a1d1721c24795930b3212bfdc', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('74', '410 logged in', '2017-09-25 02:48:11', '2c6eba6eb4f39e3d1a0f7dcbc0726b307aa545cc07d828da0fe2a9695e6b175630daf1a31a8dea9338bd9cf1ec183c9635134ecd834be2db052e84bd824dab74', '410', '::1');
INSERT INTO `Logins` VALUES ('75', '410 logged in', '2017-09-25 02:49:08', 'ad1e4f6cc38310156a00c2a046103bfb233d48814bf011b506b25df7e5a3c4370b5ba9f1310b019ebd4a21d5c9b5d114f7721adfc38b602bab5c3b899215770d', '410', '::1');
INSERT INTO `Logins` VALUES ('76', '410 logged in', '2017-09-25 02:50:29', '788ee4147c90c431a67a9ca446541f54d4b726d01bd664e417230481631a2e3435afde4b261bbbd861daf5197d5c5911d7dd4ff47572906b509ae5c6bae8acb8', '410', '::1');
INSERT INTO `Logins` VALUES ('77', '410 logged in', '2017-09-25 02:50:54', '9edabd27da59dcc57ddce498a0babf4e273ff6c4e382a2ffc3a7478019eda67d134417be170b35198d989f9a26a18f854c321a1fd0a26beb931805abc9d2c2c0', '410', '::1');

-- ----------------------------
-- Table structure for Logs
-- ----------------------------
DROP TABLE IF EXISTS `Logs`;
CREATE TABLE `Logs` (
  `LogId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Member` bigint(20) NOT NULL,
  `Object` bigint(20) NOT NULL,
  `ObjectType` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `Content` text COLLATE utf8_persian_ci NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Parent` bigint(20) NOT NULL,
  PRIMARY KEY (`LogId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Logs
-- ----------------------------

-- ----------------------------
-- Table structure for MediaTypes
-- ----------------------------
DROP TABLE IF EXISTS `MediaTypes`;
CREATE TABLE `MediaTypes` (
  `MediaTypeId` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MediaTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of MediaTypes
-- ----------------------------
INSERT INTO `MediaTypes` VALUES ('1', 'Text');
INSERT INTO `MediaTypes` VALUES ('2', 'Photo');
INSERT INTO `MediaTypes` VALUES ('3', 'Audio');
INSERT INTO `MediaTypes` VALUES ('4', 'Video');

-- ----------------------------
-- Table structure for MemberMemberTypes
-- ----------------------------
DROP TABLE IF EXISTS `MemberMemberTypes`;
CREATE TABLE `MemberMemberTypes` (
  `MemberMemberTypeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `MemberType` bigint(20) NOT NULL,
  `Member` bigint(20) NOT NULL,
  PRIMARY KEY (`MemberMemberTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of MemberMemberTypes
-- ----------------------------

-- ----------------------------
-- Table structure for MemberPost
-- ----------------------------
DROP TABLE IF EXISTS `MemberPost`;
CREATE TABLE `MemberPost` (
  `MemberPostId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Member` bigint(20) NOT NULL,
  `Post` bigint(20) NOT NULL,
  `ArticleSituation` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MemberPostId`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of MemberPost
-- ----------------------------
INSERT INTO `MemberPost` VALUES ('66', '410', '12', '0');
INSERT INTO `MemberPost` VALUES ('67', '410', '13', '0');
INSERT INTO `MemberPost` VALUES ('68', '410', '14', '0');
INSERT INTO `MemberPost` VALUES ('69', '411', '15', '0');
INSERT INTO `MemberPost` VALUES ('70', '412', '16', '0');

-- ----------------------------
-- Table structure for MemberRoles
-- ----------------------------
DROP TABLE IF EXISTS `MemberRoles`;
CREATE TABLE `MemberRoles` (
  `MemberRoleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `Description` varchar(2000) NOT NULL,
  PRIMARY KEY (`MemberRoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of MemberRoles
-- ----------------------------
INSERT INTO `MemberRoles` VALUES ('1', 'ابر مدیر', '-');
INSERT INTO `MemberRoles` VALUES ('2', 'مدیر', '-');
INSERT INTO `MemberRoles` VALUES ('3', 'طراح آزمون', '-');
INSERT INTO `MemberRoles` VALUES ('4', 'طراح سر فصل', '-');
INSERT INTO `MemberRoles` VALUES ('5', 'مدیر محصولات و پروژه ها', '-');
INSERT INTO `MemberRoles` VALUES ('6', 'مدیر مقالات', '-');
INSERT INTO `MemberRoles` VALUES ('7', 'مدیریت اعضاء', '-');
INSERT INTO `MemberRoles` VALUES ('8', 'عضو', '-');
INSERT INTO `MemberRoles` VALUES ('9', 'خالق شرکت', '-');
INSERT INTO `MemberRoles` VALUES ('10', 'خالق آموزشگاه', '-');
INSERT INTO `MemberRoles` VALUES ('11', 'دانشجو', '-');
INSERT INTO `MemberRoles` VALUES ('12', 'عضو شرکت', '-');
INSERT INTO `MemberRoles` VALUES ('13', 'مدرس', '-');

-- ----------------------------
-- Table structure for Members
-- ----------------------------
DROP TABLE IF EXISTS `Members`;
CREATE TABLE `Members` (
  `MemberId` bigint(20) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `Profile` text COLLATE utf8_persian_ci NOT NULL,
  `Sex` varchar(10) COLLATE utf8_persian_ci NOT NULL,
  `BirthDate` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `Address` varchar(400) COLLATE utf8_persian_ci NOT NULL,
  `Phone` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `Username` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `Email` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `MemberType` bigint(20) NOT NULL,
  `VerificationCode` varchar(10) COLLATE utf8_persian_ci NOT NULL,
  `Active` bit(1) NOT NULL DEFAULT b'0',
  `Parent` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MemberId`)
) ENGINE=InnoDB AUTO_INCREMENT=417 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Members
-- ----------------------------
INSERT INTO `Members` VALUES ('410', 'ali reza', '', '', '', '', '09365982333', '', 'kamisaberi@yahoo.com', '1234', '0', '68683', '', '0');
INSERT INTO `Members` VALUES ('411', 'reza', '', '', '', '', '09365892454', '', 'test1@yahoo.com', '1234', '0', '68683', '', '0');
INSERT INTO `Members` VALUES ('412', 'ahmad', '', '', '', '', '09112524568', '', 'ali@gmail.com', '1234', '0', '68683', '', '0');
INSERT INTO `Members` VALUES ('413', 'hassan hassani', '', '', '', '', '09012458796', '', 'reza@mail.com', '1234', '0', '68683', '', '0');
INSERT INTO `Members` VALUES ('414', 'hossein', '', '', '', '', '09374521598', '', 'alireza@hotmail.com', '1234', '0', '68683', '', '0');
INSERT INTO `Members` VALUES ('415', 'hamed', '', '', '', '', '09124578963', '', 'ahmadi9878@mail.ru', '1234', '0', '68683', '', '0');
INSERT INTO `Members` VALUES ('416', 'hadi', '', '', '', '', '09135478526', '', 'karim.sh@noavar.com', '1234', '0', '68683', '', '0');

-- ----------------------------
-- Table structure for MemberTeam
-- ----------------------------
DROP TABLE IF EXISTS `MemberTeam`;
CREATE TABLE `MemberTeam` (
  `MemberTeamId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Member` bigint(20) NOT NULL,
  `Team` bigint(20) NOT NULL,
  `TeamSituation` bigint(20) NOT NULL,
  PRIMARY KEY (`MemberTeamId`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of MemberTeam
-- ----------------------------
INSERT INTO `MemberTeam` VALUES ('1', '1', '1', '1');
INSERT INTO `MemberTeam` VALUES ('2', '2', '1', '1');
INSERT INTO `MemberTeam` VALUES ('3', '5', '1', '1');
INSERT INTO `MemberTeam` VALUES ('4', '5', '2', '1');
INSERT INTO `MemberTeam` VALUES ('5', '4', '2', '1');
INSERT INTO `MemberTeam` VALUES ('6', '7', '2', '1');
INSERT INTO `MemberTeam` VALUES ('7', '6', '1', '1');
INSERT INTO `MemberTeam` VALUES ('8', '1', '3', '1');
INSERT INTO `MemberTeam` VALUES ('9', '2', '3', '1');
INSERT INTO `MemberTeam` VALUES ('10', '7', '3', '1');
INSERT INTO `MemberTeam` VALUES ('51', '6', '2', '1');

-- ----------------------------
-- Table structure for MemberTypes
-- ----------------------------
DROP TABLE IF EXISTS `MemberTypes`;
CREATE TABLE `MemberTypes` (
  `MemberTypeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `Description` varchar(2000) NOT NULL,
  PRIMARY KEY (`MemberTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of MemberTypes
-- ----------------------------
INSERT INTO `MemberTypes` VALUES ('1', 'حقیقی', '-');
INSERT INTO `MemberTypes` VALUES ('2', 'شرکت', '-');
INSERT INTO `MemberTypes` VALUES ('3', 'آموزشگاه', '-');

-- ----------------------------
-- Table structure for Messages
-- ----------------------------
DROP TABLE IF EXISTS `Messages`;
CREATE TABLE `Messages` (
  `MessageId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Member` bigint(20) NOT NULL,
  `Object` bigint(20) NOT NULL,
  `ObjectType` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `Content` text COLLATE utf8_persian_ci NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Parent` bigint(20) NOT NULL,
  PRIMARY KEY (`MessageId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Messages
-- ----------------------------

-- ----------------------------
-- Table structure for ObjectTypes
-- ----------------------------
DROP TABLE IF EXISTS `ObjectTypes`;
CREATE TABLE `ObjectTypes` (
  `ObjectTypeId` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ObjectTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ObjectTypes
-- ----------------------------
INSERT INTO `ObjectTypes` VALUES ('1', 'Post');
INSERT INTO `ObjectTypes` VALUES ('2', 'Role');
INSERT INTO `ObjectTypes` VALUES ('3', 'Team');

-- ----------------------------
-- Table structure for Options
-- ----------------------------
DROP TABLE IF EXISTS `Options`;
CREATE TABLE `Options` (
  `OptionId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Key` varchar(2000) COLLATE utf8_persian_ci NOT NULL,
  `Value` varchar(2000) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`OptionId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Options
-- ----------------------------
INSERT INTO `Options` VALUES ('1', 'Allow Add Comments', '1');

-- ----------------------------
-- Table structure for PostCategories
-- ----------------------------
DROP TABLE IF EXISTS `PostCategories`;
CREATE TABLE `PostCategories` (
  `PostCategoryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  PRIMARY KEY (`PostCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of PostCategories
-- ----------------------------
INSERT INTO `PostCategories` VALUES ('1', 'General');
INSERT INTO `PostCategories` VALUES ('2', 'QA');

-- ----------------------------
-- Table structure for Posts
-- ----------------------------
DROP TABLE IF EXISTS `Posts`;
CREATE TABLE `Posts` (
  `PostId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(2000) DEFAULT NULL,
  `Description` varchar(2000) DEFAULT NULL,
  `MediaType` varchar(255) DEFAULT NULL,
  `CreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EditTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DeleteTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Deleted` bit(1) DEFAULT b'0',
  `PostCategory` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PostId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Posts
-- ----------------------------
INSERT INTO `Posts` VALUES ('12', '\"T1\"', '\"CCCCC1\"', 'Image', '2017-09-20 00:06:03', '2017-09-20 00:06:03', '2017-09-20 00:06:03', '\0', null);
INSERT INTO `Posts` VALUES ('13', '\"T1\"', '\"CCCCC1\"', 'Image', '2017-09-20 00:11:13', '2017-09-20 00:11:13', '2017-09-20 00:11:13', '\0', null);
INSERT INTO `Posts` VALUES ('14', 'TITLE 1', 'DESC 1', 'Video', '2017-09-20 00:12:31', '2017-09-20 00:12:31', '2017-09-20 00:12:31', '\0', null);
INSERT INTO `Posts` VALUES ('15', 'TITLE 1', 'DESC 1', 'Video', '2017-09-20 00:13:10', '2017-09-20 00:13:10', '2017-09-20 00:13:10', '\0', null);
INSERT INTO `Posts` VALUES ('16', '\"T1\"', '\"CCCCC1\"', 'Image', '2017-09-20 00:15:00', '2017-09-20 00:15:00', '2017-09-20 00:15:00', '\0', null);

-- ----------------------------
-- Table structure for PostTag
-- ----------------------------
DROP TABLE IF EXISTS `PostTag`;
CREATE TABLE `PostTag` (
  `PostTagId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Post` bigint(20) DEFAULT NULL,
  `Tag` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PostTagId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of PostTag
-- ----------------------------
INSERT INTO `PostTag` VALUES ('1', '1', '33');
INSERT INTO `PostTag` VALUES ('2', '2', '33');
INSERT INTO `PostTag` VALUES ('3', '3', '34');
INSERT INTO `PostTag` VALUES ('4', '4', '34');
INSERT INTO `PostTag` VALUES ('5', '5', '35');
INSERT INTO `PostTag` VALUES ('6', '6', '35');
INSERT INTO `PostTag` VALUES ('7', '7', '36');
INSERT INTO `PostTag` VALUES ('8', '8', '36');
INSERT INTO `PostTag` VALUES ('9', '9', '36');
INSERT INTO `PostTag` VALUES ('10', '10', '36');
INSERT INTO `PostTag` VALUES ('11', '11', '36');
INSERT INTO `PostTag` VALUES ('12', '12', '37');
INSERT INTO `PostTag` VALUES ('13', '13', '37');
INSERT INTO `PostTag` VALUES ('14', '14', '36');
INSERT INTO `PostTag` VALUES ('15', '15', '36');
INSERT INTO `PostTag` VALUES ('16', '16', '37');

-- ----------------------------
-- Table structure for Presets
-- ----------------------------
DROP TABLE IF EXISTS `Presets`;
CREATE TABLE `Presets` (
  `PresetId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `DefaultValue` varchar(255) DEFAULT NULL,
  `Description` varchar(2000) DEFAULT NULL,
  `Order` int(11) DEFAULT NULL,
  `ObjectType` bigint(20) DEFAULT NULL,
  `ObjectId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PresetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Presets
-- ----------------------------

-- ----------------------------
-- Table structure for Properties
-- ----------------------------
DROP TABLE IF EXISTS `Properties`;
CREATE TABLE `Properties` (
  `PropertyId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Value` varchar(255) DEFAULT NULL,
  `ObjectType` bigint(255) DEFAULT NULL,
  `ObjectId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PropertyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Properties
-- ----------------------------

-- ----------------------------
-- Table structure for Shares
-- ----------------------------
DROP TABLE IF EXISTS `Shares`;
CREATE TABLE `Shares` (
  `ShareId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Post` bigint(20) DEFAULT NULL,
  `Sender` bigint(20) DEFAULT NULL,
  `Receiver` bigint(20) DEFAULT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ShareId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Shares
-- ----------------------------

-- ----------------------------
-- Table structure for Tags
-- ----------------------------
DROP TABLE IF EXISTS `Tags`;
CREATE TABLE `Tags` (
  `TagId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`TagId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Tags
-- ----------------------------
INSERT INTO `Tags` VALUES ('36', 'TAGS 1');
INSERT INTO `Tags` VALUES ('37', '\"tags1\"');

-- ----------------------------
-- Table structure for TeamCategory
-- ----------------------------
DROP TABLE IF EXISTS `TeamCategory`;
CREATE TABLE `TeamCategory` (
  `ProductCategoryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Team` bigint(20) NOT NULL,
  `Category` bigint(20) NOT NULL,
  PRIMARY KEY (`ProductCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of TeamCategory
-- ----------------------------

-- ----------------------------
-- Table structure for Teams
-- ----------------------------
DROP TABLE IF EXISTS `Teams`;
CREATE TABLE `Teams` (
  `TeamId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `Description` text COLLATE utf8_persian_ci NOT NULL,
  `TeamCategory` bigint(20) NOT NULL,
  `Parent` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeamId`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Teams
-- ----------------------------
INSERT INTO `Teams` VALUES ('1', 'گروه آلفا گرافیک', 'گروه آلفا گرافیک مدیر سایت و مدرس در گروه برنامه نویسی پنگوئن است. ایشان در مقطع کارشناسی مشغول به تحصیل میباشند. نزدیک به 2 سال در زمینه طراحی وبسایت های وردپرس ، کسب و کار اینترنتی ، مدیریت سایت ، مقاله نویسی و تدریس فعالیت دارند. زمینه‌های مورد علاقه وی WordPress  ،  FL Studio ، راه اندازی کسب و کار آنلاین و ... می‌باشد. از تجربیات کاری ایشان میتوان به : طراحی سایت فروشگاهی ،طراحی سایت های متعدد دانلود، شخصی سازی قالب های حرفه ای، ترجبیات آموزشی در زمینه وردپرس، طراحی سایت خبری اشاره کرد.', '1', '0');
INSERT INTO `Teams` VALUES ('2', 'گروه برنامه نویسی پنگوئن', ' گروه برنامه نویسی پنگوئن مدیر سایت و مدرس در گروه برنامه نویسی پنگوئن است. ایشان در مقطع کارشناسی مشغول به تحصیل میباشند. نزدیک به 2 سال در زمینه طراحی وبسایت های وردپرس ، کسب و کار اینترنتی ، مدیریت سایت ، مقاله نویسی و تدریس فعالیت دارند. زمینه‌های مورد علاقه وی WordPress  ،  FL Studio ، راه اندازی کسب و کار آنلاین و ... می‌باشد. از تجربیات کاری ایشان میتوان به : طراحی سایت فروشگاهی ،طراحی سایت های متعدد دانلود، شخصی سازی قالب های حرفه ای، ترجبیات آموزشی در زمینه وردپرس، طراحی سایت خبری اشاره کرد.', '2', '0');
INSERT INTO `Teams` VALUES ('3', 'گروه آرناهیت', 'گروه آرناهیت مدیر سایت و مدرس در گروه برنامه نویسی پنگوئن است. ایشان در مقطع کارشناسی مشغول به تحصیل میباشند. نزدیک به 2 سال در زمینه طراحی وبسایت های وردپرس ، کسب و کار اینترنتی ، مدیریت سایت ، مقاله نویسی و تدریس فعالیت دارند. زمینه‌های مورد علاقه وی WordPress  ،  FL Studio ، راه اندازی کسب و کار آنلاین و ... می‌باشد. از تجربیات کاری ایشان میتوان به : طراحی سایت فروشگاهی ،طراحی سایت های متعدد دانلود، شخصی سازی قالب های حرفه ای، ترجبیات آموزشی در زمینه وردپرس، طراحی سایت خبری اشاره کرد.', '3', '0');

-- ----------------------------
-- Table structure for Vitrins
-- ----------------------------
DROP TABLE IF EXISTS `Vitrins`;
CREATE TABLE `Vitrins` (
  `VitrinId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Member` bigint(20) NOT NULL,
  `Key` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `Value` bigint(20) NOT NULL,
  PRIMARY KEY (`VitrinId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Vitrins
-- ----------------------------
INSERT INTO `Vitrins` VALUES ('1', '1', 'LastProduct', '1');
INSERT INTO `Vitrins` VALUES ('2', '1', 'LastArticle', '1');
INSERT INTO `Vitrins` VALUES ('3', '1', 'LastNews', '1');
INSERT INTO `Vitrins` VALUES ('4', '1', 'LastVideoPost', '1');
SET FOREIGN_KEY_CHECKS=1;
