/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : online_exam

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 26/02/2019 17:09:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biz_comment
-- ----------------------------
DROP TABLE IF EXISTS `biz_comment`;
CREATE TABLE `biz_comment`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sid` int(20) NULL DEFAULT NULL COMMENT '被评论的文章或者页面的ID(-1:留言板)',
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的ID',
  `pid` int(20) UNSIGNED NULL DEFAULT NULL COMMENT '父级评论的id',
  `qq` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的QQ（未登录用户）',
  `nickname` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的昵称（未登录用户）',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的头像地址',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的邮箱地址（未登录用户）',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的网站地址（未登录用户）',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '评论的状态',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的ip',
  `lng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的地址',
  `os` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的系统类型',
  `os_short_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的系统的简称',
  `browser` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的浏览器类型',
  `browser_short_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的浏览器的简称',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论的内容',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注（审核不通过时添加）',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持（赞）',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对（踩）',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of biz_comment
-- ----------------------------
INSERT INTO `biz_comment` VALUES (1, 1, NULL, NULL, '523179414', '郑其锋', 'http://q1.qlogo.cn/g?b=qq&nk=523179414&s=100', '', NULL, 1, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>测试评论</p>', NULL, 0, 0, '2018-09-13 23:30:56', '2018-09-13 23:30:56');
INSERT INTO `biz_comment` VALUES (2, 1, '1', 1, NULL, '郑其锋', 'http://cdn.nbclass.com/blog/img/person.jpg', '888@qq.com', NULL, 1, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>测试回复评论~</p>\r\n', NULL, 0, 0, '2018-09-13 23:31:37', '2018-09-13 23:31:37');
INSERT INTO `biz_comment` VALUES (3, 1, NULL, NULL, '123456', '腾讯视频', 'http://q1.qlogo.cn/g?b=qq&nk=123456&s=100', '', NULL, 1, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>第三方</p>', NULL, 0, 0, '2018-09-20 00:52:21', '2018-09-20 00:52:21');
INSERT INTO `biz_comment` VALUES (4, -1, NULL, NULL, '12345678', '腾讯视频', 'http://q1.qlogo.cn/g?b=qq&nk=12345678&s=100', '', NULL, 0, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>士大夫</p>', NULL, 0, 0, '2018-09-20 00:52:37', '2018-09-20 00:52:37');

-- ----------------------------
-- Table structure for biz_link
-- ----------------------------
DROP TABLE IF EXISTS `biz_link`;
CREATE TABLE `biz_link`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接名',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接地址',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接介绍',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友链图片地址',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友链站长邮箱',
  `qq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友链站长qq',
  `status` int(1) UNSIGNED NULL DEFAULT NULL COMMENT '状态',
  `origin` int(1) NULL DEFAULT NULL COMMENT '1-管理员添加 2-自助申请',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of biz_link
-- ----------------------------
INSERT INTO `biz_link` VALUES (1, '宁夏理工学院', 'http://www.nxist.com/views/font/homepage.form', '宁夏理工学院官网', '', '', '', 1, 1, '', '2018-09-13 23:24:25', '2019-02-26 11:46:17');
INSERT INTO `biz_link` VALUES (2, '百度', 'www.baidu.com', '百度网站', '', '', '', 1, 1, '', '2019-01-17 09:51:44', '2019-01-17 09:51:44');

-- ----------------------------
-- Table structure for biz_site_info
-- ----------------------------
DROP TABLE IF EXISTS `biz_site_info`;
CREATE TABLE `biz_site_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_site_info
-- ----------------------------
INSERT INTO `biz_site_info` VALUES (1, 'OnlineExam | 在线考试系统', '95后少年，热爱写bug，热爱编程，热爱学习，分享一些个人项目经验，共同学习，少走弯路。Just do it！', 'http://cdn.nbclass.com/blog/img/person.jpg', '2018-11-22 22:13:26', '2019-11-22 22:13:29');

-- ----------------------------
-- Table structure for biz_tags
-- ----------------------------
DROP TABLE IF EXISTS `biz_tags`;
CREATE TABLE `biz_tags`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书签名',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of biz_tags
-- ----------------------------
INSERT INTO `biz_tags` VALUES (1, 'Linux', '111', '2018-01-14 21:35:31', '2018-07-25 18:53:34');
INSERT INTO `biz_tags` VALUES (2, 'Java', '222', '2018-01-14 21:35:45', '2018-07-25 18:53:38');
INSERT INTO `biz_tags` VALUES (3, 'Spring', NULL, '2018-01-14 21:35:52', '2018-01-14 21:35:52');
INSERT INTO `biz_tags` VALUES (4, 'Spring Boot', NULL, '2018-01-14 21:36:01', '2018-01-14 21:36:01');
INSERT INTO `biz_tags` VALUES (5, '其他', '其他', '2018-07-25 18:55:06', '2018-07-25 18:55:06');

-- ----------------------------
-- Table structure for exam_question
-- ----------------------------
DROP TABLE IF EXISTS `exam_question`;
CREATE TABLE `exam_question`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) UNSIGNED NOT NULL COMMENT '考试ID',
  `question_id` int(11) UNSIGNED NOT NULL COMMENT '考题ID',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam_question
-- ----------------------------
INSERT INTO `exam_question` VALUES (1, 8, 6, '2019-02-15 13:20:24', '2019-02-15 13:20:24');
INSERT INTO `exam_question` VALUES (2, 8, 7, '2019-02-15 13:20:24', '2019-02-15 13:20:24');
INSERT INTO `exam_question` VALUES (3, 8, 8, '2019-02-15 13:20:24', '2019-02-15 13:20:24');
INSERT INTO `exam_question` VALUES (4, 8, 9, '2019-02-15 13:20:24', '2019-02-15 13:20:24');
INSERT INTO `exam_question` VALUES (5, 8, 10, '2019-02-15 13:20:24', '2019-02-15 13:20:24');
INSERT INTO `exam_question` VALUES (6, 8, 11, '2019-02-15 13:20:24', '2019-02-15 13:20:24');
INSERT INTO `exam_question` VALUES (7, 8, 12, '2019-02-15 13:20:24', '2019-02-15 13:20:24');
INSERT INTO `exam_question` VALUES (8, 8, 13, '2019-02-15 13:20:24', '2019-02-15 13:20:24');
INSERT INTO `exam_question` VALUES (9, 8, 14, '2019-02-15 13:20:24', '2019-02-15 13:20:24');
INSERT INTO `exam_question` VALUES (10, 8, 18, '2019-02-15 13:20:24', '2019-02-15 13:20:24');
INSERT INTO `exam_question` VALUES (30, 12, 15, '2019-02-19 09:58:44', '2019-02-19 09:58:44');
INSERT INTO `exam_question` VALUES (31, 12, 16, '2019-02-19 09:58:44', '2019-02-19 09:58:44');
INSERT INTO `exam_question` VALUES (32, 12, 17, '2019-02-19 09:58:44', '2019-02-19 09:58:44');
INSERT INTO `exam_question` VALUES (33, 13, 8, '2019-02-21 15:04:18', '2019-02-21 15:04:18');
INSERT INTO `exam_question` VALUES (34, 13, 9, '2019-02-21 15:04:18', '2019-02-21 15:04:18');
INSERT INTO `exam_question` VALUES (35, 13, 10, '2019-02-21 15:04:18', '2019-02-21 15:04:18');
INSERT INTO `exam_question` VALUES (36, 14, 6, '2019-02-21 15:04:56', '2019-02-21 15:04:56');
INSERT INTO `exam_question` VALUES (37, 15, 6, '2019-02-21 15:05:10', '2019-02-21 15:05:10');
INSERT INTO `exam_question` VALUES (38, 15, 10, '2019-02-21 15:05:10', '2019-02-21 15:05:10');
INSERT INTO `exam_question` VALUES (39, 16, 6, '2019-02-21 15:05:29', '2019-02-21 15:05:29');
INSERT INTO `exam_question` VALUES (40, 16, 10, '2019-02-21 15:05:29', '2019-02-21 15:05:29');
INSERT INTO `exam_question` VALUES (41, 16, 18, '2019-02-21 15:05:29', '2019-02-21 15:05:29');
INSERT INTO `exam_question` VALUES (42, 17, 6, '2019-02-21 15:05:46', '2019-02-21 15:05:46');
INSERT INTO `exam_question` VALUES (43, 17, 10, '2019-02-21 15:05:46', '2019-02-21 15:05:46');
INSERT INTO `exam_question` VALUES (44, 17, 18, '2019-02-21 15:05:46', '2019-02-21 15:05:46');
INSERT INTO `exam_question` VALUES (45, 17, 7, '2019-02-21 15:05:46', '2019-02-21 15:05:46');
INSERT INTO `exam_question` VALUES (46, 17, 8, '2019-02-21 15:05:46', '2019-02-21 15:05:46');
INSERT INTO `exam_question` VALUES (47, 18, 18, '2019-02-21 15:06:34', '2019-02-21 15:06:34');
INSERT INTO `exam_question` VALUES (48, 18, 15, '2019-02-21 15:06:34', '2019-02-21 15:06:34');
INSERT INTO `exam_question` VALUES (49, 18, 16, '2019-02-21 15:06:34', '2019-02-21 15:06:34');
INSERT INTO `exam_question` VALUES (50, 18, 17, '2019-02-21 15:06:34', '2019-02-21 15:06:34');
INSERT INTO `exam_question` VALUES (51, 19, 18, '2019-02-21 15:06:50', '2019-02-21 15:06:50');
INSERT INTO `exam_question` VALUES (52, 19, 15, '2019-02-21 15:06:50', '2019-02-21 15:06:50');
INSERT INTO `exam_question` VALUES (53, 19, 17, '2019-02-21 15:06:50', '2019-02-21 15:06:50');
INSERT INTO `exam_question` VALUES (54, 20, 18, '2019-02-21 15:07:49', '2019-02-21 15:07:49');
INSERT INTO `exam_question` VALUES (55, 20, 15, '2019-02-21 15:07:49', '2019-02-21 15:07:49');
INSERT INTO `exam_question` VALUES (56, 20, 16, '2019-02-21 15:07:49', '2019-02-21 15:07:49');
INSERT INTO `exam_question` VALUES (57, 20, 17, '2019-02-21 15:07:49', '2019-02-21 15:07:49');
INSERT INTO `exam_question` VALUES (58, 21, 18, '2019-02-21 15:08:03', '2019-02-21 15:08:03');
INSERT INTO `exam_question` VALUES (59, 21, 15, '2019-02-21 15:08:03', '2019-02-21 15:08:03');
INSERT INTO `exam_question` VALUES (60, 21, 16, '2019-02-21 15:08:03', '2019-02-21 15:08:03');
INSERT INTO `exam_question` VALUES (61, 21, 17, '2019-02-21 15:08:03', '2019-02-21 15:08:03');
INSERT INTO `exam_question` VALUES (62, 21, 14, '2019-02-21 15:08:03', '2019-02-21 15:08:03');
INSERT INTO `exam_question` VALUES (68, 23, 6, '2019-02-22 10:30:06', '2019-02-22 10:30:06');
INSERT INTO `exam_question` VALUES (69, 23, 7, '2019-02-22 10:30:06', '2019-02-22 10:30:06');
INSERT INTO `exam_question` VALUES (80, 22, 18, '2019-02-25 14:56:06', '2019-02-25 14:56:06');
INSERT INTO `exam_question` VALUES (81, 22, 16, '2019-02-25 14:56:06', '2019-02-25 14:56:06');
INSERT INTO `exam_question` VALUES (82, 22, 17, '2019-02-25 14:56:06', '2019-02-25 14:56:06');
INSERT INTO `exam_question` VALUES (83, 22, 8, '2019-02-25 14:56:06', '2019-02-25 14:56:06');
INSERT INTO `exam_question` VALUES (84, 22, 14, '2019-02-25 14:56:06', '2019-02-25 14:56:06');

-- ----------------------------
-- Table structure for examination
-- ----------------------------
DROP TABLE IF EXISTS `examination`;
CREATE TABLE `examination`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '考试标题',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
  `total_score` int(8) NULL DEFAULT NULL COMMENT '考试总分',
  `subject_id` int(8) NULL DEFAULT NULL COMMENT '学科ID',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '考试开始时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '考试结束时间',
  `status` int(8) NULL DEFAULT 0 COMMENT '进行状态:0表示未开始,1表示进行中,2表示考试已经结束,3表示该考试已经完成批卷',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examination
-- ----------------------------
INSERT INTO `examination` VALUES (8, 'C语言程序设计期末考试', '1', '超级管理员', 60, 1, '2019-02-15 13:20:18', '2019-02-22 11:01:29', '2019-02-15 13:17:20', '2019-02-15 13:17:22', 2);
INSERT INTO `examination` VALUES (12, 'Java语言程序设计期末考试', '1', '超级管理员', 20, 4, '2019-02-19 09:58:44', '2019-02-22 11:01:35', '2019-02-19 09:58:34', '2019-02-19 09:58:35', 2);
INSERT INTO `examination` VALUES (13, '测试', '1', '超级管理员', 15, 1, '2019-02-21 15:04:18', '2019-02-22 11:01:37', '2019-02-21 15:04:10', '2019-02-21 15:04:12', 2);
INSERT INTO `examination` VALUES (14, 'C语言程序设计期末考试', '1', '超级管理员', 5, 1, '2019-02-21 15:04:56', '2019-02-22 11:01:41', '2019-02-21 15:04:47', '2019-02-21 15:04:48', 2);
INSERT INTO `examination` VALUES (15, '测试', '1', '超级管理员', 10, 1, '2019-02-21 15:05:10', '2019-02-22 11:01:43', '2019-02-21 15:05:01', '2019-02-21 15:05:03', 2);
INSERT INTO `examination` VALUES (16, 'C语言程序设计期末考试', '1', '超级管理员', 15, 1, '2019-02-21 15:05:29', '2019-02-22 11:01:45', '2019-02-21 15:05:21', '2019-02-21 15:05:22', 2);
INSERT INTO `examination` VALUES (17, 'C语言程序设计期末考试', '1', '超级管理员', 25, 1, '2019-02-21 15:05:46', '2019-02-22 11:01:46', '2019-02-21 15:05:41', '2019-02-21 15:05:43', 2);
INSERT INTO `examination` VALUES (18, '测试', '1', '超级管理员', 20, 4, '2019-02-21 15:06:34', '2019-02-22 11:01:48', '2019-02-21 15:06:30', '2019-02-21 15:06:31', 2);
INSERT INTO `examination` VALUES (19, '测试', '1', '超级管理员', 15, 4, '2019-02-21 15:06:50', '2019-02-22 11:01:49', '2019-02-21 15:06:45', '2019-02-21 15:06:47', 2);
INSERT INTO `examination` VALUES (20, '测试', '1', '超级管理员', 20, 4, '2019-02-21 15:07:49', '2019-02-22 11:01:51', '2019-02-21 15:07:27', '2019-02-21 15:07:28', 2);
INSERT INTO `examination` VALUES (21, '测试', '1', '超级管理员', 30, 1, '2019-02-21 15:08:03', '2019-02-26 13:55:04', '2019-02-26 13:55:00', '2019-02-28 11:00:00', 1);
INSERT INTO `examination` VALUES (22, 'C语言程序设计期末考试', '1', '超级管理员', 30, 1, '2019-02-21 15:09:12', '2019-02-26 14:00:00', '2019-02-26 14:00:00', '2019-02-26 17:00:00', 1);

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '考生主键ID',
  `exam_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '考试主键ID',
  `result` int(8) NULL DEFAULT 0 COMMENT '最终分数',
  `auto_result` int(8) NULL DEFAULT 0 COMMENT '电脑自动评判选择题分数',
  `manul_result` int(8) NULL DEFAULT NULL COMMENT '人工手动评判分数',
  `answer_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '考试作答答案json',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '考试交卷时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '改卷完成时间',
  `status` int(8) NULL DEFAULT 0 COMMENT '0表示已交卷但是未评卷,1表示已交卷已评卷',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限描述',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限访问路径',
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级权限id',
  `type` int(1) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `order_num` int(3) NULL DEFAULT 0 COMMENT '排序',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `status` int(1) NOT NULL COMMENT '状态：1有效；2删除',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '1', '管理首页', '工作台', '/workdest', 'workdest', 0, 1, 1, 'fa fa-windows', 1, '2017-09-27 21:22:02', '2019-01-31 15:35:17');
INSERT INTO `permission` VALUES (2, '2', '权限管理', '权限管理', NULL, NULL, 0, 0, 4, 'fa fa-sitemap', 1, '2017-07-13 15:04:42', '2019-01-31 14:12:29');
INSERT INTO `permission` VALUES (3, '201', '用户管理', '用户管理', '/users', 'users', 2, 1, 1, 'fa fa-circle-o', 1, '2017-07-13 15:05:47', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (4, '20101', '列表查询', '用户列表查询', '/user/list', 'user:list', 3, 2, 0, NULL, 1, '2017-07-13 15:09:24', '2017-10-09 05:38:29');
INSERT INTO `permission` VALUES (5, '20102', '新增', '新增用户', '/user/add', 'user:add', 3, 2, 0, NULL, 1, '2017-07-13 15:06:50', '2018-02-28 17:58:46');
INSERT INTO `permission` VALUES (6, '20103', '编辑', '编辑用户', '/user/edit', 'user:edit', 3, 2, 0, NULL, 1, '2017-07-13 15:08:03', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (7, '20104', '删除', '删除用户', '/user/delete', 'user:delete', 3, 2, 0, NULL, 1, '2017-07-13 15:08:42', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (8, '20105', '批量删除', '批量删除用户', '/user/batch/delete', 'user:batchDelete', 3, 2, 0, '', 1, '2018-07-11 01:53:09', '2018-07-11 01:53:09');
INSERT INTO `permission` VALUES (9, '20106', '分配角色', '分配角色', '/user/assign/role', 'user:assignRole', 3, 2, 0, NULL, 1, '2017-07-13 15:09:24', '2017-10-09 05:38:29');
INSERT INTO `permission` VALUES (10, '202', '角色管理', '角色管理', '/roles', 'roles', 2, 1, 2, 'fa fa-circle-o', 1, '2017-07-17 14:39:09', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (11, '20201', '列表查询', '角色列表查询', '/role/list', 'role:list', 10, 2, 0, NULL, 1, '2017-10-10 15:31:36', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (12, '20202', '新增', '新增角色', '/role/add', 'role:add', 10, 2, 0, NULL, 1, '2017-07-17 14:39:46', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (13, '20203', '编辑', '编辑角色', '/role/edit', 'role:edit', 10, 2, 0, NULL, 1, '2017-07-17 14:40:15', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (14, '20204', '删除', '删除角色', '/role/delete', 'role:delete', 10, 2, 0, NULL, 1, '2017-07-17 14:40:57', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (15, '20205', '批量删除', '批量删除角色', '/role/batch/delete', 'role:batchDelete', 10, 2, 0, '', 1, '2018-07-10 22:20:43', '2018-07-10 22:20:43');
INSERT INTO `permission` VALUES (16, '20206', '分配权限', '分配权限', '/role/assign/permission', 'role:assignPerms', 10, 2, 0, NULL, 1, '2017-09-26 07:33:05', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (17, '203', '资源管理', '资源管理', '/permissions', 'permissions', 2, 1, 3, 'fa fa-circle-o', 1, '2017-09-26 07:33:51', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (18, '20301', '列表查询', '资源列表', '/permission/list', 'permission:list', 17, 2, 0, NULL, 1, '2018-07-12 16:25:28', '2018-07-12 16:25:33');
INSERT INTO `permission` VALUES (19, '20302', '新增', '新增资源', '/permission/add', 'permission:add', 17, 2, 0, NULL, 1, '2017-09-26 08:06:58', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (20, '20303', '编辑', '编辑资源', '/permission/edit', 'permission:edit', 17, 2, 0, NULL, 1, '2017-09-27 21:29:04', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (21, '20304', '删除', '删除资源', '/permission/delete', 'permission:delete', 17, 2, 0, NULL, 1, '2017-09-27 21:29:50', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (22, '3', '运维管理', '运维管理', NULL, NULL, 0, 0, 7, 'fa  fa-database', 1, '2018-07-06 15:19:26', '2019-01-31 14:09:33');
INSERT INTO `permission` VALUES (23, '301', '数据监控', '数据监控', '/database/monitoring', 'database', 22, 1, 1, 'fa fa-circle-o', 1, '2018-07-06 15:19:55', '2018-07-06 15:19:55');
INSERT INTO `permission` VALUES (24, '4', '系统管理', '系统管理', NULL, NULL, 0, 0, 5, 'fa  fa-users', 1, '2018-07-06 15:20:38', '2019-01-31 14:13:27');
INSERT INTO `permission` VALUES (25, '401', '在线用户', '在线用户', '/online/users', 'onlineUsers', 24, 1, 1, 'fa fa-circle-o', 1, '2018-07-06 15:21:00', '2018-07-24 14:58:22');
INSERT INTO `permission` VALUES (32, '1000001992372345', '在线用户查询', '在线用户查询', '/online/user/list', 'onlineUser:list', 25, 2, 0, '', 1, '2018-07-24 15:02:23', '2018-07-24 15:02:23');
INSERT INTO `permission` VALUES (33, '1000002083579304', '踢出用户', '踢出用户', '/online/user/kickout', 'onlineUser:kickout', 25, 2, 0, '', 1, '2018-07-24 15:03:16', '2018-07-24 15:03:16');
INSERT INTO `permission` VALUES (34, '1000000171409776', '批量踢出', '批量踢出', '/online/user/batch/kickout', 'onlineUser:batchKickout', 25, 2, 0, '', 1, '2018-07-24 15:04:09', '2018-07-24 15:04:09');
INSERT INTO `permission` VALUES (35, '1000000863853891', '网站管理', '网站管理', NULL, NULL, 0, 0, 3, 'fa fa-coffee', 1, '2018-07-24 15:44:23', '2019-01-31 14:10:30');
INSERT INTO `permission` VALUES (36, '1000001264798222', '基础信息', '基础设置', '/siteinfo', 'siteinfo', 35, 1, 1, 'fa fa-circle-o', 1, '2018-07-24 15:48:13', '2018-07-24 17:43:39');
INSERT INTO `permission` VALUES (37, '1000000432183856', '保存', '基础设置-保存', '/siteinfo/save', 'siteinfo:save', 36, 2, 0, '', 1, '2018-07-24 15:49:12', '2018-07-24 15:49:12');
INSERT INTO `permission` VALUES (38, '1000001792841328', '系统公告', '系统公告', '/notifies', 'notifies', 35, 1, 2, 'fa fa-circle-o', 0, '2018-07-24 23:40:45', '2018-09-13 12:34:18');
INSERT INTO `permission` VALUES (39, '1000001351219537', '查询', '系统公告-查询', '/notify/list', 'notify:list', 38, 2, 0, '', 0, '2018-07-24 23:41:30', '2018-09-13 12:33:19');
INSERT INTO `permission` VALUES (40, '1000000791685519', '新增', '系统公告-新增', '/notify/add', 'notify:add', 38, 2, 0, '', 0, '2018-07-24 23:42:20', '2018-09-13 12:33:26');
INSERT INTO `permission` VALUES (42, '1000001531648485', '编辑', '系统公告-编辑', '/notify/edit', 'notify:edit', 38, 2, 0, '', 0, '2018-07-24 23:44:39', '2018-09-13 12:33:52');
INSERT INTO `permission` VALUES (43, '1000001548165826', '删除', '系统公告-删除', '/notify/delete', 'notify:delete', 38, 2, 0, '', 0, '2018-07-24 23:45:27', '2018-09-13 12:33:57');
INSERT INTO `permission` VALUES (44, '1000001530229707', '批量删除', '批量删除公告', '/notify/batch/delete', 'notify:batchDelete', 38, 2, 0, '', 0, '2018-07-24 23:46:25', '2018-09-13 12:34:02');
INSERT INTO `permission` VALUES (45, '1000000237721285', '友链管理', '友情链接', '/links', 'links', 35, 1, 3, 'fa fa-circle-o', 1, '2018-07-25 11:05:49', '2018-07-25 11:07:03');
INSERT INTO `permission` VALUES (46, '1000001238193773', '查询', '友链-查询', '/link/list', 'link:list', 45, 2, 0, '', 1, '2018-07-25 11:06:44', '2018-07-25 11:06:44');
INSERT INTO `permission` VALUES (47, '1000001305005793', '新增', '友链-新增', '/link/add', 'link:add', 45, 2, 0, '', 1, '2018-07-25 11:07:46', '2018-07-25 11:07:46');
INSERT INTO `permission` VALUES (48, '1000001679037501', '编辑', '友链-编辑', '/link/edit', 'link:edit', 45, 2, 0, '', 1, '2018-07-25 11:08:21', '2018-07-25 11:08:21');
INSERT INTO `permission` VALUES (49, '1000001011730177', '删除', '友链-删除', '/link/delete', 'link:delete', 45, 2, 0, '', 1, '2018-07-25 11:08:53', '2018-07-25 11:08:53');
INSERT INTO `permission` VALUES (50, '1000001312374743', '批量删除', '友链-批量删除', '/link/batch/delete', 'link:batchDelete', 45, 2, 0, '', 1, '2018-07-25 11:09:40', '2018-07-25 11:09:40');
INSERT INTO `permission` VALUES (51, '1000001507480127', '审核', '友链-审核', '/link/audit', 'link:audit', 45, 2, 0, '', 1, '2018-07-25 11:42:28', '2018-07-25 11:42:28');
INSERT INTO `permission` VALUES (52, '1000000602555213', '考试管理', '考试管理', NULL, NULL, 0, 0, 2, 'fa fa-institution', 1, '2018-07-25 17:43:12', '2019-01-31 14:08:52');
INSERT INTO `permission` VALUES (59, '1000000976625379', '标签管理', '标签管理', '/tags', 'tags', 52, 1, 5, 'fa fa-circle-o', 1, '2018-07-25 18:50:47', '2019-02-19 10:18:34');
INSERT INTO `permission` VALUES (60, '1000002127467055', '查询', '查询标签列表', '/tag/list', 'tag:list', 59, 2, 0, '', 1, '2018-07-25 18:51:20', '2018-07-25 18:51:20');
INSERT INTO `permission` VALUES (61, '1000001458372033', '新增', '新增标签', '/tag/add', 'tag:add', 59, 2, 0, '', 1, '2018-07-25 18:51:42', '2018-07-25 18:51:42');
INSERT INTO `permission` VALUES (62, '1000001832967209', '编辑', '编辑标签', '/tag/edit', 'tag:edit', 59, 2, 0, '', 1, '2018-07-25 18:52:17', '2018-07-25 18:52:17');
INSERT INTO `permission` VALUES (63, '1000000754923037', '删除', '删除标签', '/tag/delete', 'tag:delete', 59, 2, 0, '', 1, '2018-07-25 18:52:40', '2018-07-25 18:52:40');
INSERT INTO `permission` VALUES (64, '1000000759248744', '批量删除', '批量删除标签', '/tag/batch/delete', 'tag:batchDelete', 59, 2, 0, '', 1, '2018-07-25 18:53:14', '2018-07-25 18:53:14');
INSERT INTO `permission` VALUES (72, '1000000224901858', '评论管理', '评论管理', '/comments', 'comments', 35, 1, 4, 'fa fa-circle-o', 1, '2018-08-10 09:44:41', '2018-09-19 15:44:13');
INSERT INTO `permission` VALUES (73, '1000001579533936', '查询', '查询', '/comment/list', 'comment:list', 72, 2, 0, '', 1, '2018-08-10 09:46:54', '2018-08-10 09:46:54');
INSERT INTO `permission` VALUES (74, '1000000663968031', '审核', '审核评论', '/comment/audit', 'comment:audit', 72, 2, 0, '', 1, '2018-08-10 09:57:11', '2018-08-10 09:57:11');
INSERT INTO `permission` VALUES (75, '1000000322655547', '回复', '回复评论', '/comment/reply', 'comment:audit', 72, 2, 0, '', 1, '2018-08-10 10:04:28', '2018-08-10 10:04:28');
INSERT INTO `permission` VALUES (76, '1000001419287014', '删除', '删除评论', '/comment/delete', 'comment:delete', 72, 2, 0, '', 1, '2018-08-10 10:06:27', '2018-08-10 10:06:27');
INSERT INTO `permission` VALUES (77, '1000002075182223', '批量删除', '批量删除评论', '/comment/batch/delete', 'comment:batchDelete', 72, 2, 0, '', 1, '2018-08-10 10:07:57', '2018-08-10 10:07:57');
INSERT INTO `permission` VALUES (78, '1000000587822241', '上传管理', '上传管理', NULL, NULL, 0, 0, 6, 'fa fa-upload', 1, '2018-09-12 17:08:41', '2019-01-31 14:15:01');
INSERT INTO `permission` VALUES (79, '1000000493635111', '云存储配置', '云存储配置', '/upload/config', 'upload:config', 78, 1, 1, 'fa fa-circle-o', 1, '2018-09-12 17:10:09', '2018-09-12 17:10:09');
INSERT INTO `permission` VALUES (80, '1000000318760332', '保存', '保存云存储配置', '/upload/saveConfig', 'upload:saveConfig', 79, 2, 0, '', 1, '2018-09-12 17:10:42', '2018-09-12 17:10:42');
INSERT INTO `permission` VALUES (89, '1000002036511171', '课程管理', '课程管理', '/subjects', 'subjects', 52, 1, 3, 'fa fa-circle-o', 1, '2019-01-17 13:34:57', '2019-02-19 10:18:10');
INSERT INTO `permission` VALUES (90, '1000002022858347', '新增', '新增课程', '/subject/add', 'subject:add', 89, 2, 0, '', 1, '2019-01-17 14:46:13', '2019-01-17 14:46:13');
INSERT INTO `permission` VALUES (91, '1000000411587667', '编辑', '编辑按钮', '/subject/edit', 'subject:edit', 89, 2, 0, '', 1, '2019-01-18 09:50:56', '2019-01-18 09:50:56');
INSERT INTO `permission` VALUES (92, '1000000399537883', '删除', '删除按钮', '/subject/delete', 'subject:delete', 89, 2, 0, '', 1, '2019-01-18 09:51:33', '2019-01-18 09:51:33');
INSERT INTO `permission` VALUES (93, '1000000250053894', '批量删除', '批量删除按钮', '/subject/batchDelete', 'subject:batchDelete', 89, 2, 0, '', 0, '2019-01-18 10:42:05', '2019-01-18 11:23:46');
INSERT INTO `permission` VALUES (94, '1000002145951096', '题库管理', '题库管理菜单', '/questions', 'questions', 52, 1, 4, 'fa fa-circle-o', 1, '2019-01-18 15:31:50', '2019-02-19 10:18:26');
INSERT INTO `permission` VALUES (95, '1000000776375556', '查询', '查询按钮', '/question/list', 'question:list', 94, 2, 0, '', 1, '2019-01-18 15:36:05', '2019-01-18 15:36:05');
INSERT INTO `permission` VALUES (96, '1000000307777615', '新增', '新增按钮', '/question/add', 'question:add', 94, 2, 0, '', 1, '2019-01-18 15:36:59', '2019-01-18 15:36:59');
INSERT INTO `permission` VALUES (97, '1000000428056556', '删除', '删除按钮', '/question/delete', 'question:delete', 94, 2, 0, '', 1, '2019-01-23 09:57:26', '2019-01-23 09:57:26');
INSERT INTO `permission` VALUES (98, '1000000976279608', '批量删除', '批量删除按钮', '/question/batch/delete', 'question:batchDelete', 94, 2, 0, '', 1, '2019-01-23 09:58:53', '2019-01-23 09:58:53');
INSERT INTO `permission` VALUES (99, '1000001644855070', '编辑', '编辑按钮', '/question/edit', 'question:edit', 94, 2, 0, '', 1, '2019-01-23 14:37:13', '2019-01-23 14:37:13');
INSERT INTO `permission` VALUES (100, '1000001202958412', '考试列表', '考试列表菜单', '/exams', 'exams', 52, 1, 2, 'fa fa-circle-o', 1, '2019-01-24 15:02:31', '2019-02-21 16:21:45');
INSERT INTO `permission` VALUES (101, '1000000163374336', '查询', '查询按钮', '/exam/list', 'exam:list', 100, 2, 0, NULL, 1, '2019-01-24 15:18:21', '2019-02-21 16:36:42');
INSERT INTO `permission` VALUES (102, '1000001792019422', '发布考试', '发布考试按钮', '/exam/add', 'exam:add', 100, 2, 0, NULL, 0, '2019-01-24 16:25:18', '2019-01-30 14:54:31');
INSERT INTO `permission` VALUES (103, '1000000946860898', '发布考试', '发布考试按钮', '/exam/add', 'exam:add', 100, 2, 0, NULL, 1, '2019-01-30 14:55:36', '2019-02-21 16:36:52');
INSERT INTO `permission` VALUES (104, '1000000695457216', '查询题目', '导入题目', '/question/listQuestion', 'question:listQuestion', 100, 2, 0, '', 0, '2019-02-14 15:34:20', '2019-02-15 09:34:21');
INSERT INTO `permission` VALUES (105, '1000001125494823', '发布考试', '发起考试菜单', '/exam/add', 'exam:add', 52, 1, 1, 'fa fa-circle-o', 1, '2019-02-15 14:31:28', '2019-02-21 16:36:31');
INSERT INTO `permission` VALUES (106, '1000000249577272', '编辑', '编辑按钮', '/exam/edit', 'exam:edit', 100, 2, 0, NULL, 1, '2019-02-18 13:39:40', '2019-02-21 16:37:07');
INSERT INTO `permission` VALUES (107, '1000000894058396', '删除', '删除按钮', '/exam/delete', 'exam:delete', 100, 2, 0, NULL, 1, '2019-02-19 09:21:29', '2019-02-21 16:37:17');
INSERT INTO `permission` VALUES (108, '1000002132243773', '批量删除', '批量删除', '/exam/batch/delete', 'exam:batchDelete', 100, 2, 0, NULL, 1, '2019-02-19 09:22:28', '2019-02-21 16:37:28');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '题目标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '题目内容',
  `question_type` int(8) NULL DEFAULT NULL COMMENT '题目类型,0表示单项选择题,1表示多项选择题,2表示问答题,3表示编程题',
  `option_a` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '选项A',
  `option_b` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '选项B',
  `option_c` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '选项C',
  `option_d` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '选项D',
  `option_e` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '选项E',
  `option_f` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '选项F',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '答案',
  `parse` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '答案解析',
  `score` int(8) NULL DEFAULT NULL COMMENT '题目分值',
  `difficulty` int(8) NULL DEFAULT 1 COMMENT '题目难度',
  `subject_id` int(8) NULL DEFAULT NULL COMMENT '学科ID',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `status` int(8) NULL DEFAULT 1 COMMENT '0表示未考试题目,1表示已考试题目',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (6, 'C语言中，函数值类型的定义可以缺省，此时函数值的隐含类型是（　　）。', '<p>无</p>\r\n', 0, 'void', ' int', 'float', 'double', NULL, NULL, 'B', '无解析', 5, 1, 1, '2019-01-24 16:30:14', '2019-01-28 16:01:05', 1);
INSERT INTO `question` VALUES (7, '关于野指针，下面说法错误的是（  ）。', '<p>无</p>\r\n', 0, '野指针指可能指向非法的内存地址。', '野指针有时也可能指向合法的内存地址。', '野指针都是由指针未初始化导致的。', '对野指针的访问，可能会导致程序异常。', NULL, NULL, 'C', '无解析', 5, 2, 1, '2019-01-24 16:31:48', '2019-01-24 16:31:48', 0);
INSERT INTO `question` VALUES (8, '递归调用非常危险，可能导致很多问题，即使程序编写没有逻辑错误，也可能导致下面哪种现象的发生（  ）。', '<p>无</p>\r\n', 0, '死循环', '栈溢出', '内存泄漏', '空指针', NULL, NULL, 'B', '无解析', 5, 2, 1, '2019-01-24 16:33:22', '2019-01-24 16:33:22', 0);
INSERT INTO `question` VALUES (9, '以下程序的运行情况是（   ） 。', '<pre><code>main() \r\n\r\n     {    <span class=\"hljs-keyword\">int</span> i=<span class=\"hljs-number\">1</span>,sum=<span class=\"hljs-number\">0</span>；\r\n\r\n          <span class=\"hljs-keyword\">while</span>(i&lt;<span class=\"hljs-number\">10</span>)  \r\n\r\n               sum=sum+<span class=\"hljs-number\">1</span>;  \r\n\r\n               i ++;  \r\n\r\n         <span class=\"hljs-keyword\">printf</span>(<span class=\"hljs-string\">\"i=%d,sum=%d\"</span>，i,sum)；\r\n\r\n     }\r\n</code></pre>', 0, 'i=10，sum=9', 'i=9,sum=9', 'i=2，sum=1', '以上结果都不对', NULL, NULL, 'D', '无解析', 5, 3, 1, '2019-01-24 16:35:30', '2019-01-28 16:01:09', 1);
INSERT INTO `question` VALUES (10, '如下程序，程序运行结果为（ 　 ）', '<pre><code> intChange(<span class=\"hljs-keyword\">int</span> *pX)\r\n\r\n       {   <span class=\"hljs-keyword\">int</span> <span class=\"hljs-keyword\">y</span> ＝ <span class=\"hljs-number\">8</span>；\r\n\r\n           <span class=\"hljs-keyword\">y</span> ＝ <span class=\"hljs-keyword\">y</span> - *pX；\r\n\r\n           pX ＝＆<span class=\"hljs-keyword\">y</span>；\r\n\r\n           <span class=\"hljs-keyword\">return</span> <span class=\"hljs-number\">0</span>；\r\n\r\n       }\r\n\r\n       intmain()\r\n\r\n       {   <span class=\"hljs-keyword\">int</span> xx ＝ <span class=\"hljs-number\">3</span>；\r\n\r\n           <span class=\"hljs-keyword\">int</span> *pY；\r\n\r\n           pY ＝＆xx；\r\n\r\n           Change(pY)；\r\n\r\n           <span class=\"hljs-keyword\">printf</span>(“%d”, *pY)；\r\n\r\n           <span class=\"hljs-keyword\">return</span> <span class=\"hljs-number\">0</span>\r\n\r\n       }\r\n</code></pre>', 0, '8', '3', '5', '不确定', NULL, NULL, 'B', '无解析', 5, 3, 1, '2019-01-24 16:36:40', '2019-01-24 16:36:40', 0);
INSERT INTO `question` VALUES (11, '下列程序执行后的输出结果是（    ） 。', '<pre><code>main() \r\n\r\n     {    <span class=\"hljs-keyword\">char</span>  arr[<span class=\"hljs-number\">2</span>][<span class=\"hljs-number\">4</span>]；\r\n\r\n          <span class=\"hljs-built_in\">strcpy</span>(arr,<span class=\"hljs-string\">\"you\"</span>)；\r\n\r\n          <span class=\"hljs-built_in\">strcpy</span>(arr[<span class=\"hljs-number\">1</span>],<span class=\"hljs-string\">\"me\"</span>);\r\n\r\n          arr[<span class=\"hljs-number\">0</span>][<span class=\"hljs-number\">3</span>]=<span class=\"hljs-string\">\'&amp;\'</span>；\r\n\r\n          <span class=\"hljs-built_in\">printf</span>(<span class=\"hljs-string\">\"%s\\n\"</span>,arr)；   }\r\n</code></pre>', 0, 'you&me', 'you ', 'me', 'err', NULL, NULL, 'A', '无解析', 5, 2, 1, '2019-01-24 16:38:02', '2019-01-24 16:38:02', 0);
INSERT INTO `question` VALUES (12, '下面程序的运行结果是（    ）', '<pre><code><span class=\"hljs-meta\">#<span class=\"hljs-meta-keyword\">include</span> <span class=\"hljs-meta-string\">&lt;stdlib.h&gt;</span></span>\r\n\r\n       voidfun(<span class=\"hljs-keyword\">int</span> **a,<span class=\"hljs-keyword\">int</span> p[][<span class=\"hljs-number\">3</span>])\r\n\r\n       {  \r\n\r\n              **a= p[<span class=\"hljs-number\">1</span>][<span class=\"hljs-number\">1</span>]; \r\n\r\n       }\r\n\r\n       voidmain()\r\n\r\n       {\r\n\r\n              intx[<span class=\"hljs-number\">2</span>][<span class=\"hljs-number\">3</span>] = {<span class=\"hljs-number\">2</span>,<span class=\"hljs-number\">4</span>,<span class=\"hljs-number\">6</span>,<span class=\"hljs-number\">8</span>,<span class=\"hljs-number\">10</span>,<span class=\"hljs-number\">12</span>};\r\n\r\n              <span class=\"hljs-keyword\">int</span>* p = *x;\r\n\r\n              fun(&amp;p,x);\r\n\r\n              <span class=\"hljs-built_in\">printf</span>(<span class=\"hljs-string\">\"%d\\n\"</span>,*p);}\r\n</code></pre>', 0, '10', '12', '6', '&x[1][1]', NULL, NULL, 'A', '无解析', 5, 3, 1, '2019-01-24 16:38:59', '2019-01-24 16:38:59', 0);
INSERT INTO `question` VALUES (13, '下列属于C语言标准库函数的为（）。', '<p>无</p>\r\n', 1, 'sin()', 'sqrt()', 'log10() ', 'ln() ', 'pow()', 'isalpha()', 'ABCEF', '无解析', 10, 2, 1, '2019-01-24 16:44:04', '2019-01-24 16:44:04', 0);
INSERT INTO `question` VALUES (14, '以下合法的表达式是（ ）。', '<p>无</p>\r\n', 1, 'x＝y＝200', '5+(x＝10)', '5+x＝10 ', 'y+x＝＝10 ', NULL, NULL, 'ABD', 'C错在 5+x 不是个左值,只能给左值赋值.而b是正确的,他可以分解成 x=10,5+x', 10, 2, 1, '2019-01-24 16:45:52', '2019-01-24 16:45:52', 0);
INSERT INTO `question` VALUES (15, 'JAVA所定义的版本中不包括：（）。', '<p>无</p>\r\n', 0, ' JAVA2 EE', 'JAVA2 Card', 'JAVA2 ME', 'JAVA2 HE', 'JAVA2 SE', NULL, 'D', '无解析', 5, 1, 4, '2019-01-24 16:47:38', '2019-01-24 16:47:38', 0);
INSERT INTO `question` VALUES (16, '下列说法正确的是（）。', '<pre><code><span class=\"hljs-meta\">#<span class=\"hljs-meta-keyword\">include</span> <span class=\"hljs-meta-string\">&lt;stdlib.h&gt;</span></span>\r\n\r\n       voidfun(<span class=\"hljs-keyword\">int</span> **a,<span class=\"hljs-keyword\">int</span> p[][<span class=\"hljs-number\">3</span>])\r\n\r\n       {  \r\n\r\n              **a= p[<span class=\"hljs-number\">1</span>][<span class=\"hljs-number\">1</span>]; \r\n\r\n       }\r\n\r\n       voidmain()\r\n\r\n       {\r\n\r\n              intx[<span class=\"hljs-number\">2</span>][<span class=\"hljs-number\">3</span>] = {<span class=\"hljs-number\">2</span>,<span class=\"hljs-number\">4</span>,<span class=\"hljs-number\">6</span>,<span class=\"hljs-number\">8</span>,<span class=\"hljs-number\">10</span>,<span class=\"hljs-number\">12</span>};\r\n\r\n              <span class=\"hljs-keyword\">int</span>* p = *x;\r\n\r\n              fun(&amp;p,x);\r\n\r\n              <span class=\"hljs-built_in\">printf</span>(<span class=\"hljs-string\">\"%d\\n\"</span>,*p);}\r\n</code></pre>', 0, 'JAVA程序的main方法必须写在类里面', 'JAVA程序中可以有多个main方法', 'JAVA程序中类名必须与文件名一样', 'JAVA程序的main方法中如果只有一条语句，可以不用{}(大括号)括起来', NULL, NULL, 'A', '无解析', 5, 1, 4, '2019-01-24 16:48:40', '2019-02-25 15:35:19', 0);
INSERT INTO `question` VALUES (17, 'Java中，在如下所示的Test类中，共有（）个构造方法。', '<pre><code><span class=\"hljs-keyword\">public</span> <span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">Test</span>{</span>\r\n\r\n<span class=\"hljs-keyword\">private</span> <span class=\"hljs-keyword\">int</span> x;\r\n\r\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span> <span class=\"hljs-title\">Test</span><span class=\"hljs-params\">()</span></span>{\r\n\r\nx=<span class=\"hljs-number\">35</span>;\r\n\r\n}\r\n\r\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">Test</span><span class=\"hljs-params\">(<span class=\"hljs-keyword\">double</span> f)</span></span>{\r\n\r\nThis.x=(<span class=\"hljs-keyword\">int</span>)f;\r\n\r\n}\r\n\r\n', 0, '0', '1', '2', '3', NULL, NULL, 'C', '无解析', 5, 2, 4, '2019-01-24 16:49:39', '2019-02-25 15:34:53', 0);
INSERT INTO `question` VALUES (18, '测试', '<p>的</p>\r\n', 0, '能被java.exe成功运行的java class文件必须有mian（）方法。', NULL, NULL, NULL, NULL, NULL, 'S', 'S', 5, 1, 1, '2019-01-30 13:59:33', '2019-01-30 13:59:33', 0);
INSERT INTO `question` VALUES (19, '在面向对象方法中，一个对象请求另一对象为其服务的方式是通过发送（）。', '<p>无</p>\r\n', 0, '命令', '口令', '消息', '调用语句', NULL, NULL, 'C', '无解析', 5, 1, 5, '2019-02-15 15:55:48', '2019-02-15 15:55:48', 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `status` int(1) NOT NULL COMMENT '状态：1有效；2删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '1', '超级管理员', '超级管理员', 1, '2017-06-28 20:30:05', '2017-06-28 20:30:10');
INSERT INTO `role` VALUES (2, '2', '老师', '老师', 1, '2017-06-30 23:35:19', '2019-01-13 00:00:36');
INSERT INTO `role` VALUES (3, '3', '学生', '学生', 1, '2017-06-30 23:35:44', '2019-01-13 00:00:47');
INSERT INTO `role` VALUES (4, '4', '数据库管理员', '数据库管理员', 1, '2017-07-12 11:50:22', '2017-10-09 17:38:02');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `permission_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3636 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1917, '3', '1');
INSERT INTO `role_permission` VALUES (3565, '1', '1');
INSERT INTO `role_permission` VALUES (3566, '1', '1000000602555213');
INSERT INTO `role_permission` VALUES (3567, '1', '1000001125494823');
INSERT INTO `role_permission` VALUES (3568, '1', '1000001202958412');
INSERT INTO `role_permission` VALUES (3569, '1', '1000000163374336');
INSERT INTO `role_permission` VALUES (3570, '1', '1000000946860898');
INSERT INTO `role_permission` VALUES (3571, '1', '1000000249577272');
INSERT INTO `role_permission` VALUES (3572, '1', '1000000894058396');
INSERT INTO `role_permission` VALUES (3573, '1', '1000002132243773');
INSERT INTO `role_permission` VALUES (3574, '1', '1000002036511171');
INSERT INTO `role_permission` VALUES (3575, '1', '1000002022858347');
INSERT INTO `role_permission` VALUES (3576, '1', '1000000411587667');
INSERT INTO `role_permission` VALUES (3577, '1', '1000000399537883');
INSERT INTO `role_permission` VALUES (3578, '1', '1000002145951096');
INSERT INTO `role_permission` VALUES (3579, '1', '1000000776375556');
INSERT INTO `role_permission` VALUES (3580, '1', '1000000307777615');
INSERT INTO `role_permission` VALUES (3581, '1', '1000000428056556');
INSERT INTO `role_permission` VALUES (3582, '1', '1000000976279608');
INSERT INTO `role_permission` VALUES (3583, '1', '1000001644855070');
INSERT INTO `role_permission` VALUES (3584, '1', '1000000976625379');
INSERT INTO `role_permission` VALUES (3585, '1', '1000002127467055');
INSERT INTO `role_permission` VALUES (3586, '1', '1000001458372033');
INSERT INTO `role_permission` VALUES (3587, '1', '1000001832967209');
INSERT INTO `role_permission` VALUES (3588, '1', '1000000754923037');
INSERT INTO `role_permission` VALUES (3589, '1', '1000000759248744');
INSERT INTO `role_permission` VALUES (3590, '1', '1000000863853891');
INSERT INTO `role_permission` VALUES (3591, '1', '1000001264798222');
INSERT INTO `role_permission` VALUES (3592, '1', '1000000432183856');
INSERT INTO `role_permission` VALUES (3593, '1', '1000000237721285');
INSERT INTO `role_permission` VALUES (3594, '1', '1000001238193773');
INSERT INTO `role_permission` VALUES (3595, '1', '1000001305005793');
INSERT INTO `role_permission` VALUES (3596, '1', '1000001679037501');
INSERT INTO `role_permission` VALUES (3597, '1', '1000001011730177');
INSERT INTO `role_permission` VALUES (3598, '1', '1000001312374743');
INSERT INTO `role_permission` VALUES (3599, '1', '1000001507480127');
INSERT INTO `role_permission` VALUES (3600, '1', '1000000224901858');
INSERT INTO `role_permission` VALUES (3601, '1', '1000001579533936');
INSERT INTO `role_permission` VALUES (3602, '1', '1000000663968031');
INSERT INTO `role_permission` VALUES (3603, '1', '1000000322655547');
INSERT INTO `role_permission` VALUES (3604, '1', '1000001419287014');
INSERT INTO `role_permission` VALUES (3605, '1', '1000002075182223');
INSERT INTO `role_permission` VALUES (3606, '1', '2');
INSERT INTO `role_permission` VALUES (3607, '1', '201');
INSERT INTO `role_permission` VALUES (3608, '1', '20101');
INSERT INTO `role_permission` VALUES (3609, '1', '20102');
INSERT INTO `role_permission` VALUES (3610, '1', '20103');
INSERT INTO `role_permission` VALUES (3611, '1', '20104');
INSERT INTO `role_permission` VALUES (3612, '1', '20105');
INSERT INTO `role_permission` VALUES (3613, '1', '20106');
INSERT INTO `role_permission` VALUES (3614, '1', '202');
INSERT INTO `role_permission` VALUES (3615, '1', '20201');
INSERT INTO `role_permission` VALUES (3616, '1', '20202');
INSERT INTO `role_permission` VALUES (3617, '1', '20203');
INSERT INTO `role_permission` VALUES (3618, '1', '20204');
INSERT INTO `role_permission` VALUES (3619, '1', '20205');
INSERT INTO `role_permission` VALUES (3620, '1', '20206');
INSERT INTO `role_permission` VALUES (3621, '1', '203');
INSERT INTO `role_permission` VALUES (3622, '1', '20301');
INSERT INTO `role_permission` VALUES (3623, '1', '20302');
INSERT INTO `role_permission` VALUES (3624, '1', '20303');
INSERT INTO `role_permission` VALUES (3625, '1', '20304');
INSERT INTO `role_permission` VALUES (3626, '1', '4');
INSERT INTO `role_permission` VALUES (3627, '1', '401');
INSERT INTO `role_permission` VALUES (3628, '1', '1000001992372345');
INSERT INTO `role_permission` VALUES (3629, '1', '1000002083579304');
INSERT INTO `role_permission` VALUES (3630, '1', '1000000171409776');
INSERT INTO `role_permission` VALUES (3631, '1', '1000000587822241');
INSERT INTO `role_permission` VALUES (3632, '1', '1000000493635111');
INSERT INTO `role_permission` VALUES (3633, '1', '1000000318760332');
INSERT INTO `role_permission` VALUES (3634, '1', '3');
INSERT INTO `role_permission` VALUES (3635, '1', '301');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '考生主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学科名称',
  `description` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程描述',
  `img_url` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程封面',
  `sort` int(10) NULL DEFAULT NULL COMMENT '排序',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `status` int(4) NULL DEFAULT 0 COMMENT '课程状态,0表示正常,1表示弃用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, '1', 'C语言程序设计', '计算机专业学生必修课程', 'www.github.com', 1, '超级管理员', '2019-01-17 13:18:34', '2019-01-18 11:25:21', 1);
INSERT INTO `subject` VALUES (3, '1', 'MySql数据库', '数据库专业学生必修课程', 'www.github.com', 3, '超级管理员', '2019-01-17 14:54:14', '2019-01-24 09:38:52', 1);
INSERT INTO `subject` VALUES (4, '1', 'Java程序设计', '软件工程专业学生必修课程', 'www.github.com', 2, '超级管理员', '2019-01-18 15:38:43', '2019-01-21 13:19:40', 1);
INSERT INTO `subject` VALUES (5, '1', 'Python', '软件工程专业学生必修课程', 'www.github.com', 4, '超级管理员', '2019-01-28 11:21:27', '2019-01-28 11:21:27', 1);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key',
  `sys_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`sys_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG', '{\"type\":1,\"qiniuDomain\":\"http://cdn.nbclass.com\",\"qiniuPrefix\":\"img/exam\",\"qiniuAccessKey\":\"45Q8tlxdBnQrbrUGoAXbxE06GjmwrMvok2G2fvUS\",\"qiniuSecretKey\":\"cx6_yE44prxCOsPjoKh_z0pJywLhr87A7YWlbXb1\",\"qiniuBucketName\":\"exam\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\",\"qcloudRegion\":\"\"}', 1, '云存储配置信息');
INSERT INTO `sys_config` VALUES (5, 'SITE_NAME', 'C语言在线考试系统', 1, '网站名称');
INSERT INTO `sys_config` VALUES (6, 'SITE_KWD', 'C语言在线考试系统', 1, '网站关键字');
INSERT INTO `sys_config` VALUES (7, 'SITE_DESC', 'C语言在线考试系统', 1, '网站描述');
INSERT INTO `sys_config` VALUES (8, 'SITE_PERSON_PIC', 'http://cdn.nbclass.com/blog/img/person.jpg', 1, '站长头像');
INSERT INTO `sys_config` VALUES (9, 'SITE_PERSON_NAME', 'C语言在线考试系统', 1, '站长名称');
INSERT INTO `sys_config` VALUES (10, 'SITE_PERSON_DESC', '95后少年，热爱写bug，热爱编程，热爱学习，分享一些个人项目经验，共同学习，少走弯路。Just do it！', 1, '站长描述');
INSERT INTO `sys_config` VALUES (11, 'BAIDU_PUSH_URL', 'http://data.zz.baidu.com/urls?site=www.nbclass.com&token=asdasd324234234', 1, '百度推送地址');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密盐值',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `sex` int(255) NULL DEFAULT NULL COMMENT '年龄：1男2女',
  `age` int(3) NULL DEFAULT NULL COMMENT '年龄',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `status` int(1) NOT NULL COMMENT '用户状态：1有效; 2删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', 'admin', '872359cc44c637cc73b7cd55c06d95e4', '8cd50474d2a3c1e88298e91df8bf6f1c', '超级管理员', '888@qq.com', '18788889999', 1, 22, 'http://cdn.nbclass.com/blog/img/person.jpg', 1, '2018-05-23 21:22:06', '2018-07-17 23:04:46', '2019-02-26 13:47:16');
INSERT INTO `user` VALUES (2, '1000000695368215', '40115208', '8fd1aa3c824288b4629445a75899d26e', '4cfe1aaa0c1d5c115d3b7e43dde9fc00', '郭洪奎', 'hungkuei@163.com', '15709620338', 1, 23, NULL, 1, '2019-01-13 00:01:40', '2019-01-13 00:01:40', '2019-01-13 00:01:40');
INSERT INTO `user` VALUES (3, '1000001634620406', '40115209', '8b458d71d6228f227cf75af88763dbc8', '5e920b5d8cef0ce366237a6edd4e47e8', NULL, '1468584274@qq.com', '15709620338', 1, 23, NULL, 1, '2019-02-15 16:37:56', '2019-02-15 16:37:56', '2019-02-20 16:59:13');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, '1', '1');
INSERT INTO `user_role` VALUES (2, '1000000695368215', '3');
INSERT INTO `user_role` VALUES (3, '1000001634620406', '3');

SET FOREIGN_KEY_CHECKS = 1;
