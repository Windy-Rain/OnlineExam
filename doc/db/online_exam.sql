/*
 Navicat Premium Data Transfer

 Source Server         : local-mysql8.0.20-3306
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : online_exam

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 20/02/2021 16:04:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ins_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '学院id',
  `class_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级介绍',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '添加者',
  `status` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '状态：0表示正常,1表示弃用',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sid` int(0) NULL DEFAULT NULL COMMENT '被评论的文章或者页面的ID(-1:留言板)',
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的ID',
  `pid` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '父级评论的id',
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
  `support` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '支持（赞）',
  `oppose` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '反对（踩）',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, -1, '1', NULL, 'admin', '超级管理员', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/7e60c1d428c7a75ffbb8c6813a0d695e.jpg', '1468584274@qq.com', NULL, 1, '218.75.49.82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>毕业快乐！</p>', NULL, 0, 0, '2019-06-25 15:35:50', '2019-06-25 15:35:50');

-- ----------------------------
-- Table structure for exam_question
-- ----------------------------
DROP TABLE IF EXISTS `exam_question`;
CREATE TABLE `exam_question`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `exam_id` int(0) UNSIGNED NOT NULL COMMENT '考试ID',
  `question_id` int(0) UNSIGNED NOT NULL COMMENT '考题ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '考试标题',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
  `grade` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '年级',
  `total_score` int(0) NULL DEFAULT NULL COMMENT '考试总分',
  `class_id` int(0) NULL DEFAULT NULL COMMENT '班级id',
  `subject_id` int(0) NULL DEFAULT NULL COMMENT '学科ID',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '考试开始时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '考试结束时间',
  `status` int(0) NULL DEFAULT 0 COMMENT '进行状态:0表示未开始,1表示进行中,2表示考试已经结束,3表示该考试已经完成批卷',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of examination
-- ----------------------------
INSERT INTO `examination` VALUES (4, 'C语言测试', '1', '周金莲', '2018', 72, 4, 1, '2019-06-10 15:41:21', '2019-06-13 08:08:47', '2019-06-12 21:00:00', '2019-06-12 22:00:00', 2);

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '考生主键ID',
  `exam_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '考试主键ID',
  `result` int(0) NULL DEFAULT 0 COMMENT '最终分数',
  `auto_result` int(0) NULL DEFAULT 0 COMMENT '电脑自动评判选择题分数',
  `manul_result` int(0) NULL DEFAULT NULL COMMENT '人工手动评判分数',
  `auto_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '考生选择题答案json',
  `manul_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '考生问答题答案json',
  `answer_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '考生作答答案json',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '考试交卷时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '改卷完成时间',
  `status` int(0) NULL DEFAULT 0 COMMENT '0未评卷,1及格2不及格3良好4优秀',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (1, '1', '4', 2, 2, 0, 'A~_~B~_~B~_~~_~null~_~B~_~null~_~null~_~null~_~null~_~null~_~~_~~_~~_~null~_~', '~_~~_~~_~~_~~_~null~_~null~_~erewrf~_~', 'A~_~B~_~B~_~~_~null~_~B~_~null~_~null~_~null~_~null~_~null~_~~_~~_~~_~~_~~_~~_~~_~~_~null~_~null~_~null~_~erewrf', '2019-06-12 21:22:35', '2019-06-12 21:22:35', 0);

-- ----------------------------
-- Table structure for institute
-- ----------------------------
DROP TABLE IF EXISTS `institute`;
CREATE TABLE `institute`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `institute_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学院名',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学院介绍',
  `institute_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学院Logo图片地址',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '添加者',
  `status` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '状态：0正常1弃用',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接名',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接地址',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接介绍',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友链图片地址',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友链站长邮箱',
  `qq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友链站长qq',
  `status` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '状态',
  `origin` int(0) NULL DEFAULT NULL COMMENT '1-管理员添加 2-自助申请',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sup_id` int(0) NULL DEFAULT NULL COMMENT '点赞的编号',
  `love_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点赞的类型： 0评论1其他',
  `user_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户编号',
  `user_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ip',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of love
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `permission_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限描述',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限访问路径',
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `parent_id` int(0) NULL DEFAULT NULL COMMENT '父级权限id',
  `type` int(0) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '排序',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `status` int(0) NOT NULL COMMENT '状态：1有效；2删除',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '题目标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '题目内容',
  `question_type` int(0) NULL DEFAULT NULL COMMENT '题目类型,0表示单项选择题,1表示多项选择题,2表示问答题,3表示编程题',
  `option_a` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '选项A',
  `option_b` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '选项B',
  `option_c` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '选项C',
  `option_d` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '选项D',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '答案',
  `parse` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '答案解析',
  `score` int(0) NULL DEFAULT NULL COMMENT '题目分值',
  `difficulty` int(0) NULL DEFAULT 1 COMMENT '题目难度',
  `subject_id` int(0) NULL DEFAULT NULL COMMENT '学科ID',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `status` int(0) NULL DEFAULT 1 COMMENT '0表示未考试题目,1表示已考试题目',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `question` VALUES (89, 'C语言中while和do-while循环的主要区别是（     ）', '', 0, 'while的循环控制条件比do–while的循环控制条件严格', 'do-while的循环体至少无条件执行一次', 'do-while允许从外部转到循环体内', 'do-while的循环体不能是复合语句', 'B', '无解析', 2, 1, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
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
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `status` int(0) NOT NULL COMMENT '状态：1有效；2删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `permission_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4415 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考生主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学科名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程描述',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程封面',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `status` int(0) NULL DEFAULT 0 COMMENT '课程状态,0表示正常,1表示弃用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `sys_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key',
  `sys_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(0) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`sys_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'SITE_PHONE', '+86-18888888888', 1, '云存储配置信息');
INSERT INTO `sys_config` VALUES (5, 'SITE_FAX', '+86-18888888888', 1, '网站名称');
INSERT INTO `sys_config` VALUES (6, 'SITE_EMAIL', 'hungkuei@163.com', 1, '网站关键字');
INSERT INTO `sys_config` VALUES (7, 'SITE_ADDRESS', '宁夏石嘴山市大武口区山水大道学院路1号', 1, '网站描述');
INSERT INTO `sys_config` VALUES (8, 'SITE_NAME', 'OnlineExam | C语言在线考试系统', 1, '站长头像');
INSERT INTO `sys_config` VALUES (9, 'SITE_URL', 'http://localhost', 1, '站长名称');
INSERT INTO `sys_config` VALUES (10, 'SITE_DESC', 'OnlineExam | C语言在线考试系统是一个在线测试学习系统，并用于辅助课程教学和学生学习。', 1, '站长描述');
INSERT INTO `sys_config` VALUES (11, 'CLOUD_STORAGE_CONFIG', '{\"type\":3,\"qiniuDomain\":\"\",\"qiniuPrefix\":\"\",\"qiniuAccessKey\":\"\",\"qiniuSecretKey\":\"\",\"qiniuBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"https://online-exam-1256117146.cos.ap-beijing.myqcloud.com\",\"qcloudPrefix\":\"img/exam\",\"qcloudSecretId\":\"AKIDrUs0sUOvkOnvoRttjJdhU1IJ4Zon7yA6\",\"qcloudSecretKey\":\"xxxxxxxxx\",\"qcloudBucketName\":\"online-exam-1256117146\",\"qcloudRegion\":\"ap-beijing\"}', 1, '百度推送地址');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书签名',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `class_id` int(0) NULL DEFAULT NULL COMMENT '班级id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人描述',
  `salt` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密盐值',
  `grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `sex` int(0) NULL DEFAULT NULL COMMENT '年龄：1男0女',
  `age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `status` int(0) NOT NULL COMMENT '用户状态：1有效; 2删除',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `last_login_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最后登录时间',
  PRIMARY KEY (`id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', 1, 'admin', '5d612a7242d2fca7ad70414f06ef2b7f', '95后少年，热爱写bug，热爱编程，热爱学习，分享一些个人项目经验，共同学习，少走弯路。Just do it！', '525a769d79876acfcc66505a78b533a7', '2015', '超级管理员', '1468584274@qq.com', '15709620339', 1, 23, 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/7e60c1d428c7a75ffbb8c6813a0d695e.jpg', 1, '2018-05-23 21:22:06', '2019-05-28 22:28:36', '2021-02-20 15:58:12');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, '1', '1');

SET FOREIGN_KEY_CHECKS = 1;
