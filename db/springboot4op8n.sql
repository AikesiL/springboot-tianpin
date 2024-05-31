/*
 Navicat Premium Data Transfer

 Source Server         : local_3307
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3307
 Source Schema         : springboot4op8n

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 14/04/2024 06:20:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aboutus
-- ----------------------------
DROP TABLE IF EXISTS `aboutus`;
CREATE TABLE `aboutus`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `subtitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '副标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `picture1` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片1',
  `picture2` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片2',
  `picture3` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '关于我们' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aboutus
-- ----------------------------
INSERT INTO `aboutus` VALUES (1, '2030-02-23 18:18:41', '关于我们', 'ABOUT US', '不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?\n你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。其实，我已经厌倦了你这样说说而已的把戏，我觉得就算我告诉你如何去做，你也不会照做，因为你根本什么都不做。', 'upload/aboutus_picture1.jpg', 'upload/aboutus_picture2.jpg', 'upload/xiaochi5.jpeg');

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人',
  `phone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `isdefault` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否默认地址[是/否]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1705841891492 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '2030-02-23 18:18:41', 11, '宇宙银河系金星1号', '金某', '13823888881', '是');
INSERT INTO `address` VALUES (2, '2030-02-23 18:18:41', 12, '宇宙银河系木星1号', '木某', '13823888882', '是');
INSERT INTO `address` VALUES (3, '2030-02-23 18:18:41', 13, '宇宙银河系水星1号', '水某', '13823888883', '是');
INSERT INTO `address` VALUES (4, '2030-02-23 18:18:41', 14, '宇宙银河系火星1号', '火某', '13823888884', '是');
INSERT INTO `address` VALUES (5, '2030-02-23 18:18:41', 15, '宇宙银河系土星1号', '土某', '13823888885', '是');
INSERT INTO `address` VALUES (6, '2030-02-23 18:18:41', 16, '宇宙银河系月球1号', '月某', '13823888886', '是');
INSERT INTO `address` VALUES (7, '2030-02-23 18:18:41', 17, '宇宙银河系黑洞1号', '黑某', '13823888887', '是');
INSERT INTO `address` VALUES (8, '2030-02-23 18:18:41', 18, '宇宙银河系地球1号', '地某', '13823888888', '是');
INSERT INTO `address` VALUES (1677153000708, '2030-02-23 18:18:41', 1677152977279, 'xxx地址', '111', '13899999999', '是');
INSERT INTO `address` VALUES (1705841891491, '2024-01-21 20:58:11', 21, '地址1', '用户账号1', '15478456456', '是');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tablename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'xianshihuodong' COMMENT '商品表名',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `picture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片',
  `buynumber` int(11) NOT NULL COMMENT '购买数量',
  `price` float DEFAULT NULL COMMENT '单价',
  `discountprice` float DEFAULT NULL COMMENT '会员价',
  `shangjiazhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商户名称',
  `goodtype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1705841904445 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1705841853394, '2024-01-21 20:57:33', 'tiyuyongpin', 21, 47, '甜品名称7', 'upload/xiaochi7.jpeg', 1, 99.9, 0, '商家账号7', '甜品分类7');
INSERT INTO `cart` VALUES (1705841904444, '2024-01-21 20:58:23', 'tiyuyongpin', 21, 43, '甜品名称3', 'upload/xiaochi3.jpeg', 1, 99.9, 0, '商家账号3', '甜品分类3');

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `adminid` bigint(20) DEFAULT NULL COMMENT '管理员id',
  `ask` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '提问',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '回复',
  `isreply` int(11) DEFAULT NULL COMMENT '是否回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1713046544099 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线客服' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO `chat` VALUES (61, '2030-02-23 18:18:41', 1, 1, '提问1', '回复1', 0);
INSERT INTO `chat` VALUES (62, '2030-02-23 18:18:41', 2, 2, '提问2', '回复2', 2);
INSERT INTO `chat` VALUES (63, '2030-02-23 18:18:41', 3, 3, '提问3', '回复3', 3);
INSERT INTO `chat` VALUES (64, '2030-02-23 18:18:41', 4, 4, '提问4', '回复4', 4);
INSERT INTO `chat` VALUES (65, '2030-02-23 18:18:41', 5, 5, '提问5', '回复5', 5);
INSERT INTO `chat` VALUES (66, '2030-02-23 18:18:41', 6, 6, '提问6', '回复6', 6);
INSERT INTO `chat` VALUES (67, '2030-02-23 18:18:41', 7, 7, '提问7', '回复7', 7);
INSERT INTO `chat` VALUES (68, '2030-02-23 18:18:41', 8, 8, '提问8', '回复8', 8);
INSERT INTO `chat` VALUES (1677153010148, '2030-02-23 18:18:41', 1677152977279, NULL, '用户可以联系客服', NULL, 0);
INSERT INTO `chat` VALUES (1677153309077, '2030-02-23 18:18:41', 1677152977279, 1, NULL, '回复用户', 0);
INSERT INTO `chat` VALUES (1677153358921, '2030-02-23 18:18:41', 1677152977279, NULL, '111', NULL, 1);
INSERT INTO `chat` VALUES (1705841910831, '2024-01-21 20:58:29', 21, NULL, '啊实打实的', NULL, 0);
INSERT INTO `chat` VALUES (1708541860595, '2024-02-22 02:57:40', 1, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1708542068852, '2024-02-22 03:01:07', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1708542706267, '2024-02-22 03:11:45', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1708542751304, '2024-02-22 03:12:30', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1708542986932, '2024-02-22 03:16:26', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1708544106931, '2024-02-22 03:35:06', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1708544217210, '2024-02-22 03:36:56', 21, NULL, '啊实打实的', NULL, 0);
INSERT INTO `chat` VALUES (1713045360644, '2024-04-14 05:56:00', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713045743223, '2024-04-14 06:02:22', 1, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', NULL);
INSERT INTO `chat` VALUES (1713045791438, '2024-04-14 06:03:11', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713045811940, '2024-04-14 06:03:31', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713045855294, '2024-04-14 06:04:14', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713045874264, '2024-04-14 06:04:33', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713045882386, '2024-04-14 06:04:41', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713045949449, '2024-04-14 06:05:49', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713046092998, '2024-04-14 06:08:12', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713046203564, '2024-04-14 06:10:02', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713046223317, '2024-04-14 06:10:23', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713046313550, '2024-04-14 06:11:52', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713046394014, '2024-04-14 06:13:13', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713046413324, '2024-04-14 06:13:32', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713046414568, '2024-04-14 06:13:34', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713046421766, '2024-04-14 06:13:41', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713046516192, '2024-04-14 06:15:16', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713046517736, '2024-04-14 06:15:17', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713046526023, '2024-04-14 06:15:25', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713046538431, '2024-04-14 06:15:37', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', 0);
INSERT INTO `chat` VALUES (1713046544098, '2024-04-14 06:15:43', 21, 21, NULL, '主人，我是您的智能助手小搏，请问有什么可以帮您！', NULL);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'picture1', 'upload/xiaochi1.jpeg');
INSERT INTO `config` VALUES (2, 'picture2', 'upload/xiaochi2.jpeg');
INSERT INTO `config` VALUES (3, 'picture3', 'upload/xiaochi3.jpeg');

-- ----------------------------
-- Table structure for discusstiyuyongpin
-- ----------------------------
DROP TABLE IF EXISTS `discusstiyuyongpin`;
CREATE TABLE `discusstiyuyongpin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '头像',
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '回复内容',
  `pingfen` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1677153351759 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '体育甜品评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for discussxianshihuodong
-- ----------------------------
DROP TABLE IF EXISTS `discussxianshihuodong`;
CREATE TABLE `discussxianshihuodong`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '头像',
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时活动评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for discussxiaochixinxi
-- ----------------------------
DROP TABLE IF EXISTS `discussxiaochixinxi`;
CREATE TABLE `discussxiaochixinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '头像',
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '体育小吃评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '帖子标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帖子内容',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `avatarurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '头像',
  `isdone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1708544185535 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邻里交流' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES (61, '2030-02-23 18:18:41', '帖子标题11', '<p>帖子内容1</p>', 0, 1, '用户名1', 'upload/forum_avatarurl1.jpg,upload/forum_avatarurl2.jpg,upload/forum_avatarurl3.jpg', '开放');
INSERT INTO `forum` VALUES (62, '2030-02-23 18:18:41', '帖子标题2', '帖子内容2', 0, 2, '用户名2', 'upload/forum_avatarurl2.jpg,upload/forum_avatarurl3.jpg,upload/forum_avatarurl4.jpg', '开放');
INSERT INTO `forum` VALUES (63, '2030-02-23 18:18:41', '帖子标题3', '帖子内容3', 0, 3, '用户名3', 'upload/forum_avatarurl3.jpg,upload/forum_avatarurl4.jpg,upload/forum_avatarurl5.jpg', '开放');
INSERT INTO `forum` VALUES (64, '2030-02-23 18:18:41', '帖子标题4', '帖子内容4', 0, 4, '用户名4', 'upload/forum_avatarurl4.jpg,upload/forum_avatarurl5.jpg,upload/forum_avatarurl6.jpg', '开放');
INSERT INTO `forum` VALUES (65, '2030-02-23 18:18:41', '帖子标题5', '帖子内容5', 0, 5, '用户名5', 'upload/forum_avatarurl5.jpg,upload/forum_avatarurl6.jpg,upload/forum_avatarurl7.jpg', '开放');
INSERT INTO `forum` VALUES (66, '2030-02-23 18:18:41', '帖子标题6', '帖子内容6', 0, 6, '用户名6', 'upload/forum_avatarurl6.jpg,upload/forum_avatarurl7.jpg,upload/forum_avatarurl8.jpg', '开放');
INSERT INTO `forum` VALUES (67, '2030-02-23 18:18:41', '帖子标题7', '帖子内容7', 0, 7, '用户名7', 'upload/forum_avatarurl7.jpg,upload/forum_avatarurl8.jpg,upload/forum_avatarurl9.jpg', '开放');
INSERT INTO `forum` VALUES (68, '2030-02-23 18:18:41', '帖子标题8', '帖子内容8', 0, 8, '用户名8', 'upload/forum_avatarurl8.jpg,upload/forum_avatarurl9.jpg,upload/forum_avatarurl10.jpg', '开放');
INSERT INTO `forum` VALUES (1679404169656, '2030-02-23 18:18:41', NULL, '<p>22222</p>', 1679404164055, 1679403741176, '111', 'upload/1679403739756.jpg', NULL);
INSERT INTO `forum` VALUES (1700742784817, '2030-02-23 18:18:41', NULL, '<p>3333</p>', 61, 11, NULL, 'upload/yonghu_touxiang1.jpg', NULL);
INSERT INTO `forum` VALUES (1700744440092, '2030-02-23 18:18:41', NULL, '<p>77777</p>', 61, 11, NULL, 'upload/yonghu_touxiang1.jpg', NULL);
INSERT INTO `forum` VALUES (1701117023920, '2030-02-23 18:18:41', NULL, '<p>水水水水s\'s\'s</p>', 1700744475718, 11, '', 'upload/xuesheng_touxiang1.jpg', NULL);
INSERT INTO `forum` VALUES (1701117572523, '2030-02-23 18:18:41', NULL, '<p>sssss</p>', 1700744454115, 11, '', 'upload/xuesheng_touxiang1.jpg', NULL);
INSERT INTO `forum` VALUES (1703360222558, '2030-02-23 18:18:41', NULL, '<p>dasda</p>', 1700744475718, 21, '', '', NULL);
INSERT INTO `forum` VALUES (1703425508158, '2030-02-23 18:18:41', NULL, '<p>ssssss</p>', 1703360899477, 11, '', 'upload/xuesheng_touxiang1.jpg', NULL);
INSERT INTO `forum` VALUES (1703425515717, '2030-02-23 18:18:41', NULL, '<p>1111</p>', 1703425508158, 11, '', 'upload/xuesheng_touxiang1.jpg', NULL);
INSERT INTO `forum` VALUES (1708544185534, '2024-02-22 03:36:25', NULL, '啊实打实的', 61, 21, '用户账号1', 'upload/yonghu_touxiang1.jpg', NULL);

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '留言人id',
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `avatarurl` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '头像',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `cpicture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '留言图片',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '回复内容',
  `rpicture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '回复图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1677153101975 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '意见反馈' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES (141, '2030-02-23 18:18:41', 1, '用户名1', 'upload/messages_avatarurl1.jpg', '留言内容1', 'upload/messages_cpicture1.jpg', '回复内容1', 'upload/xiaochi1.jpeg');
INSERT INTO `messages` VALUES (142, '2030-02-23 18:18:41', 2, '用户名2', 'upload/messages_avatarurl2.jpg', '留言内容2', 'upload/messages_cpicture2.jpg', '回复内容2', 'upload/xiaochi2.jpeg');
INSERT INTO `messages` VALUES (143, '2030-02-23 18:18:41', 3, '用户名3', 'upload/messages_avatarurl3.jpg', '留言内容3', 'upload/messages_cpicture3.jpg', '回复内容3', 'upload/xiaochi3.jpeg');
INSERT INTO `messages` VALUES (144, '2030-02-23 18:18:41', 4, '用户名4', 'upload/messages_avatarurl4.jpg', '留言内容4', 'upload/messages_cpicture4.jpg', '回复内容4', 'upload/xiaochi4.jpeg');
INSERT INTO `messages` VALUES (145, '2030-02-23 18:18:41', 5, '用户名5', 'upload/messages_avatarurl5.jpg', '留言内容5', 'upload/messages_cpicture5.jpg', '回复内容5', 'upload/xiaochi5.jpeg');
INSERT INTO `messages` VALUES (146, '2030-02-23 18:18:41', 6, '用户名6', 'upload/messages_avatarurl6.jpg', '留言内容6', 'upload/messages_cpicture6.jpg', '回复内容6', 'upload/xiaochi6.jpeg');
INSERT INTO `messages` VALUES (147, '2030-02-23 18:18:41', 7, '用户名7', 'upload/messages_avatarurl7.jpg', '留言内容7', 'upload/messages_cpicture7.jpg', '回复内容7', 'upload/xiaochi7.jpeg');
INSERT INTO `messages` VALUES (148, '2030-02-23 18:18:41', 8, '用户名8', 'upload/messages_avatarurl8.jpg', '留言内容8', 'upload/messages_cpicture8.jpg', '回复内容8', 'upload/xiaochi8.jpeg');
INSERT INTO `messages` VALUES (1677153101974, '2030-02-23 18:18:41', 1677152977279, '111', 'upload/1677152975491.jpg', '用户可以进行留言反馈', 'upload/1677153100393.jpg', '回复用户的留言', NULL);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '简介',
  `picture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站内活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (111, '2030-02-23 18:18:41', '有梦想，就要努力去实现', '不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。', 'upload/xiaochi1.jpeg', '<p>不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?</p><p>你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。其实，我已经厌倦了你这样说说而已的把戏，我觉得就算我告诉你如何去做，你也不会照做，因为你根本什么都不做。</p><p>真正有行动力的人不需要别人告诉他如何做，因为他已经在做了。就算碰到问题，他也会自己想办法，自己动手去解决或者主动寻求可以帮助他的人，而不是等着别人为自己解决问题。</p><p>首先要学习独立思考。花一点时间想一下自己喜欢什么，梦想是什么，不要别人说想环游世界，你就说你的梦想是环游世界。</p><p>很多人说现实束缚了自己，其实在这个世界上，我们一直都可以有很多选择，生活的决定权也—直都在自己手上，只是我们缺乏行动力而已。</p><p>如果你觉得安于现状是你想要的，那选择安于现状就会让你幸福和满足;如果你不甘平庸，选择一条改变、进取和奋斗的道路，在这个追求的过程中，你也一样会感到快乐。所谓的成功，即是按照自己想要的生活方式生活。最糟糕的状态，莫过于当你想要选择一条不甘平庸、改变、进取和奋斗的道路时，却以一种安于现状的方式生活，最后抱怨自己没有得到想要的人生。</p><p>因为喜欢，你不是在苦苦坚持，也因为喜欢，你愿意投入时间、精力，长久以往，获得成功就是自然而然的事情。</p>');
INSERT INTO `news` VALUES (112, '2030-02-23 18:18:41', '又是一年毕业季', '又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。', 'upload/xiaochi2.jpeg', '<p>又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。</p><p>过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。一直都是晚会的忠实参与者，无论是台前还是幕后，忽然间，角色转变，那种感觉确实难以用语言表达。</p><p>	过去的三年，总是默默地期盼着这个好雨时节，因为这时候，会有灿烂的阳光，会有满目的百花争艳，会有香甜的冰激凌，这是个毕业的季节，当时不经世事的我们会殷切地期待学校那一大堆的活动，期待穿上绚丽的演出服或者礼仪服，站在大礼堂镁光灯下尽情挥洒我们的澎拜的激情。</p><p>百感交集，隔岸观火与身临其境的感觉竟是如此不同。从来没想过一场晚会送走的是我们自己的时候会是怎样的感情，毕业就真的意味着结束吗?倔强的我们不愿意承认，谢谢学弟学妹们慷慨的将这次的主题定为“我们在这里”。我知道，这可能是他们对我们这些过来人的尊敬和施舍。</p><p>没有为这场晚会排练、奔波，没有为班级、学生会、文学院出点力，还真有点不习惯，百般无奈中，用“工作忙”个万能的借口来搪塞自己，欺骗别人。其实自己心里明白，那只是在逃避，只是不愿面对繁华落幕后的萧条和落寞。大四了，大家各奔东西，想凑齐班上的人真的是难上加难，敏燕从越南回来，刚落地就匆匆回了学校，那么恋家的人也启程回来了，睿睿学姐也是从家赶来跟我们团圆。大家—如既往的寒暄、打趣、调侃对方，似乎一切又回到了当初的单纯美好。</p><p>看着舞台上活泼可爱的学弟学妹们，如同一群机灵的小精灵，清澈的眼神，稚嫩的肢体，轻快地步伐，用他们那热情洋溢的舞姿渲染着在场的每一个人，我知道，我不应该羡慕嫉妒他们，不应该顾自怜惜逝去的青春，不应该感叹夕阳无限好，曾经，我们也拥有过，曾经，我们也年轻过，曾经，我们也灿烂过。我深深地告诉自己，人生的每个阶段都是美的，年轻有年轻的活力，成熟也有成熟的魅力。多—份稳重、淡然、优雅，也是漫漫时光掠影遗留下的.珍贵赏赐。</p>');
INSERT INTO `news` VALUES (113, '2030-02-23 18:18:41', '挫折路上，坚持常在心间', '回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。', 'upload/xiaochi3.jpeg', '<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>');
INSERT INTO `news` VALUES (114, '2030-02-23 18:18:41', '挫折是另一个生命的开端', '当遇到挫折或失败，你是看见失败还是看见机会?挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。', 'upload/xiaochi4.jpeg', '<p>当遇到挫折或失败，你是看见失败还是看见机会?</p><p>挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。</p><p>人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。</p><p>大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。</p><p>	“塞翁失马，焉知非福。”人生的道路，并不是每一步都迈向成功，这就是追求的意义。我们还要认识到一点，挫折作为一种情绪状态和一种个人体验，各人的耐受性是大不相同的，有的人经历了一次次挫折，就能够坚忍不拔，百折不挠;有的人稍遇挫折便意志消沉，一蹶不振。所以，挫折感是一种主观感受，因为人的目的和需要不同，成功标准不同，所以同一种活动对于不同的人可能会造成不同的挫折感受。</p><p>凡事皆以平常心来看待，对于生命顺逆不要太执著。能够“破我执”是很高层的人生境界。</p><p>人事的艰难就是一种考验。就像—支剑要有磨刀来磨，剑才会利:一块璞玉要有粗石来磨，才会发出耀眼的光芒。我们能够做到的，只是如何减少、避免那些由于自身的原因所造成的挫折，而在遇到痛苦和挫折之后，则力求化解痛苦，争取幸福。我们要知道，痛苦和挫折是双重性的，它既是我们人生中难以完全避免的，也是我们在争取成功时，不可缺少的一种动力。因为我认为，推动我们奋斗的力量，不仅仅是对成功的渴望，还有为摆脱痛苦和挫折而进行的奋斗。</p>');
INSERT INTO `news` VALUES (115, '2030-02-23 18:18:41', '你要去相信，没有到不了的明天', '有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。', 'upload/xiaochi5.jpeg', '<p>有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。</p><p>不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。</p><p>	不管你现在是在图书馆里背着怎么也看不进去的英语单词，还是你现在迷茫地看不清未来的方向不知道要往哪走。</p><p>不管你现在是在努力着去实现梦想却没能拉近与梦想的距离，还是你已经慢慢地找不到自己的梦想了。</p><p>你都要去相信，没有到不了的明天。</p><p>	有的时候你的梦想太大，别人说你的梦想根本不可能实现;有的时候你的梦想又太小，又有人说你胸无大志;有的时候你对死党说着将来要去环游世界的梦想，却换来他的不屑一顾，于是你再也不提自己的梦想;有的时候你突然说起将来要开个小店的愿望，却发现你讲述的那个人，并没有听到你在说什么。</p><p>不过又能怎么样呢，未来始终是自己的，梦想始终是自己的，没有人会来帮你实现它。</p><p>也许很多时候我们只是需要朋友的一句鼓励，一句安慰，却也得不到。但是相信我，世界上还有很多人，只是想要和你说说话。</p><p>因为我们都一样。一样的被人说成固执，一样的在追逐他们眼里根本不在意的东西。</p><p>所以，又有什么关系呢，别人始终不是你、不能懂你的心情，你又何必多去解释呢。这个世界会来阻止你，困难也会接踵而至，其实真正关键的只有自己，有没有那个倔强。</p><p>这个世界上没有不带伤的人，真正能治愈自己的，只有自己。</p>');
INSERT INTO `news` VALUES (116, '2030-02-23 18:18:41', '离开是一种痛苦，是一种勇气，但同样也是一个考验，是一个新的开端', '无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。', 'upload/xiaochi6.jpeg', '<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>');
INSERT INTO `news` VALUES (117, '2030-02-23 18:18:41', 'Leave未必是一种痛苦', '无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。', 'upload/xiaochi7.jpeg', '<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>');
INSERT INTO `news` VALUES (118, '2030-02-23 18:18:41', '坚持才会成功', '回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。', 'upload/xiaochi8.jpeg', '<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `orderid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `tablename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'xianshihuodong' COMMENT '商品表名',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `picture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '商品图片',
  `buynumber` int(11) NOT NULL COMMENT '购买数量',
  `price` float NOT NULL DEFAULT 0 COMMENT '价格',
  `discountprice` float DEFAULT 0 COMMENT '折扣价格',
  `total` float NOT NULL DEFAULT 0 COMMENT '总价格',
  `discounttotal` float DEFAULT 0 COMMENT '折扣总价格',
  `type` int(11) DEFAULT 1 COMMENT '支付类型',
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `tel` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电话',
  `consignee` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货人',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `logistics` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '物流',
  `shangjiazhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商户名称',
  `goodtype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderid`(`orderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1708544199213 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1677153068099, '2030-02-23 18:18:41', '202322319517878', 'tiyuyongpin', 1677152977279, 46, '甜品名称6', 'upload/xiaochi6.jpeg', 1, 99.9, 99.9, 99.9, 99.9, 1, '已退款', 'xxx地址', '13899999999', '111', '无', NULL, '商家账号6', '甜品分类6');
INSERT INTO `orders` VALUES (1677153068454, '2030-02-23 18:18:41', '202322319517875', 'tiyuyongpin', 1677152977279, 42, '甜品名称2', 'upload/xiaochi2.jpeg', 2, 99.9, 99.9, 199.8, 199.8, 1, '已完成', 'xxx地址', '13899999999', '111', '无', '<p>l&nbsp;2023-06-08&nbsp;16:59</p><p>l&nbsp;运输中</p><p>l&nbsp;北京市,进口海关留存待验由于疫情防控和交通管制影响，邮件寄运时效可能受到影响，不便之处敬请理解。</p><p>l&nbsp;</p><p>l&nbsp;2023-06-07&nbsp;17:42</p><p>l&nbsp;运输中</p><p>l&nbsp;北京市,送交进口海关</p><p>l&nbsp;</p><p>l&nbsp;2023-06-07&nbsp;03:39</p><p>l&nbsp;运输中</p><p>l&nbsp;北京市,离开【北京国际天竺处理中心】,下—站【北京国际天竺处理中心】(经转)</p><p>l&nbsp;</p><p>l&nbsp;2023-06-07&nbsp;01:50</p><p>l&nbsp;运输中</p><p>l&nbsp;北京市,到达【北京国际天竺处理中心】(经转)</p><p>l&nbsp;</p><p>l&nbsp;2023-06-05&nbsp;16:34</p><p>l&nbsp;运输中</p><p>l&nbsp;广州市,离开【广州国际中心】,下一站【北京国际天竺处理中心】(经转)</p>', '商家账号2', '甜品分类2');
INSERT INTO `orders` VALUES (1677153087680, '2030-02-23 18:18:41', '2023223195127472', 'xianshihuodong', 1677152977279, 52, '甜品名称2', 'upload/xiaochi2.jpeg', 1, 99.9, 99.9, 99.9, 99.9, 1, '已支付', 'xxx地址', '13899999999', '111', '无', NULL, '商家账号2', NULL);
INSERT INTO `orders` VALUES (1705841897547, '2024-01-21 20:58:16', '2024121205816567', 'tiyuyongpin', 21, 42, '甜品名称2', 'upload/xiaochi2.jpeg', 1, 99.9, 99.9, 99.9, 99.9, 1, '已支付', '地址1', '15478456456', '用户账号1', '', NULL, '商家账号2', '甜品分类2');
INSERT INTO `orders` VALUES (1708544199212, '2024-02-22 03:36:38', '202422233638209', 'tiyuyongpin', 21, 44, '甜品名称4', 'upload/xiaochi4.jpeg', 1, 99.9, 99.9, 99.9, 99.9, 1, '已支付', '地址1', '15478456456', '用户账号1', '', NULL, '商家账号4', '甜品分类4');

-- ----------------------------
-- Table structure for shangjia
-- ----------------------------
DROP TABLE IF EXISTS `shangjia`;
CREATE TABLE `shangjia`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shangjiazhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家账号',
  `mima` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `dianpumingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '店铺名称',
  `dianpudizhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '店铺地址',
  `lianxifangshi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系方式',
  `lianxiren` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系人',
  `sfsh` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '审核回复',
  `money` float DEFAULT 0 COMMENT '余额',
  `tupian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `shangjiazhanghao`(`shangjiazhanghao`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shangjia
-- ----------------------------
INSERT INTO `shangjia` VALUES (11, '2030-02-23 18:18:41', '商家账号1', '1', '店铺名称1', '店铺地址1', '联系方式1', '联系人1', '是', '', 200, 'upload/yonghu_touxiang1.jpg');
INSERT INTO `shangjia` VALUES (12, '2030-02-23 18:18:41', '商家账号2', '123456', '店铺名称2', '店铺地址2', '联系方式2', '联系人2', '是', '', 200, 'upload/yonghu_touxiang2.jpg');
INSERT INTO `shangjia` VALUES (13, '2030-02-23 18:18:41', '商家账号3', '123456', '店铺名称3', '店铺地址3', '联系方式3', '联系人3', '是', '', 200, 'upload/yonghu_touxiang3.jpg');
INSERT INTO `shangjia` VALUES (14, '2030-02-23 18:18:41', '商家账号4', '123456', '店铺名称4', '店铺地址4', '联系方式4', '联系人4', '是', '', 200, 'upload/yonghu_touxiang4.jpg');
INSERT INTO `shangjia` VALUES (15, '2030-02-23 18:18:41', '商家账号5', '123456', '店铺名称5', '店铺地址5', '联系方式5', '联系人5', '是', '', 200, 'upload/yonghu_touxiang5.jpg');
INSERT INTO `shangjia` VALUES (16, '2030-02-23 18:18:41', '商家账号6', '123456', '店铺名称6', '店铺地址6', '联系方式6', '联系人6', '是', '', 200, 'upload/yonghu_touxiang6.jpg');
INSERT INTO `shangjia` VALUES (17, '2030-02-23 18:18:41', '商家账号7', '123456', '店铺名称7', '店铺地址7', '联系方式7', '联系人7', '是', '内容1', 200, 'upload/yonghu_touxiang7.jpg');
INSERT INTO `shangjia` VALUES (18, '2030-02-23 18:18:41', '商家账号8', '123456', '店铺名称8', '店铺地址8', '联系方式8', '联系人8', '是', '账号不合理', 200, 'upload/yonghu_touxiang8.jpg');

-- ----------------------------
-- Table structure for storeup
-- ----------------------------
DROP TABLE IF EXISTS `storeup`;
CREATE TABLE `storeup`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '商品id',
  `tablename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表名',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `picture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1713046681120 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storeup
-- ----------------------------
INSERT INTO `storeup` VALUES (1705840620838, '2030-02-23 18:18:41', 21, 42, 'tiyuyongpin', '甜品名称2', 'upload/tiyuyongpin_yongpintupian2.jpg', '1', '甜品分类2', NULL);
INSERT INTO `storeup` VALUES (1705840736654, '2030-02-23 18:18:41', 21, 41, 'tiyuyongpin', '甜品名称1', 'upload/tiyuyongpin_yongpintupian1.jpg', '1', '甜品分类1', NULL);
INSERT INTO `storeup` VALUES (1705840740253, '2030-02-23 18:18:41', 21, 45, 'tiyuyongpin', '甜品名称5', 'upload/tiyuyongpin_yongpintupian5.jpg', '1', '甜品分类5', NULL);
INSERT INTO `storeup` VALUES (1705840743604, '2030-02-23 18:18:41', 21, 43, 'tiyuyongpin', '甜品名称3', 'upload/tiyuyongpin_yongpintupian3.jpg', '1', '甜品分类3', NULL);
INSERT INTO `storeup` VALUES (1705840756273, '2030-02-23 18:18:41', 22, 41, 'tiyuyongpin', '甜品名称1', 'upload/tiyuyongpin_yongpintupian1.jpg', '1', '甜品分类1', NULL);
INSERT INTO `storeup` VALUES (1705840759055, '2030-02-23 18:18:41', 22, 46, 'tiyuyongpin', '甜品名称6', 'upload/tiyuyongpin_yongpintupian6.jpg', '1', '甜品分类6', NULL);
INSERT INTO `storeup` VALUES (1705840766081, '2030-02-23 18:18:41', 23, 43, 'tiyuyongpin', '甜品名称3', 'upload/tiyuyongpin_yongpintupian3.jpg', '1', '甜品分类3', NULL);
INSERT INTO `storeup` VALUES (1705840770374, '2030-02-23 18:18:41', 23, 45, 'tiyuyongpin', '甜品名称5', 'upload/tiyuyongpin_yongpintupian5.jpg', '1', '甜品分类5', NULL);
INSERT INTO `storeup` VALUES (1705840781263, '2030-02-23 18:18:41', 24, 44, 'tiyuyongpin', '甜品名称4', 'upload/tiyuyongpin_yongpintupian4.jpg', '1', '甜品分类4', NULL);
INSERT INTO `storeup` VALUES (1705840783385, '2030-02-23 18:18:41', 24, 43, 'tiyuyongpin', '甜品名称3', 'upload/tiyuyongpin_yongpintupian3.jpg', '1', '甜品分类3', NULL);

-- ----------------------------
-- Table structure for systemintro
-- ----------------------------
DROP TABLE IF EXISTS `systemintro`;
CREATE TABLE `systemintro`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `subtitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '副标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `picture1` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片1',
  `picture2` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片2',
  `picture3` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '关于我们' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of systemintro
-- ----------------------------
INSERT INTO `systemintro` VALUES (1, '2030-02-23 18:18:41', '系统简介', 'SYSTEM INTRODUCTION', '当遇到挫折或失败，你是看见失败还是看见机会?挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。', 'upload/systemintro_picture1.jpg', 'upload/systemintro_picture2.jpg', 'upload/xiaochi2.jpeg');

-- ----------------------------
-- Table structure for tiyuyongpin
-- ----------------------------
DROP TABLE IF EXISTS `tiyuyongpin`;
CREATE TABLE `tiyuyongpin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yongpinbianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '甜品编号',
  `yongpinmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '甜品名称',
  `yongpinfenlei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '甜品分类',
  `pinpai` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '口味',
  `yongpintupian` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '甜品图片',
  `shangpinjianjie` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '制作方法',
  `shangjiazhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商家账号',
  `dianpumingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '店铺名称',
  `onelimittimes` int(11) DEFAULT NULL COMMENT '单限',
  `alllimittimes` int(11) DEFAULT NULL COMMENT '库存',
  `clicktime` datetime(0) DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT 0 COMMENT '点击次数',
  `price` float NOT NULL COMMENT '价格',
  `chengfen` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `thumbsupnum` int(11) DEFAULT 0,
  `crazilynum` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yongpinbianhao`(`yongpinbianhao`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '体育甜品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tiyuyongpin
-- ----------------------------
INSERT INTO `tiyuyongpin` VALUES (41, '2030-02-23 18:18:41', '1111111111', '甜品名称1', '蛋糕类', '口味1', 'upload/xiaochi1.jpeg', '制作方法1', '商家账号1', '店铺名称1', 1, 99, '2024-04-14 06:13:21', 12, 99.9, '成分1', 12, 11);
INSERT INTO `tiyuyongpin` VALUES (42, '2030-02-23 18:18:41', '2222222222', '甜品名称2', '甜品类', '口味2', 'upload/xiaochi2.jpeg', '<h1>制作方法2</h1>', '商家账号2', '店铺名称2', 2, 96, '2024-04-14 06:17:59', 34, 99.9, '成分2', 12, 12);
INSERT INTO `tiyuyongpin` VALUES (43, '2030-02-23 18:18:41', '3333333333', '甜品名称3', '烧烤类', '口味3', 'upload/xiaochi3.jpeg', '制作方法3', '商家账号3', '店铺名称3', 3, 99, '2024-02-22 03:36:12', 11, 99.9, '成分3', 13, 13);
INSERT INTO `tiyuyongpin` VALUES (44, '2030-02-23 18:18:41', '4444444444', '甜品名称4', '饼干类', '口味4', 'upload/xiaochi4.jpeg', '制作方法4', '商家账号4', '店铺名称4', 4, 98, '2024-04-14 06:18:05', 10, 99.9, '成分4', 15, 14);
INSERT INTO `tiyuyongpin` VALUES (45, '2030-02-23 18:18:41', '5555555555', '甜品名称5', '面包类', '口味5', 'upload/xiaochi5.jpeg', '制作方法5', '商家账号5', '店铺名称5', 5, 99, '2030-02-23 18:18:41', 7, 99.9, '成分5', 15, 15);
INSERT INTO `tiyuyongpin` VALUES (46, '2030-02-23 18:18:41', '6666666666', '甜品名称6', '巧克力类', '口味6', 'upload/xiaochi6.jpeg', '制作方法6', '商家账号6', '店铺名称6', 6, 99, '2024-04-14 05:56:02', 13, 99.9, '成分6', 16, 16);
INSERT INTO `tiyuyongpin` VALUES (47, '2030-02-23 18:18:41', '7777777777', '甜品名称7', '甜品分类7', '口味7', 'upload/xiaochi7.jpeg', '制作方法7', '商家账号7', '店铺名称7', 7, 99, '2024-02-22 03:01:08', 11, 99.9, '成分7', 17, 17);
INSERT INTO `tiyuyongpin` VALUES (48, '2030-02-23 18:18:41', '8888888888', '甜品名称8', '甜品分类8', '口味8', 'upload/xiaochi8.jpeg', '<p>制作方法8</p>', '商家账号8', '店铺名称8', 8, 99, '2024-04-14 06:19:12', 16, 99.9, '成分8', 18, 18);

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `tablename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表名',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色',
  `token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 1, 'admin', 'users', '管理员', '4heho30oy3qtboo9q5q3uh4w0w8lhutn', '2023-02-23 18:25:31', '2024-04-14 07:18:45');
INSERT INTO `token` VALUES (2, 1677152977279, '111', 'yonghu', '用户', 'u3wv1rczzim6tqnvl71y7xpk03ppi8d8', '2023-02-23 19:49:40', '2023-02-23 20:55:30');
INSERT INTO `token` VALUES (3, 12, '商家账号2', 'shangjia', '商家', 'qlvpw52ymi4hsjloomeuazrhepwbtwlq', '2023-02-23 19:52:11', '2023-02-23 20:52:12');
INSERT INTO `token` VALUES (4, 11, '商家账号1', 'shangjia', '商家', '83oz9hfscnx63kv0aqlesgaij627q3z7', '2024-01-21 17:47:16', '2024-01-21 18:47:16');
INSERT INTO `token` VALUES (5, 11, '商家账号1', 'shangjia', '商户', 'mq9x65z71uzrsuom3zt00zp0y8rnuysu', '2024-01-21 20:20:47', '2024-04-14 07:19:09');
INSERT INTO `token` VALUES (6, 21, '用户账号1', 'yonghu', '用户', '6a4gyyqqlalqq62jwvvqpyy6ls8gi10t', '2024-01-21 20:36:41', '2024-04-14 07:17:44');
INSERT INTO `token` VALUES (7, 22, '用户账号2', 'yonghu', '用户', '59k6p7jnwoo6v2ydfpr0vsbj2z3pr8iz', '2024-01-21 20:39:12', '2024-04-14 07:17:51');
INSERT INTO `token` VALUES (8, 23, '用户账号3', 'yonghu', '用户', '9ie1e76lq1nmnvp46j0i5worxs32nycy', '2024-01-21 20:39:22', '2024-04-14 07:17:55');
INSERT INTO `token` VALUES (9, 24, '用户账号4', 'yonghu', '用户', 'dqp1rd7welhhibo4tdoontlth96ntyd6', '2024-01-21 20:39:36', '2024-04-14 07:17:09');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin', '管理员', '2030-02-23 18:18:41');

-- ----------------------------
-- Table structure for xianshihuodong
-- ----------------------------
DROP TABLE IF EXISTS `xianshihuodong`;
CREATE TABLE `xianshihuodong`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yongpinbianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '甜品编号',
  `yongpinmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '甜品名称',
  `yongpinfenlei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '甜品分类',
  `pinpai` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '口味',
  `yongpintupian` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '甜品图片',
  `shangpinjianjie` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '制作方法',
  `shangjiazhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商家账号',
  `dianpumingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '店铺名称',
  `onelimittimes` int(11) DEFAULT NULL COMMENT '单限',
  `alllimittimes` int(11) DEFAULT NULL COMMENT '库存',
  `reversetime` datetime(0) DEFAULT NULL COMMENT '倒计结束时间',
  `price` float NOT NULL COMMENT '价格',
  `chengfen` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yongpinbianhao`(`yongpinbianhao`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xianshihuodong
-- ----------------------------
INSERT INTO `xianshihuodong` VALUES (51, '2030-02-23 18:18:41', '1111111111', '甜品名称1', '甜品分类1', '口味1', 'upload/xiaochi1.jpeg', '制作方法1', '商家账号1', '店铺名称1', 1, 99, '2030-02-23 18:18:41', 99.9, '成分1');
INSERT INTO `xianshihuodong` VALUES (52, '2030-02-23 18:18:41', '2222222222', '甜品名称2', '甜品分类2', '口味2', 'upload/xiaochi2.jpeg', '制作方法2', '商家账号2', '店铺名称2', 2, 98, '2030-02-23 18:18:41', 99.9, '成分2');
INSERT INTO `xianshihuodong` VALUES (53, '2030-02-23 18:18:41', '3333333333', '甜品名称3', '甜品分类3', '口味3', 'upload/xiaochi3.jpeg', '制作方法3', '商家账号3', '店铺名称3', 3, 99, '2030-02-23 18:18:41', 99.9, '成分3');
INSERT INTO `xianshihuodong` VALUES (54, '2030-02-23 18:18:41', '4444444444', '甜品名称4', '甜品分类4', '口味4', 'upload/xiaochi4.jpeg', '制作方法4', '商家账号4', '店铺名称4', 4, 99, '2030-02-23 18:18:41', 99.9, '成分4');
INSERT INTO `xianshihuodong` VALUES (55, '2030-02-23 18:18:41', '5555555555', '甜品名称5', '甜品分类5', '口味5', 'upload/xiaochi5.jpeg', '制作方法5', '商家账号5', '店铺名称5', 5, 99, '2030-02-23 18:18:41', 99.9, '成分5');
INSERT INTO `xianshihuodong` VALUES (56, '2030-02-23 18:18:41', '6666666666', '甜品名称6', '甜品分类6', '口味6', 'upload/xiaochi6.jpeg', '制作方法6', '商家账号6', '店铺名称6', 6, 99, '2030-02-23 18:18:41', 99.9, '成分6');
INSERT INTO `xianshihuodong` VALUES (57, '2030-02-23 18:18:41', '7777777777', '甜品名称7', '甜品分类7', '口味7', 'upload/xiaochi7.jpeg', '制作方法7', '商家账号7', '店铺名称7', 7, 99, '2030-02-23 18:18:41', 99.9, '成分7');
INSERT INTO `xianshihuodong` VALUES (58, '2030-02-23 18:18:41', '8888888888', '甜品名称8', '甜品分类8', '口味8', 'upload/xiaochi8.jpeg', '制作方法8', '商家账号8', '店铺名称8', 8, 99, '2030-02-23 18:18:41', 99.9, '成分8');

-- ----------------------------
-- Table structure for xiaochifenlei
-- ----------------------------
DROP TABLE IF EXISTS `xiaochifenlei`;
CREATE TABLE `xiaochifenlei`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xiaochifenlei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '小吃分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小吃分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xiaochifenlei
-- ----------------------------
INSERT INTO `xiaochifenlei` VALUES (31, '2030-02-23 18:18:41', '小吃分类1');
INSERT INTO `xiaochifenlei` VALUES (32, '2030-02-23 18:18:41', '小吃分类2');
INSERT INTO `xiaochifenlei` VALUES (33, '2030-02-23 18:18:41', '小吃分类3');
INSERT INTO `xiaochifenlei` VALUES (34, '2030-02-23 18:18:41', '小吃分类4');
INSERT INTO `xiaochifenlei` VALUES (35, '2030-02-23 18:18:41', '小吃分类5');
INSERT INTO `xiaochifenlei` VALUES (36, '2030-02-23 18:18:41', '小吃分类6');
INSERT INTO `xiaochifenlei` VALUES (37, '2030-02-23 18:18:41', '小吃分类7');
INSERT INTO `xiaochifenlei` VALUES (38, '2030-02-23 18:18:41', '小吃分类8');

-- ----------------------------
-- Table structure for xiaochixinxi
-- ----------------------------
DROP TABLE IF EXISTS `xiaochixinxi`;
CREATE TABLE `xiaochixinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xiaochibianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '小吃编号',
  `xiaochimingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '小吃名称',
  `xiaochifenlei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '小吃分类',
  `pinpai` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '品牌',
  `xiaochitupian` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '小吃图片',
  `shangpinjianjie` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '商品简介',
  `shangjiazhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商家账号',
  `dianpumingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '店铺名称',
  `onelimittimes` int(11) DEFAULT NULL COMMENT '单限',
  `alllimittimes` int(11) DEFAULT NULL COMMENT '库存',
  `clicktime` datetime(0) DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT 0 COMMENT '点击次数',
  `price` float NOT NULL COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `xiaochibianhao`(`xiaochibianhao`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '体育小吃' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xiaochixinxi
-- ----------------------------
INSERT INTO `xiaochixinxi` VALUES (41, '2030-02-23 18:18:41', '1111111111', '小吃名称1', '小吃分类1', '品牌1', 'upload/xiaochi1.jpeg', '商品简介1', '商家账号1', '店铺名称1', 1, 99, '2030-02-23 18:18:41', 4, 99.9);
INSERT INTO `xiaochixinxi` VALUES (42, '2030-02-23 18:18:41', '2222222222', '小吃名称2', '小吃分类2', '品牌2', 'upload/xiaochi2.jpeg', '<h1>商品简介2</h1>', '商家账号2', '店铺名称2', 2, 96, '2024-01-21 20:58:16', 16, 99.9);
INSERT INTO `xiaochixinxi` VALUES (43, '2030-02-23 18:18:41', '3333333333', '小吃名称3', '小吃分类3', '品牌3', 'upload/xiaochi3.jpeg', '商品简介3', '商家账号3', '店铺名称3', 3, 99, '2024-01-21 20:58:23', 9, 99.9);
INSERT INTO `xiaochixinxi` VALUES (44, '2030-02-23 18:18:41', '4444444444', '小吃名称4', '小吃分类4', '品牌4', 'upload/xiaochi4.jpeg', '商品简介4', '商家账号4', '店铺名称4', 4, 99, '2030-02-23 18:18:41', 6, 99.9);
INSERT INTO `xiaochixinxi` VALUES (45, '2030-02-23 18:18:41', '5555555555', '小吃名称5', '小吃分类5', '品牌5', 'upload/xiaochi5.jpeg', '商品简介5', '商家账号5', '店铺名称5', 5, 99, '2030-02-23 18:18:41', 7, 99.9);
INSERT INTO `xiaochixinxi` VALUES (46, '2030-02-23 18:18:41', '6666666666', '小吃名称6', '小吃分类6', '品牌6', 'upload/xiaochi6.jpeg', '商品简介6', '商家账号6', '店铺名称6', 6, 99, '2024-01-21 20:55:09', 12, 99.9);
INSERT INTO `xiaochixinxi` VALUES (47, '2030-02-23 18:18:41', '7777777777', '小吃名称7', '小吃分类7', '品牌7', 'upload/xiaochi7.jpeg', '商品简介7', '商家账号7', '店铺名称7', 7, 99, '2024-01-21 20:57:31', 9, 99.9);
INSERT INTO `xiaochixinxi` VALUES (48, '2030-02-23 18:18:41', '8888888888', '小吃名称8', 'A分类', '品牌8', 'upload/xiaochi8.jpeg', '<p>商品简介8</p>', '商家账号8', '店铺名称8', 8, 99, '2024-01-21 20:56:13', 14, 99.9);

-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `mima` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `yonghuxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户姓名',
  `xingbie` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `nianling` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '年龄',
  `touxiang` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '头像',
  `money` float DEFAULT 0 COMMENT '余额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yonghuzhanghao`(`yonghuzhanghao`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1677152977280 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES (21, '2030-02-23 18:18:41', '用户账号1', '1', '用户姓名1', '男', '年龄1', 'upload/yonghu_touxiang1.jpg', 0.2);
INSERT INTO `yonghu` VALUES (22, '2030-02-23 18:18:41', '用户账号2', '1', '用户姓名2', '男', '年龄2', 'upload/yonghu_touxiang2.jpg', 200);
INSERT INTO `yonghu` VALUES (23, '2030-02-23 18:18:41', '用户账号3', '1', '用户姓名3', '男', '年龄3', 'upload/yonghu_touxiang3.jpg', 200);
INSERT INTO `yonghu` VALUES (24, '2030-02-23 18:18:41', '用户账号4', '1', '用户姓名4', '男', '年龄4', 'upload/yonghu_touxiang4.jpg', 200);
INSERT INTO `yonghu` VALUES (25, '2030-02-23 18:18:41', '用户账号5', '1', '用户姓名5', '男', '年龄5', 'upload/yonghu_touxiang5.jpg', 200);
INSERT INTO `yonghu` VALUES (26, '2030-02-23 18:18:41', '用户账号6', '1', '用户姓名6', '男', '年龄6', 'upload/yonghu_touxiang6.jpg', 200);
INSERT INTO `yonghu` VALUES (27, '2030-02-23 18:18:41', '用户账号7', '1', '用户姓名7', '男', '年龄7', 'upload/yonghu_touxiang7.jpg', 200);
INSERT INTO `yonghu` VALUES (28, '2030-02-23 18:18:41', '1', '1', '用户姓名8', '男', '年龄8', 'upload/yonghu_touxiang8.jpg', 200);

-- ----------------------------
-- Table structure for yongpinfenlei
-- ----------------------------
DROP TABLE IF EXISTS `yongpinfenlei`;
CREATE TABLE `yongpinfenlei`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yongpinfenlei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '甜品分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1677153265814 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '甜品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yongpinfenlei
-- ----------------------------
INSERT INTO `yongpinfenlei` VALUES (31, '2030-02-23 18:18:41', '蛋糕类');
INSERT INTO `yongpinfenlei` VALUES (32, '2030-02-23 18:18:41', '甜品类');
INSERT INTO `yongpinfenlei` VALUES (33, '2030-02-23 18:18:41', '烧烤类');
INSERT INTO `yongpinfenlei` VALUES (34, '2030-02-23 18:18:41', '饼干类');
INSERT INTO `yongpinfenlei` VALUES (35, '2030-02-23 18:18:41', '面包类');
INSERT INTO `yongpinfenlei` VALUES (36, '2030-02-23 18:18:41', '巧克力类');
INSERT INTO `yongpinfenlei` VALUES (37, '2030-02-23 18:18:41', '甜品分类7');
INSERT INTO `yongpinfenlei` VALUES (38, '2030-02-23 18:18:41', '甜品分类8');

-- ----------------------------
-- Table structure for zhanneihuodong
-- ----------------------------
DROP TABLE IF EXISTS `zhanneihuodong`;
CREATE TABLE `zhanneihuodong`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '简介',
  `picture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站内活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zhanneihuodong
-- ----------------------------
INSERT INTO `zhanneihuodong` VALUES (111, '2030-02-23 18:18:41', '站内活动1', '站内活动1', 'upload/xiaochi1.jpeg', '<p>不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?</p><p>你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。其实，我已经厌倦了你这样说说而已的把戏，我觉得就算我告诉你如何去做，你也不会照做，因为你根本什么都不做。</p><p>真正有行动力的人不需要别人告诉他如何做，因为他已经在做了。就算碰到问题，他也会自己想办法，自己动手去解决或者主动寻求可以帮助他的人，而不是等着别人为自己解决问题。</p><p>首先要学习独立思考。花一点时间想一下自己喜欢什么，梦想是什么，不要别人说想环游世界，你就说你的梦想是环游世界。</p><p>很多人说现实束缚了自己，其实在这个世界上，我们一直都可以有很多选择，生活的决定权也—直都在自己手上，只是我们缺乏行动力而已。</p><p>如果你觉得安于现状是你想要的，那选择安于现状就会让你幸福和满足;如果你不甘平庸，选择一条改变、进取和奋斗的道路，在这个追求的过程中，你也一样会感到快乐。所谓的成功，即是按照自己想要的生活方式生活。最糟糕的状态，莫过于当你想要选择一条不甘平庸、改变、进取和奋斗的道路时，却以一种安于现状的方式生活，最后抱怨自己没有得到想要的人生。</p><p>因为喜欢，你不是在苦苦坚持，也因为喜欢，你愿意投入时间、精力，长久以往，获得成功就是自然而然的事情。</p>');
INSERT INTO `zhanneihuodong` VALUES (112, '2030-02-23 18:18:41', '站内活动2', '站内活动2', 'upload/xiaochi2.jpeg', '<p>又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。</p><p>过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。一直都是晚会的忠实参与者，无论是台前还是幕后，忽然间，角色转变，那种感觉确实难以用语言表达。</p><p>	过去的三年，总是默默地期盼着这个好雨时节，因为这时候，会有灿烂的阳光，会有满目的百花争艳，会有香甜的冰激凌，这是个毕业的季节，当时不经世事的我们会殷切地期待学校那一大堆的活动，期待穿上绚丽的演出服或者礼仪服，站在大礼堂镁光灯下尽情挥洒我们的澎拜的激情。</p><p>百感交集，隔岸观火与身临其境的感觉竟是如此不同。从来没想过一场晚会送走的是我们自己的时候会是怎样的感情，毕业就真的意味着结束吗?倔强的我们不愿意承认，谢谢学弟学妹们慷慨的将这次的主题定为“我们在这里”。我知道，这可能是他们对我们这些过来人的尊敬和施舍。</p><p>没有为这场晚会排练、奔波，没有为班级、学生会、文学院出点力，还真有点不习惯，百般无奈中，用“工作忙”个万能的借口来搪塞自己，欺骗别人。其实自己心里明白，那只是在逃避，只是不愿面对繁华落幕后的萧条和落寞。大四了，大家各奔东西，想凑齐班上的人真的是难上加难，敏燕从越南回来，刚落地就匆匆回了学校，那么恋家的人也启程回来了，睿睿学姐也是从家赶来跟我们团圆。大家—如既往的寒暄、打趣、调侃对方，似乎一切又回到了当初的单纯美好。</p><p>看着舞台上活泼可爱的学弟学妹们，如同一群机灵的小精灵，清澈的眼神，稚嫩的肢体，轻快地步伐，用他们那热情洋溢的舞姿渲染着在场的每一个人，我知道，我不应该羡慕嫉妒他们，不应该顾自怜惜逝去的青春，不应该感叹夕阳无限好，曾经，我们也拥有过，曾经，我们也年轻过，曾经，我们也灿烂过。我深深地告诉自己，人生的每个阶段都是美的，年轻有年轻的活力，成熟也有成熟的魅力。多—份稳重、淡然、优雅，也是漫漫时光掠影遗留下的.珍贵赏赐。</p>');
INSERT INTO `zhanneihuodong` VALUES (113, '2030-02-23 18:18:41', '站内活动3', '站内活动3', 'upload/xiaochi3.jpeg', '<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>');
INSERT INTO `zhanneihuodong` VALUES (114, '2030-02-23 18:18:41', '站内活动4', '站内活动4', 'upload/xiaochi4.jpeg', '<p>当遇到挫折或失败，你是看见失败还是看见机会?</p><p>挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。</p><p>人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。</p><p>大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。</p><p>	“塞翁失马，焉知非福。”人生的道路，并不是每一步都迈向成功，这就是追求的意义。我们还要认识到一点，挫折作为一种情绪状态和一种个人体验，各人的耐受性是大不相同的，有的人经历了一次次挫折，就能够坚忍不拔，百折不挠;有的人稍遇挫折便意志消沉，一蹶不振。所以，挫折感是一种主观感受，因为人的目的和需要不同，成功标准不同，所以同一种活动对于不同的人可能会造成不同的挫折感受。</p><p>凡事皆以平常心来看待，对于生命顺逆不要太执著。能够“破我执”是很高层的人生境界。</p><p>人事的艰难就是一种考验。就像—支剑要有磨刀来磨，剑才会利:一块璞玉要有粗石来磨，才会发出耀眼的光芒。我们能够做到的，只是如何减少、避免那些由于自身的原因所造成的挫折，而在遇到痛苦和挫折之后，则力求化解痛苦，争取幸福。我们要知道，痛苦和挫折是双重性的，它既是我们人生中难以完全避免的，也是我们在争取成功时，不可缺少的一种动力。因为我认为，推动我们奋斗的力量，不仅仅是对成功的渴望，还有为摆脱痛苦和挫折而进行的奋斗。</p>');
INSERT INTO `zhanneihuodong` VALUES (115, '2030-02-23 18:18:41', '站内活动5', '站内活动5', 'upload/xiaochi5.jpeg', '<p>有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。</p><p>不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。</p><p>	不管你现在是在图书馆里背着怎么也看不进去的英语单词，还是你现在迷茫地看不清未来的方向不知道要往哪走。</p><p>不管你现在是在努力着去实现梦想却没能拉近与梦想的距离，还是你已经慢慢地找不到自己的梦想了。</p><p>你都要去相信，没有到不了的明天。</p><p>	有的时候你的梦想太大，别人说你的梦想根本不可能实现;有的时候你的梦想又太小，又有人说你胸无大志;有的时候你对死党说着将来要去环游世界的梦想，却换来他的不屑一顾，于是你再也不提自己的梦想;有的时候你突然说起将来要开个小店的愿望，却发现你讲述的那个人，并没有听到你在说什么。</p><p>不过又能怎么样呢，未来始终是自己的，梦想始终是自己的，没有人会来帮你实现它。</p><p>也许很多时候我们只是需要朋友的一句鼓励，一句安慰，却也得不到。但是相信我，世界上还有很多人，只是想要和你说说话。</p><p>因为我们都一样。一样的被人说成固执，一样的在追逐他们眼里根本不在意的东西。</p><p>所以，又有什么关系呢，别人始终不是你、不能懂你的心情，你又何必多去解释呢。这个世界会来阻止你，困难也会接踵而至，其实真正关键的只有自己，有没有那个倔强。</p><p>这个世界上没有不带伤的人，真正能治愈自己的，只有自己。</p>');
INSERT INTO `zhanneihuodong` VALUES (116, '2030-02-23 18:18:41', '站内活动6', '站内活动6', 'upload/xiaochi6.jpeg', '<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>');
INSERT INTO `zhanneihuodong` VALUES (117, '2030-02-23 18:18:41', '站内活动7', '站内活动7', 'upload/xiaochi7.jpeg', '<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>');
INSERT INTO `zhanneihuodong` VALUES (118, '2030-02-23 18:18:41', '站内活动8', '站内活动8', 'upload/xiaochi8.jpeg', '<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>');

SET FOREIGN_KEY_CHECKS = 1;
