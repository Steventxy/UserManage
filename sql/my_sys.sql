/*
 Navicat Premium Data Transfer

 Source Server         : localConnection
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : my_sys

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 08/06/2020 16:10:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `dept_id` int(5) NOT NULL,
  `dept_name` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `leader` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '前端', NULL, NULL, NULL, 1);
INSERT INTO `department` VALUES (2, '后台', NULL, NULL, NULL, 1);
INSERT INTO `department` VALUES (3, '测试', NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for food_user
-- ----------------------------
DROP TABLE IF EXISTS `food_user`;
CREATE TABLE `food_user`  (
  `id` int(3) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isused` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of food_user
-- ----------------------------
INSERT INTO `food_user` VALUES (1, 'txy', '57cff06ce996d018218ee690c6ae568e', NULL, NULL, '1');
INSERT INTO `food_user` VALUES (2, 'admin', 'f6fdffe48c908deb0f4c3bd36c032e72', NULL, NULL, '0');
INSERT INTO `food_user` VALUES (3, 'user', '4da49c16db42ca04538d629ef0533fe8', NULL, NULL, '1');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menu_id` int(5) NOT NULL AUTO_INCREMENT,
  `menu_name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(5) NULL DEFAULT NULL,
  `url` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `perms` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (10, '菜单管理', 1, '/menu', '1', 'menu:list', NULL, '2020-06-07 10:30:22', NULL, '2020-06-07 17:42:13');
INSERT INTO `menu` VALUES (11, '用户管理', 1, '/user', '1', 'user:list', NULL, '2020-06-07 10:30:17', NULL, '2020-06-07 17:42:15');
INSERT INTO `menu` VALUES (13, '部门管理', 1, '/dept', '1', 'dept:list', NULL, NULL, NULL, NULL);
INSERT INTO `menu` VALUES (14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `perm_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `perm_name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `perm_key` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `perm_url` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`perm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '用户列表', 'user:list', '/user/list');
INSERT INTO `permission` VALUES (2, '修改用户', 'user:edit', '/user/editUser');
INSERT INTO `permission` VALUES (3, '添加用户', 'user:add', '/user/addUser');
INSERT INTO `permission` VALUES (4, '删除单个用户', 'user:delete', '/user/deleteUserById');
INSERT INTO `permission` VALUES (5, '批量删除用户', 'user:delete', '/user/deleteUserByIds');
INSERT INTO `permission` VALUES (6, '菜单列表', 'menu:list', '/menu/list');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', NULL, 'admin', NULL, '超级管理员');
INSERT INTO `role` VALUES (2, '管理员', 'common', 2, '1', '0', '0', 'admin', NULL, 'admin', NULL, '管理员');
INSERT INTO `role` VALUES (3, '开发人员', 'developer', 2, '1', '0', '0', 'admin', NULL, 'admin', NULL, '');
INSERT INTO `role` VALUES (4, '用户', 'user', 1, '1', '0', '0', 'admin', NULL, 'admin', NULL, '');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `role_id` int(10) NOT NULL,
  `perm_id` int(10) NOT NULL,
  PRIMARY KEY (`role_id`, `perm_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1);
INSERT INTO `role_permission` VALUES (1, 2);
INSERT INTO `role_permission` VALUES (1, 3);
INSERT INTO `role_permission` VALUES (1, 4);
INSERT INTO `role_permission` VALUES (1, 5);
INSERT INTO `role_permission` VALUES (1, 6);
INSERT INTO `role_permission` VALUES (2, 1);
INSERT INTO `role_permission` VALUES (2, 2);
INSERT INTO `role_permission` VALUES (2, 3);
INSERT INTO `role_permission` VALUES (2, 6);
INSERT INTO `role_permission` VALUES (3, 1);
INSERT INTO `role_permission` VALUES (3, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(15) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_role` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '男' COMMENT '用户性别',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 3, 'admin', '超级管理员', '1', 'steventanxy@foxmail.com', '15200409025', '女', '', '8274d80e12531d7521ac32ceddc250dc', 'c6ed65', '0', '0', '', NULL, '', '2020-06-08 16:06:53', '', '2020-06-08 16:01:31', '<b>富文本框测试</b>');
INSERT INTO `user` VALUES (2, 2, 'txy', '谭旭洋', '2', 'tan.xuyang@qq.com', '15200409025', '男', '', '12d89ed4f3c648b716de7e8002bc5c9a', 's8sk3v', '1', '0', '', NULL, 'admin', '2020-06-08 16:01:46', '', '2020-06-08 16:01:46', '<i>富文本框</i>');
INSERT INTO `user` VALUES (3, 1, 'wwp', '伍文平', '3', '', '', '男', '', 'd5eb064c649fe2e0d0a21029e798d6d8', 'af8j2c', '1', '0', '', NULL, 'txy', '2020-06-08 13:23:50', '', '2020-06-08 13:23:50', NULL);
INSERT INTO `user` VALUES (4, 2, 'yyf', '余颖锋', '3', '', '', '男', '', '123456', NULL, '1', '0', '', NULL, 'txy', '2020-06-02 10:36:39', '', '2020-05-30 19:56:00', NULL);
INSERT INTO `user` VALUES (5, 1, 'pwd', '彭文迪', '3', '', '', '男', '', '123456', NULL, '1', '0', '', NULL, '', '2020-06-01 23:21:08', '', NULL, NULL);
INSERT INTO `user` VALUES (6, 2, 'xtf', '肖霆锋', '3', '', '', '男', '', '123456', NULL, '1', '0', '', NULL, '', '2020-06-01 23:21:08', '', NULL, NULL);
INSERT INTO `user` VALUES (7, 2, 'xyj', '向宇杰', '3', '', '', '男', '', '654321', NULL, '1', '0', '', NULL, '', '2020-06-01 23:21:08', '', NULL, NULL);
INSERT INTO `user` VALUES (8, 3, 'zs', '张三', '4', '', '', '女', '', '000000', NULL, '1', '0', '', NULL, '', '2020-06-01 23:21:08', '', NULL, NULL);
INSERT INTO `user` VALUES (9, 3, 'ls', '李斯', '4', '', '', '男', '', '666666', NULL, '1', '0', '', NULL, '', '2020-06-02 11:51:15', '', NULL, NULL);
INSERT INTO `user` VALUES (10, 3, 'ww', '王武', '4', '', '', '男', '', '555555', NULL, '1', '0', '', NULL, '', '2020-06-01 23:21:08', '', NULL, NULL);
INSERT INTO `user` VALUES (11, 3, 'twq', 'twq', '4', '', '', '女', '', '4c43adfde73008e76fa0634762a41e25', '7ajvy6', '1', '0', '', NULL, '', '2020-06-01 22:29:50', '', NULL, NULL);
INSERT INTO `user` VALUES (27, 3, 'test', '测试', '4', '', '', '男', '', '', NULL, '1', '0', '', NULL, '', '2020-06-01 21:48:57', '', NULL, NULL);
INSERT INTO `user` VALUES (33, 1, 'test', '测试', '4', '', '13543210985', '男', '', '', NULL, '1', '0', '', NULL, '', '2020-06-01 21:49:04', '', '2020-05-31 13:07:29', NULL);
INSERT INTO `user` VALUES (34, 3, 'test', 'cs', '1', '', '', '男', '', '', NULL, '1', '2', '', NULL, '', '2020-06-08 15:48:54', '', '2020-06-01 23:17:21', NULL);
INSERT INTO `user` VALUES (35, 2, 'test', 'asd', '1', 'steventanxy@foxmail.com', '15200409025', '男', '', '', NULL, '1', '2', '', NULL, '', '2020-06-08 11:49:51', '', NULL, NULL);
INSERT INTO `user` VALUES (36, 3, 'test', 'asd', '1', 'steventanxy@foxmail.com', '15200409025', '女', '', '', NULL, '1', '2', '', NULL, '', '2020-06-08 11:49:46', '', NULL, NULL);
INSERT INTO `user` VALUES (37, 2, 'test', '测试', '1', 'steventanxy@foxmail.com', '15200409025', '女', '', '', NULL, '1', '2', '', NULL, '', '2020-06-08 15:48:51', '', NULL, NULL);
INSERT INTO `user` VALUES (38, 1, 'test', 'test', '3', 'steventanxy@foxmail.com', '15200409025', '女', '', '', NULL, '1', '2', '', NULL, '', '2020-06-08 15:55:34', '', NULL, NULL);
INSERT INTO `user` VALUES (39, 1, 'test', '阿萨德', '3', '', '', '女', '', '', NULL, '1', '2', '', NULL, '', '2020-06-08 15:55:31', '', '2020-06-08 15:55:20', '阿萨德');
INSERT INTO `user` VALUES (40, 2, 'test', '阿萨德', '3', '', '阿萨德', '女', '', '', NULL, '1', '2', '', NULL, '', '2020-06-08 15:59:57', '', NULL, '阿萨德');
INSERT INTO `user` VALUES (41, 3, 'test', '测试', '3', '', '', '女', '', '', NULL, '1', '0', '', NULL, '', '2020-06-08 16:02:14', '', NULL, '富文本框测试<img src=\"http://localhost/layui/images/face/54.gif\" alt=\"[good]\">');

-- ----------------------------
-- Table structure for user_copy1
-- ----------------------------
DROP TABLE IF EXISTS `user_copy1`;
CREATE TABLE `user_copy1`  (
  `user_id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(15) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '男' COMMENT '用户性别',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_copy1
-- ----------------------------
INSERT INTO `user_copy1` VALUES (1, 1, 'admin', 'admin', '00', '', '', '女', '', '', '1', '0', '', NULL, '', '2020-05-28 21:04:01', '', NULL, NULL);
INSERT INTO `user_copy1` VALUES (2, 2, 'txy', '谭旭洋', '1', 'tan.xuyang@qq.com', '15200409025', '男', '', 'txy813', '1', '0', '', NULL, '', '2020-05-28 21:04:21', 'admin', NULL, NULL);
INSERT INTO `user_copy1` VALUES (3, 2, 'wwp', '伍文平', '1', '', '', '男', '', '123456', '1', '0', '', NULL, '', '2020-05-28 21:06:27', 'txy', NULL, NULL);
INSERT INTO `user_copy1` VALUES (4, 2, 'yyf', '余颖锋', '1', '', '', '男', '', '123456', '1', '0', '', NULL, '', '2020-05-28 21:08:05', 'txy', NULL, NULL);
INSERT INTO `user_copy1` VALUES (5, 2, 'pwd', '彭文迪', '1', '', '', '男', '', '123456', '1', '0', '', NULL, '', '2020-05-28 21:08:41', '', NULL, NULL);
INSERT INTO `user_copy1` VALUES (6, 2, 'xtf', '肖霆锋', '1', '', '', '男', '', '123456', '1', '0', '', NULL, '', '2020-05-28 21:20:45', '', NULL, NULL);
INSERT INTO `user_copy1` VALUES (7, 2, 'xyj', '向宇杰', '1', '', '', '男', '', '654321', '1', '0', '', NULL, '', '2020-05-28 21:20:49', '', NULL, NULL);
INSERT INTO `user_copy1` VALUES (23, 3, 'zs', '张三', '2', '', '', '女', '', '000000', '1', '0', '', NULL, '', '2020-05-28 21:10:24', '', NULL, NULL);
INSERT INTO `user_copy1` VALUES (24, 3, 'ls', '李斯', '2', '', '', '男', '', '666666', '1', '0', '', NULL, '', '2020-05-28 21:10:25', '', NULL, NULL);
INSERT INTO `user_copy1` VALUES (25, 3, 'ww', '王武', '2', '', '', '男', '', '555555', '1', '0', '', NULL, '', NULL, '', NULL, NULL);
INSERT INTO `user_copy1` VALUES (26, 3, 'twq', 'twq', '3', '', '', '女', '', '888888', '1', '0', '', NULL, '', NULL, '', NULL, NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `role_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (2, 2);
INSERT INTO `user_role` VALUES (3, 3);
INSERT INTO `user_role` VALUES (4, 3);
INSERT INTO `user_role` VALUES (5, 3);
INSERT INTO `user_role` VALUES (6, 3);
INSERT INTO `user_role` VALUES (7, 3);
INSERT INTO `user_role` VALUES (8, 4);
INSERT INTO `user_role` VALUES (9, 4);
INSERT INTO `user_role` VALUES (10, 4);
INSERT INTO `user_role` VALUES (11, 4);

SET FOREIGN_KEY_CHECKS = 1;
