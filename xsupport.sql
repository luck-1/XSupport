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

 Date: 25/05/2019 11:12:29
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
INSERT INTO `big_type` VALUES ('1', 1, '%RH', '湿度异常', '湿度');
INSERT INTO `big_type` VALUES ('2', 2, '%', '浸润异常', '浸润');
INSERT INTO `big_type` VALUES ('3', 3, '(mg/L)', '金气异常', '有毒气体');
INSERT INTO `big_type` VALUES ('4', 4, '(mg/L)', '金气异常', '重金属');
INSERT INTO `big_type` VALUES ('5', 5, '(m)', '位移异常', '位移');

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
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecef4aba004c', '2019-05-25 11:01:06', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecef0f0d0039', '2019-05-25 11:00:51', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aeceed3710026', '2019-05-25 11:00:35', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecee983a0013', '2019-05-25 11:00:20', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecee56ec0000', '2019-05-25 11:00:05', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecef863d005f', '2019-05-25 11:01:21', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecefc1e00072', '2019-05-25 11:01:36', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecefff410085', '2019-05-25 11:01:52', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf03c720098', '2019-05-25 11:02:08', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf0796300ab', '2019-05-25 11:02:23', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf0b63f00be', '2019-05-25 11:02:39', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf0f37600d1', '2019-05-25 11:02:55', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf1311700e4', '2019-05-25 11:03:10', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf16e6e00f7', '2019-05-25 11:03:26', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf1ac1e010a', '2019-05-25 11:03:42', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf20873011d', '2019-05-25 11:04:06', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf20880011e', '2019-05-25 11:04:06', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf234890146', '2019-05-25 11:04:17', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf24afa015b', '2019-05-25 11:04:23', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf24b5e016e', '2019-05-25 11:04:23', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf2585d0182', '2019-05-25 11:04:26', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf273e60197', '2019-05-25 11:04:33', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf289a301ab', '2019-05-25 11:04:39', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf28a2301be', '2019-05-25 11:04:39', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf295ae01d3', '2019-05-25 11:04:42', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf2b26001e7', '2019-05-25 11:04:49', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf2c8bd01fb', '2019-05-25 11:04:55', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf2c8dd0200', '2019-05-25 11:04:55', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf2d2d10222', '2019-05-25 11:04:57', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecee11016aecf2ef200236', '2019-05-25 11:05:05', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf38bf10001', '2019-05-25 11:05:45', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf3cb130015', '2019-05-25 11:06:01', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf4081d002a', '2019-05-25 11:06:17', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf44589003e', '2019-05-25 11:06:32', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf483420052', '2019-05-25 11:06:48', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf4c0500067', '2019-05-25 11:07:04', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf4fd27007b', '2019-05-25 11:07:19', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf53aa3008f', '2019-05-25 11:07:35', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf5778100a3', '2019-05-25 11:07:51', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf5b4c500b8', '2019-05-25 11:08:06', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf5f1bd00cc', '2019-05-25 11:08:22', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf62f1900e0', '2019-05-25 11:08:38', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf66cd700f4', '2019-05-25 11:08:53', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf6aa890108', '2019-05-25 11:09:09', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf6e7e6011d', '2019-05-25 11:09:25', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf725540131', '2019-05-25 11:09:41', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf762920146', '2019-05-25 11:09:56', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf79fe9015a', '2019-05-25 11:10:12', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf7dd1c016f', '2019-05-25 11:10:28', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf81a7d0184', '2019-05-25 11:10:43', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf857920198', '2019-05-25 11:10:59', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf894f501ad', '2019-05-25 11:11:15', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf8d21001c1', '2019-05-25 11:11:30', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf90f4e01d5', '2019-05-25 11:11:46', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf94c9301e9', '2019-05-25 11:12:02', NULL);
INSERT INTO `displacement` VALUES ('2c9ac4cd6aecf351016aecf989c201fd', '2019-05-25 11:12:17', NULL);

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
-- Records of displacement_every
-- ----------------------------
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefc1fd0074', '2c9ac4cd6aecee11016aecefc1e00072', 0, '2c9ac4cd6aecee11016aecefc1fb0073', '0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefc2040076', '2c9ac4cd6aecee11016aecefc1e00072', 1, '2c9ac4cd6aecee11016aecefc2020075', '0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefc2090078', '2c9ac4cd6aecee11016aecefc1e00072', 2, '2c9ac4cd6aecee11016aecefc2090077', '0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefc20f007a', '2c9ac4cd6aecee11016aecefc1e00072', 3, '2c9ac4cd6aecee11016aecefc20e0079', '0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefc215007c', '2c9ac4cd6aecee11016aecefc1e00072', 4, '2c9ac4cd6aecee11016aecefc214007b', '0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefc21b007e', '2c9ac4cd6aecee11016aecefc1e00072', 5, '2c9ac4cd6aecee11016aecefc21a007d', '0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefc2200080', '2c9ac4cd6aecee11016aecefc1e00072', 6, '2c9ac4cd6aecee11016aecefc21f007f', '0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefc2250082', '2c9ac4cd6aecee11016aecefc1e00072', 7, '2c9ac4cd6aecee11016aecefc2240081', '0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefc2280084', '2c9ac4cd6aecee11016aecefc1e00072', 8, '2c9ac4cd6aecee11016aecefc2270083', '0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefff500087', '2c9ac4cd6aecee11016aecefff410085', 0, '2c9ac4cd6aecee11016aecefff500086', '2c9ac4cd6aecee11016aecefc1fb0073');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefff560089', '2c9ac4cd6aecee11016aecefff410085', 1, '2c9ac4cd6aecee11016aecefff550088', '2c9ac4cd6aecee11016aecefc2020075');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefff5a008b', '2c9ac4cd6aecee11016aecefff410085', 2, '2c9ac4cd6aecee11016aecefff5a008a', '2c9ac4cd6aecee11016aecefc2090077');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefff5e008d', '2c9ac4cd6aecee11016aecefff410085', 3, '2c9ac4cd6aecee11016aecefff5e008c', '2c9ac4cd6aecee11016aecefc20e0079');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefff61008f', '2c9ac4cd6aecee11016aecefff410085', 4, '2c9ac4cd6aecee11016aecefff61008e', '2c9ac4cd6aecee11016aecefc214007b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefff650091', '2c9ac4cd6aecee11016aecefff410085', 5, '2c9ac4cd6aecee11016aecefff640090', '2c9ac4cd6aecee11016aecefc21a007d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefff680093', '2c9ac4cd6aecee11016aecefff410085', 6, '2c9ac4cd6aecee11016aecefff680092', '2c9ac4cd6aecee11016aecefc21f007f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefff6c0095', '2c9ac4cd6aecee11016aecefff410085', 7, '2c9ac4cd6aecee11016aecefff6c0094', '2c9ac4cd6aecee11016aecefc2240081');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecefff6f0097', '2c9ac4cd6aecee11016aecefff410085', 8, '2c9ac4cd6aecee11016aecefff6f0096', '2c9ac4cd6aecee11016aecefc2270083');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf03c90009a', '2c9ac4cd6aecee11016aecf03c720098', 0, '2c9ac4cd6aecee11016aecf03c8e0099', '2c9ac4cd6aecee11016aecefff500086');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf03c98009c', '2c9ac4cd6aecee11016aecf03c720098', 1, '2c9ac4cd6aecee11016aecf03c97009b', '2c9ac4cd6aecee11016aecefff550088');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf03c9d009e', '2c9ac4cd6aecee11016aecf03c720098', 2, '2c9ac4cd6aecee11016aecf03c9c009d', '2c9ac4cd6aecee11016aecefff5a008a');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf03ca200a0', '2c9ac4cd6aecee11016aecf03c720098', 3, '2c9ac4cd6aecee11016aecf03ca1009f', '2c9ac4cd6aecee11016aecefff5e008c');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf03ca800a2', '2c9ac4cd6aecee11016aecf03c720098', 4, '2c9ac4cd6aecee11016aecf03ca700a1', '2c9ac4cd6aecee11016aecefff61008e');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf03cae00a4', '2c9ac4cd6aecee11016aecf03c720098', 5, '2c9ac4cd6aecee11016aecf03cad00a3', '2c9ac4cd6aecee11016aecefff640090');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf03cb300a6', '2c9ac4cd6aecee11016aecf03c720098', 6, '2c9ac4cd6aecee11016aecf03cb300a5', '2c9ac4cd6aecee11016aecefff680092');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf03cb900a8', '2c9ac4cd6aecee11016aecf03c720098', 7, '2c9ac4cd6aecee11016aecf03cb800a7', '2c9ac4cd6aecee11016aecefff6c0094');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf03cbe00aa', '2c9ac4cd6aecee11016aecf03c720098', 8, '2c9ac4cd6aecee11016aecf03cbd00a9', '2c9ac4cd6aecee11016aecefff6f0096');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0797100ad', '2c9ac4cd6aecee11016aecf0796300ab', 0, '2c9ac4cd6aecee11016aecf0797000ac', '2c9ac4cd6aecee11016aecf03c8e0099');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0797500af', '2c9ac4cd6aecee11016aecf0796300ab', 1, '2c9ac4cd6aecee11016aecf0797500ae', '2c9ac4cd6aecee11016aecf03c97009b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0797a00b1', '2c9ac4cd6aecee11016aecf0796300ab', 2, '2c9ac4cd6aecee11016aecf0797900b0', '2c9ac4cd6aecee11016aecf03c9c009d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0797e00b3', '2c9ac4cd6aecee11016aecf0796300ab', 3, '2c9ac4cd6aecee11016aecf0797d00b2', '2c9ac4cd6aecee11016aecf03ca1009f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0798200b5', '2c9ac4cd6aecee11016aecf0796300ab', 4, '2c9ac4cd6aecee11016aecf0798200b4', '2c9ac4cd6aecee11016aecf03ca700a1');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0798600b7', '2c9ac4cd6aecee11016aecf0796300ab', 5, '2c9ac4cd6aecee11016aecf0798600b6', '2c9ac4cd6aecee11016aecf03cad00a3');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0798a00b9', '2c9ac4cd6aecee11016aecf0796300ab', 6, '2c9ac4cd6aecee11016aecf0798900b8', '2c9ac4cd6aecee11016aecf03cb300a5');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0798e00bb', '2c9ac4cd6aecee11016aecf0796300ab', 7, '2c9ac4cd6aecee11016aecf0798d00ba', '2c9ac4cd6aecee11016aecf03cb800a7');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0799000bd', '2c9ac4cd6aecee11016aecf0796300ab', 8, '2c9ac4cd6aecee11016aecf0799000bc', '2c9ac4cd6aecee11016aecf03cbd00a9');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0b64c00c0', '2c9ac4cd6aecee11016aecf0b63f00be', 0, '2c9ac4cd6aecee11016aecf0b64b00bf', '2c9ac4cd6aecee11016aecf0797000ac');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0b65000c2', '2c9ac4cd6aecee11016aecf0b63f00be', 1, '2c9ac4cd6aecee11016aecf0b65000c1', '2c9ac4cd6aecee11016aecf0797500ae');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0b65500c4', '2c9ac4cd6aecee11016aecf0b63f00be', 2, '2c9ac4cd6aecee11016aecf0b65400c3', '2c9ac4cd6aecee11016aecf0797900b0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0b65900c6', '2c9ac4cd6aecee11016aecf0b63f00be', 3, '2c9ac4cd6aecee11016aecf0b65800c5', '2c9ac4cd6aecee11016aecf0797d00b2');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0b65d00c8', '2c9ac4cd6aecee11016aecf0b63f00be', 4, '2c9ac4cd6aecee11016aecf0b65c00c7', '2c9ac4cd6aecee11016aecf0798200b4');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0b66100ca', '2c9ac4cd6aecee11016aecf0b63f00be', 5, '2c9ac4cd6aecee11016aecf0b66100c9', '2c9ac4cd6aecee11016aecf0798600b6');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0b66500cc', '2c9ac4cd6aecee11016aecf0b63f00be', 6, '2c9ac4cd6aecee11016aecf0b66500cb', '2c9ac4cd6aecee11016aecf0798900b8');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0b66a00ce', '2c9ac4cd6aecee11016aecf0b63f00be', 7, '2c9ac4cd6aecee11016aecf0b66900cd', '2c9ac4cd6aecee11016aecf0798d00ba');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0b66e00d0', '2c9ac4cd6aecee11016aecf0b63f00be', 8, '2c9ac4cd6aecee11016aecf0b66e00cf', '2c9ac4cd6aecee11016aecf0799000bc');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0f38b00d3', '2c9ac4cd6aecee11016aecf0f37600d1', 0, '2c9ac4cd6aecee11016aecf0f38a00d2', '2c9ac4cd6aecee11016aecf0b64b00bf');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0f39300d5', '2c9ac4cd6aecee11016aecf0f37600d1', 1, '2c9ac4cd6aecee11016aecf0f39100d4', '2c9ac4cd6aecee11016aecf0b65000c1');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0f39b00d7', '2c9ac4cd6aecee11016aecf0f37600d1', 2, '2c9ac4cd6aecee11016aecf0f39a00d6', '2c9ac4cd6aecee11016aecf0b65400c3');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0f3a300d9', '2c9ac4cd6aecee11016aecf0f37600d1', 3, '2c9ac4cd6aecee11016aecf0f3a200d8', '2c9ac4cd6aecee11016aecf0b65800c5');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0f3ab00db', '2c9ac4cd6aecee11016aecf0f37600d1', 4, '2c9ac4cd6aecee11016aecf0f3aa00da', '2c9ac4cd6aecee11016aecf0b65c00c7');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0f3b500dd', '2c9ac4cd6aecee11016aecf0f37600d1', 5, '2c9ac4cd6aecee11016aecf0f3b200dc', '2c9ac4cd6aecee11016aecf0b66100c9');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0f3be00df', '2c9ac4cd6aecee11016aecf0f37600d1', 6, '2c9ac4cd6aecee11016aecf0f3bd00de', '2c9ac4cd6aecee11016aecf0b66500cb');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0f3c700e1', '2c9ac4cd6aecee11016aecf0f37600d1', 7, '2c9ac4cd6aecee11016aecf0f3c600e0', '2c9ac4cd6aecee11016aecf0b66900cd');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf0f3cf00e3', '2c9ac4cd6aecee11016aecf0f37600d1', 8, '2c9ac4cd6aecee11016aecf0f3ce00e2', '2c9ac4cd6aecee11016aecf0b66e00cf');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1312a00e6', '2c9ac4cd6aecee11016aecf1311700e4', 0, '2c9ac4cd6aecee11016aecf1312900e5', '2c9ac4cd6aecee11016aecf0f38a00d2');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1313200e8', '2c9ac4cd6aecee11016aecf1311700e4', 1, '2c9ac4cd6aecee11016aecf1313000e7', '2c9ac4cd6aecee11016aecf0f39100d4');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1313900ea', '2c9ac4cd6aecee11016aecf1311700e4', 2, '2c9ac4cd6aecee11016aecf1313800e9', '2c9ac4cd6aecee11016aecf0f39a00d6');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1314400ec', '2c9ac4cd6aecee11016aecf1311700e4', 3, '2c9ac4cd6aecee11016aecf1314100eb', '2c9ac4cd6aecee11016aecf0f3a200d8');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1314f00ee', '2c9ac4cd6aecee11016aecf1311700e4', 4, '2c9ac4cd6aecee11016aecf1314e00ed', '2c9ac4cd6aecee11016aecf0f3aa00da');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1315b00f0', '2c9ac4cd6aecee11016aecf1311700e4', 5, '2c9ac4cd6aecee11016aecf1315a00ef', '2c9ac4cd6aecee11016aecf0f3b200dc');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1316300f2', '2c9ac4cd6aecee11016aecf1311700e4', 6, '2c9ac4cd6aecee11016aecf1316200f1', '2c9ac4cd6aecee11016aecf0f3bd00de');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1316800f4', '2c9ac4cd6aecee11016aecf1311700e4', 7, '2c9ac4cd6aecee11016aecf1316700f3', '2c9ac4cd6aecee11016aecf0f3c600e0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1316e00f6', '2c9ac4cd6aecee11016aecf1311700e4', 8, '2c9ac4cd6aecee11016aecf1316d00f5', '2c9ac4cd6aecee11016aecf0f3ce00e2');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf16e8100f9', '2c9ac4cd6aecee11016aecf16e6e00f7', 0, '2c9ac4cd6aecee11016aecf16e8000f8', '2c9ac4cd6aecee11016aecf1312900e5');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf16e8900fb', '2c9ac4cd6aecee11016aecf16e6e00f7', 1, '2c9ac4cd6aecee11016aecf16e8800fa', '2c9ac4cd6aecee11016aecf1313000e7');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf16e9100fd', '2c9ac4cd6aecee11016aecf16e6e00f7', 2, '2c9ac4cd6aecee11016aecf16e9000fc', '2c9ac4cd6aecee11016aecf1313800e9');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf16e9900ff', '2c9ac4cd6aecee11016aecf16e6e00f7', 3, '2c9ac4cd6aecee11016aecf16e9700fe', '2c9ac4cd6aecee11016aecf1314100eb');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf16ea20101', '2c9ac4cd6aecee11016aecf16e6e00f7', 4, '2c9ac4cd6aecee11016aecf16ea10100', '2c9ac4cd6aecee11016aecf1314e00ed');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf16eab0103', '2c9ac4cd6aecee11016aecf16e6e00f7', 5, '2c9ac4cd6aecee11016aecf16ea90102', '2c9ac4cd6aecee11016aecf1315a00ef');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf16eb30105', '2c9ac4cd6aecee11016aecf16e6e00f7', 6, '2c9ac4cd6aecee11016aecf16eb20104', '2c9ac4cd6aecee11016aecf1316200f1');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf16ebb0107', '2c9ac4cd6aecee11016aecf16e6e00f7', 7, '2c9ac4cd6aecee11016aecf16eba0106', '2c9ac4cd6aecee11016aecf1316700f3');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf16ec40109', '2c9ac4cd6aecee11016aecf16e6e00f7', 8, '2c9ac4cd6aecee11016aecf16ec30108', '2c9ac4cd6aecee11016aecf1316d00f5');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1ac2d010c', '2c9ac4cd6aecee11016aecf1ac1e010a', 0, '2c9ac4cd6aecee11016aecf1ac2d010b', '2c9ac4cd6aecee11016aecf16e8000f8');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1ac33010e', '2c9ac4cd6aecee11016aecf1ac1e010a', 1, '2c9ac4cd6aecee11016aecf1ac33010d', '2c9ac4cd6aecee11016aecf16e8800fa');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1ac380110', '2c9ac4cd6aecee11016aecf1ac1e010a', 2, '2c9ac4cd6aecee11016aecf1ac37010f', '2c9ac4cd6aecee11016aecf16e9000fc');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1ac3c0112', '2c9ac4cd6aecee11016aecf1ac1e010a', 3, '2c9ac4cd6aecee11016aecf1ac3c0111', '2c9ac4cd6aecee11016aecf16e9700fe');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1ac410114', '2c9ac4cd6aecee11016aecf1ac1e010a', 4, '2c9ac4cd6aecee11016aecf1ac410113', '2c9ac4cd6aecee11016aecf16ea10100');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1ac470116', '2c9ac4cd6aecee11016aecf1ac1e010a', 5, '2c9ac4cd6aecee11016aecf1ac460115', '2c9ac4cd6aecee11016aecf16ea90102');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1ac4c0118', '2c9ac4cd6aecee11016aecf1ac1e010a', 6, '2c9ac4cd6aecee11016aecf1ac4b0117', '2c9ac4cd6aecee11016aecf16eb20104');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1ac4f011a', '2c9ac4cd6aecee11016aecf1ac1e010a', 7, '2c9ac4cd6aecee11016aecf1ac4f0119', '2c9ac4cd6aecee11016aecf16eba0106');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf1ac53011c', '2c9ac4cd6aecee11016aecf1ac1e010a', 8, '2c9ac4cd6aecee11016aecf1ac52011b', '2c9ac4cd6aecee11016aecf16ec30108');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf209e40125', '2c9ac4cd6aecee11016aecf20873011d', 0, '2c9ac4cd6aecee11016aecf2090d0120', '2c9ac4cd6aecee11016aecf1ac2d010b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf209ef0127', '2c9ac4cd6aecee11016aecf20873011d', 1, '2c9ac4cd6aecee11016aecf209ed0126', '2c9ac4cd6aecee11016aecf1ac33010d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2091d0122', '2c9ac4cd6aecee11016aecf20880011e', 0, '2c9ac4cd6aecee11016aecf209100121', '2c9ac4cd6aecee11016aecf1ac2d010b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf209f80129', '2c9ac4cd6aecee11016aecf20873011d', 2, '2c9ac4cd6aecee11016aecf209f60128', '2c9ac4cd6aecee11016aecf1ac37010f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2096a0124', '2c9ac4cd6aecee11016aecf20880011e', 1, '2c9ac4cd6aecee11016aecf2094e0123', '2c9ac4cd6aecee11016aecf1ac33010d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf20a0f012b', '2c9ac4cd6aecee11016aecf20873011d', 3, '2c9ac4cd6aecee11016aecf20a0d012a', '2c9ac4cd6aecee11016aecf1ac3c0111');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf20a350131', '2c9ac4cd6aecee11016aecf20880011e', 2, '2c9ac4cd6aecee11016aecf20a330130', '2c9ac4cd6aecee11016aecf1ac37010f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf20a1f012d', '2c9ac4cd6aecee11016aecf20873011d', 4, '2c9ac4cd6aecee11016aecf20a1b012c', '2c9ac4cd6aecee11016aecf1ac410113');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf20a4b0137', '2c9ac4cd6aecee11016aecf20880011e', 3, '2c9ac4cd6aecee11016aecf20a4a0136', '2c9ac4cd6aecee11016aecf1ac3c0111');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf20a2e012f', '2c9ac4cd6aecee11016aecf20873011d', 5, '2c9ac4cd6aecee11016aecf20a2d012e', '2c9ac4cd6aecee11016aecf1ac460115');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf20a57013b', '2c9ac4cd6aecee11016aecf20880011e', 4, '2c9ac4cd6aecee11016aecf20a55013a', '2c9ac4cd6aecee11016aecf1ac410113');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf20a3e0133', '2c9ac4cd6aecee11016aecf20873011d', 6, '2c9ac4cd6aecee11016aecf20a3d0132', '2c9ac4cd6aecee11016aecf1ac4b0117');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf20a66013d', '2c9ac4cd6aecee11016aecf20880011e', 5, '2c9ac4cd6aecee11016aecf20a65013c', '2c9ac4cd6aecee11016aecf1ac460115');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf20a450135', '2c9ac4cd6aecee11016aecf20873011d', 7, '2c9ac4cd6aecee11016aecf20a450134', '2c9ac4cd6aecee11016aecf1ac4f0119');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf20a77013f', '2c9ac4cd6aecee11016aecf20880011e', 6, '2c9ac4cd6aecee11016aecf20a76013e', '2c9ac4cd6aecee11016aecf1ac4b0117');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf20a4c0139', '2c9ac4cd6aecee11016aecf20873011d', 8, '2c9ac4cd6aecee11016aecf20a4b0138', '2c9ac4cd6aecee11016aecf1ac52011b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf20aa40141', '2c9ac4cd6aecee11016aecf20880011e', 7, '2c9ac4cd6aecee11016aecf20aa30140', '2c9ac4cd6aecee11016aecf1ac4f0119');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf20acb0143', '2c9ac4cd6aecee11016aecf20880011e', 8, '2c9ac4cd6aecee11016aecf20ac90142', '2c9ac4cd6aecee11016aecf1ac52011b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf235570148', '2c9ac4cd6aecee11016aecf234890146', 0, '2c9ac4cd6aecee11016aecf235500147', '2c9ac4cd6aecee11016aecf209100121');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2355e014a', '2c9ac4cd6aecee11016aecf234890146', 1, '2c9ac4cd6aecee11016aecf2355d0149', '2c9ac4cd6aecee11016aecf2094e0123');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf23566014c', '2c9ac4cd6aecee11016aecf234890146', 2, '2c9ac4cd6aecee11016aecf23564014b', '2c9ac4cd6aecee11016aecf20a330130');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2356e014e', '2c9ac4cd6aecee11016aecf234890146', 3, '2c9ac4cd6aecee11016aecf2356c014d', '2c9ac4cd6aecee11016aecf20a4a0136');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf235770150', '2c9ac4cd6aecee11016aecf234890146', 4, '2c9ac4cd6aecee11016aecf23575014f', '2c9ac4cd6aecee11016aecf20a55013a');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2357d0152', '2c9ac4cd6aecee11016aecf234890146', 5, '2c9ac4cd6aecee11016aecf2357d0151', '2c9ac4cd6aecee11016aecf20a65013c');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf235900154', '2c9ac4cd6aecee11016aecf234890146', 6, '2c9ac4cd6aecee11016aecf2358f0153', '2c9ac4cd6aecee11016aecf20a76013e');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf235970156', '2c9ac4cd6aecee11016aecf234890146', 7, '2c9ac4cd6aecee11016aecf235970155', '2c9ac4cd6aecee11016aecf20aa30140');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2359d0158', '2c9ac4cd6aecee11016aecf234890146', 8, '2c9ac4cd6aecee11016aecf2359c0157', '2c9ac4cd6aecee11016aecf20ac90142');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24b05015d', '2c9ac4cd6aecee11016aecf24afa015b', 0, '2c9ac4cd6aecee11016aecf24b04015c', '2c9ac4cd6aecee11016aecf235500147');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24b0f015f', '2c9ac4cd6aecee11016aecf24afa015b', 1, '2c9ac4cd6aecee11016aecf24b0e015e', '2c9ac4cd6aecee11016aecf2355d0149');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24b8e0170', '2c9ac4cd6aecee11016aecf24b5e016e', 0, '2c9ac4cd6aecee11016aecf24b8e016f', '2c9ac4cd6aecee11016aecf235500147');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24b170161', '2c9ac4cd6aecee11016aecf24afa015b', 2, '2c9ac4cd6aecee11016aecf24b150160', '2c9ac4cd6aecee11016aecf23564014b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24b940172', '2c9ac4cd6aecee11016aecf24b5e016e', 1, '2c9ac4cd6aecee11016aecf24b930171', '2c9ac4cd6aecee11016aecf2355d0149');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24b1d0163', '2c9ac4cd6aecee11016aecf24afa015b', 3, '2c9ac4cd6aecee11016aecf24b1c0162', '2c9ac4cd6aecee11016aecf2356c014d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24b990174', '2c9ac4cd6aecee11016aecf24b5e016e', 2, '2c9ac4cd6aecee11016aecf24b990173', '2c9ac4cd6aecee11016aecf23564014b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24b240165', '2c9ac4cd6aecee11016aecf24afa015b', 4, '2c9ac4cd6aecee11016aecf24b220164', '2c9ac4cd6aecee11016aecf23575014f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24bc80176', '2c9ac4cd6aecee11016aecf24b5e016e', 3, '2c9ac4cd6aecee11016aecf24bc80175', '2c9ac4cd6aecee11016aecf2356c014d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24b300167', '2c9ac4cd6aecee11016aecf24afa015b', 5, '2c9ac4cd6aecee11016aecf24b2f0166', '2c9ac4cd6aecee11016aecf2357d0151');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24bd10178', '2c9ac4cd6aecee11016aecf24b5e016e', 4, '2c9ac4cd6aecee11016aecf24bcf0177', '2c9ac4cd6aecee11016aecf23575014f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24b350169', '2c9ac4cd6aecee11016aecf24afa015b', 6, '2c9ac4cd6aecee11016aecf24b340168', '2c9ac4cd6aecee11016aecf2358f0153');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24bea017a', '2c9ac4cd6aecee11016aecf24b5e016e', 5, '2c9ac4cd6aecee11016aecf24bdb0179', '2c9ac4cd6aecee11016aecf2357d0151');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24b3a016b', '2c9ac4cd6aecee11016aecf24afa015b', 7, '2c9ac4cd6aecee11016aecf24b38016a', '2c9ac4cd6aecee11016aecf235970155');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24bfd017c', '2c9ac4cd6aecee11016aecf24b5e016e', 6, '2c9ac4cd6aecee11016aecf24bfb017b', '2c9ac4cd6aecee11016aecf2358f0153');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24b3d016d', '2c9ac4cd6aecee11016aecf24afa015b', 8, '2c9ac4cd6aecee11016aecf24b3c016c', '2c9ac4cd6aecee11016aecf2359c0157');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24c12017e', '2c9ac4cd6aecee11016aecf24b5e016e', 7, '2c9ac4cd6aecee11016aecf24c11017d', '2c9ac4cd6aecee11016aecf235970155');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf24c190180', '2c9ac4cd6aecee11016aecf24b5e016e', 8, '2c9ac4cd6aecee11016aecf24c18017f', '2c9ac4cd6aecee11016aecf2359c0157');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf258800184', '2c9ac4cd6aecee11016aecf2585d0182', 0, '2c9ac4cd6aecee11016aecf258780183', '2c9ac4cd6aecee11016aecf24b8e016f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf258880186', '2c9ac4cd6aecee11016aecf2585d0182', 1, '2c9ac4cd6aecee11016aecf258860185', '2c9ac4cd6aecee11016aecf24b930171');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf258930188', '2c9ac4cd6aecee11016aecf2585d0182', 2, '2c9ac4cd6aecee11016aecf258920187', '2c9ac4cd6aecee11016aecf24b990173');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf25897018a', '2c9ac4cd6aecee11016aecf2585d0182', 3, '2c9ac4cd6aecee11016aecf258970189', '2c9ac4cd6aecee11016aecf24bc80175');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf258a6018c', '2c9ac4cd6aecee11016aecf2585d0182', 4, '2c9ac4cd6aecee11016aecf2589e018b', '2c9ac4cd6aecee11016aecf24bcf0177');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf258ae018e', '2c9ac4cd6aecee11016aecf2585d0182', 5, '2c9ac4cd6aecee11016aecf258ac018d', '2c9ac4cd6aecee11016aecf24bdb0179');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf258b30190', '2c9ac4cd6aecee11016aecf2585d0182', 6, '2c9ac4cd6aecee11016aecf258b3018f', '2c9ac4cd6aecee11016aecf24bfb017b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf258b80192', '2c9ac4cd6aecee11016aecf2585d0182', 7, '2c9ac4cd6aecee11016aecf258b80191', '2c9ac4cd6aecee11016aecf24c11017d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf258be0194', '2c9ac4cd6aecee11016aecf2585d0182', 8, '2c9ac4cd6aecee11016aecf258bd0193', '2c9ac4cd6aecee11016aecf24c18017f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2740d0199', '2c9ac4cd6aecee11016aecf273e60197', 0, '2c9ac4cd6aecee11016aecf2740c0198', '2c9ac4cd6aecee11016aecf258780183');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf27412019b', '2c9ac4cd6aecee11016aecf273e60197', 1, '2c9ac4cd6aecee11016aecf27411019a', '2c9ac4cd6aecee11016aecf258860185');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2741a019d', '2c9ac4cd6aecee11016aecf273e60197', 2, '2c9ac4cd6aecee11016aecf27418019c', '2c9ac4cd6aecee11016aecf258920187');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf27420019f', '2c9ac4cd6aecee11016aecf273e60197', 3, '2c9ac4cd6aecee11016aecf2741f019e', '2c9ac4cd6aecee11016aecf258970189');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2742701a1', '2c9ac4cd6aecee11016aecf273e60197', 4, '2c9ac4cd6aecee11016aecf2742601a0', '2c9ac4cd6aecee11016aecf2589e018b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2742c01a3', '2c9ac4cd6aecee11016aecf273e60197', 5, '2c9ac4cd6aecee11016aecf2742b01a2', '2c9ac4cd6aecee11016aecf258ac018d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2743001a5', '2c9ac4cd6aecee11016aecf273e60197', 6, '2c9ac4cd6aecee11016aecf2743001a4', '2c9ac4cd6aecee11016aecf258b3018f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2743601a7', '2c9ac4cd6aecee11016aecf273e60197', 7, '2c9ac4cd6aecee11016aecf2743601a6', '2c9ac4cd6aecee11016aecf258b80191');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2743b01a9', '2c9ac4cd6aecee11016aecf273e60197', 8, '2c9ac4cd6aecee11016aecf2743a01a8', '2c9ac4cd6aecee11016aecf258bd0193');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf289b201ad', '2c9ac4cd6aecee11016aecf289a301ab', 0, '2c9ac4cd6aecee11016aecf289b001ac', '2c9ac4cd6aecee11016aecf2740c0198');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf28a2f01c0', '2c9ac4cd6aecee11016aecf28a2301be', 0, '2c9ac4cd6aecee11016aecf28a2e01bf', '2c9ac4cd6aecee11016aecf2740c0198');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf289b901af', '2c9ac4cd6aecee11016aecf289a301ab', 1, '2c9ac4cd6aecee11016aecf289b801ae', '2c9ac4cd6aecee11016aecf27411019a');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf28a3601c2', '2c9ac4cd6aecee11016aecf28a2301be', 1, '2c9ac4cd6aecee11016aecf28a3401c1', '2c9ac4cd6aecee11016aecf27411019a');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf289be01b1', '2c9ac4cd6aecee11016aecf289a301ab', 2, '2c9ac4cd6aecee11016aecf289bd01b0', '2c9ac4cd6aecee11016aecf27418019c');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf28a3f01c4', '2c9ac4cd6aecee11016aecf28a2301be', 2, '2c9ac4cd6aecee11016aecf28a3e01c3', '2c9ac4cd6aecee11016aecf27418019c');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf289c801b3', '2c9ac4cd6aecee11016aecf289a301ab', 3, '2c9ac4cd6aecee11016aecf289c501b2', '2c9ac4cd6aecee11016aecf2741f019e');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf28a4601c6', '2c9ac4cd6aecee11016aecf28a2301be', 3, '2c9ac4cd6aecee11016aecf28a4501c5', '2c9ac4cd6aecee11016aecf2741f019e');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf289d201b5', '2c9ac4cd6aecee11016aecf289a301ab', 4, '2c9ac4cd6aecee11016aecf289d001b4', '2c9ac4cd6aecee11016aecf2742601a0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf28a4c01c8', '2c9ac4cd6aecee11016aecf28a2301be', 4, '2c9ac4cd6aecee11016aecf28a4a01c7', '2c9ac4cd6aecee11016aecf2742601a0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf289d701b7', '2c9ac4cd6aecee11016aecf289a301ab', 5, '2c9ac4cd6aecee11016aecf289d701b6', '2c9ac4cd6aecee11016aecf2742b01a2');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf28a5101ca', '2c9ac4cd6aecee11016aecf28a2301be', 5, '2c9ac4cd6aecee11016aecf28a5001c9', '2c9ac4cd6aecee11016aecf2742b01a2');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf289e201b9', '2c9ac4cd6aecee11016aecf289a301ab', 6, '2c9ac4cd6aecee11016aecf289e101b8', '2c9ac4cd6aecee11016aecf2743001a4');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf28a5a01cc', '2c9ac4cd6aecee11016aecf28a2301be', 6, '2c9ac4cd6aecee11016aecf28a5801cb', '2c9ac4cd6aecee11016aecf2743001a4');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf289ed01bb', '2c9ac4cd6aecee11016aecf289a301ab', 7, '2c9ac4cd6aecee11016aecf289ec01ba', '2c9ac4cd6aecee11016aecf2743601a6');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf28a6901ce', '2c9ac4cd6aecee11016aecf28a2301be', 7, '2c9ac4cd6aecee11016aecf28a6901cd', '2c9ac4cd6aecee11016aecf2743601a6');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf289f701bd', '2c9ac4cd6aecee11016aecf289a301ab', 8, '2c9ac4cd6aecee11016aecf289f601bc', '2c9ac4cd6aecee11016aecf2743a01a8');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf28a6e01d0', '2c9ac4cd6aecee11016aecf28a2301be', 8, '2c9ac4cd6aecee11016aecf28a6e01cf', '2c9ac4cd6aecee11016aecf2743a01a8');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf295c101d5', '2c9ac4cd6aecee11016aecf295ae01d3', 0, '2c9ac4cd6aecee11016aecf295bc01d4', '2c9ac4cd6aecee11016aecf289b001ac');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf295c801d7', '2c9ac4cd6aecee11016aecf295ae01d3', 1, '2c9ac4cd6aecee11016aecf295c701d6', '2c9ac4cd6aecee11016aecf289b801ae');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf295ce01d9', '2c9ac4cd6aecee11016aecf295ae01d3', 2, '2c9ac4cd6aecee11016aecf295cd01d8', '2c9ac4cd6aecee11016aecf289bd01b0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf295d501db', '2c9ac4cd6aecee11016aecf295ae01d3', 3, '2c9ac4cd6aecee11016aecf295d301da', '2c9ac4cd6aecee11016aecf289c501b2');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf295db01dd', '2c9ac4cd6aecee11016aecf295ae01d3', 4, '2c9ac4cd6aecee11016aecf295da01dc', '2c9ac4cd6aecee11016aecf289d001b4');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf295e001df', '2c9ac4cd6aecee11016aecf295ae01d3', 5, '2c9ac4cd6aecee11016aecf295df01de', '2c9ac4cd6aecee11016aecf289d701b6');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf295e501e1', '2c9ac4cd6aecee11016aecf295ae01d3', 6, '2c9ac4cd6aecee11016aecf295e501e0', '2c9ac4cd6aecee11016aecf289e101b8');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf295ea01e3', '2c9ac4cd6aecee11016aecf295ae01d3', 7, '2c9ac4cd6aecee11016aecf295e901e2', '2c9ac4cd6aecee11016aecf289ec01ba');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf295f101e5', '2c9ac4cd6aecee11016aecf295ae01d3', 8, '2c9ac4cd6aecee11016aecf295f001e4', '2c9ac4cd6aecee11016aecf289f601bc');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2b27001e9', '2c9ac4cd6aecee11016aecf2b26001e7', 0, '2c9ac4cd6aecee11016aecf2b26f01e8', '2c9ac4cd6aecee11016aecf295bc01d4');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2b27501eb', '2c9ac4cd6aecee11016aecf2b26001e7', 1, '2c9ac4cd6aecee11016aecf2b27401ea', '2c9ac4cd6aecee11016aecf295c701d6');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2b27801ed', '2c9ac4cd6aecee11016aecf2b26001e7', 2, '2c9ac4cd6aecee11016aecf2b27801ec', '2c9ac4cd6aecee11016aecf295cd01d8');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2b27c01ef', '2c9ac4cd6aecee11016aecf2b26001e7', 3, '2c9ac4cd6aecee11016aecf2b27b01ee', '2c9ac4cd6aecee11016aecf295d301da');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2b27f01f1', '2c9ac4cd6aecee11016aecf2b26001e7', 4, '2c9ac4cd6aecee11016aecf2b27f01f0', '2c9ac4cd6aecee11016aecf295da01dc');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2b28501f3', '2c9ac4cd6aecee11016aecf2b26001e7', 5, '2c9ac4cd6aecee11016aecf2b28501f2', '2c9ac4cd6aecee11016aecf295df01de');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2b28b01f5', '2c9ac4cd6aecee11016aecf2b26001e7', 6, '2c9ac4cd6aecee11016aecf2b28b01f4', '2c9ac4cd6aecee11016aecf295e501e0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2b29901f7', '2c9ac4cd6aecee11016aecf2b26001e7', 7, '2c9ac4cd6aecee11016aecf2b29801f6', '2c9ac4cd6aecee11016aecf295e901e2');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2b29d01f9', '2c9ac4cd6aecee11016aecf2b26001e7', 8, '2c9ac4cd6aecee11016aecf2b29d01f8', '2c9ac4cd6aecee11016aecf295f001e4');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c8cd01fd', '2c9ac4cd6aecee11016aecf2c8bd01fb', 0, '2c9ac4cd6aecee11016aecf2c8cc01fc', '2c9ac4cd6aecee11016aecf2b26f01e8');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c8ea0208', '2c9ac4cd6aecee11016aecf2c8dd0200', 0, '2c9ac4cd6aecee11016aecf2c8ea0206', '2c9ac4cd6aecee11016aecf2b26f01e8');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c8d801ff', '2c9ac4cd6aecee11016aecf2c8bd01fb', 1, '2c9ac4cd6aecee11016aecf2c8d701fe', '2c9ac4cd6aecee11016aecf2b27401ea');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c8f0020b', '2c9ac4cd6aecee11016aecf2c8dd0200', 1, '2c9ac4cd6aecee11016aecf2c8ef0209', '2c9ac4cd6aecee11016aecf2b27401ea');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c8dd0202', '2c9ac4cd6aecee11016aecf2c8bd01fb', 2, '2c9ac4cd6aecee11016aecf2c8dd0201', '2c9ac4cd6aecee11016aecf2b27801ec');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c8f5020f', '2c9ac4cd6aecee11016aecf2c8dd0200', 2, '2c9ac4cd6aecee11016aecf2c8f5020d', '2c9ac4cd6aecee11016aecf2b27801ec');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c8e40204', '2c9ac4cd6aecee11016aecf2c8bd01fb', 3, '2c9ac4cd6aecee11016aecf2c8e30203', '2c9ac4cd6aecee11016aecf2b27b01ee');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c8fb0213', '2c9ac4cd6aecee11016aecf2c8dd0200', 3, '2c9ac4cd6aecee11016aecf2c8fa0212', '2c9ac4cd6aecee11016aecf2b27b01ee');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c8ea0207', '2c9ac4cd6aecee11016aecf2c8bd01fb', 4, '2c9ac4cd6aecee11016aecf2c8e90205', '2c9ac4cd6aecee11016aecf2b27f01f0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c9000217', '2c9ac4cd6aecee11016aecf2c8dd0200', 4, '2c9ac4cd6aecee11016aecf2c8ff0216', '2c9ac4cd6aecee11016aecf2b27f01f0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c8f0020c', '2c9ac4cd6aecee11016aecf2c8bd01fb', 5, '2c9ac4cd6aecee11016aecf2c8ef020a', '2c9ac4cd6aecee11016aecf2b28501f2');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c905021a', '2c9ac4cd6aecee11016aecf2c8dd0200', 5, '2c9ac4cd6aecee11016aecf2c9040219', '2c9ac4cd6aecee11016aecf2b28501f2');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c8f50210', '2c9ac4cd6aecee11016aecf2c8bd01fb', 6, '2c9ac4cd6aecee11016aecf2c8f5020e', '2c9ac4cd6aecee11016aecf2b28b01f4');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c90a021c', '2c9ac4cd6aecee11016aecf2c8dd0200', 6, '2c9ac4cd6aecee11016aecf2c90a021b', '2c9ac4cd6aecee11016aecf2b28b01f4');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c8fb0214', '2c9ac4cd6aecee11016aecf2c8bd01fb', 7, '2c9ac4cd6aecee11016aecf2c8fa0211', '2c9ac4cd6aecee11016aecf2b29801f6');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c90f021e', '2c9ac4cd6aecee11016aecf2c8dd0200', 7, '2c9ac4cd6aecee11016aecf2c90f021d', '2c9ac4cd6aecee11016aecf2b29801f6');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c9000218', '2c9ac4cd6aecee11016aecf2c8bd01fb', 8, '2c9ac4cd6aecee11016aecf2c8ff0215', '2c9ac4cd6aecee11016aecf2b29d01f8');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2c9140220', '2c9ac4cd6aecee11016aecf2c8dd0200', 8, '2c9ac4cd6aecee11016aecf2c913021f', '2c9ac4cd6aecee11016aecf2b29d01f8');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2d2e10224', '2c9ac4cd6aecee11016aecf2d2d10222', 0, '2c9ac4cd6aecee11016aecf2d2e00223', '2c9ac4cd6aecee11016aecf2c8ea0206');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2d2e80226', '2c9ac4cd6aecee11016aecf2d2d10222', 1, '2c9ac4cd6aecee11016aecf2d2e70225', '2c9ac4cd6aecee11016aecf2c8ef0209');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2d2f00228', '2c9ac4cd6aecee11016aecf2d2d10222', 2, '2c9ac4cd6aecee11016aecf2d2ef0227', '2c9ac4cd6aecee11016aecf2c8f5020d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2d2f4022a', '2c9ac4cd6aecee11016aecf2d2d10222', 3, '2c9ac4cd6aecee11016aecf2d2f30229', '2c9ac4cd6aecee11016aecf2c8fa0212');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2d2f8022c', '2c9ac4cd6aecee11016aecf2d2d10222', 4, '2c9ac4cd6aecee11016aecf2d2f7022b', '2c9ac4cd6aecee11016aecf2c8ff0216');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2d2fe022e', '2c9ac4cd6aecee11016aecf2d2d10222', 5, '2c9ac4cd6aecee11016aecf2d2fe022d', '2c9ac4cd6aecee11016aecf2c9040219');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2d3030230', '2c9ac4cd6aecee11016aecf2d2d10222', 6, '2c9ac4cd6aecee11016aecf2d302022f', '2c9ac4cd6aecee11016aecf2c90a021b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2d3070232', '2c9ac4cd6aecee11016aecf2d2d10222', 7, '2c9ac4cd6aecee11016aecf2d3060231', '2c9ac4cd6aecee11016aecf2c90f021d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2d30d0234', '2c9ac4cd6aecee11016aecf2d2d10222', 8, '2c9ac4cd6aecee11016aecf2d30d0233', '2c9ac4cd6aecee11016aecf2c913021f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2ef290238', '2c9ac4cd6aecee11016aecf2ef200236', 0, '2c9ac4cd6aecee11016aecf2ef280237', '2c9ac4cd6aecee11016aecf2d2e00223');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2ef2c023a', '2c9ac4cd6aecee11016aecf2ef200236', 1, '2c9ac4cd6aecee11016aecf2ef2b0239', '2c9ac4cd6aecee11016aecf2d2e70225');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2ef31023c', '2c9ac4cd6aecee11016aecf2ef200236', 2, '2c9ac4cd6aecee11016aecf2ef2f023b', '2c9ac4cd6aecee11016aecf2d2ef0227');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2ef34023e', '2c9ac4cd6aecee11016aecf2ef200236', 3, '2c9ac4cd6aecee11016aecf2ef33023d', '2c9ac4cd6aecee11016aecf2d2f30229');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2ef380240', '2c9ac4cd6aecee11016aecf2ef200236', 4, '2c9ac4cd6aecee11016aecf2ef38023f', '2c9ac4cd6aecee11016aecf2d2f7022b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2ef3c0242', '2c9ac4cd6aecee11016aecf2ef200236', 5, '2c9ac4cd6aecee11016aecf2ef3c0241', '2c9ac4cd6aecee11016aecf2d2fe022d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2ef400244', '2c9ac4cd6aecee11016aecf2ef200236', 6, '2c9ac4cd6aecee11016aecf2ef3f0243', '2c9ac4cd6aecee11016aecf2d302022f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2ef430246', '2c9ac4cd6aecee11016aecf2ef200236', 7, '2c9ac4cd6aecee11016aecf2ef420245', '2c9ac4cd6aecee11016aecf2d3060231');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecee11016aecf2ef460248', '2c9ac4cd6aecee11016aecf2ef200236', 8, '2c9ac4cd6aecee11016aecf2ef450247', '2c9ac4cd6aecee11016aecf2d30d0233');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf38c730003', '2c9ac4cd6aecf351016aecf38bf10001', 0, '2c9ac4cd6aecf351016aecf38c640002', '2c9ac4cd6aecee11016aecf2ef280237');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf38c870005', '2c9ac4cd6aecf351016aecf38bf10001', 1, '2c9ac4cd6aecf351016aecf38c860004', '2c9ac4cd6aecee11016aecf2ef2b0239');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf38c950007', '2c9ac4cd6aecf351016aecf38bf10001', 2, '2c9ac4cd6aecf351016aecf38c930006', '2c9ac4cd6aecee11016aecf2ef2f023b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf38ca30009', '2c9ac4cd6aecf351016aecf38bf10001', 3, '2c9ac4cd6aecf351016aecf38ca10008', '2c9ac4cd6aecee11016aecf2ef33023d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf38cae000b', '2c9ac4cd6aecf351016aecf38bf10001', 4, '2c9ac4cd6aecf351016aecf38cad000a', '2c9ac4cd6aecee11016aecf2ef38023f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf38cb9000d', '2c9ac4cd6aecf351016aecf38bf10001', 5, '2c9ac4cd6aecf351016aecf38cb8000c', '2c9ac4cd6aecee11016aecf2ef3c0241');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf38cc3000f', '2c9ac4cd6aecf351016aecf38bf10001', 6, '2c9ac4cd6aecf351016aecf38cc2000e', '2c9ac4cd6aecee11016aecf2ef3f0243');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf38ccb0011', '2c9ac4cd6aecf351016aecf38bf10001', 7, '2c9ac4cd6aecf351016aecf38cca0010', '2c9ac4cd6aecee11016aecf2ef420245');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf38cd60013', '2c9ac4cd6aecf351016aecf38bf10001', 8, '2c9ac4cd6aecf351016aecf38cd40012', '2c9ac4cd6aecee11016aecf2ef450247');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf3cb210017', '2c9ac4cd6aecf351016aecf3cb130015', 0, '2c9ac4cd6aecf351016aecf3cb200016', '2c9ac4cd6aecf351016aecf38c640002');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf3cb250019', '2c9ac4cd6aecf351016aecf3cb130015', 1, '2c9ac4cd6aecf351016aecf3cb250018', '2c9ac4cd6aecf351016aecf38c860004');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf3cb2b001b', '2c9ac4cd6aecf351016aecf3cb130015', 2, '2c9ac4cd6aecf351016aecf3cb2a001a', '2c9ac4cd6aecf351016aecf38c930006');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf3cb30001d', '2c9ac4cd6aecf351016aecf3cb130015', 3, '2c9ac4cd6aecf351016aecf3cb2f001c', '2c9ac4cd6aecf351016aecf38ca10008');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf3cb35001f', '2c9ac4cd6aecf351016aecf3cb130015', 4, '2c9ac4cd6aecf351016aecf3cb35001e', '2c9ac4cd6aecf351016aecf38cad000a');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf3cb3b0021', '2c9ac4cd6aecf351016aecf3cb130015', 5, '2c9ac4cd6aecf351016aecf3cb3a0020', '2c9ac4cd6aecf351016aecf38cb8000c');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf3cb410023', '2c9ac4cd6aecf351016aecf3cb130015', 6, '2c9ac4cd6aecf351016aecf3cb400022', '2c9ac4cd6aecf351016aecf38cc2000e');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf3cb480025', '2c9ac4cd6aecf351016aecf3cb130015', 7, '2c9ac4cd6aecf351016aecf3cb470024', '2c9ac4cd6aecf351016aecf38cca0010');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf3cb4e0027', '2c9ac4cd6aecf351016aecf3cb130015', 8, '2c9ac4cd6aecf351016aecf3cb4e0026', '2c9ac4cd6aecf351016aecf38cd40012');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4082e002c', '2c9ac4cd6aecf351016aecf4081d002a', 0, '2c9ac4cd6aecf351016aecf4082d002b', '2c9ac4cd6aecf351016aecf3cb200016');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf40835002e', '2c9ac4cd6aecf351016aecf4081d002a', 1, '2c9ac4cd6aecf351016aecf40834002d', '2c9ac4cd6aecf351016aecf3cb250018');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4083d0030', '2c9ac4cd6aecf351016aecf4081d002a', 2, '2c9ac4cd6aecf351016aecf4083c002f', '2c9ac4cd6aecf351016aecf3cb2a001a');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf408450032', '2c9ac4cd6aecf351016aecf4081d002a', 3, '2c9ac4cd6aecf351016aecf408440031', '2c9ac4cd6aecf351016aecf3cb2f001c');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4084b0034', '2c9ac4cd6aecf351016aecf4081d002a', 4, '2c9ac4cd6aecf351016aecf4084a0033', '2c9ac4cd6aecf351016aecf3cb35001e');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf408520036', '2c9ac4cd6aecf351016aecf4081d002a', 5, '2c9ac4cd6aecf351016aecf408520035', '2c9ac4cd6aecf351016aecf3cb3a0020');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4085c0038', '2c9ac4cd6aecf351016aecf4081d002a', 6, '2c9ac4cd6aecf351016aecf4085b0037', '2c9ac4cd6aecf351016aecf3cb400022');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf40864003a', '2c9ac4cd6aecf351016aecf4081d002a', 7, '2c9ac4cd6aecf351016aecf408630039', '2c9ac4cd6aecf351016aecf3cb470024');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4086b003c', '2c9ac4cd6aecf351016aecf4081d002a', 8, '2c9ac4cd6aecf351016aecf4086a003b', '2c9ac4cd6aecf351016aecf3cb4e0026');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf445a00040', '2c9ac4cd6aecf351016aecf44589003e', 0, '2c9ac4cd6aecf351016aecf4459f003f', '2c9ac4cd6aecf351016aecf4082d002b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf445aa0042', '2c9ac4cd6aecf351016aecf44589003e', 1, '2c9ac4cd6aecf351016aecf445a90041', '2c9ac4cd6aecf351016aecf40834002d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf445b30044', '2c9ac4cd6aecf351016aecf44589003e', 2, '2c9ac4cd6aecf351016aecf445b20043', '2c9ac4cd6aecf351016aecf4083c002f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf445ba0046', '2c9ac4cd6aecf351016aecf44589003e', 3, '2c9ac4cd6aecf351016aecf445b90045', '2c9ac4cd6aecf351016aecf408440031');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf445bf0048', '2c9ac4cd6aecf351016aecf44589003e', 4, '2c9ac4cd6aecf351016aecf445bf0047', '2c9ac4cd6aecf351016aecf4084a0033');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf445c3004a', '2c9ac4cd6aecf351016aecf44589003e', 5, '2c9ac4cd6aecf351016aecf445c30049', '2c9ac4cd6aecf351016aecf408520035');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf445cb004c', '2c9ac4cd6aecf351016aecf44589003e', 6, '2c9ac4cd6aecf351016aecf445ca004b', '2c9ac4cd6aecf351016aecf4085b0037');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf445d0004e', '2c9ac4cd6aecf351016aecf44589003e', 7, '2c9ac4cd6aecf351016aecf445cf004d', '2c9ac4cd6aecf351016aecf408630039');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf445d30050', '2c9ac4cd6aecf351016aecf44589003e', 8, '2c9ac4cd6aecf351016aecf445d3004f', '2c9ac4cd6aecf351016aecf4086a003b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4834f0054', '2c9ac4cd6aecf351016aecf483420052', 0, '2c9ac4cd6aecf351016aecf4834e0053', '2c9ac4cd6aecf351016aecf4459f003f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf483540056', '2c9ac4cd6aecf351016aecf483420052', 1, '2c9ac4cd6aecf351016aecf483540055', '2c9ac4cd6aecf351016aecf445a90041');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4835b0058', '2c9ac4cd6aecf351016aecf483420052', 2, '2c9ac4cd6aecf351016aecf4835b0057', '2c9ac4cd6aecf351016aecf445b20043');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf48362005a', '2c9ac4cd6aecf351016aecf483420052', 3, '2c9ac4cd6aecf351016aecf483620059', '2c9ac4cd6aecf351016aecf445b90045');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf48367005c', '2c9ac4cd6aecf351016aecf483420052', 4, '2c9ac4cd6aecf351016aecf48367005b', '2c9ac4cd6aecf351016aecf445bf0047');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4836d005e', '2c9ac4cd6aecf351016aecf483420052', 5, '2c9ac4cd6aecf351016aecf4836c005d', '2c9ac4cd6aecf351016aecf445c30049');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf483720060', '2c9ac4cd6aecf351016aecf483420052', 6, '2c9ac4cd6aecf351016aecf48371005f', '2c9ac4cd6aecf351016aecf445ca004b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf483760062', '2c9ac4cd6aecf351016aecf483420052', 7, '2c9ac4cd6aecf351016aecf483760061', '2c9ac4cd6aecf351016aecf445cf004d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4837a0064', '2c9ac4cd6aecf351016aecf483420052', 8, '2c9ac4cd6aecf351016aecf483790063', '2c9ac4cd6aecf351016aecf445d3004f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4c05c0069', '2c9ac4cd6aecf351016aecf4c0500067', 0, '2c9ac4cd6aecf351016aecf4c05b0068', '2c9ac4cd6aecf351016aecf4834e0053');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4c063006b', '2c9ac4cd6aecf351016aecf4c0500067', 1, '2c9ac4cd6aecf351016aecf4c062006a', '2c9ac4cd6aecf351016aecf483540055');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4c06a006d', '2c9ac4cd6aecf351016aecf4c0500067', 2, '2c9ac4cd6aecf351016aecf4c06a006c', '2c9ac4cd6aecf351016aecf4835b0057');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4c077006f', '2c9ac4cd6aecf351016aecf4c0500067', 3, '2c9ac4cd6aecf351016aecf4c076006e', '2c9ac4cd6aecf351016aecf483620059');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4c07d0071', '2c9ac4cd6aecf351016aecf4c0500067', 4, '2c9ac4cd6aecf351016aecf4c07c0070', '2c9ac4cd6aecf351016aecf48367005b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4c0810073', '2c9ac4cd6aecf351016aecf4c0500067', 5, '2c9ac4cd6aecf351016aecf4c0800072', '2c9ac4cd6aecf351016aecf4836c005d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4c0850075', '2c9ac4cd6aecf351016aecf4c0500067', 6, '2c9ac4cd6aecf351016aecf4c0850074', '2c9ac4cd6aecf351016aecf48371005f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4c08a0077', '2c9ac4cd6aecf351016aecf4c0500067', 7, '2c9ac4cd6aecf351016aecf4c0890076', '2c9ac4cd6aecf351016aecf483760061');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4c08f0079', '2c9ac4cd6aecf351016aecf4c0500067', 8, '2c9ac4cd6aecf351016aecf4c08e0078', '2c9ac4cd6aecf351016aecf483790063');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4fd36007d', '2c9ac4cd6aecf351016aecf4fd27007b', 0, '2c9ac4cd6aecf351016aecf4fd35007c', '2c9ac4cd6aecf351016aecf4c05b0068');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4fd3c007f', '2c9ac4cd6aecf351016aecf4fd27007b', 1, '2c9ac4cd6aecf351016aecf4fd3b007e', '2c9ac4cd6aecf351016aecf4c062006a');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4fd420081', '2c9ac4cd6aecf351016aecf4fd27007b', 2, '2c9ac4cd6aecf351016aecf4fd420080', '2c9ac4cd6aecf351016aecf4c06a006c');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4fd490083', '2c9ac4cd6aecf351016aecf4fd27007b', 3, '2c9ac4cd6aecf351016aecf4fd490082', '2c9ac4cd6aecf351016aecf4c076006e');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4fd4d0085', '2c9ac4cd6aecf351016aecf4fd27007b', 4, '2c9ac4cd6aecf351016aecf4fd4d0084', '2c9ac4cd6aecf351016aecf4c07c0070');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4fd530087', '2c9ac4cd6aecf351016aecf4fd27007b', 5, '2c9ac4cd6aecf351016aecf4fd530086', '2c9ac4cd6aecf351016aecf4c0800072');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4fd5b0089', '2c9ac4cd6aecf351016aecf4fd27007b', 6, '2c9ac4cd6aecf351016aecf4fd5a0088', '2c9ac4cd6aecf351016aecf4c0850074');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4fd60008b', '2c9ac4cd6aecf351016aecf4fd27007b', 7, '2c9ac4cd6aecf351016aecf4fd5f008a', '2c9ac4cd6aecf351016aecf4c0890076');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf4fd67008d', '2c9ac4cd6aecf351016aecf4fd27007b', 8, '2c9ac4cd6aecf351016aecf4fd67008c', '2c9ac4cd6aecf351016aecf4c08e0078');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf53ab50091', '2c9ac4cd6aecf351016aecf53aa3008f', 0, '2c9ac4cd6aecf351016aecf53ab40090', '2c9ac4cd6aecf351016aecf4fd35007c');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf53abb0093', '2c9ac4cd6aecf351016aecf53aa3008f', 1, '2c9ac4cd6aecf351016aecf53abb0092', '2c9ac4cd6aecf351016aecf4fd3b007e');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf53ac00095', '2c9ac4cd6aecf351016aecf53aa3008f', 2, '2c9ac4cd6aecf351016aecf53abf0094', '2c9ac4cd6aecf351016aecf4fd420080');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf53ac50097', '2c9ac4cd6aecf351016aecf53aa3008f', 3, '2c9ac4cd6aecf351016aecf53ac40096', '2c9ac4cd6aecf351016aecf4fd490082');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf53acb0099', '2c9ac4cd6aecf351016aecf53aa3008f', 4, '2c9ac4cd6aecf351016aecf53acb0098', '2c9ac4cd6aecf351016aecf4fd4d0084');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf53acf009b', '2c9ac4cd6aecf351016aecf53aa3008f', 5, '2c9ac4cd6aecf351016aecf53acf009a', '2c9ac4cd6aecf351016aecf4fd530086');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf53ad2009d', '2c9ac4cd6aecf351016aecf53aa3008f', 6, '2c9ac4cd6aecf351016aecf53ad1009c', '2c9ac4cd6aecf351016aecf4fd5a0088');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf53ad5009f', '2c9ac4cd6aecf351016aecf53aa3008f', 7, '2c9ac4cd6aecf351016aecf53ad4009e', '2c9ac4cd6aecf351016aecf4fd5f008a');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf53adb00a1', '2c9ac4cd6aecf351016aecf53aa3008f', 8, '2c9ac4cd6aecf351016aecf53adb00a0', '2c9ac4cd6aecf351016aecf4fd67008c');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5779500a5', '2c9ac4cd6aecf351016aecf5778100a3', 0, '2c9ac4cd6aecf351016aecf5779500a4', '2c9ac4cd6aecf351016aecf53ab40090');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5779b00a7', '2c9ac4cd6aecf351016aecf5778100a3', 1, '2c9ac4cd6aecf351016aecf5779a00a6', '2c9ac4cd6aecf351016aecf53abb0092');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf577a100a9', '2c9ac4cd6aecf351016aecf5778100a3', 2, '2c9ac4cd6aecf351016aecf577a000a8', '2c9ac4cd6aecf351016aecf53abf0094');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf577a700ab', '2c9ac4cd6aecf351016aecf5778100a3', 3, '2c9ac4cd6aecf351016aecf577a700aa', '2c9ac4cd6aecf351016aecf53ac40096');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf577ad00ad', '2c9ac4cd6aecf351016aecf5778100a3', 4, '2c9ac4cd6aecf351016aecf577ad00ac', '2c9ac4cd6aecf351016aecf53acb0098');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf577b400af', '2c9ac4cd6aecf351016aecf5778100a3', 5, '2c9ac4cd6aecf351016aecf577b300ae', '2c9ac4cd6aecf351016aecf53acf009a');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf577b900b1', '2c9ac4cd6aecf351016aecf5778100a3', 6, '2c9ac4cd6aecf351016aecf577b800b0', '2c9ac4cd6aecf351016aecf53ad1009c');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf577bf00b3', '2c9ac4cd6aecf351016aecf5778100a3', 7, '2c9ac4cd6aecf351016aecf577bf00b2', '2c9ac4cd6aecf351016aecf53ad4009e');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf577c500b5', '2c9ac4cd6aecf351016aecf5778100a3', 8, '2c9ac4cd6aecf351016aecf577c400b4', '2c9ac4cd6aecf351016aecf53adb00a0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5b4d400ba', '2c9ac4cd6aecf351016aecf5b4c500b8', 0, '2c9ac4cd6aecf351016aecf5b4d300b9', '2c9ac4cd6aecf351016aecf5779500a4');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5b4db00bc', '2c9ac4cd6aecf351016aecf5b4c500b8', 1, '2c9ac4cd6aecf351016aecf5b4da00bb', '2c9ac4cd6aecf351016aecf5779a00a6');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5b4e500be', '2c9ac4cd6aecf351016aecf5b4c500b8', 2, '2c9ac4cd6aecf351016aecf5b4e400bd', '2c9ac4cd6aecf351016aecf577a000a8');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5b4ec00c0', '2c9ac4cd6aecf351016aecf5b4c500b8', 3, '2c9ac4cd6aecf351016aecf5b4eb00bf', '2c9ac4cd6aecf351016aecf577a700aa');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5b4f500c2', '2c9ac4cd6aecf351016aecf5b4c500b8', 4, '2c9ac4cd6aecf351016aecf5b4f300c1', '2c9ac4cd6aecf351016aecf577ad00ac');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5b4fa00c4', '2c9ac4cd6aecf351016aecf5b4c500b8', 5, '2c9ac4cd6aecf351016aecf5b4fa00c3', '2c9ac4cd6aecf351016aecf577b300ae');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5b50000c6', '2c9ac4cd6aecf351016aecf5b4c500b8', 6, '2c9ac4cd6aecf351016aecf5b4ff00c5', '2c9ac4cd6aecf351016aecf577b800b0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5b50600c8', '2c9ac4cd6aecf351016aecf5b4c500b8', 7, '2c9ac4cd6aecf351016aecf5b50500c7', '2c9ac4cd6aecf351016aecf577bf00b2');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5b50b00ca', '2c9ac4cd6aecf351016aecf5b4c500b8', 8, '2c9ac4cd6aecf351016aecf5b50b00c9', '2c9ac4cd6aecf351016aecf577c400b4');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5f1d000ce', '2c9ac4cd6aecf351016aecf5f1bd00cc', 0, '2c9ac4cd6aecf351016aecf5f1d000cd', '2c9ac4cd6aecf351016aecf5b4d300b9');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5f1d700d0', '2c9ac4cd6aecf351016aecf5f1bd00cc', 1, '2c9ac4cd6aecf351016aecf5f1d700cf', '2c9ac4cd6aecf351016aecf5b4da00bb');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5f1dd00d2', '2c9ac4cd6aecf351016aecf5f1bd00cc', 2, '2c9ac4cd6aecf351016aecf5f1dc00d1', '2c9ac4cd6aecf351016aecf5b4e400bd');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5f1e300d4', '2c9ac4cd6aecf351016aecf5f1bd00cc', 3, '2c9ac4cd6aecf351016aecf5f1e200d3', '2c9ac4cd6aecf351016aecf5b4eb00bf');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5f1e900d6', '2c9ac4cd6aecf351016aecf5f1bd00cc', 4, '2c9ac4cd6aecf351016aecf5f1e900d5', '2c9ac4cd6aecf351016aecf5b4f300c1');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5f1f100d8', '2c9ac4cd6aecf351016aecf5f1bd00cc', 5, '2c9ac4cd6aecf351016aecf5f1f000d7', '2c9ac4cd6aecf351016aecf5b4fa00c3');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5f1f900da', '2c9ac4cd6aecf351016aecf5f1bd00cc', 6, '2c9ac4cd6aecf351016aecf5f1f800d9', '2c9ac4cd6aecf351016aecf5b4ff00c5');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5f20000dc', '2c9ac4cd6aecf351016aecf5f1bd00cc', 7, '2c9ac4cd6aecf351016aecf5f1ff00db', '2c9ac4cd6aecf351016aecf5b50500c7');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf5f20600de', '2c9ac4cd6aecf351016aecf5f1bd00cc', 8, '2c9ac4cd6aecf351016aecf5f20500dd', '2c9ac4cd6aecf351016aecf5b50b00c9');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf62f3200e2', '2c9ac4cd6aecf351016aecf62f1900e0', 0, '2c9ac4cd6aecf351016aecf62f3100e1', '2c9ac4cd6aecf351016aecf5f1d000cd');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf62f3c00e4', '2c9ac4cd6aecf351016aecf62f1900e0', 1, '2c9ac4cd6aecf351016aecf62f3b00e3', '2c9ac4cd6aecf351016aecf5f1d700cf');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf62f4700e6', '2c9ac4cd6aecf351016aecf62f1900e0', 2, '2c9ac4cd6aecf351016aecf62f4600e5', '2c9ac4cd6aecf351016aecf5f1dc00d1');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf62f5200e8', '2c9ac4cd6aecf351016aecf62f1900e0', 3, '2c9ac4cd6aecf351016aecf62f5100e7', '2c9ac4cd6aecf351016aecf5f1e200d3');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf62f5d00ea', '2c9ac4cd6aecf351016aecf62f1900e0', 4, '2c9ac4cd6aecf351016aecf62f5c00e9', '2c9ac4cd6aecf351016aecf5f1e900d5');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf62f6900ec', '2c9ac4cd6aecf351016aecf62f1900e0', 5, '2c9ac4cd6aecf351016aecf62f6800eb', '2c9ac4cd6aecf351016aecf5f1f000d7');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf62f7700ee', '2c9ac4cd6aecf351016aecf62f1900e0', 6, '2c9ac4cd6aecf351016aecf62f7500ed', '2c9ac4cd6aecf351016aecf5f1f800d9');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf62f8200f0', '2c9ac4cd6aecf351016aecf62f1900e0', 7, '2c9ac4cd6aecf351016aecf62f8100ef', '2c9ac4cd6aecf351016aecf5f1ff00db');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf62f8e00f2', '2c9ac4cd6aecf351016aecf62f1900e0', 8, '2c9ac4cd6aecf351016aecf62f8c00f1', '2c9ac4cd6aecf351016aecf5f20500dd');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf66ce400f6', '2c9ac4cd6aecf351016aecf66cd700f4', 0, '2c9ac4cd6aecf351016aecf66ce300f5', '2c9ac4cd6aecf351016aecf62f3100e1');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf66cec00f8', '2c9ac4cd6aecf351016aecf66cd700f4', 1, '2c9ac4cd6aecf351016aecf66ceb00f7', '2c9ac4cd6aecf351016aecf62f3b00e3');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf66cf300fa', '2c9ac4cd6aecf351016aecf66cd700f4', 2, '2c9ac4cd6aecf351016aecf66cf200f9', '2c9ac4cd6aecf351016aecf62f4600e5');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf66cf800fc', '2c9ac4cd6aecf351016aecf66cd700f4', 3, '2c9ac4cd6aecf351016aecf66cf700fb', '2c9ac4cd6aecf351016aecf62f5100e7');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf66cfc00fe', '2c9ac4cd6aecf351016aecf66cd700f4', 4, '2c9ac4cd6aecf351016aecf66cfc00fd', '2c9ac4cd6aecf351016aecf62f5c00e9');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf66cff0100', '2c9ac4cd6aecf351016aecf66cd700f4', 5, '2c9ac4cd6aecf351016aecf66cff00ff', '2c9ac4cd6aecf351016aecf62f6800eb');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf66d030102', '2c9ac4cd6aecf351016aecf66cd700f4', 6, '2c9ac4cd6aecf351016aecf66d020101', '2c9ac4cd6aecf351016aecf62f7500ed');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf66d060104', '2c9ac4cd6aecf351016aecf66cd700f4', 7, '2c9ac4cd6aecf351016aecf66d060103', '2c9ac4cd6aecf351016aecf62f8100ef');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf66d0a0106', '2c9ac4cd6aecf351016aecf66cd700f4', 8, '2c9ac4cd6aecf351016aecf66d090105', '2c9ac4cd6aecf351016aecf62f8c00f1');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6aaa1010a', '2c9ac4cd6aecf351016aecf6aa890108', 0, '2c9ac4cd6aecf351016aecf6aaa00109', '2c9ac4cd6aecf351016aecf66ce300f5');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6aaae010c', '2c9ac4cd6aecf351016aecf6aa890108', 1, '2c9ac4cd6aecf351016aecf6aaad010b', '2c9ac4cd6aecf351016aecf66ceb00f7');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6aaba010e', '2c9ac4cd6aecf351016aecf6aa890108', 2, '2c9ac4cd6aecf351016aecf6aab9010d', '2c9ac4cd6aecf351016aecf66cf200f9');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6aac80110', '2c9ac4cd6aecf351016aecf6aa890108', 3, '2c9ac4cd6aecf351016aecf6aac6010f', '2c9ac4cd6aecf351016aecf66cf700fb');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6aad60112', '2c9ac4cd6aecf351016aecf6aa890108', 4, '2c9ac4cd6aecf351016aecf6aad50111', '2c9ac4cd6aecf351016aecf66cfc00fd');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6aadd0114', '2c9ac4cd6aecf351016aecf6aa890108', 5, '2c9ac4cd6aecf351016aecf6aadd0113', '2c9ac4cd6aecf351016aecf66cff00ff');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6aae40116', '2c9ac4cd6aecf351016aecf6aa890108', 6, '2c9ac4cd6aecf351016aecf6aae40115', '2c9ac4cd6aecf351016aecf66d020101');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6aaec0118', '2c9ac4cd6aecf351016aecf6aa890108', 7, '2c9ac4cd6aecf351016aecf6aaec0117', '2c9ac4cd6aecf351016aecf66d060103');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6aaf6011a', '2c9ac4cd6aecf351016aecf6aa890108', 8, '2c9ac4cd6aecf351016aecf6aaf40119', '2c9ac4cd6aecf351016aecf66d090105');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6e7fe011f', '2c9ac4cd6aecf351016aecf6e7e6011d', 0, '2c9ac4cd6aecf351016aecf6e7fc011e', '2c9ac4cd6aecf351016aecf6aaa00109');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6e8090121', '2c9ac4cd6aecf351016aecf6e7e6011d', 1, '2c9ac4cd6aecf351016aecf6e8070120', '2c9ac4cd6aecf351016aecf6aaad010b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6e8140123', '2c9ac4cd6aecf351016aecf6e7e6011d', 2, '2c9ac4cd6aecf351016aecf6e8130122', '2c9ac4cd6aecf351016aecf6aab9010d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6e81d0125', '2c9ac4cd6aecf351016aecf6e7e6011d', 3, '2c9ac4cd6aecf351016aecf6e81c0124', '2c9ac4cd6aecf351016aecf6aac6010f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6e82b0127', '2c9ac4cd6aecf351016aecf6e7e6011d', 4, '2c9ac4cd6aecf351016aecf6e8290126', '2c9ac4cd6aecf351016aecf6aad50111');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6e8370129', '2c9ac4cd6aecf351016aecf6e7e6011d', 5, '2c9ac4cd6aecf351016aecf6e8350128', '2c9ac4cd6aecf351016aecf6aadd0113');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6e842012b', '2c9ac4cd6aecf351016aecf6e7e6011d', 6, '2c9ac4cd6aecf351016aecf6e841012a', '2c9ac4cd6aecf351016aecf6aae40115');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6e84e012d', '2c9ac4cd6aecf351016aecf6e7e6011d', 7, '2c9ac4cd6aecf351016aecf6e84d012c', '2c9ac4cd6aecf351016aecf6aaec0117');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf6e85a012f', '2c9ac4cd6aecf351016aecf6e7e6011d', 8, '2c9ac4cd6aecf351016aecf6e858012e', '2c9ac4cd6aecf351016aecf6aaf40119');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf725690133', '2c9ac4cd6aecf351016aecf725540131', 0, '2c9ac4cd6aecf351016aecf725680132', '2c9ac4cd6aecf351016aecf6e7fc011e');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7256f0135', '2c9ac4cd6aecf351016aecf725540131', 1, '2c9ac4cd6aecf351016aecf7256f0134', '2c9ac4cd6aecf351016aecf6e8070120');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf725750137', '2c9ac4cd6aecf351016aecf725540131', 2, '2c9ac4cd6aecf351016aecf725740136', '2c9ac4cd6aecf351016aecf6e8130122');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7257b0139', '2c9ac4cd6aecf351016aecf725540131', 3, '2c9ac4cd6aecf351016aecf7257a0138', '2c9ac4cd6aecf351016aecf6e81c0124');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf72580013b', '2c9ac4cd6aecf351016aecf725540131', 4, '2c9ac4cd6aecf351016aecf7257f013a', '2c9ac4cd6aecf351016aecf6e8290126');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf72587013d', '2c9ac4cd6aecf351016aecf725540131', 5, '2c9ac4cd6aecf351016aecf72586013c', '2c9ac4cd6aecf351016aecf6e8350128');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf72591013f', '2c9ac4cd6aecf351016aecf725540131', 6, '2c9ac4cd6aecf351016aecf72590013e', '2c9ac4cd6aecf351016aecf6e841012a');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7259f0141', '2c9ac4cd6aecf351016aecf725540131', 7, '2c9ac4cd6aecf351016aecf7259e0140', '2c9ac4cd6aecf351016aecf6e84d012c');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf725a90143', '2c9ac4cd6aecf351016aecf725540131', 8, '2c9ac4cd6aecf351016aecf725a80142', '2c9ac4cd6aecf351016aecf6e858012e');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf762aa0148', '2c9ac4cd6aecf351016aecf762920146', 0, '2c9ac4cd6aecf351016aecf762a90147', '2c9ac4cd6aecf351016aecf725680132');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf762b6014a', '2c9ac4cd6aecf351016aecf762920146', 1, '2c9ac4cd6aecf351016aecf762b50149', '2c9ac4cd6aecf351016aecf7256f0134');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf762c0014c', '2c9ac4cd6aecf351016aecf762920146', 2, '2c9ac4cd6aecf351016aecf762bf014b', '2c9ac4cd6aecf351016aecf725740136');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf762cd014e', '2c9ac4cd6aecf351016aecf762920146', 3, '2c9ac4cd6aecf351016aecf762cb014d', '2c9ac4cd6aecf351016aecf7257a0138');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf762d70150', '2c9ac4cd6aecf351016aecf762920146', 4, '2c9ac4cd6aecf351016aecf762d6014f', '2c9ac4cd6aecf351016aecf7257f013a');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf762e20152', '2c9ac4cd6aecf351016aecf762920146', 5, '2c9ac4cd6aecf351016aecf762e10151', '2c9ac4cd6aecf351016aecf72586013c');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf762ed0154', '2c9ac4cd6aecf351016aecf762920146', 6, '2c9ac4cd6aecf351016aecf762ec0153', '2c9ac4cd6aecf351016aecf72590013e');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf762f30156', '2c9ac4cd6aecf351016aecf762920146', 7, '2c9ac4cd6aecf351016aecf762f20155', '2c9ac4cd6aecf351016aecf7259e0140');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf762f90158', '2c9ac4cd6aecf351016aecf762920146', 8, '2c9ac4cd6aecf351016aecf762f80157', '2c9ac4cd6aecf351016aecf725a80142');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7a005015c', '2c9ac4cd6aecf351016aecf79fe9015a', 0, '2c9ac4cd6aecf351016aecf7a004015b', '2c9ac4cd6aecf351016aecf762a90147');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7a00d015e', '2c9ac4cd6aecf351016aecf79fe9015a', 1, '2c9ac4cd6aecf351016aecf7a00c015d', '2c9ac4cd6aecf351016aecf762b50149');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7a0140160', '2c9ac4cd6aecf351016aecf79fe9015a', 2, '2c9ac4cd6aecf351016aecf7a014015f', '2c9ac4cd6aecf351016aecf762bf014b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7a01b0162', '2c9ac4cd6aecf351016aecf79fe9015a', 3, '2c9ac4cd6aecf351016aecf7a01b0161', '2c9ac4cd6aecf351016aecf762cb014d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7a0240164', '2c9ac4cd6aecf351016aecf79fe9015a', 4, '2c9ac4cd6aecf351016aecf7a0230163', '2c9ac4cd6aecf351016aecf762d6014f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7a02c0166', '2c9ac4cd6aecf351016aecf79fe9015a', 5, '2c9ac4cd6aecf351016aecf7a02b0165', '2c9ac4cd6aecf351016aecf762e10151');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7a0330168', '2c9ac4cd6aecf351016aecf79fe9015a', 6, '2c9ac4cd6aecf351016aecf7a0320167', '2c9ac4cd6aecf351016aecf762ec0153');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7a038016a', '2c9ac4cd6aecf351016aecf79fe9015a', 7, '2c9ac4cd6aecf351016aecf7a0380169', '2c9ac4cd6aecf351016aecf762f20155');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7a03e016c', '2c9ac4cd6aecf351016aecf79fe9015a', 8, '2c9ac4cd6aecf351016aecf7a03e016b', '2c9ac4cd6aecf351016aecf762f80157');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7dd310171', '2c9ac4cd6aecf351016aecf7dd1c016f', 0, '2c9ac4cd6aecf351016aecf7dd300170', '2c9ac4cd6aecf351016aecf7a004015b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7dd3a0173', '2c9ac4cd6aecf351016aecf7dd1c016f', 1, '2c9ac4cd6aecf351016aecf7dd390172', '2c9ac4cd6aecf351016aecf7a00c015d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7dd430175', '2c9ac4cd6aecf351016aecf7dd1c016f', 2, '2c9ac4cd6aecf351016aecf7dd430174', '2c9ac4cd6aecf351016aecf7a014015f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7dd4e0177', '2c9ac4cd6aecf351016aecf7dd1c016f', 3, '2c9ac4cd6aecf351016aecf7dd4d0176', '2c9ac4cd6aecf351016aecf7a01b0161');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7dd580179', '2c9ac4cd6aecf351016aecf7dd1c016f', 4, '2c9ac4cd6aecf351016aecf7dd570178', '2c9ac4cd6aecf351016aecf7a0230163');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7dd62017b', '2c9ac4cd6aecf351016aecf7dd1c016f', 5, '2c9ac4cd6aecf351016aecf7dd61017a', '2c9ac4cd6aecf351016aecf7a02b0165');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7dd6a017d', '2c9ac4cd6aecf351016aecf7dd1c016f', 6, '2c9ac4cd6aecf351016aecf7dd67017c', '2c9ac4cd6aecf351016aecf7a0320167');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7dd71017f', '2c9ac4cd6aecf351016aecf7dd1c016f', 7, '2c9ac4cd6aecf351016aecf7dd70017e', '2c9ac4cd6aecf351016aecf7a0380169');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf7dd790181', '2c9ac4cd6aecf351016aecf7dd1c016f', 8, '2c9ac4cd6aecf351016aecf7dd780180', '2c9ac4cd6aecf351016aecf7a03e016b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf81a8f0186', '2c9ac4cd6aecf351016aecf81a7d0184', 0, '2c9ac4cd6aecf351016aecf81a8e0185', '2c9ac4cd6aecf351016aecf7dd300170');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf81a940188', '2c9ac4cd6aecf351016aecf81a7d0184', 1, '2c9ac4cd6aecf351016aecf81a940187', '2c9ac4cd6aecf351016aecf7dd390172');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf81a99018a', '2c9ac4cd6aecf351016aecf81a7d0184', 2, '2c9ac4cd6aecf351016aecf81a980189', '2c9ac4cd6aecf351016aecf7dd430174');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf81a9d018c', '2c9ac4cd6aecf351016aecf81a7d0184', 3, '2c9ac4cd6aecf351016aecf81a9c018b', '2c9ac4cd6aecf351016aecf7dd4d0176');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf81aa0018e', '2c9ac4cd6aecf351016aecf81a7d0184', 4, '2c9ac4cd6aecf351016aecf81aa0018d', '2c9ac4cd6aecf351016aecf7dd570178');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf81aa30190', '2c9ac4cd6aecf351016aecf81a7d0184', 5, '2c9ac4cd6aecf351016aecf81aa3018f', '2c9ac4cd6aecf351016aecf7dd61017a');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf81aa70192', '2c9ac4cd6aecf351016aecf81a7d0184', 6, '2c9ac4cd6aecf351016aecf81aa60191', '2c9ac4cd6aecf351016aecf7dd67017c');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf81aaa0194', '2c9ac4cd6aecf351016aecf81a7d0184', 7, '2c9ac4cd6aecf351016aecf81aaa0193', '2c9ac4cd6aecf351016aecf7dd70017e');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf81aad0196', '2c9ac4cd6aecf351016aecf81a7d0184', 8, '2c9ac4cd6aecf351016aecf81aad0195', '2c9ac4cd6aecf351016aecf7dd780180');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf857ab019a', '2c9ac4cd6aecf351016aecf857920198', 0, '2c9ac4cd6aecf351016aecf857aa0199', '2c9ac4cd6aecf351016aecf81a8e0185');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf857b6019c', '2c9ac4cd6aecf351016aecf857920198', 1, '2c9ac4cd6aecf351016aecf857b4019b', '2c9ac4cd6aecf351016aecf81a940187');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf857bf019e', '2c9ac4cd6aecf351016aecf857920198', 2, '2c9ac4cd6aecf351016aecf857bf019d', '2c9ac4cd6aecf351016aecf81a980189');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf857ca01a0', '2c9ac4cd6aecf351016aecf857920198', 3, '2c9ac4cd6aecf351016aecf857c9019f', '2c9ac4cd6aecf351016aecf81a9c018b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf857d701a2', '2c9ac4cd6aecf351016aecf857920198', 4, '2c9ac4cd6aecf351016aecf857d701a1', '2c9ac4cd6aecf351016aecf81aa0018d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf857e301a4', '2c9ac4cd6aecf351016aecf857920198', 5, '2c9ac4cd6aecf351016aecf857e201a3', '2c9ac4cd6aecf351016aecf81aa3018f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf857ee01a6', '2c9ac4cd6aecf351016aecf857920198', 6, '2c9ac4cd6aecf351016aecf857ed01a5', '2c9ac4cd6aecf351016aecf81aa60191');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf857f901a8', '2c9ac4cd6aecf351016aecf857920198', 7, '2c9ac4cd6aecf351016aecf857f801a7', '2c9ac4cd6aecf351016aecf81aaa0193');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8580401aa', '2c9ac4cd6aecf351016aecf857920198', 8, '2c9ac4cd6aecf351016aecf8580301a9', '2c9ac4cd6aecf351016aecf81aad0195');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8950901af', '2c9ac4cd6aecf351016aecf894f501ad', 0, '2c9ac4cd6aecf351016aecf8950901ae', '2c9ac4cd6aecf351016aecf857aa0199');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8950f01b1', '2c9ac4cd6aecf351016aecf894f501ad', 1, '2c9ac4cd6aecf351016aecf8950e01b0', '2c9ac4cd6aecf351016aecf857b4019b');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8951501b3', '2c9ac4cd6aecf351016aecf894f501ad', 2, '2c9ac4cd6aecf351016aecf8951401b2', '2c9ac4cd6aecf351016aecf857bf019d');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8951b01b5', '2c9ac4cd6aecf351016aecf894f501ad', 3, '2c9ac4cd6aecf351016aecf8951a01b4', '2c9ac4cd6aecf351016aecf857c9019f');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8952001b7', '2c9ac4cd6aecf351016aecf894f501ad', 4, '2c9ac4cd6aecf351016aecf8952001b6', '2c9ac4cd6aecf351016aecf857d701a1');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8952501b9', '2c9ac4cd6aecf351016aecf894f501ad', 5, '2c9ac4cd6aecf351016aecf8952501b8', '2c9ac4cd6aecf351016aecf857e201a3');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8952901bb', '2c9ac4cd6aecf351016aecf894f501ad', 6, '2c9ac4cd6aecf351016aecf8952901ba', '2c9ac4cd6aecf351016aecf857ed01a5');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8952d01bd', '2c9ac4cd6aecf351016aecf894f501ad', 7, '2c9ac4cd6aecf351016aecf8952d01bc', '2c9ac4cd6aecf351016aecf857f801a7');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8953101bf', '2c9ac4cd6aecf351016aecf894f501ad', 8, '2c9ac4cd6aecf351016aecf8953101be', '2c9ac4cd6aecf351016aecf8580301a9');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8d21d01c3', '2c9ac4cd6aecf351016aecf8d21001c1', 0, '2c9ac4cd6aecf351016aecf8d21c01c2', '2c9ac4cd6aecf351016aecf8950901ae');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8d22201c5', '2c9ac4cd6aecf351016aecf8d21001c1', 1, '2c9ac4cd6aecf351016aecf8d22201c4', '2c9ac4cd6aecf351016aecf8950e01b0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8d22701c7', '2c9ac4cd6aecf351016aecf8d21001c1', 2, '2c9ac4cd6aecf351016aecf8d22701c6', '2c9ac4cd6aecf351016aecf8951401b2');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8d22c01c9', '2c9ac4cd6aecf351016aecf8d21001c1', 3, '2c9ac4cd6aecf351016aecf8d22c01c8', '2c9ac4cd6aecf351016aecf8951a01b4');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8d23301cb', '2c9ac4cd6aecf351016aecf8d21001c1', 4, '2c9ac4cd6aecf351016aecf8d23201ca', '2c9ac4cd6aecf351016aecf8952001b6');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8d23a01cd', '2c9ac4cd6aecf351016aecf8d21001c1', 5, '2c9ac4cd6aecf351016aecf8d23901cc', '2c9ac4cd6aecf351016aecf8952501b8');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8d23f01cf', '2c9ac4cd6aecf351016aecf8d21001c1', 6, '2c9ac4cd6aecf351016aecf8d23e01ce', '2c9ac4cd6aecf351016aecf8952901ba');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8d24401d1', '2c9ac4cd6aecf351016aecf8d21001c1', 7, '2c9ac4cd6aecf351016aecf8d24401d0', '2c9ac4cd6aecf351016aecf8952d01bc');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf8d24a01d3', '2c9ac4cd6aecf351016aecf8d21001c1', 8, '2c9ac4cd6aecf351016aecf8d24901d2', '2c9ac4cd6aecf351016aecf8953101be');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf90f6501d7', '2c9ac4cd6aecf351016aecf90f4e01d5', 0, '2c9ac4cd6aecf351016aecf90f6501d6', '2c9ac4cd6aecf351016aecf8d21c01c2');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf90f7101d9', '2c9ac4cd6aecf351016aecf90f4e01d5', 1, '2c9ac4cd6aecf351016aecf90f7001d8', '2c9ac4cd6aecf351016aecf8d22201c4');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf90f7b01db', '2c9ac4cd6aecf351016aecf90f4e01d5', 2, '2c9ac4cd6aecf351016aecf90f7b01da', '2c9ac4cd6aecf351016aecf8d22701c6');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf90f8401dd', '2c9ac4cd6aecf351016aecf90f4e01d5', 3, '2c9ac4cd6aecf351016aecf90f8401dc', '2c9ac4cd6aecf351016aecf8d22c01c8');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf90f8e01df', '2c9ac4cd6aecf351016aecf90f4e01d5', 4, '2c9ac4cd6aecf351016aecf90f8d01de', '2c9ac4cd6aecf351016aecf8d23201ca');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf90f9801e1', '2c9ac4cd6aecf351016aecf90f4e01d5', 5, '2c9ac4cd6aecf351016aecf90f9801e0', '2c9ac4cd6aecf351016aecf8d23901cc');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf90fa201e3', '2c9ac4cd6aecf351016aecf90f4e01d5', 6, '2c9ac4cd6aecf351016aecf90fa101e2', '2c9ac4cd6aecf351016aecf8d23e01ce');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf90fac01e5', '2c9ac4cd6aecf351016aecf90f4e01d5', 7, '2c9ac4cd6aecf351016aecf90fac01e4', '2c9ac4cd6aecf351016aecf8d24401d0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf90fb701e7', '2c9ac4cd6aecf351016aecf90f4e01d5', 8, '2c9ac4cd6aecf351016aecf90fb601e6', '2c9ac4cd6aecf351016aecf8d24901d2');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf94ca401eb', '2c9ac4cd6aecf351016aecf94c9301e9', 0, '2c9ac4cd6aecf351016aecf94ca401ea', '2c9ac4cd6aecf351016aecf90f6501d6');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf94caa01ed', '2c9ac4cd6aecf351016aecf94c9301e9', 1, '2c9ac4cd6aecf351016aecf94ca901ec', '2c9ac4cd6aecf351016aecf90f7001d8');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf94cae01ef', '2c9ac4cd6aecf351016aecf94c9301e9', 2, '2c9ac4cd6aecf351016aecf94cae01ee', '2c9ac4cd6aecf351016aecf90f7b01da');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf94cb201f1', '2c9ac4cd6aecf351016aecf94c9301e9', 3, '2c9ac4cd6aecf351016aecf94cb201f0', '2c9ac4cd6aecf351016aecf90f8401dc');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf94cb601f3', '2c9ac4cd6aecf351016aecf94c9301e9', 4, '2c9ac4cd6aecf351016aecf94cb601f2', '2c9ac4cd6aecf351016aecf90f8d01de');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf94cb901f5', '2c9ac4cd6aecf351016aecf94c9301e9', 5, '2c9ac4cd6aecf351016aecf94cb901f4', '2c9ac4cd6aecf351016aecf90f9801e0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf94cbd01f7', '2c9ac4cd6aecf351016aecf94c9301e9', 6, '2c9ac4cd6aecf351016aecf94cbc01f6', '2c9ac4cd6aecf351016aecf90fa101e2');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf94cc001f9', '2c9ac4cd6aecf351016aecf94c9301e9', 7, '2c9ac4cd6aecf351016aecf94cbf01f8', '2c9ac4cd6aecf351016aecf90fac01e4');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf94cc501fb', '2c9ac4cd6aecf351016aecf94c9301e9', 8, '2c9ac4cd6aecf351016aecf94cc501fa', '2c9ac4cd6aecf351016aecf90fb601e6');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf989d701ff', '2c9ac4cd6aecf351016aecf989c201fd', 0, '2c9ac4cd6aecf351016aecf989d501fe', '2c9ac4cd6aecf351016aecf94ca401ea');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf989dd0201', '2c9ac4cd6aecf351016aecf989c201fd', 1, '2c9ac4cd6aecf351016aecf989dd0200', '2c9ac4cd6aecf351016aecf94ca901ec');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf989e40203', '2c9ac4cd6aecf351016aecf989c201fd', 2, '2c9ac4cd6aecf351016aecf989e30202', '2c9ac4cd6aecf351016aecf94cae01ee');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf989ea0205', '2c9ac4cd6aecf351016aecf989c201fd', 3, '2c9ac4cd6aecf351016aecf989ea0204', '2c9ac4cd6aecf351016aecf94cb201f0');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf989f00207', '2c9ac4cd6aecf351016aecf989c201fd', 4, '2c9ac4cd6aecf351016aecf989f00206', '2c9ac4cd6aecf351016aecf94cb601f2');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf989f60209', '2c9ac4cd6aecf351016aecf989c201fd', 5, '2c9ac4cd6aecf351016aecf989f60208', '2c9ac4cd6aecf351016aecf94cb901f4');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf989fc020b', '2c9ac4cd6aecf351016aecf989c201fd', 6, '2c9ac4cd6aecf351016aecf989fc020a', '2c9ac4cd6aecf351016aecf94cbc01f6');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf98a01020d', '2c9ac4cd6aecf351016aecf989c201fd', 7, '2c9ac4cd6aecf351016aecf98a01020c', '2c9ac4cd6aecf351016aecf94cbf01f8');
INSERT INTO `displacement_every` VALUES ('2c9ac4cd6aecf351016aecf98a08020f', '2c9ac4cd6aecf351016aecf989c201fd', 8, '2c9ac4cd6aecf351016aecf98a08020e', '2c9ac4cd6aecf351016aecf94cc501fa');

-- ----------------------------
-- Table structure for displacement_value
-- ----------------------------
DROP TABLE IF EXISTS `displacement_value`;
CREATE TABLE `displacement_value`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `x` float(20, 5) NULL DEFAULT NULL COMMENT 'x值',
  `y` float(20, 5) NULL DEFAULT NULL COMMENT 'y值',
  `z` float(20, 5) NULL DEFAULT NULL COMMENT 'z值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '位移测量值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of displacement_value
-- ----------------------------
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefc1fb0073', 3690902.25000, 474656.59375, 690.33893);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefc2020075', 3690902.25000, 474656.50000, 690.48712);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefc2090077', 3690902.25000, 474656.46875, 690.43793);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefc20e0079', 3690902.25000, 474656.46875, 690.50806);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefc214007b', 3690902.25000, 474656.53125, 690.50812);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefc21a007d', 3690902.25000, 474656.50000, 690.51862);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefc21f007f', 3690902.25000, 474656.59375, 690.35681);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefc2240081', 3690902.25000, 474656.56250, 690.41614);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefc2270083', 3690902.25000, 474656.59375, 690.49261);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefff500086', 3690902.25000, 474656.56250, 690.40076);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefff550088', 3690902.25000, 474656.56250, 690.58429);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefff5a008a', 3690902.25000, 474656.46875, 690.43396);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefff5e008c', 3690902.25000, 474656.40625, 690.53516);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefff61008e', 3690902.25000, 474656.43750, 690.46918);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefff640090', 3690902.25000, 474656.56250, 690.46899);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefff680092', 3690902.25000, 474656.50000, 690.43604);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefff6c0094', 3690902.25000, 474656.59375, 690.39746);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecefff6f0096', 3690902.25000, 474656.59375, 690.44415);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf03c8e0099', 3690902.25000, 474656.46875, 690.44574);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf03c97009b', 3690902.25000, 474656.46875, 690.62000);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf03c9c009d', 3690902.25000, 474656.43750, 690.42120);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf03ca1009f', 3690902.25000, 474656.40625, 690.56097);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf03ca700a1', 3690902.25000, 474656.50000, 690.54999);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf03cad00a3', 3690902.25000, 474656.46875, 690.55597);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf03cb300a5', 3690902.25000, 474656.43750, 690.46381);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf03cb800a7', 3690902.25000, 474656.59375, 690.30090);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf03cbd00a9', 3690902.25000, 474656.50000, 690.36743);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0797000ac', 3690902.25000, 474656.50000, 690.43127);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0797500ae', 3690902.25000, 474656.46875, 690.64105);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0797900b0', 3690902.25000, 474656.37500, 690.37946);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0797d00b2', 3690902.25000, 474656.50000, 690.62103);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0798200b4', 3690902.25000, 474656.46875, 690.58893);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0798600b6', 3690902.25000, 474656.56250, 690.45911);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0798900b8', 3690902.25000, 474656.46875, 690.54456);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0798d00ba', 3690902.25000, 474656.62500, 690.32422);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0799000bc', 3690902.25000, 474656.40625, 690.32666);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0b64b00bf', 3690902.25000, 474656.40625, 690.45184);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0b65000c1', 3690902.25000, 474656.43750, 690.68903);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0b65400c3', 3690902.25000, 474656.43750, 690.29816);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0b65800c5', 3690902.25000, 474656.40625, 690.54700);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0b65c00c7', 3690902.25000, 474656.53125, 690.65735);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0b66100c9', 3690902.25000, 474656.56250, 690.52698);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0b66500cb', 3690902.25000, 474656.40625, 690.50128);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0b66900cd', 3690902.25000, 474656.71875, 690.41693);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0b66e00cf', 3690902.25000, 474656.43750, 690.39526);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0f38a00d2', 3690902.25000, 474656.46875, 690.50903);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0f39100d4', 3690902.25000, 474656.40625, 690.71906);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0f39a00d6', 3690902.25000, 474656.40625, 690.37103);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0f3a200d8', 3690902.25000, 474656.34375, 690.48291);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0f3aa00da', 3690902.25000, 474656.59375, 690.57117);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0f3b200dc', 3690902.25000, 474656.46875, 690.47797);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0f3bd00de', 3690902.25000, 474656.37500, 690.57672);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0f3c600e0', 3690902.25000, 474656.68750, 690.46167);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf0f3ce00e2', 3690902.25000, 474656.53125, 690.42365);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1312900e5', 3690902.25000, 474656.37500, 690.50378);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1313000e7', 3690902.25000, 474656.37500, 690.70068);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1313800e9', 3690902.25000, 474656.31250, 690.42743);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1314100eb', 3690902.25000, 474656.40625, 690.43335);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1314e00ed', 3690902.25000, 474656.68750, 690.54260);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1315a00ef', 3690902.25000, 474656.53125, 690.43665);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1316200f1', 3690902.25000, 474656.28125, 690.60065);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1316700f3', 3690902.25000, 474656.71875, 690.50818);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1316d00f5', 3690902.25000, 474656.46875, 690.40924);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf16e8000f8', 3690902.25000, 474656.37500, 690.50940);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf16e8800fa', 3690902.25000, 474656.34375, 690.74939);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf16e9000fc', 3690902.25000, 474656.21875, 690.38721);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf16e9700fe', 3690902.25000, 474656.43750, 690.52753);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf16ea10100', 3690902.25000, 474656.78125, 690.50275);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf16ea90102', 3690902.25000, 474656.46875, 690.40729);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf16eb20104', 3690902.25000, 474656.21875, 690.56952);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf16eba0106', 3690902.25000, 474656.68750, 690.52075);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf16ec30108', 3690902.25000, 474656.37500, 690.32129);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1ac2d010b', 3690902.25000, 474656.37500, 690.44409);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1ac33010d', 3690902.25000, 474656.40625, 690.67365);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1ac37010f', 3690902.25000, 474656.15625, 690.46844);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1ac3c0111', 3690902.25000, 474656.43750, 690.48608);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1ac410113', 3690902.25000, 474656.84375, 690.47058);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1ac460115', 3690902.25000, 474656.43750, 690.49738);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1ac4b0117', 3690902.25000, 474656.28125, 690.59821);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1ac4f0119', 3690902.25000, 474656.65625, 690.61115);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf1ac52011b', 3690902.25000, 474656.43750, 690.25623);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2090d0120', 3690902.25000, 474656.43750, 690.44788);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf209ed0126', 3690902.25000, 474656.37500, 690.74146);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf209100121', 3690902.25000, 474656.28125, 690.36682);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf209f60128', 3690902.25000, 474656.18750, 690.44183);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2094e0123', 3690902.25000, 474656.40625, 690.76636);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf20a0d012a', 3690902.25000, 474656.43750, 690.42346);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf20a330130', 3690902.25000, 474656.21875, 690.47864);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf20a1b012c', 3690902.25000, 474656.87500, 690.43390);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf20a4a0136', 3690902.25000, 474656.43750, 690.46289);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf20a2d012e', 3690902.25000, 474656.53125, 690.42303);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf20a55013a', 3690902.25000, 474656.84375, 690.52350);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf20a3d0132', 3690902.25000, 474656.31250, 690.67761);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf20a65013c', 3690902.25000, 474656.53125, 690.53119);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf20a450134', 3690902.25000, 474656.75000, 690.56720);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf20a76013e', 3690902.25000, 474656.28125, 690.67859);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf20a4b0138', 3690902.25000, 474656.50000, 690.33643);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf20aa30140', 3690902.25000, 474656.59375, 690.70288);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf20ac90142', 3690902.25000, 474656.50000, 690.18781);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf235500147', 3690902.25000, 474656.21875, 690.41107);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2355d0149', 3690902.25000, 474656.37500, 690.79712);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf23564014b', 3690902.25000, 474656.15625, 690.51642);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2356c014d', 3690902.25000, 474656.34375, 690.47675);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf23575014f', 3690902.25000, 474656.84375, 690.52399);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2357d0151', 3690902.25000, 474656.50000, 690.47333);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2358f0153', 3690902.25000, 474656.21875, 690.61420);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf235970155', 3690902.25000, 474656.59375, 690.67200);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2359c0157', 3690902.25000, 474656.59375, 690.18610);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24b04015c', 3690902.25000, 474656.25000, 690.43182);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24b0e015e', 3690902.25000, 474656.28125, 690.84009);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24b8e016f', 3690902.25000, 474656.28125, 690.40527);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24b150160', 3690902.25000, 474656.15625, 690.61035);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24b930171', 3690902.25000, 474656.43750, 690.88867);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24b1c0162', 3690902.25000, 474656.25000, 690.44971);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24b990173', 3690902.25000, 474656.21875, 690.53912);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24b220164', 3690902.25000, 474656.90625, 690.51105);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24bc80175', 3690902.25000, 474656.28125, 690.47070);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24b2f0166', 3690902.25000, 474656.53125, 690.53748);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24bcf0177', 3690902.25000, 474656.90625, 690.55579);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24b340168', 3690902.25000, 474656.25000, 690.66528);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24bdb0179', 3690902.25000, 474656.40625, 690.55219);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24b38016a', 3690902.25000, 474656.65625, 690.58240);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24bfb017b', 3690902.25000, 474656.31250, 690.69958);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24b3c016c', 3690902.25000, 474656.65625, 690.19513);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24c11017d', 3690902.25000, 474656.68750, 690.64581);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf24c18017f', 3690902.25000, 474656.56250, 690.14459);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf258780183', 3690902.25000, 474656.28125, 690.31897);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf258860185', 3690902.25000, 474656.53125, 690.97058);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf258920187', 3690902.25000, 474656.28125, 690.54980);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf258970189', 3690902.25000, 474656.21875, 690.39526);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2589e018b', 3690902.25000, 474657.00000, 690.50812);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf258ac018d', 3690902.25000, 474656.37500, 690.56146);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf258b3018f', 3690902.25000, 474656.40625, 690.75665);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf258b80191', 3690902.25000, 474656.71875, 690.62823);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf258bd0193', 3690902.25000, 474656.46875, 690.09778);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2740c0198', 3690902.25000, 474656.25000, 690.37262);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf27411019a', 3690902.25000, 474656.59375, 691.06110);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf27418019c', 3690902.25000, 474656.37500, 690.45538);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2741f019e', 3690902.25000, 474656.28125, 690.35602);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2742601a0', 3690902.25000, 474657.06250, 690.57013);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2742b01a2', 3690902.25000, 474656.37500, 690.58496);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2743001a4', 3690902.25000, 474656.37500, 690.72028);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2743601a6', 3690902.25000, 474656.65625, 690.72375);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2743a01a8', 3690902.25000, 474656.37500, 690.03284);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf289b001ac', 3690902.25000, 474656.18750, 690.32709);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf28a2e01bf', 3690902.25000, 474656.21875, 690.45404);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf289b801ae', 3690902.25000, 474656.53125, 691.00311);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf28a3401c1', 3690902.25000, 474656.56250, 691.03052);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf289bd01b0', 3690902.25000, 474656.28125, 690.49689);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf28a3e01c3', 3690902.25000, 474656.31250, 690.52502);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf289c501b2', 3690902.25000, 474656.18750, 690.35547);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf28a4501c5', 3690902.25000, 474656.31250, 690.41211);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf289d001b4', 3690902.25000, 474657.06250, 690.51794);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf28a4a01c7', 3690902.25000, 474656.96875, 690.64417);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf289d701b6', 3690902.25000, 474656.40625, 690.54694);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf28a5001c9', 3690902.25000, 474656.43750, 690.49500);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf289e101b8', 3690902.25000, 474656.43750, 690.78174);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf28a5801cb', 3690902.25000, 474656.43750, 690.80353);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf289ec01ba', 3690902.25000, 474656.68750, 690.67822);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf28a6901cd', 3690902.25000, 474656.65625, 690.66211);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf289f601bc', 3690902.25000, 474656.28125, 689.98761);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf28a6e01cf', 3690902.25000, 474656.43750, 689.98798);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf295bc01d4', 3690902.25000, 474656.18750, 690.41089);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf295c701d6', 3690902.25000, 474656.43750, 691.04779);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf295cd01d8', 3690902.25000, 474656.34375, 690.54456);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf295d301da', 3690902.25000, 474656.21875, 690.34326);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf295da01dc', 3690902.25000, 474657.00000, 690.58527);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf295df01de', 3690902.25000, 474656.31250, 690.45514);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf295e501e0', 3690902.25000, 474656.53125, 690.75916);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf295e901e2', 3690902.25000, 474656.68750, 690.64868);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf295f001e4', 3690902.25000, 474656.28125, 689.91638);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2b26f01e8', 3690902.25000, 474656.15625, 690.48639);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2b27401ea', 3690902.25000, 474656.40625, 691.12671);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2b27801ec', 3690902.25000, 474656.31250, 690.59320);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2b27b01ee', 3690902.25000, 474656.15625, 690.27759);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2b27f01f0', 3690902.25000, 474657.09375, 690.52356);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2b28501f2', 3690902.25000, 474656.37500, 690.46222);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2b28b01f4', 3690902.25000, 474656.62500, 690.76624);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2b29801f6', 3690902.25000, 474656.71875, 690.59772);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2b29d01f8', 3690902.25000, 474656.28125, 689.93414);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c8cc01fc', 3690902.25000, 474656.12500, 690.44141);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c8ea0206', 3690902.25000, 474656.12500, 690.50629);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c8d701fe', 3690902.25000, 474656.37500, 691.06488);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c8ef0209', 3690902.25000, 474656.37500, 691.02979);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c8dd0201', 3690902.25000, 474656.21875, 690.62946);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c8f5020d', 3690902.25000, 474656.34375, 690.58203);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c8e30203', 3690902.25000, 474656.15625, 690.27216);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c8fa0212', 3690902.25000, 474656.18750, 690.19720);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c8e90205', 3690902.25000, 474657.18750, 690.61212);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c8ff0216', 3690902.25000, 474657.06250, 690.52948);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c8ef020a', 3690902.25000, 474656.31250, 690.38519);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c9040219', 3690902.25000, 474656.34375, 690.48633);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c8f5020e', 3690902.25000, 474656.62500, 690.74915);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c90a021b', 3690902.25000, 474656.65625, 690.85364);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c8fa0211', 3690902.25000, 474656.75000, 690.67493);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c90f021d', 3690902.25000, 474656.71875, 690.60681);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c8ff0215', 3690902.25000, 474656.18750, 690.01733);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2c913021f', 3690902.25000, 474656.37500, 689.90009);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2d2e00223', 3690902.25000, 474656.12500, 690.48444);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2d2e70225', 3690902.25000, 474656.43750, 690.98193);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2d2ef0227', 3690902.25000, 474656.40625, 690.65314);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2d2f30229', 3690902.25000, 474656.15625, 690.12567);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2d2f7022b', 3690902.25000, 474657.00000, 690.56689);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2d2fe022d', 3690902.25000, 474656.28125, 690.47308);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2d302022f', 3690902.25000, 474656.65625, 690.92584);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2d3060231', 3690902.25000, 474656.71875, 690.60870);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2d30d0233', 3690902.25000, 474656.46875, 689.97638);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2ef280237', 3690902.25000, 474656.03125, 690.52045);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2ef2b0239', 3690902.25000, 474656.43750, 691.03931);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2ef2f023b', 3690902.25000, 474656.43750, 690.58948);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2ef33023d', 3690902.25000, 474656.09375, 690.14282);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2ef38023f', 3690902.25000, 474656.90625, 690.47986);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2ef3c0241', 3690902.25000, 474656.31250, 690.54218);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2ef3f0243', 3690902.25000, 474656.59375, 690.89008);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2ef420245', 3690902.25000, 474656.68750, 690.59607);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecee11016aecf2ef450247', 3690902.25000, 474656.46875, 689.89008);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf38c640002', 3690902.25000, 474656.03125, 690.46783);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf38c860004', 3690902.25000, 474656.46875, 690.97040);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf38c930006', 3690902.25000, 474656.43750, 690.49786);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf38ca10008', 3690902.25000, 474656.12500, 690.20184);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf38cad000a', 3690902.25000, 474656.96875, 690.44446);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf38cb8000c', 3690902.25000, 474656.25000, 690.50342);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf38cc2000e', 3690902.25000, 474656.50000, 690.90521);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf38cca0010', 3690902.25000, 474656.59375, 690.62573);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf38cd40012', 3690902.25000, 474656.37500, 689.84760);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf3cb200016', 3690902.25000, 474656.06250, 690.54199);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf3cb250018', 3690902.25000, 474656.46875, 690.97119);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf3cb2a001a', 3690902.25000, 474656.43750, 690.57391);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf3cb2f001c', 3690902.25000, 474656.18750, 690.27277);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf3cb35001e', 3690902.25000, 474656.96875, 690.44995);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf3cb3a0020', 3690902.25000, 474656.18750, 690.45099);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf3cb400022', 3690902.25000, 474656.40625, 690.93182);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf3cb470024', 3690902.25000, 474656.65625, 690.61041);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf3cb4e0026', 3690902.25000, 474656.37500, 689.87170);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4082d002b', 3690902.25000, 474655.96875, 690.50787);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf40834002d', 3690902.25000, 474656.37500, 690.97333);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4083c002f', 3690902.25000, 474656.34375, 690.64948);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf408440031', 3690902.25000, 474656.21875, 690.33496);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4084a0033', 3690902.25000, 474656.90625, 690.45593);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf408520035', 3690902.25000, 474656.09375, 690.40057);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4085b0037', 3690902.25000, 474656.34375, 691.01636);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf408630039', 3690902.25000, 474656.68750, 690.70343);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4086a003b', 3690902.25000, 474656.46875, 689.92249);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4459f003f', 3690902.25000, 474656.06250, 690.59973);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf445a90041', 3690902.25000, 474656.34375, 690.96649);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf445b20043', 3690902.25000, 474656.25000, 690.55658);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf445b90045', 3690902.25000, 474656.21875, 690.29462);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf445bf0047', 3690902.25000, 474656.93750, 690.45264);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf445c30049', 3690902.25000, 474656.06250, 690.36334);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf445ca004b', 3690902.25000, 474656.37500, 691.09534);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf445cf004d', 3690902.25000, 474656.59375, 690.70312);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf445d3004f', 3690902.25000, 474656.43750, 689.97754);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4834e0053', 3690902.25000, 474656.00000, 690.66687);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf483540055', 3690902.25000, 474656.31250, 690.96204);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4835b0057', 3690902.25000, 474656.18750, 690.49420);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf483620059', 3690902.25000, 474656.15625, 690.38837);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf48367005b', 3690902.25000, 474656.87500, 690.51746);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4836c005d', 3690902.25000, 474655.96875, 690.43152);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf48371005f', 3690902.25000, 474656.43750, 691.10254);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf483760061', 3690902.25000, 474656.62500, 690.62756);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf483790063', 3690902.25000, 474656.43750, 690.05756);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4c05b0068', 3690902.25000, 474655.96875, 690.63342);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4c062006a', 3690902.25000, 474656.25000, 690.88495);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4c06a006c', 3690902.25000, 474656.12500, 690.58936);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4c076006e', 3690902.25000, 474656.21875, 690.36493);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4c07c0070', 3690902.25000, 474656.87500, 690.46320);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4c0800072', 3690902.25000, 474655.90625, 690.42169);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4c0850074', 3690902.25000, 474656.50000, 691.09296);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4c0890076', 3690902.25000, 474656.68750, 690.54810);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4c08e0078', 3690902.25000, 474656.50000, 689.97449);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4fd35007c', 3690902.25000, 474655.87500, 690.58057);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4fd3b007e', 3690902.25000, 474656.28125, 690.85645);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4fd420080', 3690902.25000, 474656.09375, 690.53601);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4fd490082', 3690902.25000, 474656.21875, 690.37671);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4fd4d0084', 3690902.25000, 474656.90625, 690.42090);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4fd530086', 3690902.25000, 474655.84375, 690.48578);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4fd5a0088', 3690902.25000, 474656.56250, 691.00165);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4fd5f008a', 3690902.25000, 474656.62500, 690.62244);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf4fd67008c', 3690902.25000, 474656.43750, 689.95892);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf53ab40090', 3690902.25000, 474655.96875, 690.61816);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf53abb0092', 3690902.25000, 474656.25000, 690.90155);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf53abf0094', 3690902.25000, 474656.09375, 690.61066);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf53ac40096', 3690902.25000, 474656.12500, 690.35358);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf53acb0098', 3690902.25000, 474656.87500, 690.33313);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf53acf009a', 3690902.25000, 474655.78125, 690.51099);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf53ad1009c', 3690902.25000, 474656.56250, 690.99951);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf53ad4009e', 3690902.25000, 474656.68750, 690.53796);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf53adb00a0', 3690902.25000, 474656.34375, 689.89667);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5779500a4', 3690902.25000, 474655.90625, 690.66797);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5779a00a6', 3690902.25000, 474656.31250, 690.84869);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf577a000a8', 3690902.25000, 474656.12500, 690.58215);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf577a700aa', 3690902.25000, 474656.12500, 690.28705);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf577ad00ac', 3690902.25000, 474656.93750, 690.42682);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf577b300ae', 3690902.25000, 474655.75000, 690.47510);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf577b800b0', 3690902.25000, 474656.46875, 690.95990);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf577bf00b2', 3690902.25000, 474656.71875, 690.56531);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf577c400b4', 3690902.25000, 474656.34375, 689.87982);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5b4d300b9', 3690902.25000, 474655.81250, 690.70221);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5b4da00bb', 3690902.25000, 474656.21875, 690.85858);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5b4e400bd', 3690902.25000, 474656.18750, 690.55109);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5b4eb00bf', 3690902.25000, 474656.15625, 690.29846);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5b4f300c1', 3690902.25000, 474656.90625, 690.40009);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5b4fa00c3', 3690902.25000, 474655.78125, 690.43188);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5b4ff00c5', 3690902.25000, 474656.37500, 690.99164);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5b50500c7', 3690902.25000, 474656.75000, 690.49152);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5b50b00c9', 3690902.25000, 474656.34375, 689.97131);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5f1d000cd', 3690902.25000, 474655.78125, 690.69568);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5f1d700cf', 3690902.25000, 474656.21875, 690.80701);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5f1dc00d1', 3690902.25000, 474656.25000, 690.56305);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5f1e200d3', 3690902.25000, 474656.09375, 690.30066);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5f1e900d5', 3690902.25000, 474656.96875, 690.45728);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5f1f000d7', 3690902.25000, 474655.84375, 690.49609);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5f1f800d9', 3690902.25000, 474656.43750, 691.03162);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5f1ff00db', 3690902.25000, 474656.84375, 690.55634);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf5f20500dd', 3690902.25000, 474656.34375, 690.03992);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf62f3100e1', 3690902.25000, 474655.71875, 690.59601);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf62f3b00e3', 3690902.25000, 474656.25000, 690.80048);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf62f4600e5', 3690902.25000, 474656.18750, 690.62390);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf62f5100e7', 3690902.25000, 474656.15625, 690.28290);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf62f5c00e9', 3690902.25000, 474657.00000, 690.38757);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf62f6800eb', 3690902.25000, 474655.81250, 690.52985);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf62f7500ed', 3690902.25000, 474656.53125, 691.04633);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf62f8100ef', 3690902.25000, 474656.90625, 690.49506);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf62f8c00f1', 3690902.25000, 474656.25000, 690.08594);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf66ce300f5', 3690902.25000, 474655.62500, 690.55414);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf66ceb00f7', 3690902.25000, 474656.21875, 690.80408);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf66cf200f9', 3690902.25000, 474656.28125, 690.58026);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf66cf700fb', 3690902.25000, 474656.06250, 690.20795);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf66cfc00fd', 3690902.25000, 474657.00000, 690.44733);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf66cff00ff', 3690902.25000, 474655.71875, 690.57050);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf66d020101', 3690902.25000, 474656.59375, 691.05463);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf66d060103', 3690902.25000, 474656.93750, 690.56488);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf66d090105', 3690902.25000, 474656.18750, 690.12280);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6aaa00109', 3690902.25000, 474655.53125, 690.48993);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6aaad010b', 3690902.25000, 474656.21875, 690.84113);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6aab9010d', 3690902.25000, 474656.37500, 690.53131);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6aac6010f', 3690902.25000, 474656.00000, 690.18195);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6aad50111', 3690902.25000, 474657.09375, 690.51147);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6aadd0113', 3690902.25000, 474655.81250, 690.65625);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6aae40115', 3690902.25000, 474656.56250, 691.01794);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6aaec0117', 3690902.25000, 474656.87500, 690.53552);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6aaf40119', 3690902.25000, 474656.25000, 690.11127);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6e7fc011e', 3690902.25000, 474655.56250, 690.58350);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6e8070120', 3690902.25000, 474656.28125, 690.89178);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6e8130122', 3690902.25000, 474656.43750, 690.60529);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6e81c0124', 3690902.25000, 474656.03125, 690.12646);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6e8290126', 3690902.25000, 474657.06250, 690.45905);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6e8350128', 3690902.25000, 474655.87500, 690.56592);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6e841012a', 3690902.25000, 474656.46875, 690.93097);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6e84d012c', 3690902.25000, 474656.93750, 690.46045);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf6e858012e', 3690902.25000, 474656.25000, 690.11420);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf725680132', 3690902.25000, 474655.65625, 690.54407);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7256f0134', 3690902.25000, 474656.18750, 690.89777);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf725740136', 3690902.25000, 474656.43750, 690.60077);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7257a0138', 3690902.25000, 474656.09375, 690.05066);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7257f013a', 3690902.25000, 474657.06250, 690.41962);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf72586013c', 3690902.25000, 474655.96875, 690.57660);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf72590013e', 3690902.25000, 474656.53125, 690.95959);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7259e0140', 3690902.25000, 474656.93750, 690.45667);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf725a80142', 3690902.25000, 474656.28125, 690.18591);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf762a90147', 3690902.25000, 474655.75000, 690.52789);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf762b50149', 3690902.25000, 474656.09375, 690.85168);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf762bf014b', 3690902.25000, 474656.40625, 690.51099);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf762cb014d', 3690902.25000, 474656.06250, 690.12347);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf762d6014f', 3690902.25000, 474657.12500, 690.43964);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf762e10151', 3690902.25000, 474655.93750, 690.53009);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf762ec0153', 3690902.25000, 474656.43750, 691.05579);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf762f20155', 3690902.25000, 474656.84375, 690.44775);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf762f80157', 3690902.25000, 474656.31250, 690.11267);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7a004015b', 3690902.25000, 474655.78125, 690.55573);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7a00c015d', 3690902.25000, 474656.06250, 690.83844);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7a014015f', 3690902.25000, 474656.46875, 690.47858);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7a01b0161', 3690902.25000, 474656.03125, 690.08533);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7a0230163', 3690902.25000, 474657.12500, 690.41547);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7a02b0165', 3690902.25000, 474656.00000, 690.62170);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7a0320167', 3690902.25000, 474656.37500, 691.09711);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7a0380169', 3690902.25000, 474656.84375, 690.43079);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7a03e016b', 3690902.25000, 474656.25000, 690.06458);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7dd300170', 3690902.25000, 474655.81250, 690.63672);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7dd390172', 3690902.25000, 474656.06250, 690.77582);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7dd430174', 3690902.25000, 474656.37500, 690.44598);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7dd4d0176', 3690902.25000, 474656.09375, 690.16895);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7dd570178', 3690902.25000, 474657.21875, 690.49493);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7dd61017a', 3690902.25000, 474656.00000, 690.65228);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7dd67017c', 3690902.25000, 474656.43750, 691.01056);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7dd70017e', 3690902.25000, 474656.81250, 690.46393);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf7dd780180', 3690902.25000, 474656.25000, 690.01587);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf81a8e0185', 3690902.25000, 474655.75000, 690.59515);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf81a940187', 3690902.25000, 474656.12500, 690.86084);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf81a980189', 3690902.25000, 474656.43750, 690.48444);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf81a9c018b', 3690902.25000, 474656.09375, 690.19067);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf81aa0018d', 3690902.25000, 474657.31250, 690.52875);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf81aa3018f', 3690902.25000, 474656.00000, 690.61456);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf81aa60191', 3690902.25000, 474656.37500, 691.08484);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf81aaa0193', 3690902.25000, 474656.78125, 690.48303);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf81aad0195', 3690902.25000, 474656.34375, 689.95776);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf857aa0199', 3690902.25000, 474655.75000, 690.63348);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf857b4019b', 3690902.25000, 474656.09375, 690.82184);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf857bf019d', 3690902.25000, 474656.37500, 690.48090);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf857c9019f', 3690902.25000, 474656.15625, 690.11340);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf857d701a1', 3690902.25000, 474657.31250, 690.58936);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf857e201a3', 3690902.25000, 474656.00000, 690.70789);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf857ed01a5', 3690902.25000, 474656.43750, 691.07886);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf857f801a7', 3690902.25000, 474656.87500, 690.51715);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8580301a9', 3690902.25000, 474656.34375, 689.87042);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8950901ae', 3690902.25000, 474655.68750, 690.56219);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8950e01b0', 3690902.25000, 474656.09375, 690.89270);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8951401b2', 3690902.25000, 474656.46875, 690.42419);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8951a01b4', 3690902.25000, 474656.15625, 690.17523);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8952001b6', 3690902.25000, 474657.28125, 690.66028);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8952501b8', 3690902.25000, 474655.93750, 690.75183);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8952901ba', 3690902.25000, 474656.37500, 691.04352);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8952d01bc', 3690902.25000, 474656.96875, 690.47784);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8953101be', 3690902.25000, 474656.25000, 689.95599);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8d21c01c2', 3690902.25000, 474655.62500, 690.46869);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8d22201c4', 3690902.25000, 474656.15625, 690.83350);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8d22701c6', 3690902.25000, 474656.40625, 690.49103);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8d22c01c8', 3690902.25000, 474656.09375, 690.22101);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8d23201ca', 3690902.25000, 474657.21875, 690.57178);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8d23901cc', 3690902.25000, 474655.87500, 690.77997);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8d23e01ce', 3690902.25000, 474656.43750, 691.09015);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8d24401d0', 3690902.25000, 474657.00000, 690.51935);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf8d24901d2', 3690902.25000, 474656.34375, 689.93329);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf90f6501d6', 3690902.25000, 474655.56250, 690.44464);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf90f7001d8', 3690902.25000, 474656.06250, 690.80328);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf90f7b01da', 3690902.25000, 474656.40625, 690.52942);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf90f8401dc', 3690902.25000, 474656.18750, 690.26477);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf90f8d01de', 3690902.25000, 474657.21875, 690.48901);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf90f9801e0', 3690902.25000, 474655.96875, 690.81635);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf90fa101e2', 3690902.25000, 474656.37500, 691.07709);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf90fac01e4', 3690902.25000, 474657.00000, 690.59674);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf90fb601e6', 3690902.25000, 474656.43750, 689.97290);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf94ca401ea', 3690902.25000, 474655.65625, 690.48627);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf94ca901ec', 3690902.25000, 474656.12500, 690.76703);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf94cae01ee', 3690902.25000, 474656.34375, 690.56757);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf94cb201f0', 3690902.25000, 474656.12500, 690.19666);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf94cb601f2', 3690902.25000, 474657.12500, 690.40680);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf94cb901f4', 3690902.25000, 474655.87500, 690.78027);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf94cbc01f6', 3690902.25000, 474656.46875, 691.03424);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf94cbf01f8', 3690902.25000, 474656.93750, 690.63800);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf94cc501fa', 3690902.25000, 474656.50000, 690.06604);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf989d501fe', 3690902.25000, 474655.65625, 690.41730);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf989dd0200', 3690902.25000, 474656.15625, 690.72235);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf989e30202', 3690902.25000, 474656.28125, 690.52271);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf989ea0204', 3690902.25000, 474656.12500, 690.26520);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf989f00206', 3690902.25000, 474657.12500, 690.39612);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf989f60208', 3690902.25000, 474655.84375, 690.72461);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf989fc020a', 3690902.25000, 474656.37500, 691.10242);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf98a01020c', 3690902.25000, 474656.93750, 690.68066);
INSERT INTO `displacement_value` VALUES ('2c9ac4cd6aecf351016aecf98a08020e', 3690902.25000, 474656.53125, 690.04285);

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
-- Records of gas
-- ----------------------------
INSERT INTO `gas` VALUES ('2c9ac4cd6aecee11016aecf258190181', '2019-05-25 11:04:26', 3, 4, 0.03, 0.70, 0, NULL);
INSERT INTO `gas` VALUES ('2c9ac4cd6aecee11016aecf2835e01aa', '2019-05-25 11:04:37', 3, 1, 0.50, 0.70, 0, NULL);
INSERT INTO `gas` VALUES ('2c9ac4cd6aecf351016aecf38b070000', '2019-05-25 11:05:45', 3, 0, 0.52, 0.70, 0, NULL);
INSERT INTO `gas` VALUES ('2c9ac4cd6aecf351016aecf47b3a0051', '2019-05-25 11:06:46', 4, 6, 0.58, 0.70, 0, NULL);
INSERT INTO `gas` VALUES ('2c9ac4cd6aecf351016aecf52bfd008e', '2019-05-25 11:07:31', 3, 0, 0.25, 0.70, 0, NULL);
INSERT INTO `gas` VALUES ('2c9ac4cd6aecf351016aecf5672400a2', '2019-05-25 11:07:46', 4, 6, 0.66, 0.70, 0, NULL);
INSERT INTO `gas` VALUES ('2c9ac4cd6aecf351016aecf5a24700b6', '2019-05-25 11:08:01', 3, 1, 0.85, 0.70, 1, NULL);
INSERT INTO `gas` VALUES ('2c9ac4cd6aecf351016aecf6187800df', '2019-05-25 11:08:32', 4, 0, 0.67, 0.70, 0, NULL);
INSERT INTO `gas` VALUES ('2c9ac4cd6aecf351016aecf6539100f3', '2019-05-25 11:08:47', 3, 4, 0.15, 0.70, 0, NULL);
INSERT INTO `gas` VALUES ('2c9ac4cd6aecf351016aecf77ba60159', '2019-05-25 11:10:03', 3, 2, 0.52, 0.70, 0, NULL);
INSERT INTO `gas` VALUES ('2c9ac4cd6aecf351016aecf82d3f0197', '2019-05-25 11:10:48', 3, 4, 0.13, 0.70, 0, NULL);
INSERT INTO `gas` VALUES ('2c9ac4cd6aecf351016aecf8dd9d01d4', '2019-05-25 11:11:33', 3, 2, 0.59, 0.70, 0, NULL);

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
-- Records of humidity
-- ----------------------------
INSERT INTO `humidity` VALUES ('2c9ac4cd6aecee11016aecf2a9ff01e6', '2019-05-25 11:04:47', 51.62, 60.00, 0, NULL);
INSERT INTO `humidity` VALUES ('2c9ac4cd6aecee11016aecf2e5150235', '2019-05-25 11:05:02', 37.83, 60.00, 0, NULL);
INSERT INTO `humidity` VALUES ('2c9ac4cd6aecf351016aecf3c9550014', '2019-05-25 11:06:00', 20.77, 60.00, 0, NULL);

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
-- Records of soak
-- ----------------------------
INSERT INTO `soak` VALUES ('2c9ac4cd6aecee11016aecf247470159', '2019-05-25 11:04:22', 0, 44.26, 30.00, 1, NULL);
INSERT INTO `soak` VALUES ('2c9ac4cd6aecee11016aecf26ece0195', '2019-05-25 11:04:32', 0, 35.22, 30.00, 1, NULL);
INSERT INTO `soak` VALUES ('2c9ac4cd6aecee11016aecf2934f01d1', '2019-05-25 11:04:41', 0, 71.56, 30.00, 1, NULL);
INSERT INTO `soak` VALUES ('2c9ac4cd6aecee11016aecf2ce800221', '2019-05-25 11:04:56', 0, 14.50, 30.00, 0, NULL);
INSERT INTO `soak` VALUES ('2c9ac4cd6aecee11016aecf2f9980249', '2019-05-25 11:05:07', 0, 52.76, 30.00, 1, NULL);
INSERT INTO `soak` VALUES ('2c9ac4cd6aecf351016aecf4b6100065', '2019-05-25 11:07:01', 0, 83.45, 30.00, 1, NULL);
INSERT INTO `soak` VALUES ('2c9ac4cd6aecf351016aecf68eb50107', '2019-05-25 11:09:02', 0, 13.98, 30.00, 0, NULL);
INSERT INTO `soak` VALUES ('2c9ac4cd6aecf351016aecf6c9d9011b', '2019-05-25 11:09:17', 0, 98.21, 30.00, 1, NULL);
INSERT INTO `soak` VALUES ('2c9ac4cd6aecf351016aecf7406f0144', '2019-05-25 11:09:48', 0, 86.62, 30.00, 1, NULL);
INSERT INTO `soak` VALUES ('2c9ac4cd6aecf351016aecf7b6cb016d', '2019-05-25 11:10:18', 0, 93.48, 30.00, 1, NULL);
INSERT INTO `soak` VALUES ('2c9ac4cd6aecf351016aecf918b701e8', '2019-05-25 11:11:48', 0, 18.03, 30.00, 0, NULL);
INSERT INTO `soak` VALUES ('2c9ac4cd6aecf351016aecf953cc01fc', '2019-05-25 11:12:04', 0, 26.73, 30.00, 0, NULL);

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
-- Records of sys_warn
-- ----------------------------
INSERT INTO `sys_warn` VALUES ('2c9ac4cd6aecee11016aecf20aed0144', '2019-05-25 11:04:06', '2019-05-25 11:04:06', NULL, 0, 0, 68.79, 60.00, 0, NULL);
INSERT INTO `sys_warn` VALUES ('2c9ac4cd6aecee11016aecf24752015a', '2019-05-25 11:04:22', '2019-05-25 11:04:22', NULL, 2, 0, 44.26, 30.00, 0, NULL);
INSERT INTO `sys_warn` VALUES ('2c9ac4cd6aecee11016aecf26ed40196', '2019-05-25 11:04:32', '2019-05-25 11:04:32', NULL, 2, 0, 35.22, 30.00, 0, NULL);
INSERT INTO `sys_warn` VALUES ('2c9ac4cd6aecee11016aecf2935101d2', '2019-05-25 11:04:41', '2019-05-25 11:04:41', NULL, 2, 0, 71.56, 30.00, 0, NULL);
INSERT INTO `sys_warn` VALUES ('2c9ac4cd6aecee11016aecf2f99a024a', '2019-05-25 11:05:07', '2019-05-25 11:05:07', NULL, 2, 0, 52.76, 30.00, 0, NULL);
INSERT INTO `sys_warn` VALUES ('2c9ac4cd6aecf351016aecf404c00029', '2019-05-25 11:06:16', '2019-05-25 11:06:16', NULL, 0, 0, 73.92, 60.00, 0, NULL);
INSERT INTO `sys_warn` VALUES ('2c9ac4cd6aecf351016aecf4b6160066', '2019-05-25 11:07:01', '2019-05-25 11:07:01', NULL, 2, 0, 83.45, 30.00, 0, NULL);
INSERT INTO `sys_warn` VALUES ('2c9ac4cd6aecf351016aecf5a24800b7', '2019-05-25 11:08:02', '2019-05-25 11:08:02', NULL, 3, 1, 0.85, 0.70, 0, NULL);
INSERT INTO `sys_warn` VALUES ('2c9ac4cd6aecf351016aecf6c9db011c', '2019-05-25 11:09:17', '2019-05-25 11:09:17', NULL, 2, 0, 98.21, 30.00, 0, NULL);
INSERT INTO `sys_warn` VALUES ('2c9ac4cd6aecf351016aecf740710145', '2019-05-25 11:09:48', '2019-05-25 11:09:48', NULL, 2, 0, 86.62, 30.00, 0, NULL);
INSERT INTO `sys_warn` VALUES ('2c9ac4cd6aecf351016aecf7b6cd016e', '2019-05-25 11:10:18', '2019-05-25 11:10:18', NULL, 2, 0, 93.48, 30.00, 0, NULL);
INSERT INTO `sys_warn` VALUES ('2c9ac4cd6aecf351016aecf7f2130183', '2019-05-25 11:10:33', '2019-05-25 11:10:33', NULL, 0, 0, 81.54, 60.00, 0, NULL);
INSERT INTO `sys_warn` VALUES ('2c9ac4cd6aecf351016aecf8680901ac', '2019-05-25 11:11:03', '2019-05-25 11:11:03', NULL, 0, 0, 80.59, 60.00, 0, NULL);

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
-- Records of temperature
-- ----------------------------
INSERT INTO `temperature` VALUES ('2c9ac4cd6aecee11016aecf208c1011f', '2019-05-25 11:04:06', 68.79, 60.00, 1, NULL);
INSERT INTO `temperature` VALUES ('2c9ac4cd6aecee11016aecf232160145', '2019-05-25 11:04:16', 31.20, 60.00, 0, NULL);
INSERT INTO `temperature` VALUES ('2c9ac4cd6aecee11016aecf2be8801fa', '2019-05-25 11:04:52', -66.73, 60.00, 0, NULL);
INSERT INTO `temperature` VALUES ('2c9ac4cd6aecf351016aecf404af0028', '2019-05-25 11:06:16', 73.92, 60.00, 1, NULL);
INSERT INTO `temperature` VALUES ('2c9ac4cd6aecf351016aecf44007003d', '2019-05-25 11:06:31', 2.38, 60.00, 0, NULL);
INSERT INTO `temperature` VALUES ('2c9ac4cd6aecf351016aecf4f10a007a', '2019-05-25 11:07:16', 38.86, 60.00, 0, NULL);
INSERT INTO `temperature` VALUES ('2c9ac4cd6aecf351016aecf5dd4d00cb', '2019-05-25 11:08:17', 32.31, 60.00, 0, NULL);
INSERT INTO `temperature` VALUES ('2c9ac4cd6aecf351016aecf705470130', '2019-05-25 11:09:32', 7.77, 60.00, 0, NULL);
INSERT INTO `temperature` VALUES ('2c9ac4cd6aecf351016aecf7f2110182', '2019-05-25 11:10:33', 81.54, 60.00, 1, NULL);
INSERT INTO `temperature` VALUES ('2c9ac4cd6aecf351016aecf8680801ab', '2019-05-25 11:11:03', 80.59, 60.00, 1, NULL);
INSERT INTO `temperature` VALUES ('2c9ac4cd6aecf351016aecf8a2df01c0', '2019-05-25 11:11:18', -91.27, 60.00, 0, NULL);
INSERT INTO `temperature` VALUES ('2c9ac4cd6aecf351016aecf98ee10210', '2019-05-25 11:12:19', 53.87, 60.00, 0, NULL);

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
INSERT INTO `type` VALUES ('0', '2019-05-25 00:53:31', '2019-05-25 10:40:29', 0, 0, 60.00, '/', NULL);
INSERT INTO `type` VALUES ('1', '2019-05-25 00:53:31', '2019-05-25 10:40:31', 1, 0, 60.00, '/', NULL);
INSERT INTO `type` VALUES ('2', '2019-05-25 00:53:31', '2019-05-25 10:40:33', 2, 0, 30.00, '/', NULL);
INSERT INTO `type` VALUES ('3', '2019-05-25 00:53:31', '2019-05-25 10:36:35', 3, 0, 0.70, 'CO', NULL);
INSERT INTO `type` VALUES ('4', '2019-05-25 00:53:31', '2019-05-25 10:37:26', 3, 1, 0.70, 'SO₂', NULL);
INSERT INTO `type` VALUES ('5', '2019-05-25 00:53:31', '2019-05-25 10:37:33', 3, 2, 0.70, 'NOx', NULL);
INSERT INTO `type` VALUES ('6', '2019-05-25 00:53:31', '2019-05-25 10:37:38', 3, 3, 0.70, 'HCl', NULL);
INSERT INTO `type` VALUES ('7', '2019-05-25 00:53:31', '2019-05-25 10:37:56', 3, 4, 0.70, 'ClO₂', NULL);
INSERT INTO `type` VALUES ('8', '2019-05-25 00:53:31', '2019-05-25 10:41:28', 4, 0, 0.70, '铜', NULL);
INSERT INTO `type` VALUES ('9', '2019-05-25 00:53:31', '2019-05-25 10:41:39', 4, 1, 0.70, '锌', NULL);
INSERT INTO `type` VALUES ('10', '2019-05-25 00:53:31', '2019-05-25 10:41:58', 4, 2, 0.70, '锡', NULL);
INSERT INTO `type` VALUES ('11', '2019-05-25 00:53:31', '2019-05-25 10:42:17', 4, 3, 0.70, '镍', NULL);
INSERT INTO `type` VALUES ('12', '2019-05-25 00:53:31', '2019-05-25 10:42:19', 4, 4, 0.70, '钴', NULL);
INSERT INTO `type` VALUES ('13', '2019-05-25 00:53:31', '2019-05-25 10:42:36', 4, 5, 0.70, '锑', NULL);
INSERT INTO `type` VALUES ('14', '2019-05-25 00:53:31', '2019-05-25 10:43:10', 4, 6, 0.70, '镉', NULL);
INSERT INTO `type` VALUES ('15', '2019-05-25 00:53:31', '2019-05-25 10:43:21', 4, 7, 0.70, '铅', NULL);

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
INSERT INTO `user` VALUES ('1', '2019-05-25 00:43:01', 'test', '000000', '李兴成', 0, 21, 0, '15191406523', '商洛学院', 0, '普通用户');

SET FOREIGN_KEY_CHECKS = 1;
