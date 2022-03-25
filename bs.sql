/*
 Navicat Premium Data Transfer

 Source Server         : test01
 Source Server Type    : MySQL
 Source Server Version : 50536
 Source Host           : 192.168.31.209:3306
 Source Schema         : bs

 Target Server Type    : MySQL
 Target Server Version : 50536
 File Encoding         : 65001

 Date: 22/03/2022 17:45:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设施名',
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设施简介',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片位置',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设施表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES (1, '云霄飞龙', '这是成都欢乐谷中唯一的一个悬挂式过山车项目，刺激无比，追求刺激者的不二之选', 'img/card/p1.png', '悬挂式过山车');
INSERT INTO `card` VALUES (2, '飞跃地中海', '该过山车的特点就是“飞行”，通过多个连续的上下起伏，让人拥有坐飞机般飞行的感觉', 'img/card/p2.png', '过山车');
INSERT INTO `card` VALUES (3, '4D影院', '在这场友谊、勇气和接纳的冒险体验中，令人惊叹的4D特效会让刺激加倍', 'img/card/p3.png', '电影');
INSERT INTO `card` VALUES (4, '幽灵古堡', '大型鬼屋，想体验惊悚刺激的感觉吗，那就来这吧', 'img/card/p4.png', '鬼屋');
INSERT INTO `card` VALUES (5, '渔猎漂流', '整个成都欢乐谷园区中唯二需要穿雨衣的项目之一，轻松缓慢的漂流', 'img/card/p5.png', '漂流');
INSERT INTO `card` VALUES (6, '加勒比风暴', '体验从高处入水激流勇进般的感觉，骤雨转瞬即逝，建议穿戴雨衣哦', 'img/card/p6.png', '俯冲');
INSERT INTO `card` VALUES (7, '大摆锤', '简单而有趣的单摆现象也能让你体验到欲与天平的感觉。', 'img/card/p7.png', '摇摆');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买者用户名',
  `ticket_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买的门票类型',
  `ticket_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买的门票名称',
  `ticket_price` int(255) NOT NULL COMMENT '购买的门票价格',
  `creat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '购买时间',
  `is_delete` tinyint(255) NOT NULL DEFAULT 1 COMMENT '1未使用，0已使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (6, 'user02', 'd1', '成人日场票（即买即用)', 230, '2022-03-15 23:18:58', 0);
INSERT INTO `goods` VALUES (9, 'user03', 'd1', '成人日场票（即买即用)', 230, '2022-03-16 23:16:42', 0);
INSERT INTO `goods` VALUES (11, 'user01', 'd1', '成人日场票（即买即用)', 230, '2022-03-17 20:09:14', 1);
INSERT INTO `goods` VALUES (12, 'user01', 'd2', '儿童日场票（即买即用)', 120, '2022-03-17 21:02:11', 0);
INSERT INTO `goods` VALUES (13, 'user01', 'n1', '成人夜场票（即买即用)', 100, '2022-03-17 20:52:30', 1);
INSERT INTO `goods` VALUES (14, 'user01', 'n2', '儿童夜场票（即买即用)', 50, '2022-03-17 20:52:30', 1);

-- ----------------------------
-- Table structure for queued
-- ----------------------------
DROP TABLE IF EXISTS `queued`;
CREATE TABLE `queued`  (
  `card_id` int(11) NOT NULL COMMENT '设施id',
  `card_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设施名',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `ticket_id` int(11) NOT NULL COMMENT '门票信息',
  `creat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '排好时间',
  `num` int(11) NOT NULL COMMENT '排位号'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of queued
-- ----------------------------
INSERT INTO `queued` VALUES (1, '云霄飞龙', 'user01', 4, '2022-03-17 19:58:37', 1);
INSERT INTO `queued` VALUES (2, '飞跃地中海', 'user03', 9, '2022-03-17 19:59:02', 1);
INSERT INTO `queued` VALUES (1, '云霄飞龙', 'user02', 6, '2022-03-17 19:58:37', 2);
INSERT INTO `queued` VALUES (2, '飞跃地中海', 'user02', 6, '2022-03-17 19:59:02', 2);

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门票类型编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门票名称',
  `price` int(200) NOT NULL COMMENT '门票价格',
  `time` int(50) NOT NULL COMMENT '1表示日场，0表示夜场',
  `creat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门票表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES ('d1', '成人日场活动票', 200, 1, '2022-03-17 20:43:08');
INSERT INTO `ticket` VALUES ('d2', '儿童日场票（即买即用)', 120, 1, '2022-03-06 21:34:14');
INSERT INTO `ticket` VALUES ('n1', '成人夜场票（即买即用)', 100, 0, '2022-03-06 21:34:46');
INSERT INTO `ticket` VALUES ('n2', '儿童夜场票（即买即用)', 50, 0, '2022-03-06 21:35:05');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `type` tinyint(255) NOT NULL DEFAULT 0 COMMENT '用户类型，0为普通用户，1为管理员',
  `balance` int(255) UNSIGNED NOT NULL DEFAULT 0 COMMENT '账户余额',
  PRIMARY KEY (`id`, `username`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (0, 'root01', 'root', 1, 0);
INSERT INTO `user` VALUES (1, 'user01', '123456', 0, 280502);
INSERT INTO `user` VALUES (2, 'user02', '123123', 0, 9770);
INSERT INTO `user` VALUES (5, 'user03', '123123', 0, 200);
INSERT INTO `user` VALUES (9, 'user04', '123', 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
