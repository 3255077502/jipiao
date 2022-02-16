/*
 Navicat Premium Data Transfer

 Source Server         : MySql_01
 Source Server Type    : MySQL
 Source Server Version : 50710
 Source Host           : localhost:3306
 Source Schema         : air_booking

 Target Server Type    : MySQL
 Target Server Version : 50710
 File Encoding         : 65001

 Date: 17/11/2021 05:27:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for air_order
-- ----------------------------
DROP TABLE IF EXISTS `air_order`;
CREATE TABLE `air_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单记录ID',
  `order_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单记录编号',
  `order_zfb_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付宝账号',
  `order_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '默认创建时间',
  `order_status` int(11) NOT NULL DEFAULT 1 COMMENT '订单状态',
  `operates_id` int(11) NOT NULL COMMENT '操作用户外键ID',
  `cabins_id` int(11) NOT NULL COMMENT '机舱类型外键ID',
  `airlines_id` int(11) NOT NULL COMMENT '航空公司外键ID',
  `flights_id` int(11) NOT NULL COMMENT '航班记录外键ID',
  `tickets_id` int(11) NOT NULL COMMENT '机票详情外键ID',
  `seats_id` int(11) NOT NULL COMMENT '座位外键ID',
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `order_number`(`order_number`) USING BTREE,
  INDEX `FK_AOA`(`operates_id`) USING BTREE,
  INDEX `FK_TSAC`(`cabins_id`) USING BTREE,
  INDEX `FK_TDCA`(`airlines_id`) USING BTREE,
  INDEX `FK_TCA`(`tickets_id`) USING BTREE,
  INDEX `FK_TFA`(`seats_id`) USING BTREE,
  INDEX `FK_TFAS`(`flights_id`) USING BTREE,
  CONSTRAINT `air_order_ibfk_1` FOREIGN KEY (`operates_id`) REFERENCES `operate_user` (`operate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `air_order_ibfk_2` FOREIGN KEY (`cabins_id`) REFERENCES `cabin_type` (`cabin_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `air_order_ibfk_3` FOREIGN KEY (`airlines_id`) REFERENCES `airline_company` (`airline_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `air_order_ibfk_4` FOREIGN KEY (`tickets_id`) REFERENCES `ticket_details` (`ticket_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `air_order_ibfk_5` FOREIGN KEY (`seats_id`) REFERENCES `air_seat` (`seat_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `air_order_ibfk_6` FOREIGN KEY (`flights_id`) REFERENCES `flight_records` (`flight_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of air_order
-- ----------------------------
INSERT INTO `air_order` VALUES (25, 'XHX44a9f397-ed09-4767-b074-1f403cc12869', 'cfmgxx1568@sandbox.com', '2021-11-15 02:29:04', 2, 3, 3, 3, 3, 28, 65);
INSERT INTO `air_order` VALUES (26, 'XHXf87668a1-f44c-4ec8-90f0-d461fafd249f', 'cfmgxx1568@sandbox.com', '2021-11-15 02:30:50', 2, 3, 3, 3, 3, 28, 56);
INSERT INTO `air_order` VALUES (27, 'XHX169119da-6dec-45cb-a3b7-955a8b1ba683', 'cfmgxx1568@sandbox.com', '2021-11-15 09:38:39', 1, 4, 3, 3, 2, 29, 55);
INSERT INTO `air_order` VALUES (28, 'XHXa9aeae76-0d1b-4648-a9af-1a89748215c8', 'cfmgxx1568@sandbox.com', '2021-11-15 11:46:34', 3, 3, 3, 3, 2, 28, 60);
INSERT INTO `air_order` VALUES (29, 'XHXaa282a3b-ccf9-4ca0-8123-aaf709d9f3a9', 'cfmgxx1568@sandbox.com', '2021-11-15 11:48:22', 1, 3, 3, 3, 2, 28, 54);

-- ----------------------------
-- Table structure for air_seat
-- ----------------------------
DROP TABLE IF EXISTS `air_seat`;
CREATE TABLE `air_seat`  (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '座位ID',
  `seat_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '座位编号',
  `seat_status` int(11) NOT NULL DEFAULT 1 COMMENT '座位状态',
  `operates_id` int(11) NOT NULL COMMENT '操作用户外键ID',
  `cabins_id` int(11) NOT NULL COMMENT '机舱类型外键ID',
  `airlines_id` int(11) NOT NULL COMMENT '航空公司外键ID',
  `flights_id` int(11) NOT NULL COMMENT '航班记录外键ID',
  `seat_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '默认创建时间',
  PRIMARY KEY (`seat_id`) USING BTREE,
  INDEX `FK_AO`(`operates_id`) USING BTREE,
  INDEX `FK_AC`(`cabins_id`) USING BTREE,
  INDEX `FK_AA`(`airlines_id`) USING BTREE,
  INDEX `FK_SF`(`flights_id`) USING BTREE,
  CONSTRAINT `air_seat_ibfk_1` FOREIGN KEY (`operates_id`) REFERENCES `operate_user` (`operate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `air_seat_ibfk_2` FOREIGN KEY (`cabins_id`) REFERENCES `cabin_type` (`cabin_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `air_seat_ibfk_3` FOREIGN KEY (`airlines_id`) REFERENCES `airline_company` (`airline_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `air_seat_ibfk_4` FOREIGN KEY (`flights_id`) REFERENCES `flight_records` (`flight_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of air_seat
-- ----------------------------
INSERT INTO `air_seat` VALUES (1, 'A1', 0, 1, 3, 1, 1, '2021-11-07 15:39:08');
INSERT INTO `air_seat` VALUES (2, 'A2', 0, 1, 3, 1, 1, '2021-11-07 15:39:08');
INSERT INTO `air_seat` VALUES (3, 'A3', 0, 1, 3, 1, 1, '2021-11-07 15:39:08');
INSERT INTO `air_seat` VALUES (4, 'A4', 0, 1, 3, 1, 1, '2021-11-07 15:39:08');
INSERT INTO `air_seat` VALUES (5, 'A5', 1, 1, 3, 1, 1, '2021-11-07 15:39:08');
INSERT INTO `air_seat` VALUES (6, 'A6', 0, 1, 3, 1, 1, '2021-11-07 15:39:08');
INSERT INTO `air_seat` VALUES (7, 'A7', 0, 1, 3, 1, 1, '2021-11-07 15:39:08');
INSERT INTO `air_seat` VALUES (8, 'A8', 0, 1, 3, 1, 1, '2021-11-07 15:39:08');
INSERT INTO `air_seat` VALUES (9, 'B1', 0, 1, 3, 1, 1, '2021-11-07 15:39:08');
INSERT INTO `air_seat` VALUES (10, 'B2', 0, 1, 3, 1, 1, '2021-11-07 15:39:08');
INSERT INTO `air_seat` VALUES (11, 'B3', 1, 1, 3, 1, 1, '2021-11-07 15:39:08');
INSERT INTO `air_seat` VALUES (12, 'B4', 0, 1, 3, 1, 1, '2021-11-07 15:39:08');
INSERT INTO `air_seat` VALUES (13, 'B5', 1, 1, 3, 1, 1, '2021-11-07 15:39:08');
INSERT INTO `air_seat` VALUES (14, 'B6', 0, 1, 3, 1, 1, '2021-11-07 15:39:08');
INSERT INTO `air_seat` VALUES (15, 'B7', 1, 1, 3, 1, 1, '2021-11-07 15:39:08');
INSERT INTO `air_seat` VALUES (16, 'B8', 0, 1, 3, 1, 1, '2021-11-07 15:39:08');
INSERT INTO `air_seat` VALUES (17, 'A1', 0, 1, 3, 3, 1, '2021-11-07 16:36:13');
INSERT INTO `air_seat` VALUES (18, 'A2', 0, 1, 3, 3, 1, '2021-11-07 16:36:13');
INSERT INTO `air_seat` VALUES (19, 'A3', 1, 1, 3, 3, 1, '2021-11-07 16:36:13');
INSERT INTO `air_seat` VALUES (20, 'A4', 0, 1, 3, 3, 1, '2021-11-07 16:36:13');
INSERT INTO `air_seat` VALUES (21, 'A5', 0, 1, 3, 3, 1, '2021-11-07 16:36:13');
INSERT INTO `air_seat` VALUES (22, 'A6', 0, 1, 3, 3, 1, '2021-11-07 16:36:13');
INSERT INTO `air_seat` VALUES (23, 'A7', 0, 1, 3, 3, 1, '2021-11-07 16:36:13');
INSERT INTO `air_seat` VALUES (24, 'A8', 0, 1, 3, 3, 1, '2021-11-07 16:36:13');
INSERT INTO `air_seat` VALUES (25, 'B1', 0, 1, 3, 3, 1, '2021-11-07 16:36:13');
INSERT INTO `air_seat` VALUES (26, 'B2', 1, 1, 3, 3, 1, '2021-11-07 16:36:13');
INSERT INTO `air_seat` VALUES (27, 'B3', 1, 1, 3, 3, 1, '2021-11-07 16:36:13');
INSERT INTO `air_seat` VALUES (28, 'B4', 1, 1, 3, 3, 1, '2021-11-07 16:36:13');
INSERT INTO `air_seat` VALUES (29, 'B5', 0, 1, 3, 3, 1, '2021-11-07 16:36:13');
INSERT INTO `air_seat` VALUES (30, 'B6', 1, 1, 3, 3, 1, '2021-11-07 16:36:13');
INSERT INTO `air_seat` VALUES (31, 'B7', 0, 1, 3, 3, 1, '2021-11-07 16:36:13');
INSERT INTO `air_seat` VALUES (32, 'B8', 0, 1, 3, 3, 1, '2021-11-07 16:36:13');
INSERT INTO `air_seat` VALUES (33, 'C1', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (34, 'C2', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (35, 'C3', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (36, 'C4', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (37, 'C5', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (38, 'C6', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (39, 'C7', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (40, 'C8', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (41, 'D1', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (42, 'D2', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (43, 'D3', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (44, 'D4', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (45, 'D5', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (46, 'D6', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (47, 'D7', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (48, 'D8', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (49, 'E1', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (50, 'E2', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (51, 'E3', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (52, 'E4', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (53, 'E5', 0, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (54, 'E6', 1, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (55, 'E7', 1, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (56, 'E8', 1, 1, 2, 1, 3, '2021-11-14 14:22:26');
INSERT INTO `air_seat` VALUES (57, 'A1', 0, 1, 3, 1, 3, '2021-11-14 14:22:45');
INSERT INTO `air_seat` VALUES (58, 'A2', 0, 1, 3, 1, 3, '2021-11-14 14:22:45');
INSERT INTO `air_seat` VALUES (59, 'A3', 0, 1, 3, 1, 3, '2021-11-14 14:22:45');
INSERT INTO `air_seat` VALUES (60, 'A4', 1, 1, 3, 1, 3, '2021-11-14 14:22:45');
INSERT INTO `air_seat` VALUES (61, 'A5', 0, 1, 3, 1, 3, '2021-11-14 14:22:45');
INSERT INTO `air_seat` VALUES (62, 'A6', 0, 1, 3, 1, 3, '2021-11-14 14:22:45');
INSERT INTO `air_seat` VALUES (63, 'A7', 0, 1, 3, 1, 3, '2021-11-14 14:22:45');
INSERT INTO `air_seat` VALUES (64, 'A8', 0, 1, 3, 1, 3, '2021-11-14 14:22:45');
INSERT INTO `air_seat` VALUES (65, 'B1', 1, 1, 3, 1, 3, '2021-11-14 14:22:45');
INSERT INTO `air_seat` VALUES (66, 'B2', 0, 1, 3, 1, 3, '2021-11-14 14:22:45');
INSERT INTO `air_seat` VALUES (67, 'B3', 0, 1, 3, 1, 3, '2021-11-14 14:22:45');
INSERT INTO `air_seat` VALUES (68, 'B4', 0, 1, 3, 1, 3, '2021-11-14 14:22:45');
INSERT INTO `air_seat` VALUES (69, 'B5', 0, 1, 3, 1, 3, '2021-11-14 14:22:45');
INSERT INTO `air_seat` VALUES (70, 'B6', 0, 1, 3, 1, 3, '2021-11-14 14:22:45');
INSERT INTO `air_seat` VALUES (71, 'B7', 0, 1, 3, 1, 3, '2021-11-14 14:22:45');
INSERT INTO `air_seat` VALUES (72, 'B8', 0, 1, 3, 1, 3, '2021-11-14 14:22:45');

-- ----------------------------
-- Table structure for airline_company
-- ----------------------------
DROP TABLE IF EXISTS `airline_company`;
CREATE TABLE `airline_company`  (
  `airline_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '航空公司ID',
  `airline_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '航空公司名称',
  `airline_logo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '航空公司LOGO',
  `airline_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '飞机型号',
  `airline_status` int(11) NOT NULL DEFAULT 1 COMMENT '航空公司状态',
  `airline_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '默认创建时间',
  PRIMARY KEY (`airline_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of airline_company
-- ----------------------------
INSERT INTO `airline_company` VALUES (1, '北京航空', '../assets/air_images/fm.png', '波音73V', 1, '2021-11-07 10:44:32');
INSERT INTO `airline_company` VALUES (2, '江苏航空', '../assets/air_images/mu.png', '波音12V', 1, '2021-11-07 10:44:32');
INSERT INTO `airline_company` VALUES (3, '南京航空', '../assets/air_images/ho.png', '波音23W', 1, '2021-11-07 10:44:32');

-- ----------------------------
-- Table structure for cabin_type
-- ----------------------------
DROP TABLE IF EXISTS `cabin_type`;
CREATE TABLE `cabin_type`  (
  `cabin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '机舱ID',
  `cabin_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机舱类型名称',
  `cabin_status` int(11) NOT NULL DEFAULT 1 COMMENT '机舱类型状态',
  `cabin_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '默认创建时间',
  PRIMARY KEY (`cabin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cabin_type
-- ----------------------------
INSERT INTO `cabin_type` VALUES (1, '经济舱', 1, '2021-11-07 10:44:32');
INSERT INTO `cabin_type` VALUES (2, '商务舱', 1, '2021-11-07 10:44:32');
INSERT INTO `cabin_type` VALUES (3, '头等舱', 1, '2021-11-07 10:44:32');

-- ----------------------------
-- Table structure for certificate_info
-- ----------------------------
DROP TABLE IF EXISTS `certificate_info`;
CREATE TABLE `certificate_info`  (
  `cer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '证件ID',
  `cer_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件名称',
  PRIMARY KEY (`cer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of certificate_info
-- ----------------------------
INSERT INTO `certificate_info` VALUES (1, '护照');
INSERT INTO `certificate_info` VALUES (2, '军官证');
INSERT INTO `certificate_info` VALUES (3, '身份证');

-- ----------------------------
-- Table structure for flight_records
-- ----------------------------
DROP TABLE IF EXISTS `flight_records`;
CREATE TABLE `flight_records`  (
  `flight_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '航班ID',
  `flight_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '航班编号',
  `flight_leave` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出发地点',
  `flight_arrive` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '到达地点',
  `flight_leaveport` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出发机场',
  `flight_arriveport` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '到达机场',
  `flight_leavedate` date NULL DEFAULT NULL COMMENT '出发日期',
  `flight_leavetime` datetime(0) NOT NULL COMMENT '出发时间',
  `flight_arrivetime` datetime(0) NOT NULL COMMENT '抵达时间',
  `flight_duration` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '耗费时长',
  `flight_price` float NOT NULL COMMENT '机票价格',
  `cabins_id` int(11) NOT NULL COMMENT '外键机舱类型ID',
  `airlines_id` int(11) NOT NULL COMMENT '航空公司外键ID',
  PRIMARY KEY (`flight_id`) USING BTREE,
  INDEX `FK_fC`(`cabins_id`) USING BTREE,
  INDEX `FK_fA`(`airlines_id`) USING BTREE,
  CONSTRAINT `flight_records_ibfk_1` FOREIGN KEY (`cabins_id`) REFERENCES `cabin_type` (`cabin_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `flight_records_ibfk_2` FOREIGN KEY (`airlines_id`) REFERENCES `airline_company` (`airline_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flight_records
-- ----------------------------
INSERT INTO `flight_records` VALUES (1, '1', '芜湖', '起飞', '宝安', '白云', '2021-11-10', '2021-11-17 00:38:00', '2021-11-27 00:37:00', '10', 333, 3, 1);
INSERT INTO `flight_records` VALUES (2, '2', '塘厦', '昌平', '宝安', '白云', '2021-11-11', '2021-11-19 00:45:00', '2021-11-20 03:45:00', '216h', 699, 2, 3);
INSERT INTO `flight_records` VALUES (3, 'nj1208', '东莞', '南京', '东莞机场', '南京机场', '2021-11-20', '2021-11-20 00:00:00', '2021-11-21 00:45:00', '24h', 300, 3, 3);
INSERT INTO `flight_records` VALUES (4, 'nj1209', '塘厦', '昌平', '广州机场', '南京机场', '2021-11-17', '2021-11-17 03:26:00', '2021-11-27 04:26:00', '24h', 300, 3, 1);
INSERT INTO `flight_records` VALUES (5, 'nj12011', '塘厦', '昌平', '广州机场', '北京机场', '2021-11-27', '2021-11-27 04:46:00', '2021-11-17 06:46:00', '24h', 300, 1, 3);

-- ----------------------------
-- Table structure for operate_user
-- ----------------------------
DROP TABLE IF EXISTS `operate_user`;
CREATE TABLE `operate_user`  (
  `operate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `operate_tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户电话',
  `operate_surname` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓',
  `operate_username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `operate_password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `operate_role` int(11) NULL DEFAULT 1 COMMENT '用户权限',
  `operate_member` int(11) NULL DEFAULT 1 COMMENT '用户是否是会员',
  `operate_status` int(11) NOT NULL DEFAULT 1 COMMENT '用户状态',
  `operate_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '用户默认创建时间',
  PRIMARY KEY (`operate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operate_user
-- ----------------------------
INSERT INTO `operate_user` VALUES (1, '17312300720', 'A', 'admin', '123456', 1, 1, 1, '2021-11-07 10:44:32');
INSERT INTO `operate_user` VALUES (3, '13560897735', '起飞', '11', '123456', 0, 1, 1, '2021-11-08 00:24:38');
INSERT INTO `operate_user` VALUES (4, '17566719171', '何', '宇', '123456', 0, 1, 1, '2021-11-08 13:51:12');

-- ----------------------------
-- Table structure for ticket_details
-- ----------------------------
DROP TABLE IF EXISTS `ticket_details`;
CREATE TABLE `ticket_details`  (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '机票ID',
  `ticket_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机票详情编号',
  `operates_id` int(11) NOT NULL COMMENT '操作用户外键ID',
  `cabins_id` int(11) NOT NULL COMMENT '外键机舱类型ID',
  `airlines_id` int(11) NOT NULL COMMENT '航空公司外键ID',
  `flights_id` int(11) NOT NULL COMMENT '航班记录外键ID',
  `ticket_status` int(11) NOT NULL DEFAULT 1 COMMENT '机票状态',
  `ticket_update` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '默认创建时间',
  PRIMARY KEY (`ticket_id`) USING BTREE,
  INDEX `FK_TC`(`cabins_id`) USING BTREE,
  INDEX `FK_TA`(`airlines_id`) USING BTREE,
  INDEX `FK_TF`(`flights_id`) USING BTREE,
  INDEX `FK_TUSER`(`operates_id`) USING BTREE,
  CONSTRAINT `ticket_details_ibfk_1` FOREIGN KEY (`cabins_id`) REFERENCES `cabin_type` (`cabin_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ticket_details_ibfk_2` FOREIGN KEY (`airlines_id`) REFERENCES `airline_company` (`airline_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ticket_details_ibfk_3` FOREIGN KEY (`flights_id`) REFERENCES `flight_records` (`flight_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ticket_details_ibfk_4` FOREIGN KEY (`operates_id`) REFERENCES `operate_user` (`operate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_details
-- ----------------------------
INSERT INTO `ticket_details` VALUES (28, 'ae19a1da-e199-41f9-be93-dff8970b644d', 3, 3, 3, 3, 1, '2021-11-15 02:10:47');
INSERT INTO `ticket_details` VALUES (29, '436dbf95-7ee6-4367-9ed9-68eff590d1c4', 4, 3, 3, 3, 1, '2021-11-15 09:37:45');
INSERT INTO `ticket_details` VALUES (30, '8f5d0d45-e308-439a-ba05-52bd1385fcb7', 4, 3, 1, 1, 1, '2021-11-15 09:44:17');
INSERT INTO `ticket_details` VALUES (31, '19bd013a-1305-46ee-89f9-e2e5a8cefe2f', 4, 3, 1, 1, 1, '2021-11-15 09:45:52');
INSERT INTO `ticket_details` VALUES (32, '5f106bea-b237-433b-95d9-9089ca81fab6', 4, 3, 1, 1, 1, '2021-11-15 09:47:18');
INSERT INTO `ticket_details` VALUES (33, '73bfd5f2-4e91-4024-a784-f54dffc703df', 3, 3, 1, 1, 1, '2021-11-15 11:14:05');
INSERT INTO `ticket_details` VALUES (34, '2fcf7b55-be96-4626-8d36-df15c30b54ca', 3, 3, 1, 1, 1, '2021-11-15 11:45:43');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户信息ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `user_phone` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户联系电话',
  `user_sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户性别',
  `;cers_id` int(11) NOT NULL COMMENT '用户证件ID外键',
  `user_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (2, '11', '1868111', '男', 3, '4444444444444');

SET FOREIGN_KEY_CHECKS = 1;
