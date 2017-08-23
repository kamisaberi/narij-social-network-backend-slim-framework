/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : NARIJ_00002

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2017-08-22 05:18:35
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
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Object` bigint(20) NOT NULL DEFAULT '0',
  `ObjectType` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `Parent` bigint(20) NOT NULL DEFAULT '0',
  `CommentSituation` bigint(20) NOT NULL DEFAULT '1',
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
  `Date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`FollowId`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Follows
-- ----------------------------
INSERT INTO `Follows` VALUES ('302', '1', '2', 'Member', '2016-05-22 08:53:14.000000');
INSERT INTO `Follows` VALUES ('303', '2', '1', 'Member', '2016-05-22 08:53:20.000000');
INSERT INTO `Follows` VALUES ('304', '1', '18', 'Member', '2016-05-22 08:53:26.000000');
INSERT INTO `Follows` VALUES ('305', '1', '6', 'Member', '2016-05-22 08:53:33.000000');
INSERT INTO `Follows` VALUES ('306', '5', '1', 'Member', '2016-05-22 08:53:39.000000');
INSERT INTO `Follows` VALUES ('308', '1', '20', 'Member', '2016-05-22 08:54:10.000000');
INSERT INTO `Follows` VALUES ('309', '2', '3', 'Member', '2016-05-22 08:54:19.000000');
INSERT INTO `Follows` VALUES ('310', '3', '4', 'Member', '2016-05-22 08:54:50.000000');
INSERT INTO `Follows` VALUES ('311', '15', '1', 'Member', '2016-05-22 08:55:32.000000');
INSERT INTO `Follows` VALUES ('312', '14', '1', 'Member', '2016-05-22 08:55:37.000000');
INSERT INTO `Follows` VALUES ('313', '13', '1', 'Member', '2016-05-22 08:55:54.000000');
INSERT INTO `Follows` VALUES ('314', '1', '19', 'Member', '2016-05-22 08:56:10.000000');
INSERT INTO `Follows` VALUES ('315', '30', '1', 'Member', '2016-05-22 08:57:15.000000');
INSERT INTO `Follows` VALUES ('316', '29', '1', 'Member', '2016-05-22 08:57:20.000000');
INSERT INTO `Follows` VALUES ('317', '1', '25', 'Member', '2016-05-22 08:57:24.000000');
INSERT INTO `Follows` VALUES ('318', '1', '26', 'Member', '2016-05-23 14:43:37.000000');
INSERT INTO `Follows` VALUES ('319', '25', '108', 'Member', '2016-05-23 01:19:36.000000');
INSERT INTO `Follows` VALUES ('321', '1', '7', 'Member', '2016-06-03 18:46:50.000000');
INSERT INTO `Follows` VALUES ('322', '1', '13', 'Member', '2016-06-03 18:46:58.000000');
INSERT INTO `Follows` VALUES ('323', '1', '94', 'Member', '2016-06-03 18:47:00.000000');
INSERT INTO `Follows` VALUES ('324', '1', '98', 'Member', '2016-06-03 18:47:00.000000');
INSERT INTO `Follows` VALUES ('325', '1', '23', 'Member', '2016-06-03 18:47:01.000000');
INSERT INTO `Follows` VALUES ('326', '1', '22', 'Member', '2016-06-03 18:47:08.000000');
INSERT INTO `Follows` VALUES ('327', '1', '10', 'Member', '2016-06-03 18:47:08.000000');
INSERT INTO `Follows` VALUES ('328', '1', '21', 'Member', '2016-06-03 18:47:09.000000');
INSERT INTO `Follows` VALUES ('329', '1', '24', 'Member', '2016-06-08 05:06:06.000000');
INSERT INTO `Follows` VALUES ('330', '1', '15', 'Member', '2016-06-08 05:06:07.000000');

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
  `Object` bigint(20) NOT NULL,
  `ObjectType` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `Date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `Session` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`LikeId`)
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Likes
-- ----------------------------
INSERT INTO `Likes` VALUES ('385', '1', '1', '8', 'Article', '2016-07-03 11:10:44.182150', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of MemberPost
-- ----------------------------
INSERT INTO `MemberPost` VALUES ('5', '1', '1', '1');
INSERT INTO `MemberPost` VALUES ('10', '1', '2', '1');
INSERT INTO `MemberPost` VALUES ('14', '2', '3', '1');
INSERT INTO `MemberPost` VALUES ('16', '1', '5', '1');
INSERT INTO `MemberPost` VALUES ('18', '2', '7', '1');
INSERT INTO `MemberPost` VALUES ('21', '2', '4', '1');
INSERT INTO `MemberPost` VALUES ('22', '1', '1', '1');
INSERT INTO `MemberPost` VALUES ('23', '3', '2', '1');
INSERT INTO `MemberPost` VALUES ('27', '1', '5', '1');
INSERT INTO `MemberPost` VALUES ('28', '4', '8', '1');
INSERT INTO `MemberPost` VALUES ('29', '4', '6', '1');
INSERT INTO `MemberPost` VALUES ('30', '1', '7', '1');
INSERT INTO `MemberPost` VALUES ('31', '4', '4', '1');
INSERT INTO `MemberPost` VALUES ('32', '5', '3', '1');
INSERT INTO `MemberPost` VALUES ('33', '5', '4', '1');
INSERT INTO `MemberPost` VALUES ('34', '1', '5', '1');
INSERT INTO `MemberPost` VALUES ('35', '1', '2', '1');
INSERT INTO `MemberPost` VALUES ('36', '6', '3', '1');
INSERT INTO `MemberPost` VALUES ('37', '6', '6', '1');
INSERT INTO `MemberPost` VALUES ('38', '6', '5', '1');
INSERT INTO `MemberPost` VALUES ('39', '1', '4', '1');
INSERT INTO `MemberPost` VALUES ('40', '7', '7', '1');
INSERT INTO `MemberPost` VALUES ('41', '7', '8', '1');
INSERT INTO `MemberPost` VALUES ('42', '7', '5', '1');
INSERT INTO `MemberPost` VALUES ('43', '3', '6', '1');
INSERT INTO `MemberPost` VALUES ('44', '3', '7', '1');
INSERT INTO `MemberPost` VALUES ('45', '1', '75', '1');
INSERT INTO `MemberPost` VALUES ('46', '1', '76', '1');
INSERT INTO `MemberPost` VALUES ('47', '1', '78', '1');
INSERT INTO `MemberPost` VALUES ('48', '1', '79', '1');
INSERT INTO `MemberPost` VALUES ('49', '1', '80', '1');

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
  `FirstName` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `LastName` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `Profile` text COLLATE utf8_persian_ci NOT NULL,
  `Sex` varchar(10) COLLATE utf8_persian_ci NOT NULL,
  `BirthDate` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `Address` varchar(400) COLLATE utf8_persian_ci NOT NULL,
  `MobileNummber` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `MelliCode` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `Username` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `Email` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `MemberType` bigint(20) NOT NULL,
  `CanLogin` bit(1) NOT NULL DEFAULT b'1',
  `Parent` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MemberId`)
) ENGINE=InnoDB AUTO_INCREMENT=388 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Members
-- ----------------------------
INSERT INTO `Members` VALUES ('1', 'kami', 'saberi', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '1980-02-19', 'لنگرود', '09365982333', '11111111', 'kamisaberi', 'kamisaberi@gmail.com', '1111', '1', '', '0');
INSERT INTO `Members` VALUES ('2', 'novin', 'khosravi', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '1992-01-01', 'سیاهکل', '09389770018', '1459541', '2', 'kami@test.com', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('3', 'koorosh', 'torabi', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '2016-01-01', 'دریاسر            ', '0000', '1425785', '3', 'kami@test.com', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('4', 'sina', 'shabani', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'زن', '2016-01-01', 'لنگرود', '11', '14236589', '4', 'kami@test.com', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('5', 'mahdi', 'saleh pour', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'زن', '2016-01-01', 'لنگرود', '2121', '12458963', '5', 'kami@test.com', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('6', 'fereydoon', 'moghaddam', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '1370', 'کلید بر', '09121415245', '2514521452', 'fereydoon', 'fereydoon@gmail.com', '1234', '1', '', '0');
INSERT INTO `Members` VALUES ('7', 'amin', 'moradi', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '1375', 'فتیده', '09112452365', '27014521452', 'amin', 'amin@gmail.com', '1234', '1', '', '0');
INSERT INTO `Members` VALUES ('8', 'hamid', 'darand', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '2016-01-01', 'کومله', '0000', '124587', '1', 'kami@test.com', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('9', 'arya', 'yousefi', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '2016', 'لنگرود', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('10', 'morteza', 'soleimani', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '2016', 'لنگرود', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('11', 'shayan', 'taeid', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '2016', 'لنگرود', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('12', 'sadegh', 'momen pour', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '2016', 'لاهیجان', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('13', 'mohsen', 'sabeti', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '2016', 'لنگرود', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('14', 'mohammad', 'sayyadi', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '2016', 'لنگرود', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('15', 'masoud', 'sabeti', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '2016', 'لنگرود', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('16', 'amir hossein', 'sadeghi', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '2016', 'آستانه', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('17', 'arezoo', 'yaqubi', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'زن', '2016', 'لنگرود', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('18', 'elham', 'ba khoda', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'زن', '2016', 'لنگرود', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('19', 'reyhane', 'shoa kazemi', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'زن', '2016', 'لاهیجان', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('20', 'zeynab', 'esmaili', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'زن', '2016', 'لنگرود', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('21', 'samane', 'shokri', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'زن', '2016', 'لنگرود', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('22', 'somayyeh', 'dohendo', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'زن', '2016', 'رودسر', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('23', 'somayyeh', 'safari', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'زن', '2016', 'رودسر', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('24', 'kobra', 'mohammadi fard', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'زن', '2016', 'رودسر', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('25', 'mahdiyeh', 'pour esmail', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'زن', '2016', 'لنگرود', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('26', 'niloofar', 'fardad', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'زن', '2016', 'لنگرود', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('27', 'alireza', 'babaei', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '2016', 'رودسر', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('28', 'farid', 'mohammad zadeh', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '2016', 'رودسر', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('29', 'mona', 'hashemi', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'زن', '2016', 'لاهیجان', '0000', '000000', '1', '1', '1', '1', '', '0');
INSERT INTO `Members` VALUES ('30', 'company', 'Link Ware Magic', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '2016', 'لنگرود', '0000', '000000', '1', '1', '1', '2', '\0', '0');
INSERT INTO `Members` VALUES ('94', 'test', 'test', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '', '', '', '', 'test', 'test@yahoo.com', '1111', '1', '', '0');
INSERT INTO `Members` VALUES ('95', 'school', 'MFT', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '', '', '', '', '', 'test@yahoo.com', '', '3', '', '0');
INSERT INTO `Members` VALUES ('97', '11', '11', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '1111', '11', '11', '11', '11', '11', '11', '1', '', '0');
INSERT INTO `Members` VALUES ('98', 'SDF', 'qqq', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '2313', '123', '123123123', '123', '123', '213', '123', '1', '', '0');
INSERT INTO `Members` VALUES ('99', '', '', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '', '', '', '', 'بلبل بیل یل ی ل', '', '', '1', '', '0');
INSERT INTO `Members` VALUES ('100', '', '', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '', '', '', '', 'sfd sd s fsf ', '', '', '1', '', '0');
INSERT INTO `Members` VALUES ('101', '', '', 'Each of us brings our own specialist expertise. Between us we can support you as an individual or an organisation, whether your work is in health, education, social care, communities or elsewhere.\r\n\r\nWe know the power of person-centred practices – not just because we’ve made it our mission to help others to understand and use them, but because we use them in our own lives and in the way we work together as a team.\r\n\r\nYou’ll find Helen Sanderson Associates in the UK & Europe, Australasia, the United ', 'مرد', '', '', '', '', 'dsf sdf sd fsdf ', '', '', '1', '', '0');
INSERT INTO `Members` VALUES ('103', 'qqq', 'qqqq', '', 'مرد', '', '', '', '', 'reza21121', 'reza@yahoo.com', '1111', '1', '', '0');
INSERT INTO `Members` VALUES ('104', 'reza', 'test', '', 'مرد', '', '', '', '', 't111111', 'ghayyaran@gmail.com', '1111', '1', '', '0');
INSERT INTO `Members` VALUES ('106', 'qqq', 'wwww', '<p>شسی شسی شسی شسی شسی </p>', 'مرد', '', '', '', '', '', '', '', '1', '', '0');
INSERT INTO `Members` VALUES ('107', 'ali', 'alipour', '', 'مرد', '', '', '', '2701452', 'ali', 'kami@gmail.com', '1234', '1', '', '0');
INSERT INTO `Members` VALUES ('108', 'reza', 'alinia', '', 'مرد', '', '', '', '145236', 'reza142', 'kali@yahoo.com', '1234', '1', '', '0');
INSERT INTO `Members` VALUES ('109', 'taghi', 'hasani', '', 'مرد', '', '', '', '142525', 'alierde', 'sa@ya.com', '1234', '1', '', '0');
INSERT INTO `Members` VALUES ('110', 'naghi', 'medavoodi', '', 'مرد', '', '', '', '1412545', 'asedrf', 'de@deded.com', '1234', '1', '', '0');
INSERT INTO `Members` VALUES ('111', 'hashi', 'havani', '', 'مرد', '', '', '', '1487569', 'azxcvb', 'alini@rani.com', '1234', '1', '', '0');
INSERT INTO `Members` VALUES ('386', '', '', '', '', '', '', '', '', '', '', '', '0', '', '0');
INSERT INTO `Members` VALUES ('387', 'Admin', 'Site', '-', 'مرد', '2016', 'لنگرود', '0000', '000000', '0', '0', '0', '2', '\0', '0');

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
  `To` bigint(20) NOT NULL,
  `From` bigint(20) NOT NULL,
  `Title` varchar(2000) COLLATE utf8_persian_ci NOT NULL,
  `Content` text COLLATE utf8_persian_ci NOT NULL,
  `Date` datetime NOT NULL,
  `Parent` bigint(20) NOT NULL,
  PRIMARY KEY (`MessageId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Messages
-- ----------------------------
INSERT INTO `Messages` VALUES ('20', '3', '1', 'پیغام تست 1', 'این یک پیغام تست است', '2016-04-16 00:00:00', '0');
INSERT INTO `Messages` VALUES ('21', '2', '1', 'سیسیش', 'شسیشسیشسیشسیسش شی شیس شسی ', '2016-04-16 00:00:00', '0');
INSERT INTO `Messages` VALUES ('22', '12', '1', 'شسیشی یشسیشسش', 'ش یش سی شی شسی ', '2016-04-16 00:00:00', '0');
INSERT INTO `Messages` VALUES ('23', '3', '1', 'ش شسی شس', 'شس یشس شسی ش ش', '2016-04-16 00:00:00', '0');
INSERT INTO `Messages` VALUES ('24', '6', '1', 'یب ییس', 'سی بس یب سیب بسی', '2016-04-16 00:00:00', '0');
INSERT INTO `Messages` VALUES ('25', '8', '1', 'asdasd', 'asdasdasd', '2016-04-16 00:00:00', '0');
INSERT INTO `Messages` VALUES ('26', '5', '1', 'asddad', 'asdasdsad as as as', '2016-04-16 00:00:00', '0');
INSERT INTO `Messages` VALUES ('27', '1', '5', 'asdasd', 'ttttttttttt', '2016-04-16 00:00:00', '0');
INSERT INTO `Messages` VALUES ('28', '1', '10', 'sdfsd', 'ghfjkhlk', '2016-04-16 00:00:00', '0');
INSERT INTO `Messages` VALUES ('29', '1', '12', 'tyrt uyt uyt', 'wwww w w w w w ', '2016-04-16 00:00:00', '0');
INSERT INTO `Messages` VALUES ('30', '10', '1', 'dfdsf', 'sdfdsfsdfsdf', '2016-04-16 00:00:00', '0');

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

-- ----------------------------
-- Table structure for PostProperties
-- ----------------------------
DROP TABLE IF EXISTS `PostProperties`;
CREATE TABLE `PostProperties` (
  `PostPropertyId` bigint(20) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Value` varchar(255) DEFAULT NULL,
  `Post` bigint(255) DEFAULT NULL,
  PRIMARY KEY (`PostPropertyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of PostProperties
-- ----------------------------

-- ----------------------------
-- Table structure for Posts
-- ----------------------------
DROP TABLE IF EXISTS `Posts`;
CREATE TABLE `Posts` (
  `PostId` bigint(20) NOT NULL,
  `PostType` tinyint(4) DEFAULT NULL,
  `CreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EditTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DeleteTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Deleted` bit(1) DEFAULT b'0',
  `Category` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PostId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Posts
-- ----------------------------

-- ----------------------------
-- Table structure for PostTypes
-- ----------------------------
DROP TABLE IF EXISTS `PostTypes`;
CREATE TABLE `PostTypes` (
  `PostTypeId` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PostTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of PostTypes
-- ----------------------------
INSERT INTO `PostTypes` VALUES ('1', 'Text');
INSERT INTO `PostTypes` VALUES ('2', 'Photo');
INSERT INTO `PostTypes` VALUES ('3', 'Audio');
INSERT INTO `PostTypes` VALUES ('4', 'Video');

-- ----------------------------
-- Table structure for Presets
-- ----------------------------
DROP TABLE IF EXISTS `Presets`;
CREATE TABLE `Presets` (
  `PresetId` bigint(20) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `DefaultValue` varchar(255) DEFAULT NULL,
  `Description` varchar(2000) DEFAULT NULL,
  `Order` int(11) DEFAULT NULL,
  `ObjectType` bigint(255) DEFAULT NULL,
  PRIMARY KEY (`PresetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Presets
-- ----------------------------

-- ----------------------------
-- Table structure for Tags
-- ----------------------------
DROP TABLE IF EXISTS `Tags`;
CREATE TABLE `Tags` (
  `TagId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`TagId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Tags
-- ----------------------------
INSERT INTO `Tags` VALUES ('22', 'سلام');
INSERT INTO `Tags` VALUES ('23', 'علیکم');
INSERT INTO `Tags` VALUES ('24', 'الکترونیک');
INSERT INTO `Tags` VALUES ('25', 'تست');
INSERT INTO `Tags` VALUES ('26', 'بیولوژی');
INSERT INTO `Tags` VALUES ('27', 'برق');
INSERT INTO `Tags` VALUES ('28', 'شیمی');
INSERT INTO `Tags` VALUES ('29', 'فیزیک');
INSERT INTO `Tags` VALUES ('30', 'ریاضی');
INSERT INTO `Tags` VALUES ('31', 'شکافت اتمی');
INSERT INTO `Tags` VALUES ('32', 'جوش هسته ای');
INSERT INTO `Tags` VALUES ('33', '');

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
