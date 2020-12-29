/*
 Navicat Premium Data Transfer

 Source Server         : Local57
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : student

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 29/12/2020 23:53:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `permission` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES (1, 'heihei', '+3f9ryjF0Lmqu2YHMrX8Vw==', 1);
INSERT INTO `administrator` VALUES (2, 'admin', 'BlnHmS4miWI4TrF/r+iDZA==', 1);

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `id` int(2) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (1, '信息与机电工程学院');
INSERT INTO `college` VALUES (2, '金融与贸易学院');
INSERT INTO `college` VALUES (3, '会计学院');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `id` int(2) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `college_id` int(2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `major_college`(`college_id`) USING BTREE,
  CONSTRAINT `major_college` FOREIGN KEY (`college_id`) REFERENCES `college` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, '计算机科学与技术', 1);
INSERT INTO `major` VALUES (2, '国际经济与贸易', 2);
INSERT INTO `major` VALUES (3, '注册会计', 3);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sex` int(1) NOT NULL,
  `birth` date NOT NULL,
  `schoolday` date NOT NULL,
  `major_id` int(2) NOT NULL,
  `college_id` int(2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_college`(`college_id`) USING BTREE,
  INDEX `student_major`(`major_id`) USING BTREE,
  CONSTRAINT `student_college` FOREIGN KEY (`college_id`) REFERENCES `college` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_major` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('20170341343', '赵晨晰', 1, '2020-12-29', '2020-12-29', 1, 1);
INSERT INTO `student` VALUES ('20170341344', '张三', 0, '2020-12-29', '2020-12-29', 2, 2);
INSERT INTO `student` VALUES ('20170341345', '李四', 1, '2020-12-29', '2020-12-29', 3, 3);

SET FOREIGN_KEY_CHECKS = 1;
