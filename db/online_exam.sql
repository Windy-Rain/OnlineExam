/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云数据库
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 47.94.11.203:3306
 Source Schema         : online_exam

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 09/07/2019 10:44:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ins_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '学院id',
  `class_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级介绍',
  `sort` int(10) NULL DEFAULT NULL COMMENT '排序',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '添加者',
  `status` int(1) UNSIGNED NULL DEFAULT NULL COMMENT '状态：0表示正常,1表示弃用',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES (1, 1, '计科15102班', '2015级计算机科学与技术专业15102班', 1, '超级管理员', 0, '2019-04-13 15:44:55', '2019-04-13 15:44:55');
INSERT INTO `classes` VALUES (2, 2, '电自18301班', '2018级电气及其自动化专业18301班', 2, '超级管理员', 0, '2019-05-28 22:45:43', '2019-05-28 22:45:43');
INSERT INTO `classes` VALUES (3, 2, '电信18101班', '2018级电子信息专业18101班', 3, '超级管理员', 0, '2019-05-28 22:48:09', '2019-05-28 22:48:09');
INSERT INTO `classes` VALUES (4, 2, '电自施耐德18101班', '18级', 4, '周金莲', 0, '2019-06-10 10:15:10', '2019-06-10 10:15:10');
INSERT INTO `classes` VALUES (5, 2, '电自施耐德18102班', '18级', 5, '周金莲', 0, '2019-06-10 10:15:49', '2019-06-10 10:15:49');
INSERT INTO `classes` VALUES (6, 2, '电自18103班', '2018级电气及其自动化专业18103班', 6, '周金莲', 0, '2019-06-13 08:22:11', '2019-06-13 08:22:11');
INSERT INTO `classes` VALUES (7, 2, '电自施耐德18103班', '18级', 7, '周金莲', 0, '2019-06-13 08:22:53', '2019-06-13 08:22:53');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sid` int(20) NULL DEFAULT NULL COMMENT '被评论的文章或者页面的ID(-1:留言板)',
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的ID',
  `pid` int(20) UNSIGNED NULL DEFAULT NULL COMMENT '父级评论的id',
  `username` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的账号',
  `nickname` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的昵称',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的头像地址',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的邮箱地址',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的网站地址',
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, -1, '1', NULL, 'admin', '超级管理员', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/7e60c1d428c7a75ffbb8c6813a0d695e.jpg', '1468584274@qq.com', NULL, 1, '218.75.49.82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>毕业快乐！</p>', NULL, 0, 0, '2019-06-25 15:35:50', '2019-06-25 15:35:50');

-- ----------------------------
-- Table structure for exam_question
-- ----------------------------
DROP TABLE IF EXISTS `exam_question`;
CREATE TABLE `exam_question`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) UNSIGNED NOT NULL COMMENT '考试ID',
  `question_id` int(11) UNSIGNED NOT NULL COMMENT '考题ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam_question
-- ----------------------------
INSERT INTO `exam_question` VALUES (24, 4, 78);
INSERT INTO `exam_question` VALUES (25, 4, 79);
INSERT INTO `exam_question` VALUES (26, 4, 80);
INSERT INTO `exam_question` VALUES (27, 4, 81);
INSERT INTO `exam_question` VALUES (28, 4, 82);
INSERT INTO `exam_question` VALUES (29, 4, 83);
INSERT INTO `exam_question` VALUES (30, 4, 84);
INSERT INTO `exam_question` VALUES (31, 4, 85);
INSERT INTO `exam_question` VALUES (32, 4, 86);
INSERT INTO `exam_question` VALUES (33, 4, 87);
INSERT INTO `exam_question` VALUES (34, 4, 88);
INSERT INTO `exam_question` VALUES (35, 4, 89);
INSERT INTO `exam_question` VALUES (36, 4, 90);
INSERT INTO `exam_question` VALUES (37, 4, 91);
INSERT INTO `exam_question` VALUES (38, 4, 92);
INSERT INTO `exam_question` VALUES (39, 4, 93);
INSERT INTO `exam_question` VALUES (40, 4, 94);
INSERT INTO `exam_question` VALUES (41, 4, 95);
INSERT INTO `exam_question` VALUES (42, 4, 129);
INSERT INTO `exam_question` VALUES (43, 4, 130);
INSERT INTO `exam_question` VALUES (44, 4, 131);
INSERT INTO `exam_question` VALUES (45, 4, 132);
INSERT INTO `exam_question` VALUES (46, 4, 133);

-- ----------------------------
-- Table structure for examination
-- ----------------------------
DROP TABLE IF EXISTS `examination`;
CREATE TABLE `examination`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '考试标题',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
  `grade` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '年级',
  `total_score` int(8) NULL DEFAULT NULL COMMENT '考试总分',
  `class_id` int(8) NULL DEFAULT NULL COMMENT '班级id',
  `subject_id` int(8) NULL DEFAULT NULL COMMENT '学科ID',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '考试开始时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '考试结束时间',
  `status` int(8) NULL DEFAULT 0 COMMENT '进行状态:0表示未开始,1表示进行中,2表示考试已经结束,3表示该考试已经完成批卷',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examination
-- ----------------------------
INSERT INTO `examination` VALUES (4, 'C语言测试', '1000002035049095', '周金莲', '2018', 72, 4, 1, '2019-06-10 15:41:21', '2019-06-13 08:08:47', '2019-06-12 21:00:00', '2019-06-12 22:00:00', 2);

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
  `auto_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '考生选择题答案json',
  `manul_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '考生问答题答案json',
  `answer_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '考生作答答案json',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '考试交卷时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '改卷完成时间',
  `status` int(8) NULL DEFAULT 0 COMMENT '0未评卷,1及格2不及格3良好4优秀',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (1, '1000002035049095', '4', 8, 8, 0, 'A~_~B~_~B~_~C~_~B~_~B~_~B~_~B~_~B~_~B~_~C~_~C~_~B~_~A~_~B~_~', 'sdfafvadv~_~ascasc~_~scascascsa~_~csacsacsa~_~csacasc~_~scsa xz sac x~_~ dx dsvrfbgn~_~casdcsdvsfvb~_~', 'A~_~B~_~B~_~C~_~B~_~B~_~B~_~B~_~B~_~B~_~C~_~C~_~B~_~sdfafvadv~_~ascasc~_~scascascsa~_~csacsacsa~_~csacasc~_~A~_~B~_~scsa xz sac x~_~ dx dsvrfbgn~_~casdcsdvsfvb', '2019-06-10 15:57:44', '2019-06-10 15:57:44', 0);
INSERT INTO `grade` VALUES (2, '1', '4', 2, 2, 0, 'A~_~B~_~B~_~~_~null~_~B~_~null~_~null~_~null~_~null~_~null~_~~_~~_~~_~null~_~', '~_~~_~~_~~_~~_~null~_~null~_~erewrf~_~', 'A~_~B~_~B~_~~_~null~_~B~_~null~_~null~_~null~_~null~_~null~_~~_~~_~~_~~_~~_~~_~~_~~_~null~_~null~_~null~_~erewrf', '2019-06-12 21:22:35', '2019-06-12 21:22:35', 0);

-- ----------------------------
-- Table structure for institute
-- ----------------------------
DROP TABLE IF EXISTS `institute`;
CREATE TABLE `institute`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `institute_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学院名',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学院介绍',
  `institute_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学院Logo图片地址',
  `sort` int(10) NULL DEFAULT NULL COMMENT '排序',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '添加者',
  `status` int(1) UNSIGNED NULL DEFAULT NULL COMMENT '状态：0正常1弃用',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of institute
-- ----------------------------
INSERT INTO `institute` VALUES (1, '计算机科学与工程学院', '宁夏理工学院计算机科学与工程学院下设计算机科学与技术、网络工程、数字媒体技术、数据科学与大数据技术四个本科专业，另有一个计算机应用专科专业。', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/738504958ce81c7f53af759f943ebfed.jpg', 1, '超级管理员', 0, '2019-04-11 21:01:56', '2019-04-11 21:01:56');
INSERT INTO `institute` VALUES (2, '电气信息工程学院', '宁夏理工学院电气信息工程学院', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/6dc409a8a4b4086affec4854f8368f26.jpg', 2, '超级管理员', 0, '2019-04-13 16:24:02', '2019-04-13 16:24:02');
INSERT INTO `institute` VALUES (3, '经济管理学院', '宁夏理工学院经济管理学院', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/677fe75ebea9f4fc4d1b707a291133ee.jpg', 3, '超级管理员', 0, '2019-06-01 20:26:36', '2019-06-01 20:26:36');
INSERT INTO `institute` VALUES (4, '机械工程学院', '宁夏理工学院机械工程学院', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/18c0baefd616578b2ffa13ca24ec8da7.jpg', 4, '超级管理员', 0, '2019-06-01 20:27:37', '2019-06-01 20:27:37');
INSERT INTO `institute` VALUES (5, '建筑与环境学院', '宁夏理工学院建筑与环境学院', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/68ed1451b4dd180d3c4cad36bb4b7e0f.jpg', 5, '超级管理员', 0, '2019-06-01 20:28:23', '2019-06-01 20:28:23');
INSERT INTO `institute` VALUES (6, '外国语学院', '宁夏理工学院外国语学院', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/90597f6e52ca7545b039834abb5e2231.jpg', 6, '超级管理员', 0, '2019-06-01 20:30:01', '2019-06-01 20:30:01');

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES (1, '百度', 'https://www.baidu.com', '百度网址', '', '', '', 1, 1, '', '2018-09-13 23:24:25', '2019-04-07 18:41:17');
INSERT INTO `link` VALUES (2, '宁夏理工学院', 'https://www.nxist.com', '宁夏理工学院官方网站', '', '', '', 1, 1, '', '2019-04-07 18:38:30', '2019-05-14 20:22:10');
INSERT INTO `link` VALUES (3, 'GitHub开源项目托管平台', 'https://www.github.com/', 'GitHub是一个面向开源及私有软件项目的托管平台', '', '', '', 1, 1, '', '2019-05-14 20:23:57', '2019-05-15 18:22:14');

-- ----------------------------
-- Table structure for love
-- ----------------------------
DROP TABLE IF EXISTS `love`;
CREATE TABLE `love`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sup_id` int(8) NULL DEFAULT NULL COMMENT '点赞的编号',
  `love_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点赞的类型： 0评论1其他',
  `user_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户编号',
  `user_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ip',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '1', '管理桌面', '工作台', '/workdest', 'workdest', 0, 1, 1, 'fa fa-windows', 1, '2017-09-27 21:22:02', '2019-04-15 18:58:46');
INSERT INTO `permission` VALUES (2, '2', '权限管理', '权限管理', NULL, NULL, 0, 0, 3, 'fa fa-sitemap', 1, '2017-07-13 15:04:42', '2019-04-11 20:41:58');
INSERT INTO `permission` VALUES (3, '201', '用户管理', '用户管理', '/users', 'users', 2, 1, 3, 'fa fa-circle-o', 1, '2017-07-13 15:05:47', '2019-04-13 15:38:06');
INSERT INTO `permission` VALUES (4, '20101', '列表查询', '用户列表查询', '/user/list', 'user:list', 3, 2, 0, NULL, 1, '2017-07-13 15:09:24', '2017-10-09 05:38:29');
INSERT INTO `permission` VALUES (5, '20102', '新增', '新增用户', '/user/add', 'user:add', 3, 2, 0, NULL, 1, '2017-07-13 15:06:50', '2018-02-28 17:58:46');
INSERT INTO `permission` VALUES (6, '20103', '编辑', '编辑用户', '/user/edit', 'user:edit', 3, 2, 0, NULL, 1, '2017-07-13 15:08:03', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (7, '20104', '删除', '删除用户', '/user/delete', 'user:delete', 3, 2, 0, NULL, 1, '2017-07-13 15:08:42', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (8, '20105', '批量删除', '批量删除用户', '/user/batch/delete', 'user:batchDelete', 3, 2, 0, '', 1, '2018-07-11 01:53:09', '2018-07-11 01:53:09');
INSERT INTO `permission` VALUES (9, '20106', '分配角色', '分配角色', '/user/assign/role', 'user:assignRole', 3, 2, 0, NULL, 1, '2017-07-13 15:09:24', '2017-10-09 05:38:29');
INSERT INTO `permission` VALUES (10, '202', '角色管理', '角色管理', '/roles', 'roles', 2, 1, 4, 'fa fa-circle-o', 1, '2017-07-17 14:39:09', '2019-04-13 15:37:53');
INSERT INTO `permission` VALUES (11, '20201', '列表查询', '角色列表查询', '/role/list', 'role:list', 10, 2, 0, NULL, 1, '2017-10-10 15:31:36', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (12, '20202', '新增', '新增角色', '/role/add', 'role:add', 10, 2, 0, NULL, 1, '2017-07-17 14:39:46', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (13, '20203', '编辑', '编辑角色', '/role/edit', 'role:edit', 10, 2, 0, NULL, 1, '2017-07-17 14:40:15', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (14, '20204', '删除', '删除角色', '/role/delete', 'role:delete', 10, 2, 0, NULL, 1, '2017-07-17 14:40:57', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (15, '20205', '批量删除', '批量删除角色', '/role/batch/delete', 'role:batchDelete', 10, 2, 0, '', 1, '2018-07-10 22:20:43', '2018-07-10 22:20:43');
INSERT INTO `permission` VALUES (16, '20206', '分配权限', '分配权限', '/role/assign/permission', 'role:assignPerms', 10, 2, 0, NULL, 1, '2017-09-26 07:33:05', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (17, '203', '资源管理', '资源管理', '/permissions', 'permissions', 2, 1, 5, 'fa fa-circle-o', 1, '2017-09-26 07:33:51', '2019-04-13 15:37:46');
INSERT INTO `permission` VALUES (18, '20301', '列表查询', '资源列表', '/permission/list', 'permission:list', 17, 2, 0, NULL, 1, '2018-07-12 16:25:28', '2018-07-12 16:25:33');
INSERT INTO `permission` VALUES (19, '20302', '新增', '新增资源', '/permission/add', 'permission:add', 17, 2, 0, NULL, 1, '2017-09-26 08:06:58', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (20, '20303', '编辑', '编辑资源', '/permission/edit', 'permission:edit', 17, 2, 0, NULL, 1, '2017-09-27 21:29:04', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (21, '20304', '删除', '删除资源', '/permission/delete', 'permission:delete', 17, 2, 0, NULL, 1, '2017-09-27 21:29:50', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (22, '3', '运维管理', '运维管理', NULL, NULL, 0, 0, 7, 'fa f fa-database', 1, '2018-07-06 15:19:26', '2019-02-01 01:32:49');
INSERT INTO `permission` VALUES (23, '301', '数据监控', '数据监控', '/database/monitoring', 'database', 22, 1, 1, 'fa fa-circle-o', 1, '2018-07-06 15:19:55', '2018-07-06 15:19:55');
INSERT INTO `permission` VALUES (24, '4', '系统管理', '系统管理', NULL, NULL, 0, 0, 5, 'fa fa-th-list', 1, '2018-07-06 15:20:38', '2018-07-24 15:42:28');
INSERT INTO `permission` VALUES (25, '401', '在线用户', '在线用户', '/online/users', 'onlineUsers', 24, 1, 1, 'fa fa-circle-o', 1, '2018-07-06 15:21:00', '2018-07-24 14:58:22');
INSERT INTO `permission` VALUES (32, '1000001992372345', '在线用户查询', '在线用户查询', '/online/user/list', 'onlineUser:list', 25, 2, 0, '', 1, '2018-07-24 15:02:23', '2018-07-24 15:02:23');
INSERT INTO `permission` VALUES (33, '1000002083579304', '踢出用户', '踢出用户', '/online/user/kickout', 'onlineUser:kickout', 25, 2, 0, '', 1, '2018-07-24 15:03:16', '2018-07-24 15:03:16');
INSERT INTO `permission` VALUES (34, '1000000171409776', '批量踢出', '批量踢出', '/online/user/batch/kickout', 'onlineUser:batchKickout', 25, 2, 0, '', 1, '2018-07-24 15:04:09', '2018-07-24 15:04:09');
INSERT INTO `permission` VALUES (35, '1000000863853891', '网站管理', '网站管理', NULL, NULL, 0, 0, 4, 'fa fa-users', 1, '2018-07-24 15:44:23', '2019-04-11 20:42:05');
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
INSERT INTO `permission` VALUES (52, '1000000602555213', '考试管理', '考试管理', NULL, NULL, 0, 0, 2, 'fa fa-institution', 1, '2018-07-25 17:43:12', '2019-02-01 01:33:39');
INSERT INTO `permission` VALUES (59, '1000000976625379', '标签管理', '标签管理', '/tags', 'tags', 35, 1, 5, 'fa fa-circle-o', 1, '2018-07-25 18:50:47', '2019-04-22 14:45:11');
INSERT INTO `permission` VALUES (60, '1000002127467055', '查询', '查询标签列表', '/tag/list', 'tag:list', 59, 2, 0, '', 1, '2018-07-25 18:51:20', '2018-07-25 18:51:20');
INSERT INTO `permission` VALUES (61, '1000001458372033', '新增', '新增标签', '/tag/add', 'tag:add', 59, 2, 0, '', 1, '2018-07-25 18:51:42', '2018-07-25 18:51:42');
INSERT INTO `permission` VALUES (62, '1000001832967209', '编辑', '编辑标签', '/tag/edit', 'tag:edit', 59, 2, 0, '', 1, '2018-07-25 18:52:17', '2018-07-25 18:52:17');
INSERT INTO `permission` VALUES (63, '1000000754923037', '删除', '删除标签', '/tag/delete', 'tag:delete', 59, 2, 0, '', 1, '2018-07-25 18:52:40', '2018-07-25 18:52:40');
INSERT INTO `permission` VALUES (64, '1000000759248744', '批量删除', '批量删除标签', '/tag/batch/delete', 'tag:batchDelete', 59, 2, 0, '', 1, '2018-07-25 18:53:14', '2018-07-25 18:53:14');
INSERT INTO `permission` VALUES (71, '1000000899091444', '发布考试', '发布考试', '/exam/add', 'exam:add', 52, 1, 1, 'fa fa-dot-circle-o', 1, '2018-07-29 20:39:49', '2019-02-20 20:10:03');
INSERT INTO `permission` VALUES (72, '1000000224901858', '评论管理', '评论管理', '/comments', 'comments', 35, 1, 4, 'fa fa-circle-o', 1, '2018-08-10 09:44:41', '2018-09-19 15:44:13');
INSERT INTO `permission` VALUES (73, '1000001579533936', '查询', '查询', '/comment/list', 'comment:list', 72, 2, 0, '', 1, '2018-08-10 09:46:54', '2018-08-10 09:46:54');
INSERT INTO `permission` VALUES (74, '1000000663968031', '审核', '审核评论', '/comment/audit', 'comment:audit', 72, 2, 0, '', 1, '2018-08-10 09:57:11', '2018-08-10 09:57:11');
INSERT INTO `permission` VALUES (75, '1000000322655547', '回复', '回复评论', '/comment/reply', 'comment:reply', 72, 2, 0, NULL, 1, '2018-08-10 10:04:28', '2019-04-18 10:27:24');
INSERT INTO `permission` VALUES (76, '1000001419287014', '删除', '删除评论', '/comment/delete', 'comment:delete', 72, 2, 0, '', 1, '2018-08-10 10:06:27', '2018-08-10 10:06:27');
INSERT INTO `permission` VALUES (77, '1000002075182223', '批量删除', '批量删除评论', '/comment/batch/delete', 'comment:batchDelete', 72, 2, 0, '', 1, '2018-08-10 10:07:57', '2018-08-10 10:07:57');
INSERT INTO `permission` VALUES (78, '1000000587822241', '上传管理', '上传管理', NULL, NULL, 0, 0, 6, 'fa fa-upload', 1, '2018-09-12 17:08:41', '2019-02-01 01:37:52');
INSERT INTO `permission` VALUES (79, '1000000493635111', '云存储配置', '云存储配置', '/upload/config', 'upload:config', 78, 1, 1, 'fa fa-circle-o', 1, '2018-09-12 17:10:09', '2018-09-12 17:10:09');
INSERT INTO `permission` VALUES (80, '1000000318760332', '保存', '保存云存储配置', '/upload/saveConfig', 'upload:saveConfig', 79, 2, 0, '', 1, '2018-09-12 17:10:42', '2018-09-12 17:10:42');
INSERT INTO `permission` VALUES (89, '1000002085828985', '课程管理', '课程管理菜单', '/subjects', 'subjects', 52, 1, 3, 'fa fa-circle-o', 1, '2019-01-18 19:14:08', '2019-02-20 21:23:00');
INSERT INTO `permission` VALUES (90, '1000000583815309', '新增', '新增按钮', '/subject/add', 'subject:add', 89, 2, 0, '', 1, '2019-01-18 19:15:39', '2019-01-18 19:15:39');
INSERT INTO `permission` VALUES (91, '1000000414556681', '编辑', '编辑按钮', '/subject/edit', 'subject:edit', 89, 2, 0, '', 1, '2019-01-18 19:16:26', '2019-01-18 19:16:26');
INSERT INTO `permission` VALUES (92, '1000001670195971', '删除', '删除按钮', '/subject/delete', 'subject:delete', 89, 2, 0, '', 1, '2019-01-18 19:17:06', '2019-01-18 19:17:06');
INSERT INTO `permission` VALUES (93, '1000000233644405', '题库管理', '题库管理菜单', '/questions', 'questions', 52, 1, 4, 'fa fa-circle-o', 1, '2019-01-18 19:18:48', '2019-02-20 21:23:17');
INSERT INTO `permission` VALUES (94, '1000000159347988', '新增', '新增按钮', '/question/add', 'question:add', 93, 2, 0, '', 1, '2019-01-18 19:20:08', '2019-01-18 19:20:08');
INSERT INTO `permission` VALUES (95, '1000001743618837', '查询', '查询按钮', '/question/list', 'question:list', 93, 2, 0, '', 1, '2019-01-18 19:22:12', '2019-01-18 19:22:12');
INSERT INTO `permission` VALUES (96, '1000000098066544', '删除', '删除按钮', '/question/delete', 'question:delete', 93, 2, 0, NULL, 1, '2019-01-22 22:39:34', '2019-01-22 22:40:28');
INSERT INTO `permission` VALUES (97, '1000001512619368', '批量删除', '批量删除按钮', '/question/batch/delete', 'question:batchDelete', 93, 2, 0, '', 1, '2019-01-22 22:47:20', '2019-01-22 22:47:20');
INSERT INTO `permission` VALUES (98, '1000000727959093', '编辑', '编辑按钮', '/question/edit', 'question:edit', 93, 2, 0, NULL, 1, '2019-01-23 23:30:36', '2019-01-23 23:34:06');
INSERT INTO `permission` VALUES (99, '1000001224543466', '考试列表', '考试列表菜单', '/exams', 'exams', 52, 1, 2, 'fa fa-circle-o', 1, '2019-01-26 21:13:34', '2019-02-20 21:22:45');
INSERT INTO `permission` VALUES (100, '1000001747915483', '查询', '查询按钮', '/exam/list', 'exam:list', 99, 2, 0, '', 1, '2019-01-26 21:16:16', '2019-01-26 21:16:16');
INSERT INTO `permission` VALUES (101, '1000000864155694', '发布考试', '发布考试按钮', '/exam/add', 'exam:add', 99, 2, 0, NULL, 1, '2019-01-26 21:16:51', '2019-02-18 20:41:41');
INSERT INTO `permission` VALUES (102, '1000000167185653', '编辑', '编辑按钮', '/exam/edit', 'exam:edit', 99, 2, 0, '', 1, '2019-02-18 20:41:27', '2019-02-18 20:41:27');
INSERT INTO `permission` VALUES (103, '1000000850255464', '删除', '删除按钮', '/exam/delete', 'exam:delete', 99, 2, 0, '', 1, '2019-02-18 21:56:38', '2019-02-18 21:56:38');
INSERT INTO `permission` VALUES (104, '1000000553415807', '批量删除', '批量删除按钮', '/exam/batch/delete', 'exam:batchDelete', 99, 2, 0, NULL, 1, '2019-02-18 21:57:57', '2019-02-20 20:33:27');
INSERT INTO `permission` VALUES (105, '1000000243343801', '成绩管理', '成绩管理菜单', '/grades', 'grades', 52, 1, 5, 'fa fa-circle-o', 1, '2019-03-14 10:55:35', '2019-03-14 10:55:35');
INSERT INTO `permission` VALUES (106, '1000000426716222', '查询', '查询按钮', '/grade/list', 'grade:list', 105, 2, 0, '', 1, '2019-03-14 10:56:42', '2019-03-14 10:56:42');
INSERT INTO `permission` VALUES (107, '1000000773560150', '批阅', '批阅按钮', '/grade/mark', 'grade:mark', 105, 2, 0, '', 1, '2019-03-15 18:23:51', '2019-03-15 18:23:51');
INSERT INTO `permission` VALUES (108, '1000000658745124', '详情', '详情按钮', '/grade/detail', 'grade:detail', 105, 2, 0, '', 1, '2019-03-16 16:10:16', '2019-03-16 16:10:16');
INSERT INTO `permission` VALUES (109, '1000000281400324', '删除', '删除按钮', '/grade/delete', 'grade:delete', 105, 2, 0, '', 1, '2019-03-16 16:10:53', '2019-03-16 16:10:53');
INSERT INTO `permission` VALUES (110, '1000000399266971', '批量删除', '批量删除按钮', '/grade/batch/delete', 'grade:batchDelete', 105, 2, 0, NULL, 1, '2019-03-16 16:12:10', '2019-03-16 16:13:13');
INSERT INTO `permission` VALUES (111, '1000000791531592', '批量导入题库', '批量导入题库按钮', '/question/importExcel', 'question:importExcel', 99, 2, 0, NULL, 0, '2019-03-22 14:53:45', '2019-03-22 14:57:37');
INSERT INTO `permission` VALUES (112, '1000000698074212', '批量导入题库', '批量导入题库按钮', '/question/importExcel', 'question:importExcel', 93, 2, 0, '', 1, '2019-03-22 14:58:22', '2019-03-22 14:58:22');
INSERT INTO `permission` VALUES (113, '1000000100079524', '批量删除', '批量删除课程按钮', '/subject/batch/delete', 'subject:batchDelete', 89, 2, 0, '', 1, '2019-03-26 19:03:34', '2019-03-26 19:03:34');
INSERT INTO `permission` VALUES (114, '1000001665814828', '学院管理', '学院信息管理', '/institutes', 'institutes', 2, 1, 1, 'fa fa-circle-o', 1, '2019-04-11 20:37:04', '2019-04-11 20:37:04');
INSERT INTO `permission` VALUES (115, '1000000075001179', '查询', '学院信息查询', '/institute/list', 'institute:list', 114, 2, 0, '', 1, '2019-04-11 20:43:59', '2019-04-11 20:43:59');
INSERT INTO `permission` VALUES (116, '1000000826591162', '新增', '新增按钮', '/institute/add', 'institute:add', 114, 2, 0, '', 1, '2019-04-11 20:45:06', '2019-04-11 20:45:06');
INSERT INTO `permission` VALUES (117, '1000002056106190', '编辑', '编辑按钮', '/institute/edit', 'institute:edit', 114, 2, 0, '', 1, '2019-04-11 20:46:01', '2019-04-11 20:46:01');
INSERT INTO `permission` VALUES (118, '1000000206952702', '删除', '删除按钮', '/institute/delete', 'institute:delete', 114, 2, 0, '', 1, '2019-04-11 20:46:43', '2019-04-11 20:46:43');
INSERT INTO `permission` VALUES (119, '1000001181531387', '批量删除', '批量删除按钮', '/institute/batch/delete', 'institute:batchDelete', 114, 2, 0, '', 1, '2019-04-11 20:47:52', '2019-04-11 20:47:52');
INSERT INTO `permission` VALUES (120, '1000001516188546', '班级管理', '班级管理', '/classes', 'classes', 2, 1, 2, 'fa fa-circle-o', 1, '2019-04-13 15:37:21', '2019-04-13 15:37:37');
INSERT INTO `permission` VALUES (121, '1000000790358121', '查询', '查询按钮', '/classes/list', 'classes:list', 120, 2, 0, '', 1, '2019-04-13 15:38:44', '2019-04-13 15:38:44');
INSERT INTO `permission` VALUES (122, '1000001707301213', '新增', '新增按钮', '/classes/add', 'classes:add', 120, 2, 0, '', 1, '2019-04-13 15:39:25', '2019-04-13 15:39:25');
INSERT INTO `permission` VALUES (123, '1000001537406462', '编辑', '编辑按钮', '/classes/edit', 'classes:edit', 120, 2, 0, '', 1, '2019-04-13 15:40:14', '2019-04-13 15:40:14');
INSERT INTO `permission` VALUES (124, '1000000382493709', '删除', '删除按钮', '/classes/delete', 'classes:delete', 120, 2, 0, '', 1, '2019-04-13 15:40:53', '2019-04-13 15:40:53');
INSERT INTO `permission` VALUES (125, '1000001943891212', '批量删除', '批量删除按钮', '/classes/batch/delete', 'classes:batchDelete', 120, 2, 0, '', 1, '2019-04-13 15:41:44', '2019-04-13 15:41:44');
INSERT INTO `permission` VALUES (126, '1000000812880328', '考试情况', '数据统计菜单', '/datas', 'datas', 52, 1, 6, 'fa fa-circle-o', 1, '2019-04-24 18:11:24', '2019-06-01 00:25:15');
INSERT INTO `permission` VALUES (127, '1000000666428532', '查询', '查询按钮', '/data/list', 'data:list', 126, 2, 0, '', 1, '2019-04-24 18:12:26', '2019-04-24 18:12:26');
INSERT INTO `permission` VALUES (128, '1000000408456990', '批量导入用户', '批量导入用户按钮', '/user/importUserExcel', 'user:importUserExcel', 3, 2, 0, '', 1, '2019-04-27 20:50:27', '2019-04-27 20:50:27');
INSERT INTO `permission` VALUES (129, '1000000067717336', '禁用', '禁用用户按钮', '/user/ban', 'user:ban', 3, 2, 0, '', 1, '2019-05-09 18:24:44', '2019-05-09 18:24:44');
INSERT INTO `permission` VALUES (130, '1000001960327190', '启用', '启用用户按钮', '/user/enable', 'user:enable', 3, 2, 0, '', 1, '2019-05-09 18:25:27', '2019-05-09 18:25:27');
INSERT INTO `permission` VALUES (131, '1000000048936375', '批量禁用', '批量禁用用户按钮', '/user/batch/ban', 'user:batchBan', 3, 2, 0, '', 1, '2019-05-09 18:26:29', '2019-05-09 18:26:29');
INSERT INTO `permission` VALUES (132, '1000002019782608', '批量启用', '批量启用用户按钮', '/user/batch/enbale', 'user:batchEnable', 3, 2, 0, '', 1, '2019-05-09 18:27:11', '2019-05-09 18:27:11');
INSERT INTO `permission` VALUES (133, '1000001282126651', '访问权限', '允许访问管理后台权限按钮', '/manager', 'manager', 1, 2, 0, NULL, 1, '2019-05-15 01:14:46', '2019-05-15 13:56:40');
INSERT INTO `permission` VALUES (134, '1000001851940032', '批量分配角色', '批量分配角色按钮', '/user/batch/assign/role', 'user:batchAssignRole', 3, 2, 0, '', 1, '2019-05-29 00:42:37', '2019-05-29 00:42:37');

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
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '答案',
  `parse` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '答案解析',
  `score` int(8) NULL DEFAULT NULL COMMENT '题目分值',
  `difficulty` int(8) NULL DEFAULT 1 COMMENT '题目难度',
  `subject_id` int(8) NULL DEFAULT NULL COMMENT '学科ID',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `status` int(8) NULL DEFAULT 1 COMMENT '0表示未考试题目,1表示已考试题目',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (78, 'C语言属于（    ）', '', 0, '机器语言', '低级语言', '中级语言', '高级语言', 'D', '无解析', 2, 1, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (79, 'C语言规定，在一个源程序中，main函数的位置（    ）', '', 0, '必须在最开始', '必须在系统调用的库函数的后面', '可以任意', '必须在最后', 'C', '无解析', 2, 1, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (80, 'C语言程序的块注释是（    ）', '', 0, '由“/*”开头，“*/”结尾', '由“/*”开头，“/*”结尾', '由“//”开头', '由“/*”或“//”开头，“*/”结尾', 'A', '无解析', 2, 1, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (81, 'C语言中用于结构化程序设计的3种基本结构是（    ）', '', 0, 'if、switch、break', '顺序结构、选择结构、循环结构', 'for、while、do-while', 'if、for、continue', 'B', '无解析', 2, 1, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (82, 'C语言提供的合法的数据类型的关键字是（      ）', '', 0, 'integer', 'long　', 'Double', 'Char', 'B', '无解析', 2, 1, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (83, '在C语言中，要求参加运算的数必须时整数的运算符是（     ）', '', 0, '/', '%', '*', '=', 'B', '无解析', 2, 1, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (84, '设x,i,j,k都是int型变量，表达式x=(i=4,j=16,k=32)计算后，x的值为（    ）', '', 0, '表达式不正确', '32', '16', '4', 'B', '无解析', 2, 3, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (85, '已知int x=1,y=2,z；执行（z=1.0/y*x）语句后z的值是（     ）', '', 0, '0', '0', '1', '2', 'C', '无解析', 2, 1, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (86, '若有说明语句：int a;float b;,以下输入语句正确的是（      ）', '', 0, 'scanf(“%f%f”,&a,&b)', 'scanf(“%f%d”,&a,&b)', 'scanf(“%d%f”,&a,&b)', 'scanf(“%6.2f%6.2f”,&a,&b)', 'C', '无解析', 2, 1, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (87, '设有: int a=1,b=2,c=3,d=4,m=2,n=2; 执行 (m=a>b)&&(n=c>d)后,n的值是（     ）', '', 0, '1', '2', '3', '4', 'B', '无解析', 2, 3, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (88, '以下选项中,当x为大于l的奇数时,值为0的表达式是（     ）', '', 0, 'x%2==1', 'x/2', 'x%2!=0', 'x%2==0', 'D', '无解析', 2, 2, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (89, 'C语言中while和do-while循环的主要区别是（     ）', '', 0, 'while的循环控制条件比do–while的循环控制条件严格', 'do-while的循环体至少无条件执行一次', 'do-while允许从外部转到循环体内', 'do-while的循环体不能是复合语句', 'B', '无解析', 2, 1, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (90, '若k为整型变量，则下面while循环执行的次数为：（      ）。\nk=10;\nwhile(k==0)  k=k-1;', '', 0, '0', '10', '1', '无数次', 'A', '无解析', 2, 2, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (91, '一个C源程序至少应包括一个_______。', '', 2, '', '', '', '', '函数', '无解析', 1, 2, 1, '2019-06-10 10:24:36', '2019-06-13 11:20:04', 0);
INSERT INTO `question` VALUES (92, 'C 语言中的标识符只能由 _________、__________ 和 _________ 三种字符组成，且第一个字符必须是 __________。', '', 2, '', '', '', '', '字母、数字、下划线', '无解析', 3, 2, 1, '2019-06-10 10:24:36', '2019-06-13 11:22:17', 0);
INSERT INTO `question` VALUES (93, 'C语言中的实型变量分为_________和__________两种类型。', '', 2, '', '', '', '', 'float、double', '无解析', 2, 2, 1, '2019-06-10 10:24:36', '2019-06-13 11:23:44', 0);
INSERT INTO `question` VALUES (94, 'C语言中，函数由函数首部和___________组成。', '', 2, '', '', '', '', '函数体', '无解析', 1, 2, 1, '2019-06-10 10:24:36', '2019-06-13 11:24:09', 0);
INSERT INTO `question` VALUES (95, '编写一个C程序，输入a,b两个值，输出这两个数的和。', '', 2, '', '', '', '', '# include <stdio.h>\nint main()\n{int a,b,c;\nscanf(\"%d,%d\",&a,&b);\nc=a+b;\nprintf(\"c=%d\",c);\nreturn 0;', '无解析', 10, 2, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (129, '程序输出结果为：', '<pre><code>\r\n<span class=\"hljs-meta\">#<span class=\"hljs-meta-keyword\">include</span><span class=\"hljs-meta-string\">&lt;stdio.h&gt;</span></span>\r\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">int</span> <span class=\"hljs-title\">main</span><span class=\"hljs-params\">( )</span>\r\n</span>{ <span class=\"hljs-keyword\">int</span> x=<span class=\"hljs-number\">0</span>,y=<span class=\"hljs-number\">0</span>,z=<span class=\"hljs-number\">0</span>;\r\n<span class=\"hljs-keyword\">if</span> (x==y+z)  <span class=\"hljs-built_in\">printf</span>(“***”);\r\n<span class=\"hljs-keyword\">else</span>  <span class=\"hljs-built_in\">printf</span>(“###”);\r\n}<span class=\"hljs-string\">\"</span>\r\n</code></pre>', 0, '有语法错误，不能通过编译', '输出：***', '可以编译，但不能通过连接，所以不能运行', '输出：###', 'B', '无', 2, 1, 1, '2019-06-10 10:28:04', '2019-06-10 10:28:04', 0);
INSERT INTO `question` VALUES (130, '以下程序的运行结果是（     ）', '<pre><code><span class=\"hljs-keyword\">int</span>  main()\r\n { <span class=\"hljs-keyword\">int</span> <span class=\"hljs-keyword\">m</span>=<span class=\"hljs-number\">5</span>;\r\n<span class=\"hljs-keyword\">if</span>(<span class=\"hljs-keyword\">m</span>++&gt;<span class=\"hljs-number\">5</span>)  <span class=\"hljs-keyword\">printf</span>(“%d\\n”,<span class=\"hljs-keyword\">m</span>);\r\n<span class=\"hljs-keyword\">else</span>       <span class=\"hljs-keyword\">printf</span>(“%d\\n”,<span class=\"hljs-keyword\">m</span>--); }\r\n</code></pre>', 0, '4', '5', '6', '7', 'C', '无', 2, 2, 1, '2019-06-10 10:29:40', '2019-06-10 10:29:40', 0);
INSERT INTO `question` VALUES (131, '以下程序的运行结果是：             ', '<pre><code><span class=\"hljs-meta\"># <span class=\"hljs-meta-keyword\">include</span> <span class=\"hljs-meta-string\">&lt;stdio.h&gt;</span></span>\r\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">int</span> <span class=\"hljs-title\">main</span><span class=\"hljs-params\">( )</span> \r\n</span>{<span class=\"hljs-keyword\">int</span> a,b,s; \r\na = <span class=\"hljs-number\">4</span>;b =<span class=\"hljs-number\">18</span>; \r\ns = (a + b)*<span class=\"hljs-number\">3</span>;\r\n<span class=\"hljs-built_in\">printf</span>(“(a+b)*<span class=\"hljs-number\">3</span>=%d\\n”,s); \r\n<span class=\"hljs-keyword\">return</span> <span class=\"hljs-number\">0</span>;     }\r\n</code></pre>', 2, '', '', '', '', '（a+b）=66', '无', 5, 1, 1, '2019-06-10 10:31:23', '2019-06-10 10:31:23', 0);
INSERT INTO `question` VALUES (132, '输入一个三位正整数，判断该数是否为水仙花数。（水仙花数的是指一个三位数，其各位数字的立方各等于该数本身。例如：153是一个水仙花数，因为153=1^3+5^3+3^3）\r\n', '', 2, '', '', '', '', '无', '无', 10, 2, 1, '2019-06-10 10:37:16', '2019-06-10 10:37:16', 0);
INSERT INTO `question` VALUES (133, '编写程序，输入一个数，输出该数的阶乘。输出数据格式为：5！=120', '', 2, '', '', '', '', '无', '无\r\n', 10, 2, 1, '2019-06-10 10:37:45', '2019-06-10 10:37:45', 0);

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
INSERT INTO `role` VALUES (1, '1', '超级管理员', '超级管理员', 1, '2018-12-28 20:30:05', '2018-12-28 20:30:05');
INSERT INTO `role` VALUES (2, '2', '老师', '老师', 1, '2018-12-30 23:35:19', '2019-01-13 00:00:36');
INSERT INTO `role` VALUES (3, '3', '学生', '学生', 1, '2018-12-30 23:35:44', '2019-01-13 00:00:47');
INSERT INTO `role` VALUES (4, '4', '数据库管理员', '数据库管理员', 1, '2019-01-12 11:50:22', '2019-01-12 11:50:22');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `permission_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4415 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (4247, '1', '1');
INSERT INTO `role_permission` VALUES (4248, '1', '1000001282126651');
INSERT INTO `role_permission` VALUES (4249, '1', '1000000602555213');
INSERT INTO `role_permission` VALUES (4250, '1', '1000000899091444');
INSERT INTO `role_permission` VALUES (4251, '1', '1000001224543466');
INSERT INTO `role_permission` VALUES (4252, '1', '1000001747915483');
INSERT INTO `role_permission` VALUES (4253, '1', '1000000864155694');
INSERT INTO `role_permission` VALUES (4254, '1', '1000000167185653');
INSERT INTO `role_permission` VALUES (4255, '1', '1000000850255464');
INSERT INTO `role_permission` VALUES (4256, '1', '1000000553415807');
INSERT INTO `role_permission` VALUES (4257, '1', '1000002085828985');
INSERT INTO `role_permission` VALUES (4258, '1', '1000000583815309');
INSERT INTO `role_permission` VALUES (4259, '1', '1000000414556681');
INSERT INTO `role_permission` VALUES (4260, '1', '1000001670195971');
INSERT INTO `role_permission` VALUES (4261, '1', '1000000100079524');
INSERT INTO `role_permission` VALUES (4262, '1', '1000000233644405');
INSERT INTO `role_permission` VALUES (4263, '1', '1000000159347988');
INSERT INTO `role_permission` VALUES (4264, '1', '1000001743618837');
INSERT INTO `role_permission` VALUES (4265, '1', '1000000098066544');
INSERT INTO `role_permission` VALUES (4266, '1', '1000001512619368');
INSERT INTO `role_permission` VALUES (4267, '1', '1000000727959093');
INSERT INTO `role_permission` VALUES (4268, '1', '1000000698074212');
INSERT INTO `role_permission` VALUES (4269, '1', '1000000243343801');
INSERT INTO `role_permission` VALUES (4270, '1', '1000000426716222');
INSERT INTO `role_permission` VALUES (4271, '1', '1000000773560150');
INSERT INTO `role_permission` VALUES (4272, '1', '1000000658745124');
INSERT INTO `role_permission` VALUES (4273, '1', '1000000281400324');
INSERT INTO `role_permission` VALUES (4274, '1', '1000000399266971');
INSERT INTO `role_permission` VALUES (4275, '1', '1000000812880328');
INSERT INTO `role_permission` VALUES (4276, '1', '1000000666428532');
INSERT INTO `role_permission` VALUES (4277, '1', '2');
INSERT INTO `role_permission` VALUES (4278, '1', '1000001665814828');
INSERT INTO `role_permission` VALUES (4279, '1', '1000000075001179');
INSERT INTO `role_permission` VALUES (4280, '1', '1000000826591162');
INSERT INTO `role_permission` VALUES (4281, '1', '1000002056106190');
INSERT INTO `role_permission` VALUES (4282, '1', '1000000206952702');
INSERT INTO `role_permission` VALUES (4283, '1', '1000001181531387');
INSERT INTO `role_permission` VALUES (4284, '1', '1000001516188546');
INSERT INTO `role_permission` VALUES (4285, '1', '1000000790358121');
INSERT INTO `role_permission` VALUES (4286, '1', '1000001707301213');
INSERT INTO `role_permission` VALUES (4287, '1', '1000001537406462');
INSERT INTO `role_permission` VALUES (4288, '1', '1000000382493709');
INSERT INTO `role_permission` VALUES (4289, '1', '1000001943891212');
INSERT INTO `role_permission` VALUES (4290, '1', '201');
INSERT INTO `role_permission` VALUES (4291, '1', '20101');
INSERT INTO `role_permission` VALUES (4292, '1', '20102');
INSERT INTO `role_permission` VALUES (4293, '1', '20103');
INSERT INTO `role_permission` VALUES (4294, '1', '20104');
INSERT INTO `role_permission` VALUES (4295, '1', '20105');
INSERT INTO `role_permission` VALUES (4296, '1', '20106');
INSERT INTO `role_permission` VALUES (4297, '1', '1000000408456990');
INSERT INTO `role_permission` VALUES (4298, '1', '1000000067717336');
INSERT INTO `role_permission` VALUES (4299, '1', '1000001960327190');
INSERT INTO `role_permission` VALUES (4300, '1', '1000000048936375');
INSERT INTO `role_permission` VALUES (4301, '1', '1000002019782608');
INSERT INTO `role_permission` VALUES (4302, '1', '1000001851940032');
INSERT INTO `role_permission` VALUES (4303, '1', '202');
INSERT INTO `role_permission` VALUES (4304, '1', '20201');
INSERT INTO `role_permission` VALUES (4305, '1', '20202');
INSERT INTO `role_permission` VALUES (4306, '1', '20203');
INSERT INTO `role_permission` VALUES (4307, '1', '20204');
INSERT INTO `role_permission` VALUES (4308, '1', '20205');
INSERT INTO `role_permission` VALUES (4309, '1', '20206');
INSERT INTO `role_permission` VALUES (4310, '1', '203');
INSERT INTO `role_permission` VALUES (4311, '1', '20301');
INSERT INTO `role_permission` VALUES (4312, '1', '20302');
INSERT INTO `role_permission` VALUES (4313, '1', '20303');
INSERT INTO `role_permission` VALUES (4314, '1', '20304');
INSERT INTO `role_permission` VALUES (4315, '1', '1000000863853891');
INSERT INTO `role_permission` VALUES (4316, '1', '1000001264798222');
INSERT INTO `role_permission` VALUES (4317, '1', '1000000432183856');
INSERT INTO `role_permission` VALUES (4318, '1', '1000000237721285');
INSERT INTO `role_permission` VALUES (4319, '1', '1000001238193773');
INSERT INTO `role_permission` VALUES (4320, '1', '1000001305005793');
INSERT INTO `role_permission` VALUES (4321, '1', '1000001679037501');
INSERT INTO `role_permission` VALUES (4322, '1', '1000001011730177');
INSERT INTO `role_permission` VALUES (4323, '1', '1000001312374743');
INSERT INTO `role_permission` VALUES (4324, '1', '1000001507480127');
INSERT INTO `role_permission` VALUES (4325, '1', '1000000224901858');
INSERT INTO `role_permission` VALUES (4326, '1', '1000001579533936');
INSERT INTO `role_permission` VALUES (4327, '1', '1000000663968031');
INSERT INTO `role_permission` VALUES (4328, '1', '1000000322655547');
INSERT INTO `role_permission` VALUES (4329, '1', '1000001419287014');
INSERT INTO `role_permission` VALUES (4330, '1', '1000002075182223');
INSERT INTO `role_permission` VALUES (4331, '1', '1000000976625379');
INSERT INTO `role_permission` VALUES (4332, '1', '1000002127467055');
INSERT INTO `role_permission` VALUES (4333, '1', '1000001458372033');
INSERT INTO `role_permission` VALUES (4334, '1', '1000001832967209');
INSERT INTO `role_permission` VALUES (4335, '1', '1000000754923037');
INSERT INTO `role_permission` VALUES (4336, '1', '1000000759248744');
INSERT INTO `role_permission` VALUES (4337, '1', '4');
INSERT INTO `role_permission` VALUES (4338, '1', '401');
INSERT INTO `role_permission` VALUES (4339, '1', '1000001992372345');
INSERT INTO `role_permission` VALUES (4340, '1', '1000002083579304');
INSERT INTO `role_permission` VALUES (4341, '1', '1000000171409776');
INSERT INTO `role_permission` VALUES (4342, '1', '1000000587822241');
INSERT INTO `role_permission` VALUES (4343, '1', '1000000493635111');
INSERT INTO `role_permission` VALUES (4344, '1', '1000000318760332');
INSERT INTO `role_permission` VALUES (4345, '1', '3');
INSERT INTO `role_permission` VALUES (4346, '1', '301');
INSERT INTO `role_permission` VALUES (4347, '2', '1');
INSERT INTO `role_permission` VALUES (4348, '2', '1000001282126651');
INSERT INTO `role_permission` VALUES (4349, '2', '1000000602555213');
INSERT INTO `role_permission` VALUES (4350, '2', '1000000899091444');
INSERT INTO `role_permission` VALUES (4351, '2', '1000001224543466');
INSERT INTO `role_permission` VALUES (4352, '2', '1000001747915483');
INSERT INTO `role_permission` VALUES (4353, '2', '1000000864155694');
INSERT INTO `role_permission` VALUES (4354, '2', '1000000167185653');
INSERT INTO `role_permission` VALUES (4355, '2', '1000000850255464');
INSERT INTO `role_permission` VALUES (4356, '2', '1000000553415807');
INSERT INTO `role_permission` VALUES (4357, '2', '1000002085828985');
INSERT INTO `role_permission` VALUES (4358, '2', '1000000583815309');
INSERT INTO `role_permission` VALUES (4359, '2', '1000000414556681');
INSERT INTO `role_permission` VALUES (4360, '2', '1000001670195971');
INSERT INTO `role_permission` VALUES (4361, '2', '1000000100079524');
INSERT INTO `role_permission` VALUES (4362, '2', '1000000233644405');
INSERT INTO `role_permission` VALUES (4363, '2', '1000000159347988');
INSERT INTO `role_permission` VALUES (4364, '2', '1000001743618837');
INSERT INTO `role_permission` VALUES (4365, '2', '1000000098066544');
INSERT INTO `role_permission` VALUES (4366, '2', '1000001512619368');
INSERT INTO `role_permission` VALUES (4367, '2', '1000000727959093');
INSERT INTO `role_permission` VALUES (4368, '2', '1000000698074212');
INSERT INTO `role_permission` VALUES (4369, '2', '1000000243343801');
INSERT INTO `role_permission` VALUES (4370, '2', '1000000426716222');
INSERT INTO `role_permission` VALUES (4371, '2', '1000000773560150');
INSERT INTO `role_permission` VALUES (4372, '2', '1000000658745124');
INSERT INTO `role_permission` VALUES (4373, '2', '1000000281400324');
INSERT INTO `role_permission` VALUES (4374, '2', '1000000399266971');
INSERT INTO `role_permission` VALUES (4375, '2', '1000000812880328');
INSERT INTO `role_permission` VALUES (4376, '2', '1000000666428532');
INSERT INTO `role_permission` VALUES (4377, '2', '2');
INSERT INTO `role_permission` VALUES (4378, '2', '1000001665814828');
INSERT INTO `role_permission` VALUES (4379, '2', '1000000075001179');
INSERT INTO `role_permission` VALUES (4380, '2', '1000000826591162');
INSERT INTO `role_permission` VALUES (4381, '2', '1000002056106190');
INSERT INTO `role_permission` VALUES (4382, '2', '1000000206952702');
INSERT INTO `role_permission` VALUES (4383, '2', '1000001181531387');
INSERT INTO `role_permission` VALUES (4384, '2', '1000001516188546');
INSERT INTO `role_permission` VALUES (4385, '2', '1000000790358121');
INSERT INTO `role_permission` VALUES (4386, '2', '1000001707301213');
INSERT INTO `role_permission` VALUES (4387, '2', '1000001537406462');
INSERT INTO `role_permission` VALUES (4388, '2', '1000000382493709');
INSERT INTO `role_permission` VALUES (4389, '2', '1000001943891212');
INSERT INTO `role_permission` VALUES (4390, '2', '201');
INSERT INTO `role_permission` VALUES (4391, '2', '20101');
INSERT INTO `role_permission` VALUES (4392, '2', '20102');
INSERT INTO `role_permission` VALUES (4393, '2', '20103');
INSERT INTO `role_permission` VALUES (4394, '2', '20104');
INSERT INTO `role_permission` VALUES (4395, '2', '20105');
INSERT INTO `role_permission` VALUES (4396, '2', '20106');
INSERT INTO `role_permission` VALUES (4397, '2', '1000000408456990');
INSERT INTO `role_permission` VALUES (4398, '2', '1000000067717336');
INSERT INTO `role_permission` VALUES (4399, '2', '1000001960327190');
INSERT INTO `role_permission` VALUES (4400, '2', '1000000048936375');
INSERT INTO `role_permission` VALUES (4401, '2', '1000002019782608');
INSERT INTO `role_permission` VALUES (4402, '2', '1000001851940032');
INSERT INTO `role_permission` VALUES (4403, '4', '1');
INSERT INTO `role_permission` VALUES (4404, '4', '1000001282126651');
INSERT INTO `role_permission` VALUES (4405, '4', '4');
INSERT INTO `role_permission` VALUES (4406, '4', '401');
INSERT INTO `role_permission` VALUES (4407, '4', '1000001992372345');
INSERT INTO `role_permission` VALUES (4408, '4', '1000002083579304');
INSERT INTO `role_permission` VALUES (4409, '4', '1000000171409776');
INSERT INTO `role_permission` VALUES (4410, '4', '1000000587822241');
INSERT INTO `role_permission` VALUES (4411, '4', '1000000493635111');
INSERT INTO `role_permission` VALUES (4412, '4', '1000000318760332');
INSERT INTO `role_permission` VALUES (4413, '4', '3');
INSERT INTO `role_permission` VALUES (4414, '4', '301');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考生主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学科名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程描述',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程封面',
  `sort` int(10) NULL DEFAULT NULL COMMENT '排序',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `status` int(4) NULL DEFAULT 0 COMMENT '课程状态,0表示正常,1表示弃用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, '1', 'C语言程序设计', '计算机专业学生必修课程', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/346fae5706c7044dd530304c25a21d72.jpg', 1, '超级管理员', '2019-01-18 19:23:42', '2019-05-28 22:38:19', 0);
INSERT INTO `subject` VALUES (2, '1', 'Java程序设计', '软件工程专业学生必修课程', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/6bea0f0034d2f0b9a236346fc3f171fb.jpg', 2, '超级管理员', '2019-01-18 19:25:09', '2019-05-28 22:38:33', 0);
INSERT INTO `subject` VALUES (3, '1', '数据库', '软件工程专业学生必须课程', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/7080a373597bdc28e123cdce4d4893a7.jpg', 3, '超级管理员', '2019-01-23 23:40:05', '2019-05-28 22:38:50', 0);
INSERT INTO `subject` VALUES (6, '1', 'Python程序设计', '计算机科学与技术专业必修课程', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/02017c3f559b8307455898d3e860673d.jpg', 4, '超级管理员', '2019-03-26 19:42:15', '2019-05-28 22:39:01', 0);
INSERT INTO `subject` VALUES (7, '1', '大数据理论', '大数据专业学生必修课程', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/56d9260f1724cd7493eeec4e6c2dcded.jpg', 5, '超级管理员', '2019-04-05 17:32:13', '2019-05-28 22:39:19', 0);

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
INSERT INTO `sys_config` VALUES (1, 'SITE_PHONE', '+86-15709620338', 1, '云存储配置信息');
INSERT INTO `sys_config` VALUES (5, 'SITE_FAX', '+86-15709620338', 1, '网站名称');
INSERT INTO `sys_config` VALUES (6, 'SITE_EMAIL', 'hungkuei@163.com', 1, '网站关键字');
INSERT INTO `sys_config` VALUES (7, 'SITE_ADDRESS', '宁夏石嘴山市大武口区山水大道学院路1号', 1, '网站描述');
INSERT INTO `sys_config` VALUES (8, 'SITE_NAME', 'OnlineExam | C语言在线考试系统', 1, '站长头像');
INSERT INTO `sys_config` VALUES (9, 'SITE_URL', 'http://exam.nxlgjsj.cn', 1, '站长名称');
INSERT INTO `sys_config` VALUES (10, 'SITE_DESC', 'OnlineExam | C语言在线考试系统是一个在线测试学习系统，并用于辅助课程教学和学生学习。', 1, '站长描述');
INSERT INTO `sys_config` VALUES (11, 'CLOUD_STORAGE_CONFIG', '{\"type\":3,\"qiniuDomain\":\"\",\"qiniuPrefix\":\"\",\"qiniuAccessKey\":\"\",\"qiniuSecretKey\":\"\",\"qiniuBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"https://online-exam-1256117146.cos.ap-beijing.myqcloud.com\",\"qcloudPrefix\":\"img/exam\",\"qcloudSecretId\":\"AKIDrUs0sUOvkOnvoRttjJdhU1IJ4Zon7yA6\",\"qcloudSecretKey\":\"mIYcT6ViiT1LRKzRghV6UfcLrAF6j9LK\",\"qcloudBucketName\":\"online-exam-1256117146\",\"qcloudRegion\":\"ap-beijing\"}', 1, '百度推送地址');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书签名',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, 'Linux', '111', '2018-01-14 21:35:31', '2018-07-25 18:53:34');
INSERT INTO `tag` VALUES (2, 'Java', '222', '2018-01-14 21:35:45', '2018-07-25 18:53:38');
INSERT INTO `tag` VALUES (3, 'Spring', NULL, '2018-01-14 21:35:52', '2018-01-14 21:35:52');
INSERT INTO `tag` VALUES (4, 'Spring Boot', NULL, '2018-01-14 21:36:01', '2018-01-14 21:36:01');
INSERT INTO `tag` VALUES (5, '其他', '其他', '2018-07-25 18:55:06', '2018-07-25 18:55:06');
INSERT INTO `tag` VALUES (6, 'C语言在线考试系统', '在线考试系统', '2019-04-07 18:36:34', '2019-04-07 18:36:34');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `class_id` int(11) NULL DEFAULT NULL COMMENT '班级id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人描述',
  `salt` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密盐值',
  `grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `sex` int(255) NULL DEFAULT NULL COMMENT '年龄：1男0女',
  `age` int(3) NULL DEFAULT NULL COMMENT '年龄',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `status` int(1) NOT NULL COMMENT '用户状态：1有效; 2删除',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `last_login_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登录时间',
  PRIMARY KEY (`id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 253 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', 1, 'admin', '37f2dd3a7e5163c9373b7cf77044c2a0', '95后少年，热爱写bug，热爱编程，热爱学习，分享一些个人项目经验，共同学习，少走弯路。Just do it！', '347172bacda0929395c3ea4736444ec9', '2015', '超级管理员', '1468584274@qq.com', '15709620339', 1, 23, 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/7e60c1d428c7a75ffbb8c6813a0d695e.jpg', 1, '2018-05-23 21:22:06', '2019-05-28 22:28:36', '2019-07-05 09:47:37');
INSERT INTO `user` VALUES (46, '1000002093435045', 1, '1001', 'be4c1edad579aebad942b68e6dca05c3', '', '102134e99552ac7f79e6c4b512d114c8', '2015', '马萍', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-11 17:44:11');
INSERT INTO `user` VALUES (47, '1000000738386653', 2, '36418102', '69dc8856a94cadd10c4c803f4bd87a7e', '', '37555c7f1e57151cec0da5db8d53818b', '2018', '马娟', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 16:05:12');
INSERT INTO `user` VALUES (48, '1000001232936417', 2, '36418103', '98e9c735b45e4c02b3e25c8303b62a5e', '', 'c072e9f6165617b45e970bbcf0aa6b70', '2018', '马文杰', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (49, '1000000329142518', 2, '36418105', '36f49fec4726804c5b0d8710fa275026', '', '937e63376250da9ebf637edd3f536fd9', '2018', '吴子旭', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (50, '1000001362277777', 2, '36418106', '2b3a14e91d4d4905dd1805192b57f0e0', '', 'd65eec6fc0c98e0c458ae96bdc8d121e', '2018', '马宁', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (51, '1000000768154633', 2, '36418108', 'f9c79fbb336c8552f6752eb33b482337', '', '0b9e7631b2947ddb69715da2094ab283', '2018', '刘赫', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (52, '1000001364687181', 2, '36418110', 'e14c346c6f3bce9aee2c583abcb544ec', '', '6933fd66db7b0e926e7fe06161d99413', '2018', '赫旭东', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (53, '1000000132791333', 2, '36418111', '5c7d99bb6773306dc371798d9f29703e', '', 'd68078657dd03733c56f7ee75b175623', '2018', '张昊', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (54, '1000000099472040', 2, '36418115', '664a519f2703ab961e741ab9f9ad1b08', '', 'c340e04abfd866538cf658b208a83d76', '2018', '孙正华', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (55, '1000000634241647', 2, '36418117', 'f4cbf9e896a2e4a4b47c5fd26b4bb620', '', '8b48b5531e5b974e94623715418b8797', '2018', '李荣', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (56, '1000001655042422', 2, '36418119', 'd9a8caedfec0cd3d671a30bd4467893e', '', '3fb09c242dd3a34eb447d86c4e40c2c7', '2018', '田世生', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (57, '1000000077178849', 2, '36418120', '30873690b6600432adc9aa981300c309', '', '18dead73cb14ba34f530c2cf8c17868f', '2018', '邵同同', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (58, '1000000353678078', 2, '36418122', '0327215d85a5ab199e71b0741d27cc3d', '', '4f69884f662bbb1805e351d1b948f918', '2018', '赵连龙', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (59, '1000000773366546', 2, '36418123', '0902779dc1753390098959029f609541', '', 'ae1cb728b9db8fb21924857af9e56986', '2018', '李小东', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (60, '1000000711412775', 2, '36418124', '5e36562e79b15a78b09568427f03b697', '', '0e4437ebb42a48d73cf809eaadee19a5', '2018', '丁越', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (61, '1000000548067370', 2, '36418126', '3568dc68a46dc8e8f650fcadbae89bdd', '', '240b4ea35de0facb41107825789e7529', '2018', '江永文', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (62, '1000001226341840', 2, '36418130', '06dfdd141cba7b14719fb78112c98da4', '', '883c6518a73bdb2a90e666bed777a84e', '2018', '贺鹏', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (63, '1000000998890425', 2, '36418131', 'd4d3072e43cfb46e73ad3ecadaf8d09a', '', '7a8f8ab820aca4883fef0ea89e139694', '2018', '樊重阳', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (64, '1000001422042463', 2, '36418136', 'f6ac9eabbcc2e838892cd16f998a9780', '', '3cb99035d7a9fc7a4e09ac582b9196ce', '2018', '马龙', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (65, '1000001103422463', 2, '36418137', '61a0b840cb99bffd624313bb79046fd4', '', 'c84d10a7af81443858ea03a4995c4747', '2018', '马国东', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (66, '1000001905036577', 2, '36418138', '1453ddc0ad3f97580fc2b697a4ee0f6d', '', '2434e73685ad35077a467383dee60f7d', '2018', '马风虎', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (67, '1000001328951620', 2, '36418140', 'ba55c78e90ae6af8978ed1036bdacf12', '', '5ca607f4e72e40e66cf836d59c4fc02e', '2018', '李儒冉', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (68, '1000000950567584', 2, '36418141', '483d4de9946dc292f00837be8e2088f1', '', 'b4cd9537eb3d727e24e5b175a368cb72', '2018', '马浩', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (69, '1000000258775967', 2, '36418142', '2423db2cc0ded9d639d42c9fccbfecc1', '', '786f03ff7b2354fec6c659ce0dacc0f8', '2018', '董小川', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (70, '1000001464610296', 2, '36418144', '5f44379c6e2ae9b4e78b3f8cbb0a5cb9', '', '539d6fd1fb2f6c4ffe872407b44840fc', '2018', '史福荣', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (71, '1000000553300995', 2, '36418145', '907d7543d7700f5ba753ed51958546e1', '', 'b7d5c6789add034a82d5531a3c2994d9', '2018', '李磊', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (72, '1000000285040298', 2, '36418146', '33075d022ca6112a91b5f7a974ab4119', '', 'd48c30f8e4f99b6e9a144a5732f562b5', '2018', '邵凯宁', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (73, '1000001100760136', 2, '36418147', '1a71fe58b2e471d0c888eb199ba96b95', '', '22a4303f7d64e3a3a470ec18b51970d9', '2018', '高超', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (74, '1000000928294998', 2, '36418151', 'fd4ca0eededaea0bfa585da345963ab1', '', '0937ddcc2ce4ec46b1633807a8f393d9', '2018', '班澈', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (75, '1000000017164434', 2, '36418152', 'c6f981b21ca00119c7aeadadf0613cb9', '', 'b0e4b799ff4ceaaff0fbe5e9be4e2db5', '2018', '杨啸天', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (76, '1000000332452198', 2, '36418153', '50ddf1edd9050e988add67190ac46b31', '', '545d93e897bb9aaad85f4a8da7276076', '2018', '柳靖', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (77, '1000000058743441', 2, '36418155', '5ff7b049aeb3850d7997847966dc44fd', '', '214c436497f0611341870b9e7ffac2c0', '2018', '蒋福文', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (78, '1000001708050136', 2, '36418157', 'ab80c2d10b804a9d1a058ede456fc7ea', '', '325bd27f2c4e6d7c7c206cb4edf141f1', '2018', '阎俊鹏', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (79, '1000001224615059', 2, '36418158', '7b100ed3d82cdafa86bf25585858f1ef', '', 'e77a4a3991a519b246906901fd486881', '2018', '高峻', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (80, '1000001621760425', 2, '36418160', 'bbbbf940c2b88fa60cf219d64d9e0b24', '', '3a496b62e2b1e223db1d6539b57d1ac7', '2018', '张生乾', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (81, '1000000127832604', 2, '36418162', 'd607aba4e70d0a6575cd8d02d37acc26', '', '3826afd3168c851a13d661d3e08783eb', '2018', '王锦明', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (82, '1000001032025346', 2, '36418163', 'a70dc4ce2ab2554a3f2e85040c4f584a', '', '03551d222729ded3f42321aad44f2f64', '2018', '王振东', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (83, '1000000021528355', 2, '36418164', 'fca8138e4b8e870503368cc5a001eb3b', '', 'c502036bdec3316e34ad1d6337fe1262', '2018', '吴永鑫', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (84, '1000002128683563', 2, '36418165', 'd882763afac3f6b5476aaf5e76d53cde', '', 'fe877fdca4e5913414f04f4066c1bcfc', '2018', '张宇', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (85, '1000000136977834', 2, '36418166', '55d9aa1eb5adf2296e720843d9236902', '', 'e7ef850b0246b5038c7a1db48ed0a868', '2018', '尤海龙', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (86, '1000000238372940', 2, '36418169', 'df871450b9866b2b0be6524cc4b5ab3e', '', '1e11781478777a6017ff1f93ec9c4c6d', '2018', '郭爱伟', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (87, '1000001979344631', 2, '36418171', '85d01e08816f969d659e51ed59103b35', '', 'f9b4617d02d7a4381fa1fb41485e4e07', '2018', '周玉玺', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (88, '1000001578602167', 2, '36418172', 'fd135cca3e24e1e9058ae2c0b8fe1ec5', '', '467fe67652ad80d205983783f0ee88ac', '2018', '张文', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (89, '1000000878273986', 2, '36418129', 'd8ffbf0288d3f3257d67df2f5c3ecf11', '', 'c4033c451184b5339945ce7f900238fe', '2018', '杨虎成', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (90, '1000001291157132', 3, '40418101', '5ded1ff67a049980b5ac97281911a4aa', '', '9e78119946e6da646ec52751e1cb6986', '2018', '邓富强', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (91, '1000000125238196', 3, '40418102', 'b2a67408fdde5e0ba347c5d8d8698fe5', '', 'fdfa6baf49bef915bc166d265b708fd9', '2018', '陈静琰', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (92, '1000000057343714', 3, '40418103', 'bc1fbbdc10d4415eefb945e531cad248', '', '62107593c07b6ba458e71f64a98f1591', '2018', '于志伟', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (93, '1000000933262066', 3, '40418104', 'b13a342d44761db6cc6e946427ad65f0', '', 'f6e52fe613cf833cf2fe148cf56f6066', '2018', '车金玉', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (94, '1000000436132200', 3, '40418105', '0d41940f4fd6de4094a6943af891cd4e', '', '46c5dc2f6516dff53ea12ca47d5b3adc', '2018', '魏爱青', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (95, '1000000644489782', 3, '40418106', 'd41c9461d8d2ebb4e1bb903a94c2dc0e', '', 'd7a486c79d7d12613e60f6b5024fa3d7', '2018', '李振亚', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (96, '1000001424018494', 3, '40418107', '879cb8260aa0f1eb2332c39bd9d3d7dd', '', '575337a0d15bdc90129179af17b0e56f', '2018', '叶涛', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (97, '1000000165587507', 3, '40418109', '9c75091a899abfcbc2327c3724c11e8b', '', '91490e888283802d6b34328b4d3ddf8d', '2018', '金宇贺', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (98, '1000002023792002', 3, '40418110', 'b381e70e17c7df0ebda618c0d1c6a70f', '', 'fbf8e5b1fb4a56527397573620b87a1d', '2018', '张小龙', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (99, '1000000963040852', 3, '40418111', '023219fb6bcaf1cc1c364eea1f2bfa15', '', 'f852ab66c5a7be5e85f9580c733bb0da', '2018', '杨伶利', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (100, '1000000376216028', 3, '40418112', 'e905fe9db839d7fb86e37ff57ee0635f', '', 'a9a53146fffabd537ae4356e54a49b74', '2018', '谢奇达', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (101, '1000001440651745', 3, '40418113', '5c5e2cb1cc7a83f00817aaa28365f43f', '', '3f572a9a04dd62e86db269a30e41647b', '2018', '别尚野', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (102, '1000001453024926', 3, '40418114', '298f540d5449ac6e3fce191d7ba32af8', '', '1be11c9affb93703da8f857153e99f8a', '2018', '徐琛', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (103, '1000002122422844', 3, '40418115', '319006b372030a6402fc4722a2d71759', '', 'a8c71e742178195128857fadd5fc0ddb', '2018', '陈毅', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (104, '1000000056158331', 3, '40418117', 'c97718359e19eb487b53342cbf07a97f', '', '590784add05f90b0619c90a07d5db320', '2018', '林守一', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (105, '1000001009754988', 3, '40418118', 'ac717f844e9a8002f01ac766554f6d06', '', 'b8e1b6e7441507c8060dce8347501dee', '2018', '伊嘉润', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (106, '1000001973435347', 3, '40418119', 'eaa8e0af521bd9f4cb06f50093706c27', '', '207f885521bdbeef0bd4edf2b79c7518', '2018', '张海杰', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (107, '1000001691369142', 3, '40418120', 'dd89c62ff4ee06b4cd1efdedc27ffbe9', '', 'a18fdacee47c3e4f1b6fa4718b629486', '2018', '张标', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (108, '1000000553928129', 3, '40418121', 'cea37ab028ef371fbac271dd96eb45ac', '', 'fad0d0465644618ae6926e663399fd3a', '2018', '林盛世', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (109, '1000002052681190', 3, '40418122', '55ba106bd974e5a83615c18c74ffa294', '', '783e26e0404c845e57c16db595005105', '2018', '张英明', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (110, '1000000281942577', 3, '40418123', '6f47b672742a42733cbd7143db51eb2e', '', '030a2b7517eabc0d9782cf1405323c9a', '2018', '时梓豪', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (111, '1000001350098156', 3, '40418124', '13a4e455e19a55604544704b62c08e10', '', 'a005e10c42867a480499bdef657266d0', '2018', '刘健', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (112, '1000001555025159', 3, '40418125', '6ed77d6ee615c59e994008fb10444914', '', '3528fcdfc18c5f1b59ef1a6d81813120', '2018', '王岩', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (113, '1000001856948502', 3, '40418126', '490c2ced41c0f6e937254021391e25bf', '', '10c2976fa9e8aba21305e46355abb856', '2018', '杜文锦', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (114, '1000002034220427', 3, '40418127', 'c6cb0a0e17290a007749d04e1e1d9c6d', '', '002c906447cbc3a6c8e4c3de9c38e978', '2018', '马行哲', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (115, '1000001765020872', 3, '40418128', 'b3133b94617437e4a881b85f2f0cd71a', '', '48d16078c73084502afad7574bc8d77a', '2018', '林雪颖', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (116, '1000001041539469', 3, '40418129', 'a4902d44d90eaf106f662b724fe1c3d0', '', 'cf1fb4610d1ae023dfd5e978f294866f', '2018', '董薇', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (117, '1000002100962346', 3, '40418130', '8ddb15d395aa83c5039b1e641c230c82', '', '6f13a78471439ab988215349e51cc06c', '2018', '刘丽萍', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (118, '1000000315255381', 3, '40418131', '8ed8ce444e78c7cd253e29e66556880e', '', '2c3e9f62b791c5380019d281a9c8403b', '2018', '高庆红', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (119, '1000001075479717', 3, '40418132', '02bbd265845c19ec62660384901d96a9', '', '2a1b4ac7c5b40d9f8e166b6fa6fbbb1b', '2018', '梁子威', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (120, '1000001619935634', 3, '40418133', '5175b158386f52fb6c387079578c2209', '', '6b2292661505038dd3bc3a35b277065f', '2018', '贾紫藤', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (121, '1000001040193420', 3, '40418134', '7be0c1e4a575bd492e263e6c191e6692', '', 'e0f86c601d32dfbe8a563b60ec845bbb', '2018', '田博涛', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (122, '1000002083276435', 3, '40418135', '721820632281def5938b3551608b7a01', '', '3e2065314670da95b2514b2b228f5ad7', '2018', '王建伟', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (123, '1000000508273141', 3, '40418136', 'c055d74ecfda70a0944d191ae2e9e9b0', '', '2d67fac196f2aa5a457b193314c67483', '2018', '雍骞', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (124, '1000001642826629', 3, '40418137', '560f99a9636611c4b1e2a8d291dd2c52', '', '7da453d9fd71439f28aba36d5b5c49c4', '2018', '肖鑫', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (125, '1000000446854541', 3, '40418138', '2b1c7e5a8ff49d3341a05427d01c4362', '', '3ed88d8bb0d134771e57e055d1c539bc', '2018', '张勇', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (126, '1000001427450408', 3, '40418139', '819e3b271d7e98d50beb6930e66cdc5d', '', '03ba989aa5ab2112787b93debdd31b1f', '2018', '谭照', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (127, '1000002119232905', 3, '40418140', '7b8469ee21deec50034a46558cc3d0f4', '', '830bed53024b9bde98828d1c50f9b862', '2018', '郑奥', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (128, '1000000627872150', 3, '40418141', '2562429b3d5523da8d057b7a4bc2d1e0', '', '02acfd6cfc32238ebc58621ceb835d5d', '2018', '徐玮聪', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (129, '1000001373850779', 3, '40418142', '5534198df4bef8ac32e51db29a09b29d', '', '3f3083e2bd9132c5984ce34b1b71c7d2', '2018', '王七娟', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (130, '1000000338345804', 3, '40418145', '6558dcb96fb4aaea95322e27bd8aee1e', '', 'b4bee635a3d06d1ae63b974919d26114', '2018', '喻俊钦', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (131, '1000000594342424', 3, '40418147', '0385f1f24118c3d98accc595509c5820', '', 'accd6b9b30319cc9b5929cf57ed03c75', '2018', '哈文静', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (132, '1000001536524277', 3, '40418148', '4108d607f201a98b369fe9430dad3123', '', '9a51f2de14038806e884c3a765799522', '2018', '胡丽娜', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (133, '1000001236077223', 3, '40418149', '0e5131adc4bd9072fa5b339c493de41c', '', '4ccbab32159a794b05ad6e260f37625b', '2018', '王祯', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (134, '1000000121403214', 3, '40418150', '24a303881c179ad51081acd124002f90', '', '9d85f781c57669a8d8628da59723fae4', '2018', '陆文龙', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (135, '1000001671555479', 3, '40418151', '70a19f9653e95a55adb1c59ff5240536', '', 'a485ae16d360860c3d90b453debae247', '2018', '朱彦婷', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-01 00:19:22', '2019-06-01 00:19:22', '2019-06-01 00:19:22');
INSERT INTO `user` VALUES (136, '1000002035049095', 1, '1002', 'c002f04e06713855dc6e77b84717ea4f', NULL, 'ad46fd0be2b45a9c401fc60d618c63a3', '2015', '周金莲', '', '', 2, NULL, '/img/user-default.png', 1, '2019-06-03 15:31:51', '2019-06-03 15:31:51', '2019-06-13 09:08:03');
INSERT INTO `user` VALUES (137, '1000000919622415', 4, '40318102', '5b7c382e65961826d57c6678cadb1521', '', 'bfb78618ae965cc1594264811f4be3be', '2018', '汪松露', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-12 21:08:39');
INSERT INTO `user` VALUES (138, '1000001250115131', 4, '40318103', 'c5bd9bfca396c4d0f0a40f7da00c302f', '', 'bd88a84ab170a3ce9f5556bf289ca7cc', '2018', '刘思琪', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-12 21:13:58');
INSERT INTO `user` VALUES (139, '1000000920471812', 4, '40318104', '0e080fedffbb3ca65c71a54318f6dc17', '', 'd8b9226352c674f369976b97ce8f3513', '2018', '彭成林', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-12 21:10:37');
INSERT INTO `user` VALUES (140, '1000001022786414', 4, '40318108', 'd723e73dfeefbf4a7574cd9be00df7fd', '', '7c6f223d22bad8656efabc73beaa98f2', '2018', '石伟龙', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-12 21:11:22');
INSERT INTO `user` VALUES (141, '1000000528958664', 4, '40318109', '6ae3b57150e11689657397a9fe771c98', '', '04d3e238a81eccdc0d5670e23b88cc69', '2018', '吴东海', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:49:58');
INSERT INTO `user` VALUES (142, '1000000173327100', 4, '40318111', '80828208ace6744527370df2a9e44c91', '', 'b2c3b81e6756df1301b1fb901dce44e0', '2018', '李国伟', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:51:11');
INSERT INTO `user` VALUES (143, '1000001391109365', 4, '40318112', 'bf5d32831a722b76485b48b78723e60c', '', '0ec97d9286ebd45b53d864a29d52634a', '2018', '胡越', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:52:06');
INSERT INTO `user` VALUES (144, '1000001152209671', 4, '40318114', '2a6086bf79ce9a0a7dc3f628f7df0e3e', '', '9128f6c45d643212d524b9c679905571', '2018', '蒲文海', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (145, '1000001444400777', 4, '40318115', '0fcca2e7bbf7ddc616cefda28e4c65de', '', 'b66933f1a8e2d7d0debb988cd3b5bcc4', '2018', '蔡金龙', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (146, '1000001571733897', 4, '40318116', 'c13cbcbd9a4c4db8b4e87b0de056e16f', '', '6377dbe50de680b2e234df816a1cf60a', '2018', '石强', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-20 12:15:26');
INSERT INTO `user` VALUES (147, '1000000476827496', 4, '40318118', 'ef841a496aaede62b0b4f3b7fb8dc291', '', '447dde8718dd96b5d7957d49da9f03ff', '2018', '张龙', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (148, '1000001309921512', 4, '40318126', '048a9a81636a9d429b779f8cc021001a', '', '7ab330f7ad45cd2f6e7dafc8640a6e0f', '2018', '曹昂', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (149, '1000002123028002', 4, '40318127', 'ca4f1c9aec16e5190c66aa2607102dfb', '', 'db95d5858b7108165f8a08783e92d3aa', '2018', '苏鑫', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (150, '1000000481782900', 4, '40318128', 'e45fd9f281e64f14c325f61260457ad5', '', '2a6ca730ad4afe51c4ec159fee2880d7', '2018', '谢祥宇', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (151, '1000001400204061', 4, '40318131', '21615ff1a32f88cabe8fcbebed7c6924', '', '5ebc6d51823d6bd3e18cdf072b54a00d', '2018', '李钰', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (152, '1000000511841473', 4, '40318132', '118e8551a878a6a0da3d2e0bce83a3fc', '', '0a645c2370643b1a991becc94bf03f84', '2018', '韩梁恒', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:54:23');
INSERT INTO `user` VALUES (153, '1000001934251013', 4, '40318135', '2f31a961fdf650a182ebaee130323a0d', '', 'd6fcf327d8050126c5186f07cd155367', '2018', '王超伟', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:55:16');
INSERT INTO `user` VALUES (154, '1000001675051151', 4, '40318140', 'ac6b95d23ef9903e7996fedcc3d4a5f0', '', 'c3c5eb8af5c3805ad004862df3319b72', '2018', '张家宇', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:51:35');
INSERT INTO `user` VALUES (155, '1000000696497619', 4, '40318144', 'f190b809a5dbbe6f22f3cb13d6690f20', '', '5496a3a214dde183170a7e48dc53057d', '2018', '马文卓', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:55:57');
INSERT INTO `user` VALUES (156, '1000001788270692', 4, '40318147', '49b2ee5788c2bd12c0f6614ecb42ee01', '', '99528fa96d6a8bac074715ae82562adc', '2018', '薛晶', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (157, '1000000559411457', 4, '40318152', '6e64a773d0c4b033d0b740eaaef0dd89', '', 'f18c150cbd06d7f6ceadef99e14d7269', '2018', '马奥森', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:51:22');
INSERT INTO `user` VALUES (158, '1000000315870379', 4, '40318157', '862340f17c8a63647588da4c40074775', '', '86b61cb742cf3dbe4a8a9c17cd4f4123', '2018', '张照乾', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (159, '1000001724624066', 4, '40318162', 'b97c6a53bd00273b8e1fd24217645cc0', '', 'c3edb8d7a68ba6d963bdc3e419bc3892', '2018', '杨琴', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (160, '1000001944696121', 4, '40318164', '8b8d76e8d5605f0eb6ecff74ce1383c7', '', 'b3d963186330fcecca6735c3c81e135c', '2018', '陈棋琛', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (161, '1000000630303122', 4, '40318171', '6a124666f492fbc6b65127f05018ee67', '', 'c49db38ca7ed9bc52252bf8cf5982902', '2018', '张建荣', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:54:38');
INSERT INTO `user` VALUES (162, '1000001229962213', 4, '40318184', '1d6ec22b888e25124b5bc6251c7b8d00', '', '4b00ae5033b719711f26ea31a5ff0415', '2018', '徐浩杰', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:51:17');
INSERT INTO `user` VALUES (163, '1000000681627606', 5, '40318105', 'cc236bea5a979da5b88890906a7899ee', '', '56dfed7651c10331dd44231bea4ad794', '2018', '张想军', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (164, '1000001019131158', 5, '40318106', '0d530df06a33da4ee81eeb289b80f46d', '', '4c32f76f99f6e807707ba712a2de3781', '2018', '崔稳祥', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (165, '1000001084795030', 5, '40318120', '427bee4aed0a5aecf2675b957231eef9', '', '9ef015c6896c45c33ea02e0481e9859d', '2018', '陈春辉', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (166, '1000001113090662', 5, '40318122', '294bfca36bdf2f42487150763ed3a8e9', '', 'c952a0ce5ea75c86c20e24dc4d944490', '2018', '贺怡然', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (167, '1000001343485993', 5, '40318123', 'b1c6bce3ecb49c48901dea7c1a32caf9', '', 'dc441af0796a798c8fe9ced9bbc7e5f6', '2018', '王剑飞', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (168, '1000001140867695', 5, '40318125', '04867f7fa198103cc03dc896f7b4453d', '', '45c52457fed9e0c6d6867b76a75c7f0a', '2018', '卢文浩', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 11:37:16');
INSERT INTO `user` VALUES (169, '1000001473955519', 5, '40318129', 'ab3accbb031ba7e80d4c042c6e9b3003', '', '518ed460f7c8d8078d1ad8086e5407c1', '2018', '王赵峰', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (170, '1000001273240711', 5, '40318130', 'd4c45049dba7bc600385979b9deadb61', '', '8b4fbe90b07fd67a26f4a910d24548c5', '2018', '张迎迎', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (171, '1000001205939472', 5, '40318136', 'b79cd33bc44739bb444cd061e05de907', '', '89ae80dd5cc120f71353d4345a665a08', '2018', '张恒华', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (172, '1000000918934314', 5, '40318137', '67615f85e4fc761b599881f2a1ad1357', '', '8282d98f3e29313d6f8531a055df3b3d', '2018', '于德福', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (173, '1000001091464263', 5, '40318141', 'f136bd1d923776492f5d95cb62b80598', '', '68a14a7487558fa6b2f29dd6510f2b35', '2018', '陈龙', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (174, '1000000217977519', 5, '40318153', 'd5bfb175f5904e21938e9a547ec0ae05', '', '9a005c90b9bb8bcbbf67c4b7b0fa9916', '2018', '王先艺', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (175, '1000001208439387', 5, '40318156', '4bc87b8925cf6596b0eca92f3494d04d', '', '72b2f4b0f6d88e0eafbd5652d3568fcb', '2018', '史昊炀', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (176, '1000000565318783', 5, '40318158', 'ad55c21078ba8ee45510714c13c13f15', '', '8fce9a8618c3f240733039223e0425d6', '2018', '王瑜', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (177, '1000000618193515', 5, '40318163', 'fc3f12bb1ab7024db26e7b3267e340a8', '', 'cc5279f0a24df0689ffde481356d8e11', '2018', '万立永', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (178, '1000002015267263', 5, '40318166', 'd87e5e693d867ec4c8049666ea9b4044', '', '829efbd9effc0fdb27397818e1ea8722', '2018', '程豪', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (179, '1000001766903410', 5, '40318168', '8b0b78ee63f4ee366c701b7765e742a8', '', 'f46ffe1089d03ac7c3b012c2bcaa71c9', '2018', '唐瑞男', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (180, '1000001627146556', 5, '40318169', 'b630b87d59e181aa297cbf2fbd2ffb31', '', '547caa6be44b052934d10b469a5b4c67', '2018', '齐晓轩', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (181, '1000001419068445', 5, '40318170', 'e372c37a91048271b279a1750c50c63c', '', '7cec20ef97a900bccb0bb993ef8c52d4', '2018', '梁文奇', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (182, '1000000906021533', 5, '40318172', '29b8d1bbf143181a3cbb682bab3f5cdc', '', '1957bffe6acad70a2e0117c528a34037', '2018', '马国宁', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (183, '1000000325753769', 5, '40318173', 'cc7c519bab19c6655fa931a3e6a51060', '', 'eff7e83634da35495cae70e2cc00aed8', '2018', '李维虎', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (184, '1000000211795919', 5, '40318177', 'e50a194f9992aba61ff55678675eb0c0', '', '1b95fa777985f0e033f3758a89076cb5', '2018', '李会', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (185, '1000000905955895', 5, '40318178', '9ee2b0097d6e05ef5d76ddfa7ceded64', '', 'a816670b0055ffd815a3d3814f2a4b80', '2018', '李亮', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (186, '1000001282902556', 5, '40318181', 'e2106886156da4f5c504c5302341c47b', '', 'df0c1b18b0a76a5ae7306e7bd409d669', '2018', '尚冠毅', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (187, '1000001165300706', 5, '40318183', '794b30cec09edaf1293b8cfb766aa1e7', '', '0635c0a6bbf86eee78053f7269ed7eec', '2018', '马国宝', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (188, '1000001976778280', 5, '40318186', 'c0487e865f50e2bd538cbd76f6b00f2e', '', '96ffbce1d101fe387dcb922070032423', '2018', '吕旭升', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-10 10:18:37', '2019-06-10 10:18:37', '2019-06-10 10:18:37');
INSERT INTO `user` VALUES (227, '1000000674895000', 7, '40318036', '9c74361aec435555ed82701df6ab71e7', '', 'f65ffc339666c54125f7101588a808f1', '2018', '朱梦丹', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (228, '1000001066554970', 7, '40318110', '8e0776fcd23c472f397cd99784eb961d', '', '92e7232102268a1a830d52bcc3bc13ef', '2018', '袁龙', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (229, '1000000770632880', 7, '40318113', '4749df6974a970dac3e65d102a13c817', '', '7c6d43bf823d2f124163ce82e19afad7', '2018', '王金鹏', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (230, '1000000636972187', 7, '40318117', 'a9068765cd28a676f1996a27a563badc', '', 'bb15abdb787bbc100a59030123497c5e', '2018', '刘永皓', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (231, '1000000832630301', 7, '40318119', '78acb79e0394368c816239ce5ae9f578', '', '2e7b61a0d38e0fc0aa63a5a33ca7e85d', '2018', '刘慧敏', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (232, '1000001117366356', 7, '40318121', '63a3d1230afdac44e8f65f158d97514b', '', 'db62d15cc22124a0c90dba83d492deab', '2018', '高升', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (233, '1000001280972489', 7, '40318124', 'c6306b3db7d612937396a1995f66c4a0', '', '6448ed4f95290e26b08827f473907ec9', '2018', '许豪佳', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (234, '1000000988619072', 7, '40318133', '178413c26a5fcdeca90e6b95b88f556b', '', '3095e3ec13ac804040dda06a258e8930', '2018', '郭少江', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (235, '1000001594031301', 7, '40318134', '54f8e6583ca214ac78f07959c6bdecda', '', '111373ef44703cd3caa343adca972318', '2018', '刘建鑫', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (236, '1000000482351303', 7, '40318138', '2d02ba78e47c2f58083c3575e0f646b4', '', '6d86cad62c143e9d315921e5aa0441e5', '2018', '刘可心', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (237, '1000000226027786', 7, '40318139', '43c7f171d1dbbb7933ef407364c170e6', '', '8dbaf85742b51b04274a777062b54343', '2018', '李梓煜', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (238, '1000001772651701', 7, '40318142', '1fa5e08340c107076ba89af0475edb0e', '', '9d31f6a7ed9fc78999d07e7513f0989b', '2018', '李雨涵', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (239, '1000001554531652', 7, '40318145', '9eef31e004f09bd7032aa26d68c82e97', '', '98c6e6e61a03b65a0d0e3cea082ccb16', '2018', '曾凡高', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (240, '1000001708777143', 7, '40318146', 'e859447d37672e3993e13d32cbb80eee', '', '72250d4d823621a54f8990254dbf315c', '2018', '陈淞瑞', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (241, '1000000518391887', 7, '40318148', 'f330f19cad9d7836c5c7bad7fb172e8e', '', '64385e1bc70f948aa6e3bea879b9bb7a', '2018', '祁正元', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (242, '1000001608000317', 7, '40318149', '5d2f0e5d459f298b0e65cd876eed27b2', '', 'a4438ce0258a5f4d7057ad9ab27e9d29', '2018', '刘妍', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (243, '1000001213465595', 7, '40318150', '0b8619fcd6fcd4ee38a1fd3446115ed9', '', '2b2d9b7a84264edc7315e705d2acb151', '2018', '张宗坤', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (244, '1000002093194033', 7, '40318151', '5b434d1b6ab38a61954a26c5d69b315d', '', 'ed6fae146b8c4c17f26b5599e839f9c1', '2018', '次慧祺', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (245, '1000002119809469', 7, '40318154', 'f109bba21f49fba8cff82a21ddf2f5b1', '', 'eb59cf29f838526b22d9b8076d2f3e1b', '2018', '郭毛毛', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (246, '1000001573798984', 7, '40318155', '31a8e5283274bbe624a2c0f02ccc188e', '', 'c7839a581e57133e3cb44026a1a8781c', '2018', '李根', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (247, '1000000036788456', 7, '40318160', '382687a9fe8ba453f6945a4969e93906', '', '21ac57a39a9d304282baf076352de0f0', '2018', '林雨轩', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (248, '1000001661312424', 7, '40318161', '5e89a31d245d2a1ba247d9307b44ff2c', '', '7d78708ebc1b7890987885b396ce3a18', '2018', '龙帝丞', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (249, '1000001553329161', 7, '40318174', '9e63bc45b9be701e735837eb7b900221', '', '43a42f06cf3b0c493aad047b07f9132d', '2018', '海浩杰', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (250, '1000001810280164', 7, '40318175', 'd72ff2ddc368ba7dc20b0ce860aea335', '', '09da9c7290b8a01516a570612170d305', '2018', '王梓懿', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (251, '1000001928953994', 7, '40318182', '28d6294b4e70a5c4b129765a1f11250f', '', 'cf9a656b3e41507fff331c69e9756509', '2018', '薛勇', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');
INSERT INTO `user` VALUES (252, '1000001810676603', 7, '40318185', '9bb5a8112f19a7207d1c3ea576b82be4', '', '5a84565854205dca57dd23a5a80e98dc', '2018', '高军', '', '', NULL, NULL, '/img/user-default.png', 1, '2019-06-13 11:09:02', '2019-06-13 11:09:02', '2019-06-13 11:09:02');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, '1', '1');
INSERT INTO `user_role` VALUES (2, '1000000717453085', '2');
INSERT INTO `user_role` VALUES (3, '1000002093435045', '2');
INSERT INTO `user_role` VALUES (4, '1000000738386653', '3');
INSERT INTO `user_role` VALUES (5, '1000001232936417', '3');
INSERT INTO `user_role` VALUES (6, '1000000329142518', '3');
INSERT INTO `user_role` VALUES (7, '1000001362277777', '3');
INSERT INTO `user_role` VALUES (8, '1000000768154633', '3');
INSERT INTO `user_role` VALUES (9, '1000001364687181', '3');
INSERT INTO `user_role` VALUES (10, '1000000132791333', '3');
INSERT INTO `user_role` VALUES (11, '1000000099472040', '3');
INSERT INTO `user_role` VALUES (12, '1000000634241647', '3');
INSERT INTO `user_role` VALUES (13, '1000001655042422', '3');
INSERT INTO `user_role` VALUES (14, '1000000077178849', '3');
INSERT INTO `user_role` VALUES (15, '1000000353678078', '3');
INSERT INTO `user_role` VALUES (16, '1000000773366546', '3');
INSERT INTO `user_role` VALUES (17, '1000000711412775', '3');
INSERT INTO `user_role` VALUES (18, '1000000548067370', '3');
INSERT INTO `user_role` VALUES (19, '1000001226341840', '3');
INSERT INTO `user_role` VALUES (20, '1000000998890425', '3');
INSERT INTO `user_role` VALUES (21, '1000001422042463', '3');
INSERT INTO `user_role` VALUES (22, '1000001103422463', '3');
INSERT INTO `user_role` VALUES (23, '1000001905036577', '3');
INSERT INTO `user_role` VALUES (24, '1000001328951620', '3');
INSERT INTO `user_role` VALUES (25, '1000000950567584', '3');
INSERT INTO `user_role` VALUES (26, '1000000258775967', '3');
INSERT INTO `user_role` VALUES (27, '1000001464610296', '3');
INSERT INTO `user_role` VALUES (28, '1000000553300995', '3');
INSERT INTO `user_role` VALUES (29, '1000000285040298', '3');
INSERT INTO `user_role` VALUES (30, '1000001100760136', '3');
INSERT INTO `user_role` VALUES (31, '1000000928294998', '3');
INSERT INTO `user_role` VALUES (32, '1000000017164434', '3');
INSERT INTO `user_role` VALUES (33, '1000000332452198', '3');
INSERT INTO `user_role` VALUES (34, '1000000058743441', '3');
INSERT INTO `user_role` VALUES (35, '1000001708050136', '3');
INSERT INTO `user_role` VALUES (36, '1000001224615059', '3');
INSERT INTO `user_role` VALUES (37, '1000001621760425', '3');
INSERT INTO `user_role` VALUES (38, '1000000127832604', '3');
INSERT INTO `user_role` VALUES (39, '1000001032025346', '3');
INSERT INTO `user_role` VALUES (40, '1000000021528355', '3');
INSERT INTO `user_role` VALUES (41, '1000002128683563', '3');
INSERT INTO `user_role` VALUES (42, '1000000136977834', '3');
INSERT INTO `user_role` VALUES (43, '1000000238372940', '3');
INSERT INTO `user_role` VALUES (44, '1000001979344631', '3');
INSERT INTO `user_role` VALUES (45, '1000001578602167', '3');
INSERT INTO `user_role` VALUES (46, '1000000878273986', '3');
INSERT INTO `user_role` VALUES (47, '1000001291157132', '3');
INSERT INTO `user_role` VALUES (48, '1000000125238196', '3');
INSERT INTO `user_role` VALUES (49, '1000000057343714', '3');
INSERT INTO `user_role` VALUES (50, '1000000933262066', '3');
INSERT INTO `user_role` VALUES (51, '1000000436132200', '3');
INSERT INTO `user_role` VALUES (52, '1000000644489782', '3');
INSERT INTO `user_role` VALUES (53, '1000001424018494', '3');
INSERT INTO `user_role` VALUES (54, '1000000165587507', '3');
INSERT INTO `user_role` VALUES (55, '1000002023792002', '3');
INSERT INTO `user_role` VALUES (56, '1000000963040852', '3');
INSERT INTO `user_role` VALUES (57, '1000000376216028', '3');
INSERT INTO `user_role` VALUES (58, '1000001440651745', '3');
INSERT INTO `user_role` VALUES (59, '1000001453024926', '3');
INSERT INTO `user_role` VALUES (60, '1000002122422844', '3');
INSERT INTO `user_role` VALUES (61, '1000000056158331', '3');
INSERT INTO `user_role` VALUES (62, '1000001009754988', '3');
INSERT INTO `user_role` VALUES (63, '1000001973435347', '3');
INSERT INTO `user_role` VALUES (64, '1000001691369142', '3');
INSERT INTO `user_role` VALUES (65, '1000000553928129', '3');
INSERT INTO `user_role` VALUES (66, '1000002052681190', '3');
INSERT INTO `user_role` VALUES (67, '1000000281942577', '3');
INSERT INTO `user_role` VALUES (68, '1000001350098156', '3');
INSERT INTO `user_role` VALUES (69, '1000001555025159', '3');
INSERT INTO `user_role` VALUES (70, '1000001856948502', '3');
INSERT INTO `user_role` VALUES (71, '1000002034220427', '3');
INSERT INTO `user_role` VALUES (72, '1000001765020872', '3');
INSERT INTO `user_role` VALUES (73, '1000001041539469', '3');
INSERT INTO `user_role` VALUES (74, '1000002100962346', '3');
INSERT INTO `user_role` VALUES (75, '1000000315255381', '3');
INSERT INTO `user_role` VALUES (76, '1000001075479717', '3');
INSERT INTO `user_role` VALUES (77, '1000001619935634', '3');
INSERT INTO `user_role` VALUES (78, '1000001040193420', '3');
INSERT INTO `user_role` VALUES (79, '1000002083276435', '3');
INSERT INTO `user_role` VALUES (80, '1000000508273141', '3');
INSERT INTO `user_role` VALUES (81, '1000001642826629', '3');
INSERT INTO `user_role` VALUES (82, '1000000446854541', '3');
INSERT INTO `user_role` VALUES (83, '1000001427450408', '3');
INSERT INTO `user_role` VALUES (84, '1000002119232905', '3');
INSERT INTO `user_role` VALUES (85, '1000000627872150', '3');
INSERT INTO `user_role` VALUES (86, '1000001373850779', '3');
INSERT INTO `user_role` VALUES (87, '1000000338345804', '3');
INSERT INTO `user_role` VALUES (88, '1000000594342424', '3');
INSERT INTO `user_role` VALUES (89, '1000001536524277', '3');
INSERT INTO `user_role` VALUES (90, '1000001236077223', '3');
INSERT INTO `user_role` VALUES (91, '1000000121403214', '3');
INSERT INTO `user_role` VALUES (92, '1000001671555479', '3');
INSERT INTO `user_role` VALUES (93, '1000002035049095', '2');
INSERT INTO `user_role` VALUES (94, '1000000919622415', '3');
INSERT INTO `user_role` VALUES (95, '1000001250115131', '3');
INSERT INTO `user_role` VALUES (96, '1000000920471812', '3');
INSERT INTO `user_role` VALUES (97, '1000001022786414', '3');
INSERT INTO `user_role` VALUES (98, '1000000528958664', '3');
INSERT INTO `user_role` VALUES (99, '1000000173327100', '3');
INSERT INTO `user_role` VALUES (100, '1000001391109365', '3');
INSERT INTO `user_role` VALUES (101, '1000001152209671', '3');
INSERT INTO `user_role` VALUES (102, '1000001444400777', '3');
INSERT INTO `user_role` VALUES (103, '1000001571733897', '3');
INSERT INTO `user_role` VALUES (104, '1000000476827496', '3');
INSERT INTO `user_role` VALUES (105, '1000001309921512', '3');
INSERT INTO `user_role` VALUES (106, '1000002123028002', '3');
INSERT INTO `user_role` VALUES (107, '1000000481782900', '3');
INSERT INTO `user_role` VALUES (108, '1000001400204061', '3');
INSERT INTO `user_role` VALUES (109, '1000000511841473', '3');
INSERT INTO `user_role` VALUES (110, '1000001934251013', '3');
INSERT INTO `user_role` VALUES (111, '1000001675051151', '3');
INSERT INTO `user_role` VALUES (112, '1000000696497619', '3');
INSERT INTO `user_role` VALUES (113, '1000001788270692', '3');
INSERT INTO `user_role` VALUES (114, '1000000559411457', '3');
INSERT INTO `user_role` VALUES (115, '1000000315870379', '3');
INSERT INTO `user_role` VALUES (116, '1000001724624066', '3');
INSERT INTO `user_role` VALUES (117, '1000001944696121', '3');
INSERT INTO `user_role` VALUES (118, '1000000630303122', '3');
INSERT INTO `user_role` VALUES (119, '1000001229962213', '3');
INSERT INTO `user_role` VALUES (120, '1000000681627606', '3');
INSERT INTO `user_role` VALUES (121, '1000001019131158', '3');
INSERT INTO `user_role` VALUES (122, '1000001084795030', '3');
INSERT INTO `user_role` VALUES (123, '1000001113090662', '3');
INSERT INTO `user_role` VALUES (124, '1000001343485993', '3');
INSERT INTO `user_role` VALUES (125, '1000001140867695', '3');
INSERT INTO `user_role` VALUES (126, '1000001473955519', '3');
INSERT INTO `user_role` VALUES (127, '1000001273240711', '3');
INSERT INTO `user_role` VALUES (128, '1000001205939472', '3');
INSERT INTO `user_role` VALUES (129, '1000000918934314', '3');
INSERT INTO `user_role` VALUES (130, '1000001091464263', '3');
INSERT INTO `user_role` VALUES (131, '1000000217977519', '3');
INSERT INTO `user_role` VALUES (132, '1000001208439387', '3');
INSERT INTO `user_role` VALUES (133, '1000000565318783', '3');
INSERT INTO `user_role` VALUES (134, '1000000618193515', '3');
INSERT INTO `user_role` VALUES (135, '1000002015267263', '3');
INSERT INTO `user_role` VALUES (136, '1000001766903410', '3');
INSERT INTO `user_role` VALUES (137, '1000001627146556', '3');
INSERT INTO `user_role` VALUES (138, '1000001419068445', '3');
INSERT INTO `user_role` VALUES (139, '1000000906021533', '3');
INSERT INTO `user_role` VALUES (140, '1000000325753769', '3');
INSERT INTO `user_role` VALUES (141, '1000000211795919', '3');
INSERT INTO `user_role` VALUES (142, '1000000905955895', '3');
INSERT INTO `user_role` VALUES (143, '1000001282902556', '3');
INSERT INTO `user_role` VALUES (144, '1000001165300706', '3');
INSERT INTO `user_role` VALUES (145, '1000001976778280', '3');

SET FOREIGN_KEY_CHECKS = 1;
