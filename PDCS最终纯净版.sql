/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717 (5.7.17-log)
 Source Host           : localhost:3306
 Source Schema         : pdcs

 Target Server Type    : MySQL
 Target Server Version : 50717 (5.7.17-log)
 File Encoding         : 65001

 Date: 03/07/2023 10:27:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '古风类');
INSERT INTO `category` VALUES (2, '科技类');
INSERT INTO `category` VALUES (3, '文艺类');
INSERT INTO `category` VALUES (4, '风景类');
INSERT INTO `category` VALUES (5, '写真类');
INSERT INTO `category` VALUES (6, '公益类');

-- ----------------------------
-- Table structure for heart
-- ----------------------------
DROP TABLE IF EXISTS `heart`;
CREATE TABLE `heart`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NULL DEFAULT NULL,
  `TeamId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `heart_fk_1`(`UserId`) USING BTREE,
  CONSTRAINT `heart_fk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of heart
-- ----------------------------

-- ----------------------------
-- Table structure for match
-- ----------------------------
DROP TABLE IF EXISTS `match`;
CREATE TABLE `match`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Start` date NOT NULL,
  `End` date NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `Url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ApplicationEnd` date NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `match_fk_1`(`CategoryId`) USING BTREE,
  CONSTRAINT `match_fk_1` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of match
-- ----------------------------
INSERT INTO `match` VALUES (1, '妙手生花，漫享时光', '2023-06-15', '2023-07-06', '一花一世界\r\n\r\n一叶一菩提\r\n\r\n鲜艳芬芳的花朵\r\n\r\n总能给人带来视觉和嗅觉的愉悦体验\r\n\r\n通过绚丽的花艺\r\n\r\n可以看到花的灿烂与多姿\r\n\r\n更能为生活带来温情与诗意', '花艺；诗意；绚丽', 3, 'img_2.png', '2023-07-05');
INSERT INTO `match` VALUES (2, '发现·自然美', '2023-06-15', '2023-07-06', '在中华传统文化里，山水文化是意蕴丰富的、具有独特的审美内涵的一种文化。人类在大自然中生活，大自然中的山山水水以它丰富的形态展现着天地之大美。', '山水；独特；自然', 4, 'img_3.png', '2023-07-03');
INSERT INTO `match` VALUES (3, '大海就是我故乡...', '2023-06-14', '2023-07-03', '小时候妈妈对我讲，大海就是我故乡......对大海的憧憬和向往就是在童年记里妈妈的歌声里产生的。从而也种下了一个种子，想着有一天去看看大海', '环保；海洋；童年', 6, 'img_5.jpg', '2023-07-02');
INSERT INTO `match` VALUES (4, '炽热的心，冰冷的肺', '2023-06-15', '2023-07-03', '于是我拆封电子，把故事装进盒子，盒子里是用纯真换的物质，我的心炽热，肺却冰冷着，其实我想抽，但不敢对你说', '纯真；健康；革新', 6, 'img_6.jpg', '2023-07-02');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `TeamId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `member_fk_1`(`UserId`) USING BTREE,
  INDEX `member_fk_2`(`TeamId`) USING BTREE,
  CONSTRAINT `member_fk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `member_fk_2` FOREIGN KEY (`TeamId`) REFERENCES `team` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of member
-- ----------------------------

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IsDelete` int(11) NOT NULL,
  `WorkName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Like` int(11) NOT NULL,
  `Lv` int(11) NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MatchId` int(11) NOT NULL,
  `CaptainId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `Team_fk_1`(`MatchId`) USING BTREE,
  CONSTRAINT `team_fk_1` FOREIGN KEY (`MatchId`) REFERENCES `match` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of team
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IsAdmin` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin@qq.com', 'admin', 1);
INSERT INTO `user` VALUES (2, '王一', '1@qq.com', '1', 0);
INSERT INTO `user` VALUES (3, '李二', '2@qq.com', '2', 0);
INSERT INTO `user` VALUES (4, '张三', '3@qq.com', '3', 0);
INSERT INTO `user` VALUES (5, '刘四', '4@qq.com', '4', 0);
INSERT INTO `user` VALUES (6, '杨五', '5@qq.com', '5', 0);

-- ----------------------------
-- Table structure for work
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MatchId` int(11) NOT NULL,
  `TeamId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `Work_fk_1`(`MatchId`) USING BTREE,
  INDEX `Work_fk_2`(`TeamId`) USING BTREE,
  CONSTRAINT `work_fk_1` FOREIGN KEY (`MatchId`) REFERENCES `match` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `work_fk_2` FOREIGN KEY (`TeamId`) REFERENCES `team` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of work
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
