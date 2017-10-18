/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : NARIJ_00008

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2017-10-08 19:29:53
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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

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
INSERT INTO `Logins` VALUES ('35', '410  logged in', '2017-09-20 09:27:38', '9acd8bacc8cbf8e4870e5d2a4521b28bd14777927bc0414e21d300ca90d23e34a87904b20fdce2f550188a7868582fc993bce34b285bc733ad1bdc81f296b8f6', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('36', '410  logged in', '2017-09-20 09:32:49', '4593fa8292c43cd584fee502ebbaaa03bb1eeee8bce4bdb7937dfd9e889fcdfacb27af0fb0536fe5b49b6c545cd26dcf42d031fcb302fd25101c1f484d2bb9cc', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('71', '410  logged in', '2017-09-23 08:36:49', 'b9a2412e52d2827e36e4a89213706efd524669bff073115375b3942eda5aeb9921c3159d1bff44fd45dc3b7f06fb548babfdeacfaa0cfd3c02a1d56935ffdf4c', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('72', '410  logged in', '2017-09-23 08:37:05', 'bbe39bfe2ebbceaa3c3bf6f62b864b76d21570c7a83f89433d45d3b4cffd24b71ee2e4d21b5fd14dca0a5078b07ea8e5b673892fa4e8b77353e865aa3449c090', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('73', '410  logged in', '2017-09-23 08:40:42', '8f390069b830cceac622a2830dbe29ed29c25d0228c90e0aa050f344a2679c72dc99bb5a2cc51fb8567a51c5ae1bb782ed5bbc7a1d1721c24795930b3212bfdc', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('78', '410 logged in', '2017-09-30 00:46:19', '67e42e8ab957b98421b15220eedf07a4ca26f23fd17aaa7333dd8d867aa9db34e0fd606169898023e14dd2b94609b68accc8d626869993fac772838242a290d2', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('79', '410 logged in', '2017-10-02 09:19:08', 'eccdc473518eb85bf3faee9274577d2df9504c2a62ea045afa801adfeb3a35a65d3e1197e123bff1da3d9ba3013c7f66593f0f04518ba6c92983b97ca79f340f', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('80', '410 logged in', '2017-10-02 09:43:33', '2b9f181a7b95f95c482d3f2d00a579de2b0c8933a35f1666e581cd4c47c6af80d69af78cad62b174de90a783e332a86aae83dd65b11b31f7ee92006249b62393', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('81', '410 logged in', '2017-10-02 09:45:55', 'd23abe29f68ce74080a4c528ae91d6fc37cb8b0bc359c4444753734813c4ea46c9fd1181fbb456bcf50d5745febb26acbfd597c1c340cd4175242a8ba54f87bb', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('82', '410 logged in', '2017-10-02 09:52:23', 'cf311c917061df6a78a001672487093a015118928024784ffa096b616cc4b013f80c695927e2134d9dd277eb1405af249fbd4cbfd931d442fb48534066cd5d12', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('83', '410 logged in', '2017-10-02 10:04:51', 'fb4d43f1c54388cacc4f9eef6342b3c298110260347182a7865a4c7de5b55f6be1ff41b6e0333a4f1e1756c4c548d239d0c187d35c82fd4eb5318f97996e3da5', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('84', '410 logged in', '2017-10-02 11:29:32', 'd6ec52f58d909ca01eb18063f8d571d9166f673016511909de97a7cc045bf43c8a577d9e9a24c99ed6fdffdf6ea8c9e2c7ac0a0d144cb4454ebfa44f68c58d9f', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('85', '410 logged in', '2017-10-02 11:32:10', '9408b52271cc1d1b3ee44272f68152306a25b7df4c1657893cbd821aec57f48714309b271dc4300bdc57893d8f16eebcceae45637841f7f35995b50575bca813', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('86', '410 logged in', '2017-10-02 12:17:45', 'f68938a449a13391c6b8e86c3e7e447132c19be842bdcb3ddc7a62fb529aaea4422260a4729a58b9fec3fc364188249e6123689ed39ab0cc05f88c7376ed818e', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('87', '410 logged in', '2017-10-02 12:46:10', '7277f09adbfb293b86ba9795f85426c2e788eedd61a0e4e7ae454aa6d3eade26123adf3e00384076a6bd5be0ffb227167352c7c97065267d7c672ce8483b213a', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('88', '410 logged in', '2017-10-02 15:00:58', '69e1e8ecd6e53b28b071ef46aebcd22e340a0589c9d5e4a7ff9394ec22d2888e455c059339b451bdbd2cf9c1ccca221c77748610694664f74f04819daab534bb', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('89', '410 logged in', '2017-10-02 15:56:21', '1bbb89eda07a51dbf233729e892915804dccef2ec68de07aeda946f09ad091be8cffd59af3d513a2b2d7212d641ffb3d0fc7387992a482e854f8ca64cbb69f35', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('90', '410 logged in', '2017-10-02 18:28:29', '212574e7b7c75df062d76969ae0d6ab44b6966f32df53318cc24c75c4d02d443d6d70a5691421aa30cd651e342fc57be907e9af6b5b6205b88ea629c861a7555', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('91', '410 logged in', '2017-10-02 18:29:52', 'ad6877e1c6dac1cda9bf2afef18a728464f8a808dd99ca95dcb3996a63373b74bd681b23337369996dec652822f82c4d04d025f3db655dfe58202ad81b593c1b', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('92', '410 logged in', '2017-10-02 18:31:09', '7d97f69811fd115085666116514bdba4c3223386c550030780198a58a9bc9531df41ac2055d1c580f4080a14600bc2038a461c7beaee96345895287219d31701', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('93', '410 logged in', '2017-10-02 18:33:37', 'dc373a86062edf6a119b82601f815f971458e52dd57c7f90d6d45cdfa8d89f059eafe828b1fc2d1a50b1cf2c977471bd528e734db02b0b4008e1b7aae9f4cd13', '410', '192.168.1.100');
INSERT INTO `Logins` VALUES ('94', '410 logged in', '2017-10-07 00:51:45', '10bedd8ae7a913534e88450b67f4e2ac6606dd42e35f8d41e76dcaffb8318837d1cbd2b486f227d34589da07687a9b730de0002cab528b0c88ce2c136ea2c71f', '410', '::1');
INSERT INTO `Logins` VALUES ('95', '410 logged in', '2017-10-08 18:04:02', 'b0cd753bb3b0e2e7400e559fcebf30f8aaebe38bdede0f8a4a77e0ee7f729b5a9672ad994c4dce67b3708817152a5baffac46d39ab32eb16fcd782347c5b1813', '410', '192.168.1.100');

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
) ENGINE=InnoDB AUTO_INCREMENT=447 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- ----------------------------
-- Records of Members
-- ----------------------------
INSERT INTO `Members` VALUES ('410', 'fgg', '', '', '', '', '09365982333', '', 'ggg', '1234', '0', '68683', '', '0');
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
  `Member` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PostId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Posts
-- ----------------------------
INSERT INTO `Posts` VALUES ('12', '\"T1\"', 'Different foods go through different metabolic pathways in the body.\\nThey can have a vastly different effect on hunger, hormones and how many calories we burn here are the 20 most weight loss friendly foods on earth, that are supported by science', 'Text', '2017-09-20 00:06:03', '2017-10-01 09:59:01', '2017-09-20 00:06:03', '\0', '1', '410');
INSERT INTO `Posts` VALUES ('13', '\"T1\"', 'Licensed under the Apache License, Version 2.0 (the \"License\");\r\nyou may not use this file except in compliance with the License.\r\nYou may obtain a copy of the License at', 'Test', '2017-09-20 00:11:13', '2017-10-01 09:59:34', '2017-09-20 00:11:13', '\0', '1', '410');
INSERT INTO `Posts` VALUES ('14', 'TITLE 1', 'Unless required by applicable law or agreed to in writing, software\r\ndistributed under the License is distributed on an', 'Image', '2017-09-20 00:12:31', '2017-10-01 09:59:37', '2017-09-20 00:12:31', '\0', '1', '411');
INSERT INTO `Posts` VALUES ('15', 'TITLE 1', 'Stroke and background color on custom Drawable should be preset by the user: too complex to determine the type of the Drawable used in order to change its color.', 'Image', '2017-09-20 00:13:10', '2017-10-01 10:00:11', '2017-09-20 00:13:10', '\0', '1', '410');
INSERT INTO `Posts` VALUES ('16', '\"T1\"', 'Transparency has a little glitch when used with elevation, you could see shadow In the shape: more transparent the color is more visible the shadow is.', 'Text', '2017-09-20 00:15:00', '2017-10-01 10:00:25', '2017-09-20 00:15:00', '\0', '1', '412');

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
