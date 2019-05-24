/*
 Navicat MySQL Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : xsupport

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 25/05/2019 01:15:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for big_type
-- ----------------------------
DROP TABLE IF EXISTS `big_type`;
CREATE TABLE `big_type`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `type` int(2) NULL DEFAULT NULL COMMENT '类型code',
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `exceptionLocationName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常定位名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of big_type
-- ----------------------------
INSERT INTO `big_type` VALUES ('0', 0, '℃', '温度异常', '温度');
INSERT INTO `big_type` VALUES ('1', 1, '℃', '湿度异常', '湿度');
INSERT INTO `big_type` VALUES ('2', 2, '℃', '浸润异常', '浸润');
INSERT INTO `big_type` VALUES ('3', 3, '℃', '金气异常', '有毒气体');
INSERT INTO `big_type` VALUES ('4', 4, '℃', '金气异常', '重金属');
INSERT INTO `big_type` VALUES ('5', 5, '℃', '位移异常', '位移');

-- ----------------------------
-- Table structure for displacement
-- ----------------------------
DROP TABLE IF EXISTS `displacement`;
CREATE TABLE `displacement`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '位移测量单次汇总记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of displacement
-- ----------------------------
INSERT INTO `displacement` VALUES ('2c9ac4cd6aea9322016aea9347f10000', NULL, NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aea9322016aea9384e20001', NULL, NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aea9322016aea93bfee0002', NULL, NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aea9322016aea93fafd0003', NULL, NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aea9322016aea94362b0004', NULL, NULL);

-- ----------------------------
-- Table structure for displacement_every
-- ----------------------------
DROP TABLE IF EXISTS `displacement_every`;
CREATE TABLE `displacement_every`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `groupId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组ID',
  `point` int(3) NULL DEFAULT NULL COMMENT '测量点',
  `thisValue` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测量值',
  `beforeValue` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次测量值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '位移测量单挑记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for displacement_value
-- ----------------------------
DROP TABLE IF EXISTS `displacement_value`;
CREATE TABLE `displacement_value`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `x` float(5, 2) NULL DEFAULT NULL COMMENT 'x值',
  `y` float(5, 2) NULL DEFAULT NULL COMMENT 'y值',
  `z` float(5, 2) NULL DEFAULT NULL COMMENT 'z值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '位移测量值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gas
-- ----------------------------
DROP TABLE IF EXISTS `gas`;
CREATE TABLE `gas`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `bigType` int(2) NULL DEFAULT NULL COMMENT '大类型',
  `subIndex` int(2) NULL DEFAULT NULL COMMENT '子序号',
  `value` float(5, 2) NULL DEFAULT NULL COMMENT '测量值',
  `limitValue` float(5, 2) NULL DEFAULT NULL COMMENT '阈值',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '金气' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for humidity
-- ----------------------------
DROP TABLE IF EXISTS `humidity`;
CREATE TABLE `humidity`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `value` float(5, 2) NULL DEFAULT NULL COMMENT '测量值',
  `limitValue` float(5, 2) NULL DEFAULT NULL COMMENT '阈值',
  `state` int(1) NULL DEFAULT 0 COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '湿度' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for point_enum
-- ----------------------------
DROP TABLE IF EXISTS `point_enum`;
CREATE TABLE `point_enum`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `code` int(2) NULL DEFAULT NULL COMMENT 'code',
  `line` int(1) NULL DEFAULT 0 COMMENT '测量线',
  `point` int(1) NULL DEFAULT 0 COMMENT '测量点',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测量点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of point_enum
-- ----------------------------
INSERT INTO `point_enum` VALUES ('0', 0, 0, 0, '位A-0');
INSERT INTO `point_enum` VALUES ('1', 1, 0, 1, '位A-1');
INSERT INTO `point_enum` VALUES ('2', 2, 0, 2, '位A-2');
INSERT INTO `point_enum` VALUES ('3', 3, 1, 0, '位B-0');
INSERT INTO `point_enum` VALUES ('4', 4, 1, 1, '位B-1');
INSERT INTO `point_enum` VALUES ('5', 5, 1, 2, '位B-2');
INSERT INTO `point_enum` VALUES ('6', 6, 2, 0, '位C-0');
INSERT INTO `point_enum` VALUES ('7', 7, 2, 1, '位C-1');
INSERT INTO `point_enum` VALUES ('8', 8, 2, 2, '位C-2');

-- ----------------------------
-- Table structure for soak
-- ----------------------------
DROP TABLE IF EXISTS `soak`;
CREATE TABLE `soak`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `type` int(2) NULL DEFAULT 0 COMMENT '类型',
  `value` float(5, 2) NULL DEFAULT NULL COMMENT '测量值',
  `limitValue` float(5, 2) NULL DEFAULT NULL COMMENT '阈值',
  `state` int(1) NULL DEFAULT 0 COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '浸润' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_warn
-- ----------------------------
DROP TABLE IF EXISTS `sys_warn`;
CREATE TABLE `sys_warn`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `optionUser` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `exceptionLocation` int(1) NULL DEFAULT 0 COMMENT '异常定位',
  `exceptionDescription` int(2) NULL DEFAULT 0 COMMENT '异常描述',
  `exceptionValue` float(5, 2) NULL DEFAULT NULL COMMENT '异常值',
  `limitValue` float(5, 2) NULL DEFAULT NULL COMMENT '阈值',
  `exceptionState` int(1) NULL DEFAULT 0 COMMENT '异常状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注'
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测量异常' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temperature
-- ----------------------------
DROP TABLE IF EXISTS `temperature`;
CREATE TABLE `temperature`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `value` float(5, 2) NULL DEFAULT NULL COMMENT '测量值',
  `limitValue` float(5, 2) NULL DEFAULT NULL COMMENT '阈值',
  `state` int(1) NULL DEFAULT 0 COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '温度' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `bigType` int(1) NULL DEFAULT NULL COMMENT '大类型',
  `subIndex` int(2) NULL DEFAULT 0 COMMENT '子序号',
  `limitValue` float(5, 2) NULL DEFAULT NULL COMMENT '阈值',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('0', '2019-05-25 00:53:31', '2019-05-25 00:56:07', 0, 0, 60.00, '温度', NULL);
INSERT INTO `type` VALUES ('1', '2019-05-25 00:53:31', '2019-05-25 00:56:10', 1, 0, 60.00, '湿度', NULL);
INSERT INTO `type` VALUES ('2', '2019-05-25 00:53:31', '2019-05-25 00:56:17', 2, 0, 30.00, '浸润', NULL);
INSERT INTO `type` VALUES ('3', '2019-05-25 00:53:31', '2019-05-25 00:56:35', 3, 0, 0.70, NULL, NULL);
INSERT INTO `type` VALUES ('4', '2019-05-25 00:53:31', '2019-05-25 00:57:53', 3, 1, 0.70, NULL, NULL);
INSERT INTO `type` VALUES ('5', '2019-05-25 00:53:31', '2019-05-25 00:57:53', 3, 2, 0.70, NULL, NULL);
INSERT INTO `type` VALUES ('6', '2019-05-25 00:53:31', '2019-05-25 00:57:53', 3, 3, 0.70, NULL, NULL);
INSERT INTO `type` VALUES ('7', '2019-05-25 00:53:31', '2019-05-25 00:57:53', 3, 4, 0.70, NULL, NULL);
INSERT INTO `type` VALUES ('8', '2019-05-25 00:53:31', '2019-05-25 00:57:53', 3, 5, 0.70, NULL, NULL);
INSERT INTO `type` VALUES ('9', '2019-05-25 00:53:31', '2019-05-25 00:58:14', 4, 0, 0.70, NULL, NULL);
INSERT INTO `type` VALUES ('10', '2019-05-25 00:53:31', '2019-05-25 00:58:14', 4, 1, 0.70, NULL, NULL);
INSERT INTO `type` VALUES ('11', '2019-05-25 00:53:31', '2019-05-25 00:58:14', 4, 2, 0.70, NULL, NULL);
INSERT INTO `type` VALUES ('12', '2019-05-25 00:53:31', '2019-05-25 00:58:14', 4, 3, 0.70, NULL, NULL);
INSERT INTO `type` VALUES ('13', '2019-05-25 00:53:31', '2019-05-25 00:58:14', 4, 4, 0.70, NULL, NULL);
INSERT INTO `type` VALUES ('14', '2019-05-25 00:53:31', '2019-05-25 00:58:14', 4, 5, 0.70, NULL, NULL);
INSERT INTO `type` VALUES ('15', '2019-05-25 00:53:31', '2019-05-25 00:58:14', 4, 6, 0.70, NULL, NULL);
INSERT INTO `type` VALUES ('16', '2019-05-25 00:53:31', '2019-05-25 00:58:14', 4, 7, 0.70, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `isAdmin` int(1) NULL DEFAULT 0 COMMENT '是否管理员',
  `age` int(3) NULL DEFAULT 0 COMMENT '年龄',
  `sex` int(1) NULL DEFAULT 0 COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `isForbidden` tinyint(1) NULL DEFAULT 0 COMMENT '是否禁用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0', '2019-05-25 00:42:49', 'admin', '000000', '李兴成', 1, 21, 0, '15191406523', '商洛学院', 0, '管理员');
INSERT INTO `user` VALUES ('1', '2019-05-25 00:43:01', NULL, '000000', '李兴成', 0, 21, 0, '15191406523', '商洛学院', 0, '普通用户');

SET FOREIGN_KEY_CHECKS = 1;
