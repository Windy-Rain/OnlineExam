/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : online_exam

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 18/03/2019 19:20:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
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
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, NULL, NULL, '523179414', '郭洪奎', 'http://q1.qlogo.cn/g?b=qq&nk=523179414&s=100', '', NULL, 1, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>测试评论</p>', NULL, 0, 0, '2018-09-13 23:30:56', '2018-09-13 23:30:56');
INSERT INTO `comment` VALUES (2, 1, '1', 1, NULL, '郭洪奎', 'http://cdn.nbclass.com/blog/img/person.jpg', '888@qq.com', NULL, 1, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>测试回复评论~</p>\r\n', NULL, 0, 0, '2018-09-13 23:31:37', '2018-09-13 23:31:37');
INSERT INTO `comment` VALUES (3, 1, NULL, NULL, '123456', '腾讯视频', 'http://q1.qlogo.cn/g?b=qq&nk=123456&s=100', '', NULL, 1, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>第三方</p>', NULL, 0, 0, '2018-09-20 00:52:21', '2018-09-20 00:52:21');
INSERT INTO `comment` VALUES (4, -1, NULL, NULL, '12345678', '腾讯视频', 'http://q1.qlogo.cn/g?b=qq&nk=12345678&s=100', '', NULL, 0, '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>士大夫</p>', NULL, 0, 0, '2018-09-20 00:52:37', '2018-09-20 00:52:37');

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
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam_question
-- ----------------------------
INSERT INTO `exam_question` VALUES (28, 5, 9, '2019-02-18 22:13:08', '2019-02-18 22:13:08');
INSERT INTO `exam_question` VALUES (29, 5, 10, '2019-02-18 22:13:08', '2019-02-18 22:13:08');
INSERT INTO `exam_question` VALUES (30, 6, 7, '2019-02-21 19:28:23', '2019-02-21 19:28:23');
INSERT INTO `exam_question` VALUES (31, 6, 8, '2019-02-21 19:28:23', '2019-02-21 19:28:23');
INSERT INTO `exam_question` VALUES (32, 7, 9, '2019-02-21 19:28:47', '2019-02-21 19:28:47');
INSERT INTO `exam_question` VALUES (33, 7, 10, '2019-02-21 19:28:47', '2019-02-21 19:28:47');
INSERT INTO `exam_question` VALUES (43, 8, 9, '2019-03-12 14:29:41', '2019-03-12 14:29:41');
INSERT INTO `exam_question` VALUES (44, 8, 10, '2019-03-12 14:29:41', '2019-03-12 14:29:41');
INSERT INTO `exam_question` VALUES (45, 8, 13, '2019-03-12 14:29:41', '2019-03-12 14:29:41');
INSERT INTO `exam_question` VALUES (46, 8, 14, '2019-03-12 14:29:41', '2019-03-12 14:29:41');
INSERT INTO `exam_question` VALUES (47, 8, 15, '2019-03-12 14:29:41', '2019-03-12 14:29:41');
INSERT INTO `exam_question` VALUES (48, 8, 16, '2019-03-12 14:29:41', '2019-03-12 14:29:41');
INSERT INTO `exam_question` VALUES (63, 9, 7, '2019-03-16 17:48:16', '2019-03-16 17:48:16');
INSERT INTO `exam_question` VALUES (64, 9, 8, '2019-03-16 17:48:16', '2019-03-16 17:48:16');
INSERT INTO `exam_question` VALUES (65, 9, 17, '2019-03-16 17:48:16', '2019-03-16 17:48:16');
INSERT INTO `exam_question` VALUES (66, 9, 18, '2019-03-16 17:48:16', '2019-03-16 17:48:16');
INSERT INTO `exam_question` VALUES (67, 9, 19, '2019-03-16 17:48:16', '2019-03-16 17:48:16');
INSERT INTO `exam_question` VALUES (68, 9, 20, '2019-03-16 17:48:16', '2019-03-16 17:48:16');
INSERT INTO `exam_question` VALUES (69, 9, 21, '2019-03-16 17:48:16', '2019-03-16 17:48:16');
INSERT INTO `exam_question` VALUES (70, 9, 22, '2019-03-16 17:48:16', '2019-03-16 17:48:16');
INSERT INTO `exam_question` VALUES (71, 9, 23, '2019-03-16 17:48:16', '2019-03-16 17:48:16');
INSERT INTO `exam_question` VALUES (72, 9, 24, '2019-03-16 17:48:16', '2019-03-16 17:48:16');
INSERT INTO `exam_question` VALUES (73, 9, 25, '2019-03-16 17:48:16', '2019-03-16 17:48:16');
INSERT INTO `exam_question` VALUES (74, 9, 26, '2019-03-16 17:48:16', '2019-03-16 17:48:16');
INSERT INTO `exam_question` VALUES (75, 9, 27, '2019-03-16 17:48:16', '2019-03-16 17:48:16');
INSERT INTO `exam_question` VALUES (76, 9, 29, '2019-03-16 17:48:16', '2019-03-16 17:48:16');
INSERT INTO `exam_question` VALUES (77, 9, 33, '2019-03-16 17:48:16', '2019-03-16 17:48:16');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examination
-- ----------------------------
INSERT INTO `examination` VALUES (5, 'Java期末测试', '1', '超级管理员', 15, 2, '2019-02-18 22:13:07', '2019-02-22 19:13:58', '2019-02-18 22:12:53', '2019-02-18 22:12:54', 2);
INSERT INTO `examination` VALUES (6, '测试', '1', '超级管理员', 10, 1, '2019-02-21 19:28:23', '2019-02-22 19:13:58', '2019-02-21 19:27:57', '2019-02-21 19:27:59', 2);
INSERT INTO `examination` VALUES (7, '测试', '1', '超级管理员', 15, 2, '2019-02-21 19:28:47', '2019-02-22 19:13:58', '2019-02-21 19:28:38', '2019-02-21 19:28:40', 2);
INSERT INTO `examination` VALUES (8, '2018-2019年度宁夏理工学院Java期末测试', '1', '超级管理员', 40, 2, '2019-02-22 19:15:49', '2019-03-17 14:31:29', '2019-03-16 13:20:26', '2019-03-16 20:00:00', 2);
INSERT INTO `examination` VALUES (9, '计算机学院大一第二学期C语言测试', '1', '超级管理员', 85, 1, '2019-03-16 17:20:54', '2019-03-16 17:48:37', '2019-03-16 17:25:22', '2019-03-20 12:00:22', 1);

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
  `status` int(8) NULL DEFAULT 0 COMMENT '0表示已交卷但是未评卷,1表示已交卷已评卷',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (14, '1', '8', 100, 5, 95, 'B,B,BD,AD,A,', '可以，一个类中只能有一个被public修饰的类，这个类名还必须和文件名相同。,', 'B,B,可以，一个类中只能有一个被public修饰的类，这个类名还必须和文件名相同。,BD,AD,A', '2019-03-16 16:31:13', NULL, 1);
INSERT INTO `grade` VALUES (19, '1', '9', 15, 15, 0, 'A~_~B~_~C~_~D~_~C~_~B~_~A~_~B~_~C~_~ABCD~_~ABCD~_~ABCD~_~ABCD~_~', 'C语言的表达式 (-10< x <10)不能够表达x在区间（-10,10），因为在C语言里面，逻辑运算符的运行顺序是从左至右的顺序，而 (-10< x <10)这种形式，-10会与输入的数据比较，输出正确与否，即0或1。正确的表达式如下：（x >-10 && x < 10）~_~10，12，120~_~', 'A~_~B~_~C~_~D~_~C~_~B~_~A~_~B~_~C~_~ABCD~_~ABCD~_~ABCD~_~ABCD~_~C语言的表达式 (-10< x <10)不能够表达x在区间（-10,10），因为在C语言里面，逻辑运算符的运行顺序是从左至右的顺序，而 (-10< x <10)这种形式，-10会与输入的数据比较，输出正确与否，即0或1。正确的表达式如下：（x >-10 && x < 10）~_~10，12，120', '2019-03-17 17:02:08', NULL, 0);
INSERT INTO `grade` VALUES (20, '1000001795280200', '9', 10, 10, 0, 'D~_~C~_~A~_~B~_~B~_~C~_~B~_~B~_~C~_~BC~_~CD~_~AC~_~ABD~_~', 'rwetergfdcxcsdgrhgherf~_~rwefergrehtrherfsd~_~', 'D~_~C~_~A~_~B~_~B~_~C~_~B~_~B~_~C~_~BC~_~CD~_~AC~_~ABD~_~rwetergfdcxcsdgrhgherf~_~rwefergrehtrherfsd', '2019-03-18 18:02:24', NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES (1, '百度', 'www.baidu.com', '百度网址', '', '', '', 1, 1, '', '2018-09-13 23:24:25', '2019-03-11 19:10:07');

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
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '1', '管理首页', '工作台', '/workdest', 'workdest', 0, 1, 1, 'fa fa-windows', 1, '2017-09-27 21:22:02', '2019-02-01 01:36:15');
INSERT INTO `permission` VALUES (2, '2', '权限管理', '权限管理', NULL, NULL, 0, 0, 4, 'fa fa-sitemap', 1, '2017-07-13 15:04:42', '2019-02-01 01:34:08');
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
INSERT INTO `permission` VALUES (22, '3', '运维管理', '运维管理', NULL, NULL, 0, 0, 7, 'fa f fa-database', 1, '2018-07-06 15:19:26', '2019-02-01 01:32:49');
INSERT INTO `permission` VALUES (23, '301', '数据监控', '数据监控', '/database/monitoring', 'database', 22, 1, 1, 'fa fa-circle-o', 1, '2018-07-06 15:19:55', '2018-07-06 15:19:55');
INSERT INTO `permission` VALUES (24, '4', '系统管理', '系统管理', NULL, NULL, 0, 0, 5, 'fa fa-th-list', 1, '2018-07-06 15:20:38', '2018-07-24 15:42:28');
INSERT INTO `permission` VALUES (25, '401', '在线用户', '在线用户', '/online/users', 'onlineUsers', 24, 1, 1, 'fa fa-circle-o', 1, '2018-07-06 15:21:00', '2018-07-24 14:58:22');
INSERT INTO `permission` VALUES (32, '1000001992372345', '在线用户查询', '在线用户查询', '/online/user/list', 'onlineUser:list', 25, 2, 0, '', 1, '2018-07-24 15:02:23', '2018-07-24 15:02:23');
INSERT INTO `permission` VALUES (33, '1000002083579304', '踢出用户', '踢出用户', '/online/user/kickout', 'onlineUser:kickout', 25, 2, 0, '', 1, '2018-07-24 15:03:16', '2018-07-24 15:03:16');
INSERT INTO `permission` VALUES (34, '1000000171409776', '批量踢出', '批量踢出', '/online/user/batch/kickout', 'onlineUser:batchKickout', 25, 2, 0, '', 1, '2018-07-24 15:04:09', '2018-07-24 15:04:09');
INSERT INTO `permission` VALUES (35, '1000000863853891', '网站管理', '网站管理', NULL, NULL, 0, 0, 3, 'fa fa-users', 1, '2018-07-24 15:44:23', '2019-02-01 01:38:47');
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
INSERT INTO `permission` VALUES (59, '1000000976625379', '标签管理', '标签管理', '/tags', 'tags', 52, 1, 6, 'fa fa-circle-o', 1, '2018-07-25 18:50:47', '2019-03-14 10:55:44');
INSERT INTO `permission` VALUES (60, '1000002127467055', '查询', '查询标签列表', '/tag/list', 'tag:list', 59, 2, 0, '', 1, '2018-07-25 18:51:20', '2018-07-25 18:51:20');
INSERT INTO `permission` VALUES (61, '1000001458372033', '新增', '新增标签', '/tag/add', 'tag:add', 59, 2, 0, '', 1, '2018-07-25 18:51:42', '2018-07-25 18:51:42');
INSERT INTO `permission` VALUES (62, '1000001832967209', '编辑', '编辑标签', '/tag/edit', 'tag:edit', 59, 2, 0, '', 1, '2018-07-25 18:52:17', '2018-07-25 18:52:17');
INSERT INTO `permission` VALUES (63, '1000000754923037', '删除', '删除标签', '/tag/delete', 'tag:delete', 59, 2, 0, '', 1, '2018-07-25 18:52:40', '2018-07-25 18:52:40');
INSERT INTO `permission` VALUES (64, '1000000759248744', '批量删除', '批量删除标签', '/tag/batch/delete', 'tag:batchDelete', 59, 2, 0, '', 1, '2018-07-25 18:53:14', '2018-07-25 18:53:14');
INSERT INTO `permission` VALUES (71, '1000000899091444', '发布考试', '发布考试', '/exam/add', 'exam:add', 52, 1, 1, 'fa fa-dot-circle-o', 1, '2018-07-29 20:39:49', '2019-02-20 20:10:03');
INSERT INTO `permission` VALUES (72, '1000000224901858', '评论管理', '评论管理', '/comments', 'comments', 35, 1, 4, 'fa fa-circle-o', 1, '2018-08-10 09:44:41', '2018-09-19 15:44:13');
INSERT INTO `permission` VALUES (73, '1000001579533936', '查询', '查询', '/comment/list', 'comment:list', 72, 2, 0, '', 1, '2018-08-10 09:46:54', '2018-08-10 09:46:54');
INSERT INTO `permission` VALUES (74, '1000000663968031', '审核', '审核评论', '/comment/audit', 'comment:audit', 72, 2, 0, '', 1, '2018-08-10 09:57:11', '2018-08-10 09:57:11');
INSERT INTO `permission` VALUES (75, '1000000322655547', '回复', '回复评论', '/comment/reply', 'comment:audit', 72, 2, 0, '', 1, '2018-08-10 10:04:28', '2018-08-10 10:04:28');
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
  `exam_id` int(8) NULL DEFAULT NULL COMMENT '试卷ID',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `status` int(8) NULL DEFAULT 1 COMMENT '0表示未考试题目,1表示已考试题目',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (7, 'C语言中，函数值类型的定义可以缺省，此时函数值的隐含类型是（　　）。', '', 0, 'void', 'int', 'float', 'double', NULL, NULL, 'B', 'B，无解析', 5, 1, 1, NULL, '2019-01-23 00:01:42', '2019-03-11 16:34:37', 0);
INSERT INTO `question` VALUES (8, '以下关于函数设计不正确的说法是（     ）。', '\r\n', 0, '函数设计应该追求高内聚低耦合', '要尽可能多的使用全局变量', '函数参数不易过多', '设计函数时，尽量做到谁申请的资源就由谁来释放', NULL, NULL, 'B', 'B，无解析', 5, 2, 1, NULL, '2019-01-23 00:03:51', '2019-03-11 16:34:39', 0);
INSERT INTO `question` VALUES (9, 'Java中，在如下所示的Test类中，共有（）个构造方法。', '', 0, '0', '1', '2', '3', NULL, NULL, 'C', 'C，无解析', 10, 3, 2, NULL, '2019-01-23 00:06:42', '2019-03-12 16:38:39', 0);
INSERT INTO `question` VALUES (10, '变量命名规范说法正确的是（       ）。', '', 0, '变量由字母、下划线、数字、$符号随意组成', '变量不能以数字作为开头', 'A和a在java中是同一个变量', '不同类型的变量，可以起相同的名字', NULL, NULL, 'B', 'B，无解析', 5, 2, 2, NULL, '2019-01-23 00:08:06', '2019-03-11 16:34:50', 0);
INSERT INTO `question` VALUES (11, '索引是什么?有什么作用以及优缺点?', '', 2, '', NULL, NULL, NULL, NULL, NULL, '索引是对数据库表中一或多个列的值进行排序的结构，是帮助MySQL高效获取数据的数据结构\r\n你也可以这样理解：索引就是加快检索表中数据的方法。数据库的索引类似于书籍的索引。\r\n在书籍中，索引允许用户不必翻阅完整个书就能迅速地找到所需要的信息。\r\n在数据库中，索引也允许数据库程序迅速地找到表中的数据，而不必扫描整个数据库。\r\nMySQL数据库几个基本的索引类型：普通索引、唯一索引、主键索引、全文索引\r\n索引的优点\r\n① 建立索引的列可以保证行的唯一性，生成唯一的rowId\r\n② 建立索引可以有效缩短数据的检索时间\r\n③ 建立索引可以加快表与表之间的连接\r\n④ 为用来排序或者是分组的字段添加索引可以加快分组和排序顺序\r\n索引的缺点：\r\n① 创建索引和维护索引需要时间成本，这个成本随着数据量的增加而加大\r\n\r\n② 创建索引和维护索引需要空间成本，每一条索引都要占据数据库的物理存储空间，数据量越大，占用空间也越大(数据表占据的是数据库的数据空间)\r\n③ 会降低表的增删改的效率，因为每次增删改索引需要进行动态维护，导致时间变长', '无解析', 10, 5, 3, NULL, '2019-01-23 23:42:06', '2019-03-11 16:34:52', 0);
INSERT INTO `question` VALUES (12, '要保证数据库的逻辑数据独立性，需要修改的是（）。', '', 0, '模式与外模式之间的映射', ' 模式与内模式之间的映射', '模式', '三级模式', NULL, NULL, 'A', '无解析', 5, 1, 3, NULL, '2019-02-13 22:01:16', '2019-03-11 16:34:58', 0);
INSERT INTO `question` VALUES (13, '一个 \".java\"源文件中是否可以包括多个类（不内部）？有什么限制？', '哈哈哈哈哈哈哈', 2, '', NULL, NULL, NULL, NULL, NULL, '可以，一个类中只能有一个被public修饰的类，这个类名还必须和文件名相同。', '可以，一个类中只能有一个被public修饰的类，这个类名还必须和文件名相同。', 10, 2, 2, NULL, '2019-03-11 19:03:10', '2019-03-12 16:14:48', 0);
INSERT INTO `question` VALUES (14, '下面说法错误的是（    ）', '', 1, '能被java.exe成功运行的java class文件必须有mian（）方法。', 'J2SDK就是Java API。', 'Appletviewer.exe可利用jar选项运行.jar文件。', '能被Appletviewer成功运行的java class文件必须有main方法。', NULL, NULL, 'BCD ', '正确答案：BCD \r\n A：main是主函数，是程序执行的起始点。没有main函数会报错不能编译执行。 \r\n B：J2SDK是java开发环境包，包括了JDK（开发工具包）和JRE（运行环境包）。而API是Application Programming Interface，是应用程序编程接口，两者不是一个东西。\r\n\r\n C：这个楼楼真的没搞懂，欢迎懂得大佬来踢馆。 \r\n D：Applet只要继承Applet类就行了,不需要main()方法。', 5, 2, 2, NULL, '2019-03-12 14:25:11', '2019-03-13 16:48:09', 0);
INSERT INTO `question` VALUES (15, '不能用来修饰interface的有（  ）', '', 1, 'private', 'public', 'protected', 'static', NULL, NULL, 'ACD', '正确答案：ACD \r\n A：接口是为了让别人实现的，你私有化了，就和自身作用其冲突，所以错误。 \r\n B：正确。 \r\n C：接口为的是实现，所以你修饰protected了，别的类就无法实现了，错误。 \r\n D：interface是一个接口，也就是说它的方法全部都为空，只有方法名，没有方法体，如果定义成static，那么就能直接调用类来调用抽象方法，没有意义。故而规定interface不能用static修饰。', 5, 2, 2, NULL, '2019-03-12 14:27:04', '2019-03-13 16:48:13', 0);
INSERT INTO `question` VALUES (16, '如下代码输出的结果是什么？', '<pre><code><span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">Test</span> {\r\n  <span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">int</span> <span class=\"hljs-title\">aMethod</span>(<span class=\"hljs-params\"></span>) </span>{\r\n      <span class=\"hljs-keyword\">static</span> <span class=\"hljs-keyword\">int</span> i = <span class=\"hljs-number\">0</span>;  <span class=\"hljs-comment\">//错误的语法</span>\r\n      i++;\r\n      <span class=\"hljs-keyword\">return</span> i;\r\n  }\r\n  <span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">static</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">main</span> (<span class=\"hljs-params\">String args[]</span>) </span>{\r\n      Test test = <span class=\"hljs-keyword\">new</span> Test();\r\n      test.aMethod();\r\n      <span class=\"hljs-keyword\">int</span> j = test.aMethod();\r\n      System.<span class=\"hljs-keyword\">out</span>.println(j);\r\n  }\r\n}\r\n</code></pre>', 0, '0', '1', '2', ' 编译失败', NULL, NULL, 'D', 'i在方法aMethod中是成员变量，而static的作用域是整个类', 5, 2, 2, NULL, '2019-03-12 14:29:14', '2019-03-12 14:29:14', 0);
INSERT INTO `question` VALUES (17, '若变量已正确定义并赋值,以下符合C语言语法的表达式是 ', '', 0, 'a:=b+1', 'a=b=c+2', 'int 18.5%3', 'a=a+7=c+b', NULL, NULL, 'B', '答案解析：选项A中包含一个不合法的运算符\":=\";选项C应改为(int)18.5%3;选项D可理解为两个表达式:a+7=c+b和a=a+7,其中第一个是错的,因为C语言规定赋值号的左边只能是单个变量,不能是表达式或常量等。因此,正确答案是选项B,它实际上相当于a=(b=c+2),进而可分解为两个表达式:b=c+2和a=b。', 5, 2, 1, NULL, '2019-03-12 17:36:48', '2019-03-16 17:26:38', 0);
INSERT INTO `question` VALUES (18, '以下不合法的用户标识符是( ) ', '', 0, '804zhang', '_ hh', 'yy614', 'If', NULL, NULL, 'A', 'C语言规定，标识符是由字母、数字或下划线组成，并且它的第一个字符必须是字母或下划线', 5, 1, 1, NULL, '2019-03-16 16:46:28', '2019-03-16 17:26:42', 0);
INSERT INTO `question` VALUES (19, '以下说法正确的是( )。', '', 0, '宏定义是C语句，要在行末加分号', '可以使用# undefine提前结束宏名的使用', '在进行宏定义时，宏定义不能嵌套', '双引号中出现的宏名也要进行替换', NULL, NULL, 'B', '本题考查宏的使用规则：①字符替换格式：#define标识符字符串，行末不加分号;②双引号中出现的宏名不替换;③如果提前结束宏名的使用，程序中可以使用#undefine;④在进行宏定义时，宏定义能层层置换，能够嵌套', 5, 2, 1, NULL, '2019-03-16 16:48:28', '2019-03-16 17:26:46', 0);
INSERT INTO `question` VALUES (20, '设已有定义： float x; 则以下对指针变量p进行定义且赋初值的语句中正确的是( )', '', 0, 'int *p=(float)x', 'float *p=&x', 'float p=&x', 'float *p=1024', NULL, NULL, 'B', '定义指针变量的一般形式为：类型名 *指针变量名1，*指针变量名2,……;。对一个指针变量赋值要通过求地址运算符(&)获得变量的地址值，然后把此地址值赋给指针变量。因而在选项A的表达式中，赋值号的左边表示定义了指针变量p，而右边表示求变量x的地址值', 5, 2, 1, NULL, '2019-03-16 16:50:52', '2019-03-16 17:26:49', 0);
INSERT INTO `question` VALUES (21, '以下选项中与 if(a==1)a=b; else a++; 语句功能不同的switch语句是( )', '', 0, 'switch(a==1) {case 0:a=b;break; case 1:a++; }', 'switch(A {case 1:a=b;break; default : a++; } ', 'switch(A {default:a++;break; case 1:a=b; }', 'switch(a==1) {case 1:a=b;break; case 0:a++; }', NULL, NULL, 'A', 'if else语句的含义是，如果变量a的值等于1，则把变量b的值赋给变量a，否则，变量a的值加1。在本题的4个选项中，与其含义不同的是选项A，表示如果变量a的值等于1，则把变量a的值加1，否则，把变量b的值赋给变量a', 5, 3, 1, NULL, '2019-03-16 16:52:58', '2019-03-16 17:26:53', 0);
INSERT INTO `question` VALUES (22, '变量a中的数据用二进制表示的形式是01011101,变量b中的数据用二进制表示的形式是11110000。若要求将a的高4位取反,低4位不变,所要执行的运算是（）', '', 0, 'a^b', 'a|b', 'a&b', 'a<<4', NULL, NULL, 'A', '本题考查的是位运算的知识,对于任何二进制数,和1进行异或运算会让其取反,而和0进行异或运算不会产生任何变化,故本题选A', 5, 3, 1, NULL, '2019-03-16 16:54:47', '2019-03-16 17:26:57', 0);
INSERT INTO `question` VALUES (23, '设有定义： char p[]={′1′, ′2′, ′3′},*q=p; 以下不能计算出一个char型数据所占字节数的表达式是( )', '', 0, 'sizeof(p)', 'izeof(char)', 'sizeof(*q)', 'sizeof(p[0])', NULL, NULL, 'A', '选项A计算的是p[ ]字符数组首地址所占的内存字节数，返回值数组中所有元素占有的空间。*q和p[0]分别表示数组p中下标为0的字符元素，选项B和D都可以计算char型数据占有的字节数', 5, 3, 1, NULL, '2019-03-16 16:56:20', '2019-03-16 17:27:00', 0);
INSERT INTO `question` VALUES (24, '合法的数组定义是( ) ', '', 1, ' char a[ ] = {‘s’, ‘t’, ‘r’, ‘i’, ‘n’, ‘g’, 0}', 'char s = \"string\"', 'char a[ ] = {‘s’, ‘t’, ‘r’, ‘i’, ‘n’, ‘g’, ‘\\0’}', 'char a[] = \"string\"', NULL, NULL, 'ACD', '无解析', 5, 2, 1, NULL, '2019-03-16 16:58:40', '2019-03-16 17:27:03', 0);
INSERT INTO `question` VALUES (25, '引用数组元素时，其数组下标表达式允许是（）', '', 1, '整型常量', '整型表达式', '任何类型的表达式', '任何类型的函数调用', NULL, NULL, 'AB', '无解析', 5, 1, 1, NULL, '2019-03-16 16:59:42', '2019-03-16 17:27:06', 0);
INSERT INTO `question` VALUES (26, '若有说明int a[ ]={ 1,2,3,4};则对a数组元素的正确引用是( )', '', 1, 'a[0]', 'a[3.5]', 'a[2-1]', 'a[4]', NULL, NULL, 'AC', '无解析', 5, 2, 1, NULL, '2019-03-16 17:00:50', '2019-03-16 17:27:09', 0);
INSERT INTO `question` VALUES (27, '以下选项中不是C语言合法整数的是()', '', 1, '10110', '0386 ', '0Xffa', 'x2a2', NULL, NULL, 'BD', '无解析', 5, 1, 1, NULL, '2019-03-16 17:02:27', '2019-03-16 17:27:12', 0);
INSERT INTO `question` VALUES (28, '下列程序的输出结果是（）', '<pre><code>main(){\r\n    <span class=\"hljs-keyword\">int</span> a = <span class=\"hljs-number\">7</span>, b = <span class=\"hljs-number\">5</span>;\r\n    <span class=\"hljs-keyword\">printf</span>(<span class=\"hljs-string\">\"%d\"</span>, b = b/a);\r\n}\r\n</code></pre>', 0, '5', '1', '0', '不确定值', NULL, NULL, 'C', '无解析', 5, 2, 1, NULL, '2019-03-16 17:07:53', '2019-03-16 17:07:53', 0);
INSERT INTO `question` VALUES (29, 'C语言的表达式 (-10< x <10)能够表达x在区间（-10,10）吗？为什么？如果不能，正确的表达式应该怎么写？', '', 2, '', NULL, NULL, NULL, NULL, NULL, 'C语言的表达式 (-10< x <10)不能够表达x在区间（-10,10），因为在C语言里面，逻辑运算符的运行顺序是从左至右的顺序，而 (-10< x <10)这种形式，-10会与输入的数据比较，输出正确与否，即0或1。正确的表达式如下：\r\n（x >-10 && x < 10）;', '无解析', 10, 3, 1, NULL, '2019-03-16 17:10:08', '2019-03-16 17:27:16', 0);
INSERT INTO `question` VALUES (30, '给出以下定义: 则正确的叙述为( )', '<pre><code><span class=\"hljs-keyword\">char</span> acX[ ]= <span class=\"hljs-string\">\"abcdefg\"</span>;\r\n<span class=\"hljs-keyword\">char</span> acY[ ]= {<span class=\"hljs-string\">\'a\'</span>,<span class=\"hljs-string\">\'b\'</span>,<span class=\"hljs-string\">\'c\'</span>,<span class=\"hljs-string\">\'d\'</span>,<span class=\"hljs-string\">\'e\'</span>,<span class=\"hljs-string\">\'f\'</span>,<span class=\"hljs-string\">\'g\'</span>};\r\n</code></pre>', 0, '数组acX和数组acY等价', '数组acX和数组acY的长度相同', '数组acX的长度大于数组acY的长度', '数组acX的长度小于数组acY的长度', NULL, NULL, 'C', '无解析', 5, 2, 1, NULL, '2019-03-16 17:12:38', '2019-03-16 17:12:38', 0);
INSERT INTO `question` VALUES (31, '下面这段代码输出结果是（）', '<pre><code><span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">example</span><span class=\"hljs-params\">(<span class=\"hljs-keyword\">char</span> acHello[])</span>\r\n</span>{\r\n      <span class=\"hljs-built_in\">printf</span>(<span class=\"hljs-string\">\"%d\"</span>, <span class=\"hljs-keyword\">sizeof</span>(acHello));\r\n      <span class=\"hljs-keyword\">return</span>;\r\n}\r\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">main</span><span class=\"hljs-params\">()</span>\r\n</span>{\r\n      <span class=\"hljs-keyword\">char</span> acHello[] = <span class=\"hljs-string\">\"hello\"</span>;\r\n      example(acHello);<span class=\"hljs-comment\">//数组名称作参数，传的是地址，一个地址占四个字节</span>\r\n      <span class=\"hljs-keyword\">return</span>;\r\n}\r\n</code></pre>', 0, '4', '5', '6', '不确定', NULL, NULL, 'A', '无解析', 10, 2, 1, NULL, '2019-03-16 17:13:42', '2019-03-16 17:13:42', 0);
INSERT INTO `question` VALUES (32, '以下叙述中不正确的是( )', '', 0, '在不同的函数中可以使用相同名字的变量', '函数中的形式参数是局部变量', '在一个函数内定义的变量只在本函数范围内有效', '在一个函数内的复合语句中定义的变量在本函数范围内有效(复合语句指函数中的成对括号构成的代码)', NULL, NULL, 'D', '无解析', 5, 1, 1, NULL, '2019-03-16 17:14:42', '2019-03-16 17:27:21', 0);
INSERT INTO `question` VALUES (33, '请写出下列代码的输出内容', '<pre><code><span class=\"hljs-meta\">#<span class=\"hljs-meta-keyword\">include</span>  　　</span>\r\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">int</span> <span class=\"hljs-title\">main</span><span class=\"hljs-params\">(<span class=\"hljs-keyword\">void</span>)</span> 　　\r\n</span>{ 　　　\r\n<span class=\"hljs-keyword\">int</span> a,b,c,d;\r\n　　a=<span class=\"hljs-number\">10</span>; 　\r\n　　b=a++; 　\r\n　　c=++a; 　　\r\n　 d=<span class=\"hljs-number\">10</span>*a++; 　\r\n　　<span class=\"hljs-built_in\">printf</span>(<span class=\"hljs-string\">\"b，c，d：%d，%d，%d\"</span>，b，c，d）; 　\r\n　　<span class=\"hljs-keyword\">return</span> <span class=\"hljs-number\">0</span>; 　\r\n　}\r\n</code></pre>', 2, '', NULL, NULL, NULL, NULL, NULL, '10，12，120', '10，12，120', 10, 2, 1, NULL, '2019-03-16 17:46:09', '2019-03-16 17:46:09', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3135 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (2906, '3', '1');
INSERT INTO `role_permission` VALUES (2907, '3', '4');
INSERT INTO `role_permission` VALUES (2908, '3', '401');
INSERT INTO `role_permission` VALUES (2909, '3', '1000001992372345');
INSERT INTO `role_permission` VALUES (2910, '3', '1000002083579304');
INSERT INTO `role_permission` VALUES (3058, '1', '1');
INSERT INTO `role_permission` VALUES (3059, '1', '1000000602555213');
INSERT INTO `role_permission` VALUES (3060, '1', '1000000899091444');
INSERT INTO `role_permission` VALUES (3061, '1', '1000001224543466');
INSERT INTO `role_permission` VALUES (3062, '1', '1000001747915483');
INSERT INTO `role_permission` VALUES (3063, '1', '1000000864155694');
INSERT INTO `role_permission` VALUES (3064, '1', '1000000167185653');
INSERT INTO `role_permission` VALUES (3065, '1', '1000000850255464');
INSERT INTO `role_permission` VALUES (3066, '1', '1000000553415807');
INSERT INTO `role_permission` VALUES (3067, '1', '1000002085828985');
INSERT INTO `role_permission` VALUES (3068, '1', '1000000583815309');
INSERT INTO `role_permission` VALUES (3069, '1', '1000000414556681');
INSERT INTO `role_permission` VALUES (3070, '1', '1000001670195971');
INSERT INTO `role_permission` VALUES (3071, '1', '1000000233644405');
INSERT INTO `role_permission` VALUES (3072, '1', '1000000159347988');
INSERT INTO `role_permission` VALUES (3073, '1', '1000001743618837');
INSERT INTO `role_permission` VALUES (3074, '1', '1000000098066544');
INSERT INTO `role_permission` VALUES (3075, '1', '1000001512619368');
INSERT INTO `role_permission` VALUES (3076, '1', '1000000727959093');
INSERT INTO `role_permission` VALUES (3077, '1', '1000000243343801');
INSERT INTO `role_permission` VALUES (3078, '1', '1000000426716222');
INSERT INTO `role_permission` VALUES (3079, '1', '1000000773560150');
INSERT INTO `role_permission` VALUES (3080, '1', '1000000658745124');
INSERT INTO `role_permission` VALUES (3081, '1', '1000000281400324');
INSERT INTO `role_permission` VALUES (3082, '1', '1000000399266971');
INSERT INTO `role_permission` VALUES (3083, '1', '1000000976625379');
INSERT INTO `role_permission` VALUES (3084, '1', '1000002127467055');
INSERT INTO `role_permission` VALUES (3085, '1', '1000001458372033');
INSERT INTO `role_permission` VALUES (3086, '1', '1000001832967209');
INSERT INTO `role_permission` VALUES (3087, '1', '1000000754923037');
INSERT INTO `role_permission` VALUES (3088, '1', '1000000759248744');
INSERT INTO `role_permission` VALUES (3089, '1', '1000000863853891');
INSERT INTO `role_permission` VALUES (3090, '1', '1000001264798222');
INSERT INTO `role_permission` VALUES (3091, '1', '1000000432183856');
INSERT INTO `role_permission` VALUES (3092, '1', '1000000237721285');
INSERT INTO `role_permission` VALUES (3093, '1', '1000001238193773');
INSERT INTO `role_permission` VALUES (3094, '1', '1000001305005793');
INSERT INTO `role_permission` VALUES (3095, '1', '1000001679037501');
INSERT INTO `role_permission` VALUES (3096, '1', '1000001011730177');
INSERT INTO `role_permission` VALUES (3097, '1', '1000001312374743');
INSERT INTO `role_permission` VALUES (3098, '1', '1000001507480127');
INSERT INTO `role_permission` VALUES (3099, '1', '1000000224901858');
INSERT INTO `role_permission` VALUES (3100, '1', '1000001579533936');
INSERT INTO `role_permission` VALUES (3101, '1', '1000000663968031');
INSERT INTO `role_permission` VALUES (3102, '1', '1000000322655547');
INSERT INTO `role_permission` VALUES (3103, '1', '1000001419287014');
INSERT INTO `role_permission` VALUES (3104, '1', '1000002075182223');
INSERT INTO `role_permission` VALUES (3105, '1', '2');
INSERT INTO `role_permission` VALUES (3106, '1', '201');
INSERT INTO `role_permission` VALUES (3107, '1', '20101');
INSERT INTO `role_permission` VALUES (3108, '1', '20102');
INSERT INTO `role_permission` VALUES (3109, '1', '20103');
INSERT INTO `role_permission` VALUES (3110, '1', '20104');
INSERT INTO `role_permission` VALUES (3111, '1', '20105');
INSERT INTO `role_permission` VALUES (3112, '1', '20106');
INSERT INTO `role_permission` VALUES (3113, '1', '202');
INSERT INTO `role_permission` VALUES (3114, '1', '20201');
INSERT INTO `role_permission` VALUES (3115, '1', '20202');
INSERT INTO `role_permission` VALUES (3116, '1', '20203');
INSERT INTO `role_permission` VALUES (3117, '1', '20204');
INSERT INTO `role_permission` VALUES (3118, '1', '20205');
INSERT INTO `role_permission` VALUES (3119, '1', '20206');
INSERT INTO `role_permission` VALUES (3120, '1', '203');
INSERT INTO `role_permission` VALUES (3121, '1', '20301');
INSERT INTO `role_permission` VALUES (3122, '1', '20302');
INSERT INTO `role_permission` VALUES (3123, '1', '20303');
INSERT INTO `role_permission` VALUES (3124, '1', '20304');
INSERT INTO `role_permission` VALUES (3125, '1', '4');
INSERT INTO `role_permission` VALUES (3126, '1', '401');
INSERT INTO `role_permission` VALUES (3127, '1', '1000001992372345');
INSERT INTO `role_permission` VALUES (3128, '1', '1000002083579304');
INSERT INTO `role_permission` VALUES (3129, '1', '1000000171409776');
INSERT INTO `role_permission` VALUES (3130, '1', '1000000587822241');
INSERT INTO `role_permission` VALUES (3131, '1', '1000000493635111');
INSERT INTO `role_permission` VALUES (3132, '1', '1000000318760332');
INSERT INTO `role_permission` VALUES (3133, '1', '3');
INSERT INTO `role_permission` VALUES (3134, '1', '301');

-- ----------------------------
-- Table structure for site_info
-- ----------------------------
DROP TABLE IF EXISTS `site_info`;
CREATE TABLE `site_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of site_info
-- ----------------------------
INSERT INTO `site_info` VALUES (1, 'OnlineExam | C语言在线考试系统', '90后少年，热爱写bug，热爱编程，热爱学习，分享一些个人项目经验，共同学习，少走弯路。Just do it！', 'http://cdn.nbclass.com/blog/img/person.jpg', '2018-07-22 22:13:26', '2018-07-22 22:13:29');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, '1', 'C语言程序设计', '计算机专业学生必修课程', 'http://localhost:8081/index#subjects', 1, '超级管理员', '2019-01-18 19:23:42', '2019-01-18 19:23:42', 1);
INSERT INTO `subject` VALUES (2, '1', 'Java程序设计', '软件工程专业学生必修课程', 'http://localhost:8081/index#subjects', 2, '超级管理员', '2019-01-18 19:25:09', '2019-01-18 19:25:09', 1);
INSERT INTO `subject` VALUES (3, '1', '数据库', '软件工程专业学生必须课程', '1234545667.jpg', 3, '超级管理员', '2019-01-23 23:40:05', '2019-01-23 23:40:05', 1);

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
INSERT INTO `sys_config` VALUES (6, 'SITE_KWD', '在线考试系统', 1, '网站关键字');
INSERT INTO `sys_config` VALUES (7, 'SITE_DESC', '在线考试系统', 1, '网站描述');
INSERT INTO `sys_config` VALUES (8, 'SITE_PERSON_PIC', 'http://cdn.nbclass.com/blog/img/person.jpg', 1, '站长头像');
INSERT INTO `sys_config` VALUES (9, 'SITE_PERSON_NAME', 'OnlineExam | 在线考试系统', 1, '站长名称');
INSERT INTO `sys_config` VALUES (10, 'SITE_PERSON_DESC', '90后少年，热爱写bug，热爱编程，热爱学习，分享一些个人项目经验，共同学习，少走弯路。Just do it！', 1, '站长描述');
INSERT INTO `sys_config` VALUES (11, 'BAIDU_PUSH_URL', 'http://data.zz.baidu.com/urls?site=www.nbclass.com&token=asdasd324234234', 1, '百度推送地址');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, 'Linux', '111', '2018-01-14 21:35:31', '2018-07-25 18:53:34');
INSERT INTO `tag` VALUES (2, 'Java', '222', '2018-01-14 21:35:45', '2018-07-25 18:53:38');
INSERT INTO `tag` VALUES (3, 'Spring', NULL, '2018-01-14 21:35:52', '2018-01-14 21:35:52');
INSERT INTO `tag` VALUES (4, 'Spring Boot', NULL, '2018-01-14 21:36:01', '2018-01-14 21:36:01');
INSERT INTO `tag` VALUES (5, '其他', '其他', '2018-07-25 18:55:06', '2018-07-25 18:55:06');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', 'admin', '872359cc44c637cc73b7cd55c06d95e4', '8cd50474d2a3c1e88298e91df8bf6f1c', '超级管理员', '888@qq.com', '18788889999', 1, 22, 'http://cdn.nbclass.com/blog/img/person.jpg', 1, '2018-05-23 21:22:06', '2018-07-17 23:04:46', '2019-03-18 18:34:06');
INSERT INTO `user` VALUES (3, '1000001795280200', '40115208', '66e7c92327cf7da04695c621d3bb86a8', 'deb10a46317ac7a41fb97d6ffe8d9165', '郭洪奎', 'hungkuei@163.com', '15709620338', 1, 24, NULL, 1, '2019-02-27 11:58:02', '2019-02-27 11:58:02', '2019-03-18 18:00:02');
INSERT INTO `user` VALUES (4, '1000000318553137', '40115200', '67835e6eb98746c9edcde9c24b9c4af0', '05762c074117634fe628921e57ffdce0', '郭洪奎', 'hungkuei@163.com', '15709620338', 1, 24, NULL, 1, '2019-03-17 17:19:47', '2019-03-17 17:19:47', '2019-03-17 17:19:47');
INSERT INTO `user` VALUES (5, '1000001728681140', 'dbsys', '3600692b048f55e5390379c9922599fa', 'e8bcbb9168a502b258bdccb7a1cd7688', '数据库管理员', '', '', 1, NULL, NULL, 1, '2019-03-17 17:20:45', '2019-03-17 17:20:45', '2019-03-17 17:20:45');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, '1', '1');
INSERT INTO `user_role` VALUES (2, '1000000695368215', '3');
INSERT INTO `user_role` VALUES (3, '1000001795280200', '3');
INSERT INTO `user_role` VALUES (4, '1000001728681140', '4');
INSERT INTO `user_role` VALUES (5, '1000000318553137', '3');

SET FOREIGN_KEY_CHECKS = 1;
