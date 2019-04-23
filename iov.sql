/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50621
 Source Host           : localhost:3306
 Source Schema         : iov

 Target Server Type    : MySQL
 Target Server Version : 50621
 File Encoding         : 65001

 Date: 23/04/2019 18:20:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_account_log
-- ----------------------------
DROP TABLE IF EXISTS `auth_account_log`;
CREATE TABLE `auth_account_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `log_type` int(1) DEFAULT NULL COMMENT '日志名称(1:login,register,logout)',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录ip',
  `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `succeed` tinyint(1) DEFAULT NULL COMMENT '是否执行成功(0失败1成功)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录注册登出记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_account_log
-- ----------------------------
INSERT INTO `auth_account_log` VALUES (16, 1, 1, '0:0:0:0:0:0:0:1', '2019-04-23 17:18:28', 1);
INSERT INTO `auth_account_log` VALUES (17, 1, 1, '0:0:0:0:0:0:0:1', '2019-04-23 17:42:19', 1);
INSERT INTO `auth_account_log` VALUES (18, 1, 1, '0:0:0:0:0:0:0:1', '2019-04-23 17:45:24', 1);
INSERT INTO `auth_account_log` VALUES (19, 1, 1, '0:0:0:0:0:0:0:1', '2019-04-23 17:50:13', 1);
INSERT INTO `auth_account_log` VALUES (20, 1, 1, '0:0:0:0:0:0:0:1', '2019-04-23 17:53:35', 1);
INSERT INTO `auth_account_log` VALUES (21, 1, 1, '0:0:0:0:0:0:0:1', '2019-04-23 17:58:30', 1);

-- ----------------------------
-- Table structure for auth_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `auth_operation_log`;
CREATE TABLE `auth_operation_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
  `user_id` int(11) UNSIGNED DEFAULT NULL COMMENT '操作id',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '接口路径',
  `http_method` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求方式（get、post...）',
  `operation_time` datetime(0) DEFAULT NULL COMMENT '操作时间',
  `succeed` tinyint(1) DEFAULT NULL COMMENT '是否执行成功(0失败1成功)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_operation_log
-- ----------------------------
INSERT INTO `auth_operation_log` VALUES (31, 1, '/require_permission1', 'GET', '2019-04-23 17:18:42', 1);
INSERT INTO `auth_operation_log` VALUES (32, 1, '/require_permission1', 'GET', '2019-04-23 17:20:17', 1);
INSERT INTO `auth_operation_log` VALUES (33, 1, '/require_permission1', 'GET', '2019-04-23 17:21:33', 0);
INSERT INTO `auth_operation_log` VALUES (34, 1, '/401', 'GET', '2019-04-23 17:21:33', 0);
INSERT INTO `auth_operation_log` VALUES (35, 1, '/require_permission1', 'GET', '2019-04-23 17:42:46', 1);
INSERT INTO `auth_operation_log` VALUES (36, 1, '/require_permission1', 'GET', '2019-04-23 17:43:31', 1);
INSERT INTO `auth_operation_log` VALUES (37, 1, '/require_permission1', 'GET', '2019-04-23 17:46:53', 1);
INSERT INTO `auth_operation_log` VALUES (38, 1, '/require_permission1', 'GET', '2019-04-23 17:50:29', 1);
INSERT INTO `auth_operation_log` VALUES (39, 1, '/require_permission1', 'GET', '2019-04-23 17:53:49', 1);
INSERT INTO `auth_operation_log` VALUES (40, 1, '/require_permission1', 'GET', '2019-04-23 17:58:43', 1);

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `permission` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `type` int(3) NOT NULL DEFAULT 0 COMMENT '类型：0：默认拥有的；1：菜单类型；2：功能类型',
  `parent_id` int(11) DEFAULT 0 COMMENT '父级权限',
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限描述',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源(权限路径)',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint(1) DEFAULT 0 COMMENT '删除（0存在，1删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'delete', 0, 0, 'test', 'www.baidu.com', '2019-04-18 09:24:59', NULL, 0);
INSERT INTO `auth_permission` VALUES (2, 'edit', 0, 0, 'test', 'www.baidu.com', '2019-04-18 09:24:59', NULL, 0);
INSERT INTO `auth_permission` VALUES (3, 'user:edit', 0, 0, 'test', 'www.baidu.com', '2019-04-18 09:24:59', NULL, 0);
INSERT INTO `auth_permission` VALUES (4, 'select', 0, 0, 'test', 'www.baidu.com', '2019-04-18 09:24:59', NULL, 0);
INSERT INTO `auth_permission` VALUES (5, 'user:view', 0, 0, 'test', '222', '2019-04-15 15:31:28', NULL, 0);
INSERT INTO `auth_permission` VALUES (6, 'edit', 0, 0, 'test', '222', '2019-04-15 15:31:28', NULL, 0);

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_type` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型(0.超级管理员，1.公司管理员，2普通,3.管理通用)',
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色描述',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint(1) DEFAULT 0 COMMENT '删除（0存在，1删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES (1, 'admin', 'admin', 'test', '2019-04-19 11:01:08', NULL, 0);

-- ----------------------------
-- Table structure for auth_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_permission`;
CREATE TABLE `auth_role_permission`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色权限id',
  `role_id` int(11) UNSIGNED NOT NULL COMMENT '角色id',
  `permission_id` int(11) UNSIGNED NOT NULL COMMENT '权限id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `deleted` tinyint(1) DEFAULT 0 COMMENT '删除（0存在，1删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_role_permission
-- ----------------------------
INSERT INTO `auth_role_permission` VALUES (1, 1, 1, '2019-04-18 11:03:45', 0);
INSERT INTO `auth_role_permission` VALUES (2, 1, 2, '2019-04-18 11:03:45', 0);
INSERT INTO `auth_role_permission` VALUES (3, 1, 3, '2019-04-18 11:03:45', 0);
INSERT INTO `auth_role_permission` VALUES (4, 1, 4, '2019-04-19 11:16:38', 0);
INSERT INTO `auth_role_permission` VALUES (5, 1, 5, '2019-04-19 11:16:38', 0);

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `salt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盐',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `deleted` tinyint(1) DEFAULT 0 COMMENT '删除（0存在，1删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'root', '5434149629becbd343b308db447706af', '456u', '2019-04-18 11:11:10', NULL, 0);
INSERT INTO `auth_user` VALUES (2, 'test', 'test', '456u', '2019-04-18 11:39:06', NULL, 0);

-- ----------------------------
-- Table structure for auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_role`;
CREATE TABLE `auth_user_role`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `deleted` tinyint(1) DEFAULT 0 COMMENT '删除（0存在，1删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_user_role
-- ----------------------------
INSERT INTO `auth_user_role` VALUES (1, 1, 1, '2019-04-19 11:14:04', 0);

SET FOREIGN_KEY_CHECKS = 1;
