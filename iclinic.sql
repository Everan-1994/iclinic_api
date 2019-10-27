/*
 Navicat Premium Data Transfer

 Source Server         : Everan-server
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : 39.108.114.179:3306
 Source Schema         : iclinic

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 20/10/2019 20:03:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for actions
-- ----------------------------
DROP TABLE IF EXISTS `actions`;
CREATE TABLE `actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(10) unsigned NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of actions
-- ----------------------------
BEGIN;
INSERT INTO `actions` VALUES (24, 0, '权限', '', '仅开发人员使用', 6, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (25, 24, '创建权限', 'Post:/admin/actions', '', 2, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (26, 24, '删除权限', 'Delete:/admin/actions', '', 4, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (27, 0, '权限通过角色进行分配', '', '', 8, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (28, 27, '查看角色列表', 'Get:/admin/roles', '', 1, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (29, 27, '查看角色详情', 'Get:/admin/roles/{id:[0-9]+}', '', 2, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (30, 27, '创建角色', 'Post:/admin/roles', '', 3, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (31, 27, '更新角色', 'Put:/admin/roles', '', 4, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (32, 27, '删除角色', 'Delete:/admin/roles', '', 5, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (33, 0, '成员', '', '后台管理员', 7, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (34, 33, '查看成员列表', 'Get:/admin/members', '', 1, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (35, 33, '查看成员详情', 'Get:/admin/members/{id}', '', 2, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (36, 33, '创建成员', 'Post:/admin/members', '', 3, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (37, 33, '更新成员', 'Put:/admin/members', '', 4, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (38, 33, '删除成员', 'Delete:/admin/members', '', 5, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (39, 33, '禁用、启用成员账户', 'Patch:/admin/members', '', 6, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (60, 24, '更新权限', 'Put:/admin/actions', '', 3, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
INSERT INTO `actions` VALUES (61, 0, '个人信息管理', '', '', 1569515038, '2019-09-27 00:23:58', '2019-09-27 00:23:58', NULL);
INSERT INTO `actions` VALUES (62, 61, '个人信息新增', 'Post:/admin/person', '', 1569515181, '2019-09-27 00:26:21', '2019-09-27 00:26:21', NULL);
INSERT INTO `actions` VALUES (63, 61, '个人信息列表', 'Get:/admin/person', '', 1569515277, '2019-09-27 00:27:57', '2019-09-27 00:27:57', NULL);
INSERT INTO `actions` VALUES (64, 61, '个人信息详情', 'Get:/admin/person/{id}', '', 1569515294, '2019-09-27 00:28:14', '2019-09-27 00:28:14', NULL);
INSERT INTO `actions` VALUES (65, 61, '个人信息更新', 'Put:/admin/person/{id}', '', 1569515316, '2019-09-27 00:28:36', '2019-09-27 00:28:36', NULL);
INSERT INTO `actions` VALUES (66, 61, '个人信息删除', 'Delete:/admin/person', '', 1569515336, '2019-09-27 00:28:56', '2019-09-27 00:28:56', NULL);
INSERT INTO `actions` VALUES (67, 0, '设备资源管理', '', '', 1569515377, '2019-09-27 00:29:37', '2019-09-27 00:29:37', NULL);
INSERT INTO `actions` VALUES (68, 67, '设置资源新增', 'Post:/admin/device', '', 1569515410, '2019-09-27 00:30:10', '2019-09-27 00:30:10', NULL);
INSERT INTO `actions` VALUES (69, 67, '设置资源列表', 'Get:/admin/device', '', 1569515436, '2019-09-27 00:30:36', '2019-09-27 00:30:36', NULL);
INSERT INTO `actions` VALUES (70, 67, '设置资源详情', 'Get:/admin/device/{id}', '', 1569515452, '2019-09-27 00:30:52', '2019-09-27 00:30:52', NULL);
INSERT INTO `actions` VALUES (71, 67, '设置资源更新', 'Put:/admin/device/{id}', '', 1569515465, '2019-09-27 00:31:05', '2019-09-27 00:31:05', NULL);
INSERT INTO `actions` VALUES (72, 67, '设置资源删除', 'Delete:/admin/device', '', 1569515477, '2019-09-27 00:31:17', '2019-09-27 00:31:17', NULL);
INSERT INTO `actions` VALUES (73, 0, '医疗诊断', '', '', 1569515518, '2019-09-27 00:31:58', '2019-09-27 00:31:58', NULL);
INSERT INTO `actions` VALUES (74, 73, '医疗诊断新增', 'Post:/admin/diagnose', '', 1569515576, '2019-09-27 00:32:56', '2019-09-27 00:32:56', NULL);
INSERT INTO `actions` VALUES (75, 73, '医疗诊断列表', 'Get:/admin/diagnose', '', 1569515589, '2019-09-27 00:33:09', '2019-09-27 00:33:09', NULL);
INSERT INTO `actions` VALUES (76, 73, '医疗诊断详情', 'Get:/admin/diagnose/{id}', '', 1569515599, '2019-09-27 00:33:19', '2019-09-27 00:33:19', NULL);
INSERT INTO `actions` VALUES (77, 73, '医疗诊断更新', 'Put:/admin/diagnose/{id}', '', 1569515611, '2019-09-27 00:33:31', '2019-09-27 00:33:31', NULL);
INSERT INTO `actions` VALUES (78, 73, '医疗诊断删除', 'Delete:/admin/diagnose', '', 1569515623, '2019-09-27 00:33:43', '2019-09-27 00:33:43', NULL);
INSERT INTO `actions` VALUES (79, 0, '门诊处方', '', '', 1569515655, '2019-09-27 00:34:15', '2019-09-27 00:35:15', NULL);
INSERT INTO `actions` VALUES (80, 79, '门诊处方新增', 'Post:/admin/order', '', 1569515709, '2019-09-27 00:35:09', '2019-09-27 00:35:09', NULL);
INSERT INTO `actions` VALUES (81, 79, '门诊处方列表', 'Get:/admin/order', '', 1569515734, '2019-09-27 00:35:34', '2019-09-27 00:35:34', NULL);
INSERT INTO `actions` VALUES (82, 79, '门诊处方详情', 'Get:/admin/order/{id}', '', 1569515744, '2019-09-27 00:35:44', '2019-09-27 00:35:44', NULL);
INSERT INTO `actions` VALUES (83, 79, '门诊处方更新', 'Put:/admin/order/{id}', '', 1569515768, '2019-09-27 00:36:08', '2019-09-27 00:36:08', NULL);
INSERT INTO `actions` VALUES (84, 79, '门诊处方删除', 'Delete:/admin/order', '', 1569515778, '2019-09-27 00:36:18', '2019-09-27 00:36:18', NULL);
INSERT INTO `actions` VALUES (85, 0, '门诊病历', '', '', 1569515797, '2019-09-27 00:36:37', '2019-09-27 00:36:37', NULL);
INSERT INTO `actions` VALUES (86, 85, '门诊病历新增', 'Post:/admin/record', '', 1569515824, '2019-09-27 00:37:04', '2019-09-27 00:37:04', NULL);
INSERT INTO `actions` VALUES (87, 85, '门诊病历列表', 'Get:/admin/record', '', 1569515864, '2019-09-27 00:37:44', '2019-09-27 00:37:44', NULL);
INSERT INTO `actions` VALUES (88, 85, '门诊病历详情', 'Get:/admin/record/{id}', '', 1569515873, '2019-09-27 00:37:53', '2019-09-27 00:37:53', NULL);
INSERT INTO `actions` VALUES (89, 85, '门诊病历更新', 'Put:/admin/record/{id}', '', 1569515881, '2019-09-27 00:38:01', '2019-09-27 00:38:01', NULL);
INSERT INTO `actions` VALUES (90, 85, '门诊病历删除', 'Delete:/admin/record', '', 1569515906, '2019-09-27 00:38:26', '2019-09-27 00:38:26', NULL);
INSERT INTO `actions` VALUES (91, 0, '转诊记录', '', '', 1569515925, '2019-09-27 00:38:45', '2019-09-27 00:38:45', NULL);
INSERT INTO `actions` VALUES (92, 91, '转诊记录新增', 'Post:/admin/referral', '', 1569515942, '2019-09-27 00:39:02', '2019-09-27 00:39:02', NULL);
INSERT INTO `actions` VALUES (93, 91, '转诊记录列表', 'Get:/admin/referral', '', 1569515953, '2019-09-27 00:39:13', '2019-09-27 00:39:13', NULL);
INSERT INTO `actions` VALUES (94, 91, '转诊记录详情', 'Get:/admin/referral/{id}', '', 1569515961, '2019-09-27 00:39:21', '2019-09-27 00:39:21', NULL);
INSERT INTO `actions` VALUES (95, 91, '转诊记录更新', 'Put:/admin/referral/{id}', '', 1569515970, '2019-09-27 00:39:30', '2019-09-27 00:39:30', NULL);
INSERT INTO `actions` VALUES (96, 91, '转诊记录删除', 'Delete:/admin/referral', '', 1569515978, '2019-09-27 00:39:38', '2019-09-27 00:39:38', NULL);
INSERT INTO `actions` VALUES (97, 0, '机构组织', '', '', 1569515996, '2019-09-27 00:39:56', '2019-09-27 00:39:56', NULL);
INSERT INTO `actions` VALUES (98, 97, '机构组织新增', 'Post:/admin/organization', '', 1569516019, '2019-09-27 00:40:19', '2019-09-27 00:45:57', NULL);
INSERT INTO `actions` VALUES (99, 97, '机构组织列表', 'Get:/admin/organization', '', 1569516034, '2019-09-27 00:40:34', '2019-09-27 00:45:59', NULL);
INSERT INTO `actions` VALUES (100, 97, '机构组织详情', 'Get:/admin/organization/{id}', '', 1569516048, '2019-09-27 00:40:48', '2019-09-27 00:46:01', NULL);
INSERT INTO `actions` VALUES (101, 97, '机构组织更新', 'Put:/admin/organization/{id}', '', 1569516057, '2019-09-27 00:40:57', '2019-09-27 00:46:03', NULL);
INSERT INTO `actions` VALUES (102, 97, '机构组织删除', 'Delete:/admin/organization', '', 1569516070, '2019-09-27 00:41:10', '2019-09-27 00:46:11', NULL);
INSERT INTO `actions` VALUES (103, 0, '服务点', '', '', 1569516082, '2019-09-27 00:41:22', '2019-09-27 00:41:22', NULL);
INSERT INTO `actions` VALUES (104, 103, '服务点新增', 'Post:/admin/server', '', 1569516096, '2019-09-27 00:41:36', '2019-09-27 00:41:36', NULL);
INSERT INTO `actions` VALUES (105, 103, '服务点列表', 'Get:/admin/server', '', 1569516104, '2019-09-27 00:41:44', '2019-09-27 00:41:44', NULL);
INSERT INTO `actions` VALUES (106, 103, '服务点详情', 'Get:/admin/server/{id}', '', 1569516113, '2019-09-27 00:41:53', '2019-09-27 00:41:53', NULL);
INSERT INTO `actions` VALUES (107, 103, '服务点更新', 'Put:/admin/server/{id}', '', 1569516123, '2019-09-27 00:42:03', '2019-09-27 00:42:03', NULL);
INSERT INTO `actions` VALUES (108, 103, '服务点删除', 'Delete:/admin/server', '', 1569516131, '2019-09-27 00:42:11', '2019-09-27 00:42:11', NULL);
INSERT INTO `actions` VALUES (109, 0, '机构业务开展情况', '', '', 1569516155, '2019-09-27 00:42:35', '2019-09-27 00:42:35', NULL);
INSERT INTO `actions` VALUES (110, 109, '机构业务开展情况新增', 'Post:/admin/odi', '', 1569516188, '2019-09-27 00:43:08', '2019-09-27 00:43:08', NULL);
INSERT INTO `actions` VALUES (111, 109, '机构业务开展情况列表', 'Get:/admin/odi', '', 1569516215, '2019-09-27 00:43:35', '2019-09-27 00:43:35', NULL);
INSERT INTO `actions` VALUES (112, 109, '机构业务开展情况详情', 'Get:/admin/odi/{id}', '', 1569516225, '2019-09-27 00:43:45', '2019-09-27 00:43:45', NULL);
INSERT INTO `actions` VALUES (113, 109, '机构业务开展情况更新', 'Put:/admin/odi/{id}', '', 1569516270, '2019-09-27 00:44:30', '2019-09-27 00:44:30', NULL);
INSERT INTO `actions` VALUES (114, 109, '机构业务开展情况删除', 'Delete:/admin/odi', '', 1569516281, '2019-09-27 00:44:41', '2019-09-27 00:44:41', NULL);
INSERT INTO `actions` VALUES (115, 0, '科室管理', '', '', 1569516413, '2019-09-27 00:46:53', '2019-09-27 00:46:53', NULL);
INSERT INTO `actions` VALUES (116, 115, '科室新增', 'Post:/admin/department', '', 1569516437, '2019-09-27 00:47:17', '2019-09-27 00:47:17', NULL);
INSERT INTO `actions` VALUES (117, 115, '科室列表', 'Get:/admin/department', '', 1569516448, '2019-09-27 00:47:28', '2019-09-27 00:47:28', NULL);
INSERT INTO `actions` VALUES (118, 115, '科室详情', 'Get:/admin/department/{id}', '', 1569516460, '2019-09-27 00:47:40', '2019-09-27 00:47:40', NULL);
INSERT INTO `actions` VALUES (119, 115, '科室更新', 'Put:/admin/department/{id}', '', 1569516490, '2019-09-27 00:48:10', '2019-09-27 00:48:10', NULL);
INSERT INTO `actions` VALUES (120, 115, '科室删除', 'Delete:/admin/department', '', 1569516498, '2019-09-27 00:48:18', '2019-09-27 00:48:18', NULL);
INSERT INTO `actions` VALUES (121, 0, '人力资源信息', '', '', 1569516517, '2019-09-27 00:48:37', '2019-09-27 00:48:37', NULL);
INSERT INTO `actions` VALUES (122, 121, '人力资源新增', 'Post:/admin/human', '', 1569516534, '2019-09-27 00:48:54', '2019-09-27 00:48:54', NULL);
INSERT INTO `actions` VALUES (123, 121, '人力资源列表', 'Get:/admin/human', '', 1569516544, '2019-09-27 00:49:04', '2019-09-27 00:49:04', NULL);
INSERT INTO `actions` VALUES (124, 121, '人力资源详情', 'Get:/admin/human/{id}', '', 1569516551, '2019-09-27 00:49:11', '2019-09-27 00:49:11', NULL);
INSERT INTO `actions` VALUES (125, 121, '人力资源更新', 'Put:/admin/human/{id}', '', 1569516558, '2019-09-27 00:49:18', '2019-09-27 00:49:18', NULL);
INSERT INTO `actions` VALUES (126, 121, '人力资源删除', 'Delete:/admin/human', '', 1569516574, '2019-09-27 00:49:34', '2019-09-27 00:49:34', NULL);
INSERT INTO `actions` VALUES (127, 0, '操作日志', 'Get:/admin/operation', '', 1569516625, '2019-09-27 00:50:25', '2019-09-27 00:50:37', '2019-09-27 00:50:37');
INSERT INTO `actions` VALUES (128, 0, '其他权限', 'Get:/admin/operation', '', -27, '2019-09-27 00:51:11', '2019-09-27 00:52:40', NULL);
INSERT INTO `actions` VALUES (129, 128, '操作日志', 'Get:/admin/operation', '', 1569516689, '2019-09-27 00:51:29', '2019-09-27 00:51:29', NULL);
INSERT INTO `actions` VALUES (130, 128, '动作列表', 'Get:/admin/actions', '', 1569516705, '2019-09-27 00:51:45', '2019-09-27 00:51:55', NULL);
INSERT INTO `actions` VALUES (131, 128, '排序操作', 'Patch:/admin/actions/sort', '', 1569516737, '2019-09-27 00:52:17', '2019-09-27 00:52:17', NULL);
INSERT INTO `actions` VALUES (132, 128, '下拉选项', 'Get:/admin/select', '', 1569516755, '2019-09-27 00:52:35', '2019-09-27 00:52:35', NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_role_actions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_actions`;
CREATE TABLE `admin_role_actions` (
  `adminRoleId` int(10) unsigned NOT NULL,
  `actionId` int(10) unsigned NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL,
  KEY `admin_role_actions_adminroleid_index` (`adminRoleId`),
  KEY `admin_role_actions_actionid_index` (`actionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `adminRoleId` int(10) unsigned NOT NULL,
  `adminUserId` int(10) unsigned NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_adminroleid_index` (`adminRoleId`),
  KEY `admin_role_users_adminuserid_index` (`adminUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_users` VALUES (1, 1, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isSuper` tinyint(4) NOT NULL DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
BEGIN;
INSERT INTO `admin_roles` VALUES (1, '超级管理员', 1, '2019-09-16 04:16:48', '2019-09-16 04:16:48', NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `realname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isEnable` tinyint(4) NOT NULL DEFAULT '1',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_users` VALUES (1, 'admin', 'admin', 'admin@qq.com', '$2y$10$YVJpRi6/0cf3uNktt3xiPu4V7XF/IAJpeWD/yWxgaUh4S6UolkVHq', 1, '2019-09-16 04:16:48', '2019-09-16 04:41:08', NULL);
COMMIT;

-- ----------------------------
-- Table structure for block_items
-- ----------------------------
DROP TABLE IF EXISTS `block_items`;
CREATE TABLE `block_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blockId` int(10) unsigned NOT NULL COMMENT '区块id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链接地址',
  `imagePath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片路径',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for blocks
-- ----------------------------
DROP TABLE IF EXISTS `blocks`;
CREATE TABLE `blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for code_abo
-- ----------------------------
DROP TABLE IF EXISTS `code_abo`;
CREATE TABLE `code_abo` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ABO血型代码';

-- ----------------------------
-- Records of code_abo
-- ----------------------------
BEGIN;
INSERT INTO `code_abo` VALUES ('1', 'A型');
INSERT INTO `code_abo` VALUES ('2', 'B型');
COMMIT;

-- ----------------------------
-- Table structure for code_advice
-- ----------------------------
DROP TABLE IF EXISTS `code_advice`;
CREATE TABLE `code_advice` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='医嘱项目类型代码表';

-- ----------------------------
-- Records of code_advice
-- ----------------------------
BEGIN;
INSERT INTO `code_advice` VALUES ('01', '药品类医嘱');
INSERT INTO `code_advice` VALUES ('02', '检查类医嘱');
COMMIT;

-- ----------------------------
-- Table structure for code_career
-- ----------------------------
DROP TABLE IF EXISTS `code_career`;
CREATE TABLE `code_career` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='职业类别代码';

-- ----------------------------
-- Records of code_career
-- ----------------------------
BEGIN;
INSERT INTO `code_career` VALUES ('0', '国家机关、党群组织、企业、事业单位负责人');
INSERT INTO `code_career` VALUES ('0-1', '中国共产党中央委员会和地方各级组织负责人');
COMMIT;

-- ----------------------------
-- Table structure for code_cm_category
-- ----------------------------
DROP TABLE IF EXISTS `code_cm_category`;
CREATE TABLE `code_cm_category` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='中药使用类别代码';

-- ----------------------------
-- Records of code_cm_category
-- ----------------------------
BEGIN;
INSERT INTO `code_cm_category` VALUES ('1', '未使用');
INSERT INTO `code_cm_category` VALUES ('2', '中成药');
COMMIT;

-- ----------------------------
-- Table structure for code_country
-- ----------------------------
DROP TABLE IF EXISTS `code_country`;
CREATE TABLE `code_country` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='国籍代码';

-- ----------------------------
-- Records of code_country
-- ----------------------------
BEGIN;
INSERT INTO `code_country` VALUES ('004', '阿富汗');
INSERT INTO `code_country` VALUES ('008', '阿尔巴尼亚');
COMMIT;

-- ----------------------------
-- Table structure for code_diagnose
-- ----------------------------
DROP TABLE IF EXISTS `code_diagnose`;
CREATE TABLE `code_diagnose` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='诊断类型编码';

-- ----------------------------
-- Records of code_diagnose
-- ----------------------------
BEGIN;
INSERT INTO `code_diagnose` VALUES ('11', '西医诊断（主要）');
INSERT INTO `code_diagnose` VALUES ('12', '西医诊断（其他）');
COMMIT;

-- ----------------------------
-- Table structure for code_disease
-- ----------------------------
DROP TABLE IF EXISTS `code_disease`;
CREATE TABLE `code_disease` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='疾病诊断编码';

-- ----------------------------
-- Table structure for code_disease_cn
-- ----------------------------
DROP TABLE IF EXISTS `code_disease_cn`;
CREATE TABLE `code_disease_cn` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='中医疾病编码';

-- ----------------------------
-- Records of code_disease_cn
-- ----------------------------
BEGIN;
INSERT INTO `code_disease_cn` VALUES ('JB:3', '传染病、寄生虫病类');
INSERT INTO `code_disease_cn` VALUES ('JB:3.1', '(时疫)霍乱');
COMMIT;

-- ----------------------------
-- Table structure for code_drug
-- ----------------------------
DROP TABLE IF EXISTS `code_drug`;
CREATE TABLE `code_drug` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='药品编码';

-- ----------------------------
-- Table structure for code_drug_category
-- ----------------------------
DROP TABLE IF EXISTS `code_drug_category`;
CREATE TABLE `code_drug_category` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用药种类编码';

-- ----------------------------
-- Records of code_drug_category
-- ----------------------------
BEGIN;
INSERT INTO `code_drug_category` VALUES ('1', '磺酰脲类');
INSERT INTO `code_drug_category` VALUES ('2', '双胍类');
COMMIT;

-- ----------------------------
-- Table structure for code_drug_form
-- ----------------------------
DROP TABLE IF EXISTS `code_drug_form`;
CREATE TABLE `code_drug_form` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='药物剂型代码';

-- ----------------------------
-- Records of code_drug_form
-- ----------------------------
BEGIN;
INSERT INTO `code_drug_form` VALUES ('00', '原料');
INSERT INTO `code_drug_form` VALUES ('06', '泡腾片');
COMMIT;

-- ----------------------------
-- Table structure for code_drug_frequency
-- ----------------------------
DROP TABLE IF EXISTS `code_drug_frequency`;
CREATE TABLE `code_drug_frequency` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='药物使用频次代码表';

-- ----------------------------
-- Records of code_drug_frequency
-- ----------------------------
BEGIN;
INSERT INTO `code_drug_frequency` VALUES ('01', 'bid');
INSERT INTO `code_drug_frequency` VALUES ('02', 'biw');
COMMIT;

-- ----------------------------
-- Table structure for code_drug_usage
-- ----------------------------
DROP TABLE IF EXISTS `code_drug_usage`;
CREATE TABLE `code_drug_usage` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='药物使用途径编码';

-- ----------------------------
-- Records of code_drug_usage
-- ----------------------------
BEGIN;
INSERT INTO `code_drug_usage` VALUES ('1', '口服');
INSERT INTO `code_drug_usage` VALUES ('2', '直肠给药');
COMMIT;

-- ----------------------------
-- Table structure for code_education
-- ----------------------------
DROP TABLE IF EXISTS `code_education`;
CREATE TABLE `code_education` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文化程度代码';

-- ----------------------------
-- Records of code_education
-- ----------------------------
BEGIN;
INSERT INTO `code_education` VALUES ('10', '研究所');
INSERT INTO `code_education` VALUES ('11', '博士研究生毕业');
COMMIT;

-- ----------------------------
-- Table structure for code_gender
-- ----------------------------
DROP TABLE IF EXISTS `code_gender`;
CREATE TABLE `code_gender` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='性别代码';

-- ----------------------------
-- Records of code_gender
-- ----------------------------
BEGIN;
INSERT INTO `code_gender` VALUES ('1', '男性');
INSERT INTO `code_gender` VALUES ('2', '女性');
COMMIT;

-- ----------------------------
-- Table structure for code_idcard
-- ----------------------------
DROP TABLE IF EXISTS `code_idcard`;
CREATE TABLE `code_idcard` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='身份证件类别代码';

-- ----------------------------
-- Records of code_idcard
-- ----------------------------
BEGIN;
INSERT INTO `code_idcard` VALUES ('01', '居民户身份证');
INSERT INTO `code_idcard` VALUES ('02', '居民户户口簿');
COMMIT;

-- ----------------------------
-- Table structure for code_insurance
-- ----------------------------
DROP TABLE IF EXISTS `code_insurance`;
CREATE TABLE `code_insurance` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参保类别代码';

-- ----------------------------
-- Records of code_insurance
-- ----------------------------
BEGIN;
INSERT INTO `code_insurance` VALUES ('1', '社会基本医疗保险');
INSERT INTO `code_insurance` VALUES ('2', '商业保险');
COMMIT;

-- ----------------------------
-- Table structure for code_marriage
-- ----------------------------
DROP TABLE IF EXISTS `code_marriage`;
CREATE TABLE `code_marriage` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='婚姻状况代码';

-- ----------------------------
-- Records of code_marriage
-- ----------------------------
BEGIN;
INSERT INTO `code_marriage` VALUES ('10', '未婚');
INSERT INTO `code_marriage` VALUES ('20', '已婚');
COMMIT;

-- ----------------------------
-- Table structure for code_nation
-- ----------------------------
DROP TABLE IF EXISTS `code_nation`;
CREATE TABLE `code_nation` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='民族代码';

-- ----------------------------
-- Records of code_nation
-- ----------------------------
BEGIN;
INSERT INTO `code_nation` VALUES ('01', '汉族');
INSERT INTO `code_nation` VALUES ('02', '蒙古族');
COMMIT;

-- ----------------------------
-- Table structure for code_position
-- ----------------------------
DROP TABLE IF EXISTS `code_position`;
CREATE TABLE `code_position` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='专业技术职务代码';

-- ----------------------------
-- Records of code_position
-- ----------------------------
BEGIN;
INSERT INTO `code_position` VALUES ('230', '卫生技术人员（医师）');
INSERT INTO `code_position` VALUES ('231', '主任医师');
COMMIT;

-- ----------------------------
-- Table structure for code_position_class
-- ----------------------------
DROP TABLE IF EXISTS `code_position_class`;
CREATE TABLE `code_position_class` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='专业技术职务类别代码';

-- ----------------------------
-- Records of code_position_class
-- ----------------------------
BEGIN;
INSERT INTO `code_position_class` VALUES ('1', '正高');
INSERT INTO `code_position_class` VALUES ('2', '副高');
COMMIT;

-- ----------------------------
-- Table structure for code_rh
-- ----------------------------
DROP TABLE IF EXISTS `code_rh`;
CREATE TABLE `code_rh` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Rh血型类别代码';

-- ----------------------------
-- Records of code_rh
-- ----------------------------
BEGIN;
INSERT INTO `code_rh` VALUES ('1', 'RH阴性');
INSERT INTO `code_rh` VALUES ('2', 'RH阳性');
COMMIT;

-- ----------------------------
-- Table structure for code_symptom
-- ----------------------------
DROP TABLE IF EXISTS `code_symptom`;
CREATE TABLE `code_symptom` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='症状编码';

-- ----------------------------
-- Records of code_symptom
-- ----------------------------
BEGIN;
INSERT INTO `code_symptom` VALUES ('R40.201', '意识丧失');
INSERT INTO `code_symptom` VALUES ('R43.801', '嗅觉和味觉障碍');
COMMIT;

-- ----------------------------
-- Table structure for code_treatment
-- ----------------------------
DROP TABLE IF EXISTS `code_treatment`;
CREATE TABLE `code_treatment` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='就诊类型';

-- ----------------------------
-- Records of code_treatment
-- ----------------------------
BEGIN;
INSERT INTO `code_treatment` VALUES ('100', '普通门诊');
INSERT INTO `code_treatment` VALUES ('101', '专科门诊');
COMMIT;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `ksbm` varchar(10) NOT NULL COMMENT '科室编码',
  `ksmc` varchar(32) NOT NULL COMMENT '科室名称',
  `bzksdm` varchar(8) NOT NULL COMMENT '标准科室代码',
  `ybjdm` varchar(8) DEFAULT NULL COMMENT '医保局代码',
  `ksjs` text COMMENT '科室简介',
  `sjscsj` timestamp NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` int(11) NOT NULL COMMENT '填报日期',
  `cxbz` varchar(2) NOT NULL COMMENT '撤销标志',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='科室字典表';

-- ----------------------------
-- Records of department
-- ----------------------------
BEGIN;
INSERT INTO `department` VALUES (1, '123', '123', '213', '123', '123', NULL, '2019-09-22 08:00:00', 1569168000, '1', '2019-09-24 00:13:04', '2019-09-26 23:22:59', NULL);
COMMIT;

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `sbdh` varchar(30) NOT NULL COMMENT '设备代号',
  `sbmc` varchar(20) NOT NULL COMMENT '设备名称',
  `tpsbts` int(3) NOT NULL COMMENT '同批购进相同型号设备台数',
  `cd` varchar(2) NOT NULL COMMENT '产地',
  `sccj` varchar(120) DEFAULT NULL COMMENT '生产厂家',
  `sbxh` varchar(120) DEFAULT NULL COMMENT '设备型号',
  `sbcs` text COMMENT '备参数',
  `sblx` varchar(2) DEFAULT NULL COMMENT '设备类型',
  `gmrq` timestamp NOT NULL COMMENT '购买日期',
  `yt` text COMMENT '用途',
  `sbjzje` float DEFAULT NULL COMMENT '设备价值金额',
  `gjsxqk` varchar(2) DEFAULT NULL COMMENT '购进时新旧情况',
  `llsjsm` int(3) DEFAULT NULL COMMENT '理论设计寿命',
  `syqk` char(1) NOT NULL COMMENT '使用情况',
  `bz` varchar(100) DEFAULT NULL COMMENT '备注',
  `sjscsj` timestamp NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` int(11) NOT NULL COMMENT '填报日期',
  `cxbz` varchar(2) NOT NULL COMMENT '撤销标志',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='设备资源信息表';

-- ----------------------------
-- Records of device
-- ----------------------------
BEGIN;
INSERT INTO `device` VALUES (1, '测试机构标识', 'X101', 'Mac2019', 123, '1', '深圳市南山区深南大道101号', NULL, NULL, '1', '2019-09-22 08:00:00', NULL, NULL, NULL, NULL, '1', NULL, '2019-09-21 08:00:00', 1569081600, '1', '2019-09-23 00:45:05', '2019-09-26 23:25:07', NULL);
INSERT INTO `device` VALUES (2, '123', '12', '撒旦', 123, '1', '123', '123', NULL, '1', '2019-09-22 08:00:00', NULL, NULL, NULL, NULL, '1', NULL, '2019-09-22 08:00:00', 1569168000, '1', '2019-09-24 00:15:31', '2019-09-26 23:25:01', NULL);
COMMIT;

-- ----------------------------
-- Table structure for institution
-- ----------------------------
DROP TABLE IF EXISTS `institution`;
CREATE TABLE `institution` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `zzjgdm` varchar(30) NOT NULL COMMENT '统一社会信用代码',
  `jgmc` varchar(70) NOT NULL COMMENT '机构名称',
  `xzqhdm` varchar(6) NOT NULL COMMENT '行政区划代码',
  `jglx` varchar(3) NOT NULL COMMENT '机构类型',
  `jgclrq` timestamp NOT NULL COMMENT '机构成立日期',
  `dwlsgxdm` varchar(3) NOT NULL COMMENT '单位隶属关系代码',
  `jgflgllbdm` char(1) NOT NULL COMMENT '机构分类管理类别代码',
  `jgfldm` varchar(4) NOT NULL COMMENT '机构分类代码',
  `jjlxdm` varchar(3) NOT NULL COMMENT '经济类型代码',
  `dz` varchar(100) NOT NULL COMMENT '地址',
  `styyzzjgdm` varchar(30) NOT NULL COMMENT '实体医院医疗组织机构代码',
  `styymc` varchar(70) NOT NULL COMMENT '实体医院名称',
  `styljgjb` varchar(1) NOT NULL COMMENT '实体医疗机构级别',
  `styljgdj` varchar(1) NOT NULL COMMENT '实体医院机构等级',
  `hlwyywz` varchar(50) NOT NULL COMMENT '互联网医院网址',
  `xkzhm` varchar(40) NOT NULL COMMENT '许可证号码',
  `xkxmmc` text NOT NULL COMMENT '许可项目名称',
  `xkzyxq` timestamp NOT NULL COMMENT '许可证有效期',
  `xxaqdjbh` varchar(2) NOT NULL COMMENT '信息安全等级保护',
  `xxaqdjbhbh` varchar(18) DEFAULT NULL COMMENT '信息安全等级保护证书编号',
  `kbzjjes` float NOT NULL COMMENT '开办资金金额数',
  `frdb` varchar(30) NOT NULL COMMENT '法人代表/负责人',
  `jgszdmzzzdfbz` char(1) NOT NULL COMMENT '机构所在地民族自治地方标志',
  `sffzjg` char(1) NOT NULL COMMENT '是否分支机构',
  `jgdemc` varchar(30) DEFAULT NULL COMMENT '机构第二名称',
  `jgms` text COMMENT '机构描述',
  `yzbm` varchar(6) DEFAULT NULL COMMENT '邮政编码',
  `dhhm` varchar(12) DEFAULT NULL COMMENT '电话号码(总机/查询台)',
  `dwdzyx` varchar(50) DEFAULT NULL COMMENT '单位电子信箱(E-mail)',
  `bz` text COMMENT '备注',
  `sjscsj` timestamp NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` int(11) NOT NULL COMMENT '填报日期',
  `cxbz` varchar(2) NOT NULL COMMENT '撤销标志',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='机构信息表';

-- ----------------------------
-- Records of institution
-- ----------------------------
BEGIN;
INSERT INTO `institution` VALUES (1, 'djei-12333', 'dj123', '腾讯科技', 'djo-11', '02', '2019-09-21 08:00:00', 'dj', '1', 'd-2', 'j2', '深南大道101号', 'xus-123', '南山医院', '1', '1', 'http://www.badu.com', 'sd-ddsajj', '美容手术', '2019-09-21 08:00:00', '1', NULL, 123, '张三', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-21 08:00:00', 1569081600, '1', '2019-09-23 00:53:36', '2019-09-26 23:22:08', NULL);
INSERT INTO `institution` VALUES (2, '123', '123', '123', '123', '01', '2019-09-22 08:00:00', '123', '1', '213', '123', '213', '123', '123', '1', '1', '123', '123', '123', '2019-09-22 08:00:00', '1', '123', 123, '123', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-22 08:00:00', 1569168000, '1', '2019-09-24 00:11:29', '2019-09-26 23:22:00', NULL);
INSERT INTO `institution` VALUES (3, 'dddd', 'dddd', 'dddd', 'ddd', '01', '2019-10-18 00:00:00', 'sss', '1', 'ssss', 'sss', 'sss', 'sfdsf', 'sdfsd', '0', '0', 'sdfsd', 'fsdf', 'sdfds', '2019-10-24 00:00:00', '2', 'dsfdsf', 123213, 'sfds', '1', '1', 'sdfds', 'sdfds', 'sdfdsf', '12321312', 'test@test.com', 'sfdsf', '2019-10-25 00:00:00', 1571846400, '2', '2019-10-18 18:48:17', '2019-10-18 18:48:17', NULL);
COMMIT;

-- ----------------------------
-- Table structure for institution_business
-- ----------------------------
DROP TABLE IF EXISTS `institution_business`;
CREATE TABLE `institution_business` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `nf` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '月份',
  `pcjgsl` int(2) DEFAULT NULL COMMENT '派出（分支）机构数量',
  `bspt` varchar(2) NOT NULL COMMENT '部署平台',
  `wljgtdz` text COMMENT '网络架构图地址',
  `jgmsxx` text COMMENT '架构描述',
  `jfmj` float DEFAULT NULL COMMENT '机房面积',
  `zgzs` int(8) NOT NULL COMMENT '职工总数',
  `khfwryzs` int(8) NOT NULL COMMENT '客户服务人员总数',
  `ywyfmj` float DEFAULT NULL COMMENT '业务用房面积',
  `zsr` float NOT NULL COMMENT '总收入',
  `zzc` float NOT NULL COMMENT '总支出',
  `zzch` float NOT NULL COMMENT '总资产',
  `ldzc` float NOT NULL COMMENT '流动资产',
  `dwtz` float NOT NULL COMMENT '对外投资',
  `gdzc` float NOT NULL COMMENT '固定资产',
  `wxzcjkbf` float NOT NULL COMMENT '无形资产及开办费',
  `fz` float NOT NULL COMMENT '负债',
  `jzc` float NOT NULL COMMENT '净资产',
  `sjscsj` timestamp NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` int(11) NOT NULL COMMENT '填报日期',
  `cxbz` varchar(2) NOT NULL COMMENT '撤销标志',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='机构业务开展情况表';

-- ----------------------------
-- Records of institution_business
-- ----------------------------
BEGIN;
INSERT INTO `institution_business` VALUES (1, '123', '2019-07', NULL, '02', NULL, NULL, NULL, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, '2019-09-21 08:00:00', 1569081600, '1', '2019-09-23 01:10:08', '2019-09-26 23:22:51', NULL);
INSERT INTO `institution_business` VALUES (2, '213', '2019-07', 12, '03', NULL, NULL, NULL, 123, 123, 123, 123, 123, 123, 123, 213, 123, 123, 123, 123, '2019-09-22 08:00:00', 1569168000, '1', '2019-09-24 00:12:47', '2019-09-26 23:22:44', NULL);
COMMIT;

-- ----------------------------
-- Table structure for operation_log
-- ----------------------------
DROP TABLE IF EXISTS `operation_log`;
CREATE TABLE `operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ipInfo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of operation_log
-- ----------------------------
BEGIN;
INSERT INTO `operation_log` VALUES (3, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '/admin/login', '登录', NULL, '{\"email\":\"admin@qq.com\",\"password\":\"admin\"}', 'POST', '113.116.140.77', '中国-广东-深圳-440300', '0', 'success', '2019-09-27 01:00:15', '2019-09-27 01:00:15');
INSERT INTO `operation_log` VALUES (4, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', '/admin/logout', '退出登录', NULL, NULL, 'DELETE', '113.116.140.77', '中国-广东-深圳-440300', '0', 'success', '2019-09-27 01:07:59', '2019-09-27 01:07:59');
INSERT INTO `operation_log` VALUES (5, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/login', '登录', NULL, '{\"email\":\"admin@qq.com\",\"password\":\"admin\"}', 'POST', '121.201.4.30', '中国-广东-中山-442000', '0', 'success', '2019-09-28 10:30:06', '2019-09-28 10:30:06');
INSERT INTO `operation_log` VALUES (6, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/logout', '退出登录', NULL, NULL, 'DELETE', '121.201.4.30', '中国-广东-中山-442000', '0', 'success', '2019-09-28 10:30:25', '2019-09-28 10:30:25');
INSERT INTO `operation_log` VALUES (7, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/login', '登录', NULL, '{\"email\":\"admin@qq.com\",\"password\":\"admin\"}', 'POST', '121.201.4.30', '中国-广东-中山-442000', '0', 'success', '2019-10-11 12:52:57', '2019-10-11 12:52:57');
INSERT INTO `operation_log` VALUES (8, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/logout', '退出登录', NULL, NULL, 'DELETE', '121.201.4.30', '中国-广东-中山-442000', '0', 'success', '2019-10-11 12:55:01', '2019-10-11 12:55:01');
INSERT INTO `operation_log` VALUES (9, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/login', '登录', NULL, '{\"email\":\"admin@qq.com\",\"password\":\"admin\"}', 'POST', '119.139.197.38', '中国-广东-深圳-440300', '0', 'success', '2019-10-18 18:46:22', '2019-10-18 18:46:22');
INSERT INTO `operation_log` VALUES (10, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/organization', '机构组织新增', NULL, '{\"jgdm\":\"dddd\",\"zzjgdm\":\"dddd\",\"jgmc\":\"dddd\",\"xzqhdm\":\"ddd\",\"jglx\":\"01\",\"dwlsgxdm\":\"sss\",\"jgflgllbdm\":\"1\",\"jgfldm\":\"ssss\",\"jjlxdm\":\"sss\",\"dz\":\"sss\",\"styyzzjgdm\":\"sfdsf\",\"styymc\":\"sdfsd\",\"styljgjb\":\"0\",\"styljgdj\":\"0\",\"hlwyywz\":\"sdfsd\",\"xkzhm\":\"fsdf\",\"xkxmmc\":\"sdfds\",\"xxaqdjbh\":\"2\",\"xxaqdjbhbh\":\"dsfdsf\",\"kbzjjes\":\"123213\",\"frdb\":\"sfds\",\"jgszdmzzzdfbz\":\"1\",\"sffzjg\":\"1\",\"jgdemc\":\"sdfds\",\"jgms\":\"sdfds\",\"yzbm\":\"sdfdsf\",\"dhhm\":\"12321312\",\"dwdzyx\":\"test@test.com\",\"bz\":\"sfdsf\",\"cxbz\":\"2\",\"jgclrq\":1571328000,\"xkzyxq\":1571846400,\"sjscsj\":1571932800,\"tbrqsj\":1571846400}', 'POST', '119.139.197.38', '中国-广东-深圳-440300', '0', '添加成功', '2019-10-18 18:48:17', '2019-10-18 18:48:17');
INSERT INTO `operation_log` VALUES (11, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/diagnose', '医疗诊断新增', NULL, '{\"jgdm\":\"adsfads\",\"fwwddm\":\"adfdas\",\"zdxxid\":\"adf\",\"kh\":\"asdfds\",\"klx\":\"0\",\"mzh\":\"adf\",\"xm\":\"adf\",\"xbdm\":\"1\",\"nls\":\"35\",\"nly\":\"2\",\"zdlxbm\":\"sd\",\"xyzdbm\":\"sdfds\",\"xyzdmc\":\"sdfsd\",\"xyzdbmlx\":\"01\",\"zyzdbm\":\"sdfsd\",\"zyzdmc\":\"sdf\",\"zyzdbmlx\":\"02\",\"zdsm\":\"sdfds\",\"zdbz\":\"1\",\"zdysgh\":\"sfdsd\",\"zdysxm\":\"sfsd\",\"cxbz\":\"1\",\"zdsj\":1571846400,\"csrq\":1571155200,\"jzrqsj\":1570464000,\"sjscsj\":1571673600,\"tbrqsj\":1571500800}', 'POST', '119.139.197.38', '中国-广东-深圳-440300', '0', '添加成功', '2019-10-18 18:51:11', '2019-10-18 18:51:11');
INSERT INTO `operation_log` VALUES (12, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/diagnose/{id}', '医疗诊断更新', '{\"id\":\"1\"}', '{\"jgdm\":\"123\",\"fwwddm\":\"123\",\"zdxxid\":\"213\",\"kh\":\"1233\",\"klx\":\"2\",\"mzh\":\"213\",\"xm\":\"213\",\"xbdm\":\"1\",\"nls\":123,\"nly\":\"12\",\"zdlxbm\":\"12\",\"xyzdbm\":null,\"xyzdmc\":\"123\",\"xyzdbmlx\":\"03\",\"zyzdbm\":null,\"zyzdmc\":null,\"zyzdbmlx\":\"05\",\"zdsm\":\"123\",\"zdbz\":\"4\",\"zdysgh\":\"123\",\"zdysxm\":\"123\",\"yl1\":null,\"mj\":null,\"cxbz\":\"1\",\"zdsj\":null,\"csrq\":1569254400,\"jzrqsj\":1569254400,\"sjscsj\":1569254400,\"tbrqsj\":1569340800}', 'PUT', '119.139.197.38', '中国-广东-深圳-440300', '0', '编辑成功', '2019-10-18 18:51:29', '2019-10-18 18:51:29');
INSERT INTO `operation_log` VALUES (13, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/diagnose', '医疗诊断删除', NULL, '{\"ids\":[2]}', 'DELETE', '119.139.197.38', '中国-广东-深圳-440300', '0', '删除成功', '2019-10-18 18:51:49', '2019-10-18 18:51:49');
INSERT INTO `operation_log` VALUES (14, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/record/{id}', '门诊病历更新', '{\"id\":\"1\"}', '{\"jgdm\":\"213\",\"fwwddm\":\"213\",\"jzlx\":\"100\",\"kh\":\"123\",\"klx\":\"1\",\"mzh\":\"123\",\"ksbm\":\"123\",\"ksmc\":\"213\",\"xm\":\"123\",\"xbdm\":\"1\",\"nls\":123,\"nly\":null,\"gmsbs\":\"T\",\"gms\":null,\"cblb\":null,\"jzzdsm\":null,\"czbzdm\":\"1\",\"zs\":null,\"xbs\":null,\"jws\":null,\"fzjcxm\":null,\"fzjcjg\":null,\"mzzzzddm\":null,\"mzzzzdmc\":null,\"mzzzzdbmlx\":\"04\",\"zzms\":null,\"bzyj\":null,\"zzzf\":null,\"jkzd\":null,\"czjh\":null,\"yzysgh\":\"213\",\"yzysjm\":\"123\",\"czylwsjgdm\":\"123\",\"czylswjgmc\":\"123\",\"zzbz\":null,\"hzmyd\":null,\"yl1\":null,\"yl2\":null,\"dzcfwjcfdz\":null,\"ysdspwjcfdz\":null,\"hzdspwjcfdz\":null,\"jlypcfdz\":null,\"mj\":null,\"cxbz\":\"1\",\"csrq\":1569340800,\"jzrqsj\":1569340800,\"jzjssj\":1571846400,\"sjscsj\":1569340800,\"tbrqsj\":1569427200}', 'PUT', '119.139.197.38', '中国-广东-深圳-440300', '0', '编辑成功', '2019-10-18 19:04:23', '2019-10-18 19:04:23');
INSERT INTO `operation_log` VALUES (15, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/record/{id}', '门诊病历更新', '{\"id\":\"1\"}', '{\"jgdm\":\"213\",\"fwwddm\":\"213\",\"jzlx\":\"100\",\"kh\":\"123\",\"klx\":\"1\",\"mzh\":\"123\",\"ksbm\":\"123\",\"ksmc\":\"213\",\"xm\":\"123\",\"xbdm\":\"1\",\"nls\":123,\"nly\":null,\"gmsbs\":\"T\",\"gms\":null,\"cblb\":null,\"jzzdsm\":null,\"czbzdm\":\"1\",\"zs\":null,\"xbs\":null,\"jws\":null,\"fzjcxm\":null,\"fzjcjg\":null,\"mzzzzddm\":null,\"mzzzzdmc\":null,\"mzzzzdbmlx\":\"04\",\"zzms\":null,\"bzyj\":null,\"zzzf\":null,\"jkzd\":null,\"czjh\":null,\"yzysgh\":\"213\",\"yzysjm\":\"123\",\"czylwsjgdm\":\"123\",\"czylswjgmc\":\"123\",\"zzbz\":\"F\",\"hzmyd\":null,\"yl1\":null,\"yl2\":\"safadsf\",\"dzcfwjcfdz\":null,\"ysdspwjcfdz\":null,\"hzdspwjcfdz\":null,\"jlypcfdz\":null,\"mj\":null,\"cxbz\":\"1\",\"csrq\":1569340800,\"jzrqsj\":1569340800,\"jzjssj\":1571846400,\"sjscsj\":1569340800,\"tbrqsj\":1569427200}', 'PUT', '119.139.197.38', '中国-广东-深圳-440300', '0', '编辑成功', '2019-10-18 19:04:38', '2019-10-18 19:04:38');
INSERT INTO `operation_log` VALUES (16, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/diagnose/{id}', '医疗诊断更新', '{\"id\":\"1\"}', '{\"jgdm\":\"123\",\"fwwddm\":\"123\",\"zdxxid\":\"213\",\"kh\":\"1233\",\"klx\":\"2\",\"mzh\":\"213\",\"xm\":\"213\",\"xbdm\":\"1\",\"nls\":123,\"nly\":\"12\",\"zdlxbm\":\"12\",\"xyzdbm\":null,\"xyzdmc\":\"123\",\"xyzdbmlx\":\"03\",\"zyzdbm\":null,\"zyzdmc\":null,\"zyzdbmlx\":\"05\",\"zdsm\":\"123\",\"zdbz\":\"4\",\"zdysgh\":\"1232\",\"zdysxm\":\"123\",\"yl1\":null,\"mj\":null,\"cxbz\":\"1\",\"zdsj\":null,\"csrq\":1569254400,\"jzrqsj\":1569254400,\"sjscsj\":1569254400,\"tbrqsj\":1569340800}', 'PUT', '119.139.197.38', '中国-广东-深圳-440300', '0', '编辑成功', '2019-10-18 19:04:57', '2019-10-18 19:04:57');
INSERT INTO `operation_log` VALUES (17, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/diagnose/{id}', '医疗诊断更新', '{\"id\":\"1\"}', '{\"jgdm\":\"123\",\"fwwddm\":\"123\",\"zdxxid\":\"213\",\"kh\":\"1233\",\"klx\":\"2\",\"mzh\":\"213\",\"xm\":\"213\",\"xbdm\":\"1\",\"nls\":123,\"nly\":\"12\",\"zdlxbm\":\"12\",\"xyzdbm\":null,\"xyzdmc\":\"123\",\"xyzdbmlx\":\"03\",\"zyzdbm\":null,\"zyzdmc\":null,\"zyzdbmlx\":\"03\",\"zdsm\":\"123\",\"zdbz\":\"4\",\"zdysgh\":\"1232\",\"zdysxm\":\"123\",\"yl1\":null,\"mj\":null,\"cxbz\":\"1\",\"zdsj\":null,\"csrq\":1569254400,\"jzrqsj\":1569254400,\"sjscsj\":1569254400,\"tbrqsj\":1569340800}', 'PUT', '119.139.197.38', '中国-广东-深圳-440300', '0', '编辑成功', '2019-10-18 19:05:05', '2019-10-18 19:05:05');
INSERT INTO `operation_log` VALUES (18, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/referral/{id}', '转诊记录更新', '{\"id\":\"1\"}', '{\"jgdm\":\"123\",\"fwwddm\":\"123\",\"zzjlid\":\"123\",\"kh\":\"123\",\"klx\":\"0\",\"mzh\":\"123\",\"xm\":\"213\",\"xbdm\":\"1\",\"nls\":123,\"nly\":null,\"fzysgh\":null,\"fzysxm\":null,\"fzksbm\":\"123\",\"fzksmc\":\"123\",\"zzyy\":\"fdsafasdf\",\"zxjgdm\":\"213\",\"zxjgmc\":\"213\",\"zxksbm\":null,\"zxksmc\":null,\"zxysgh\":null,\"zxysxm\":null,\"zyjws\":null,\"zljg\":null,\"xybzlfa\":null,\"zzbz\":\"1\",\"mj\":null,\"cxbz\":\"1\",\"zzsj\":1569369600,\"csrq\":1569340800,\"jzrqsj\":1569513600,\"sjscsj\":1569340800,\"tbrqsj\":1569427200}', 'PUT', '119.139.197.38', '中国-广东-深圳-440300', '0', '编辑成功', '2019-10-18 19:05:25', '2019-10-18 19:05:25');
INSERT INTO `operation_log` VALUES (19, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/person/{id}', '个人信息更新', '{\"id\":\"2\"}', '{\"jgdm\":\"123\",\"klx\":\"1\",\"kh\":\"213\",\"zjlbdm\":null,\"zjhm\":null,\"xm\":\"123\",\"xbdm\":\"1\",\"xbmc\":\"\\u7537\\u6027\",\"hzsx\":null,\"hyztdm\":null,\"csrq\":1569168000,\"mzdm\":\"1\",\"gjdm\":null,\"jgnbdah\":null,\"whcddm\":null,\"gddhhm\":null,\"sjhm\":null,\"dzyj\":null,\"zylbdm\":null,\"csdxzqhm\":null,\"jzdxzqhm\":null,\"csd\":null,\"jzdz\":null,\"hkdxzqhm\":null,\"hkdz\":null,\"lxrxm\":null,\"lxrdh\":null,\"abo\":null,\"rh\":null,\"cblbdm\":\"1\",\"grdaid\":null,\"tbrqsj\":1569254400,\"sjscsj\":\"\",\"mj\":\"1\",\"cxbz\":\"1\",\"yl1\":\"\",\"yl2\":\"\"}', 'PUT', '119.139.197.38', '中国-广东-深圳-440300', '0', '编辑成功', '2019-10-18 19:05:41', '2019-10-18 19:05:41');
INSERT INTO `operation_log` VALUES (20, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/person/{id}', '个人信息更新', '{\"id\":\"3\"}', '{\"jgdm\":\"\\u65b0\\u7684\\u673a\\u6784\",\"klx\":\"1\",\"kh\":\"1232\",\"zjlbdm\":\"1\",\"zjhm\":null,\"xm\":\"sdfsdf\",\"xbdm\":\"1\",\"xbmc\":\"\\u7537\\u6027\",\"hzsx\":\"1\",\"hyztdm\":null,\"csrq\":1569168000,\"mzdm\":\"1\",\"gjdm\":null,\"jgnbdah\":null,\"whcddm\":null,\"gddhhm\":null,\"sjhm\":null,\"dzyj\":null,\"zylbdm\":null,\"csdxzqhm\":null,\"jzdxzqhm\":null,\"csd\":null,\"jzdz\":null,\"hkdxzqhm\":null,\"hkdz\":null,\"lxrxm\":null,\"lxrdh\":null,\"abo\":null,\"rh\":null,\"cblbdm\":\"2\",\"grdaid\":null,\"tbrqsj\":1569254400,\"sjscsj\":\"\",\"mj\":\"1\",\"cxbz\":\"1\",\"yl1\":\"\",\"yl2\":\"\"}', 'PUT', '119.139.197.38', '中国-广东-深圳-440300', '0', '编辑成功', '2019-10-18 19:05:51', '2019-10-18 19:05:51');
INSERT INTO `operation_log` VALUES (21, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/human/{id}', '人力资源更新', '{\"id\":\"1\"}', '{\"jgdm\":\"123\",\"yhrygh\":\"123\",\"yhryxm\":\"13\",\"xb\":\"2\",\"sfzh\":\"123\",\"ksdm\":\"3\",\"zyjszwdm\":\"231\",\"zyjszwlbdm\":\"1\",\"zzlbmc\":\"123\",\"zgzsbm\":\"12\",\"zyzsbm\":\"1231\",\"zydd\":\"123\",\"zyfw\":\"23\",\"zyzyyljgdm\":\"123\",\"zyzyyymc\":\"123\",\"qkysbz\":\"T\",\"sjhm\":\"123\",\"zc\":\"123\",\"xl\":null,\"grzpcfdz\":\"123\",\"zgzcfdz\":null,\"zyzcfdz\":null,\"cxbz\":\"2\",\"mc\":\"1\",\"csrq\":1569081600,\"fzrq\":1569081600,\"zcsj\":1569081600,\"zghdsj\":1569081600,\"cjgzrq\":1569081600,\"sjscsj\":1569081600,\"tbrqsj\":1569168000}', 'PUT', '119.139.197.38', '中国-广东-深圳-440300', '0', '编辑成功', '2019-10-18 19:07:26', '2019-10-18 19:07:26');
INSERT INTO `operation_log` VALUES (22, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/login', '登录', NULL, '{\"email\":\"admin@qq.com\",\"password\":\"admin\"}', 'POST', '121.201.4.30', '中国-广东-中山-442000', '0', 'success', '2019-10-18 19:36:53', '2019-10-18 19:36:53');
INSERT INTO `operation_log` VALUES (23, 'admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', '/admin/logout', '退出登录', NULL, NULL, 'DELETE', '121.201.4.30', '中国-广东-中山-442000', '0', 'success', '2019-10-18 19:39:29', '2019-10-18 19:39:29');
COMMIT;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `kh` varchar(30) NOT NULL COMMENT '卡号',
  `klx` varchar(2) NOT NULL COMMENT '卡类型',
  `zjhm` varchar(20) DEFAULT NULL COMMENT '身份证件号码',
  `zjlbdm` varchar(2) DEFAULT NULL COMMENT '身份证件类别代码',
  `xm` varchar(50) NOT NULL COMMENT '患者本人姓名',
  `xbdm` char(1) NOT NULL COMMENT '性别代码',
  `xbmc` varchar(20) NOT NULL COMMENT '性别名称',
  `hzsx` varchar(2) DEFAULT NULL COMMENT '患者属性',
  `hyztdm` varchar(2) DEFAULT NULL COMMENT '婚姻状况代码',
  `hyztmc` varchar(50) DEFAULT NULL COMMENT '婚姻状态名称',
  `csrq` timestamp NOT NULL COMMENT '出生日期',
  `mzdm` varchar(2) DEFAULT NULL COMMENT '民族代码',
  `mzmc` varchar(50) DEFAULT NULL COMMENT '民族名称',
  `gjdm` varchar(3) DEFAULT NULL COMMENT '国籍代码',
  `gjmc` varchar(50) DEFAULT NULL COMMENT '国籍名称',
  `jgnbdah` varchar(32) DEFAULT NULL COMMENT '机构内部档案号',
  `gddhhm` varchar(20) DEFAULT NULL COMMENT '固定电话号码',
  `sjhm` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `dzyj` varchar(70) DEFAULT NULL COMMENT '电子邮件',
  `whcddm` varchar(2) DEFAULT NULL COMMENT '文化程度代码',
  `whcdmc` varchar(50) DEFAULT NULL COMMENT '文化程度名称',
  `zylbdm` varchar(3) DEFAULT NULL COMMENT '职业类别代码',
  `zylbmc` varchar(50) DEFAULT NULL COMMENT '职业类别名称',
  `csdxzqhm` varchar(15) DEFAULT NULL COMMENT '出生地行政区划码',
  `csd` varchar(200) DEFAULT NULL COMMENT '出生地',
  `jzdxzqhm` varchar(15) DEFAULT NULL COMMENT '居住地行政区划码',
  `jzdz` varchar(200) DEFAULT NULL COMMENT '居住地址',
  `hkdxzqhm` varchar(15) DEFAULT NULL COMMENT '户口地行政区划码',
  `hkdz` varchar(200) DEFAULT NULL COMMENT '户口地址',
  `lxrxm` varchar(50) DEFAULT NULL COMMENT '联系人姓名',
  `lxrdh` varchar(50) DEFAULT NULL COMMENT '联系人电话',
  `abo` char(1) DEFAULT NULL COMMENT 'ABO血型',
  `rh` char(1) DEFAULT NULL COMMENT 'RH血型',
  `cblbdm` char(1) DEFAULT NULL COMMENT '参保类别代码',
  `grdaid` varchar(30) DEFAULT NULL COMMENT '个人档案ID',
  `yl1` text COMMENT '预留一',
  `yl2` text COMMENT '预留二',
  `sjscsj` timestamp NULL DEFAULT NULL COMMENT '数据生成时间',
  `tbrqsj` int(11) NOT NULL COMMENT '填报日期',
  `mj` varchar(2) NOT NULL COMMENT '密级',
  `cxbz` char(1) NOT NULL COMMENT '撤销标志',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='患者基本信息表';

-- ----------------------------
-- Records of person
-- ----------------------------
BEGIN;
INSERT INTO `person` VALUES (1, '测试机构标识', '123456', '2', '身份证', '1', '张三', '1', '男', '1', '1', NULL, '2019-09-21 08:00:00', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, 1569081600, '1', '1', '2019-09-23 00:29:52', '2019-09-23 00:31:47', NULL);
INSERT INTO `person` VALUES (2, '123', '213', '1', NULL, NULL, '123', '1', '男性', NULL, NULL, NULL, '2019-09-23 00:00:00', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '', '', NULL, 1569254400, '1', '1', '2019-09-24 00:18:31', '2019-10-18 19:05:41', NULL);
INSERT INTO `person` VALUES (3, '新的机构', '1232', '1', NULL, '1', 'sdfsdf', '1', '男性', '1', NULL, NULL, '2019-09-23 00:00:00', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, '', '', NULL, 1569254400, '1', '1', '2019-09-24 14:13:09', '2019-10-18 19:05:51', NULL);
COMMIT;

-- ----------------------------
-- Table structure for service_point
-- ----------------------------
DROP TABLE IF EXISTS `service_point`;
CREATE TABLE `service_point` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `zzjgdm` varchar(30) NOT NULL COMMENT '统一社会信用代码',
  `fwwddm` varchar(30) NOT NULL COMMENT '服务网点代码',
  `fwdmc` varchar(70) NOT NULL COMMENT '服务点名称',
  `xzqhdm` varchar(6) NOT NULL COMMENT '行政区划代码',
  `fwdlx` varchar(3) NOT NULL COMMENT '服务点类型',
  `fwdclrq` timestamp NOT NULL COMMENT '服务点成立日期',
  `dwlsgxdm` varchar(3) NOT NULL COMMENT '单位隶属关系代码',
  `fwdflgllbdm` char(1) NOT NULL COMMENT '服务点分类管理类别代码',
  `fwdfldm` varchar(4) NOT NULL COMMENT '服务点分类代码',
  `jjlxdm` varchar(3) NOT NULL COMMENT '经济类型代码',
  `dz` varchar(100) NOT NULL COMMENT '地址',
  `fwdyyjb` varchar(1) NOT NULL COMMENT '服务点医院级别',
  `fwdyydj` varchar(1) NOT NULL COMMENT '服务点医院等级',
  `hlwyywz` varchar(50) NOT NULL COMMENT '互联网医院网址',
  `xkzhm` varchar(40) NOT NULL COMMENT '许可证号码',
  `xkxmmc` text NOT NULL COMMENT '许可项目名称',
  `xkzyxq` timestamp NOT NULL COMMENT '许可证有效期',
  `kbzjjes` float DEFAULT NULL COMMENT '开办资金金额数',
  `frdb` varchar(30) DEFAULT NULL COMMENT '法人代表/负责人',
  `fwdszdmzzzdfbz` char(1) NOT NULL COMMENT '服务点所在地民族自治地方标志',
  `sffzjg` char(1) NOT NULL COMMENT '是否分支机构',
  `fwddemc` varchar(30) DEFAULT NULL COMMENT '服务点第二名称',
  `fwdms` text COMMENT '服务点描述',
  `yzbm` varchar(6) DEFAULT NULL COMMENT '邮政编码',
  `dhhm` varchar(12) DEFAULT NULL COMMENT '电话号码(总机/查询台)',
  `dwdzyx` varchar(50) DEFAULT NULL COMMENT '单位电子信箱(E-mail)',
  `bz` text COMMENT '备注',
  `sjscsj` timestamp NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` int(11) NOT NULL COMMENT '填报日期',
  `cxbz` varchar(2) NOT NULL COMMENT '撤销标志',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='服务点字典表';

-- ----------------------------
-- Records of service_point
-- ----------------------------
BEGIN;
INSERT INTO `service_point` VALUES (1, '测试机构标识', '123213', 'di1', '服务点一', '12j', '04', '2019-09-21 08:00:00', 'd-1', '1', 'd2', 'j2', '深南大道101号', '1', '1', 'http://www.baidu.com', '12-1', '项目一', '2019-09-21 08:00:00', 123, '李四', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-21 08:00:00', 1569081600, '1', '2019-09-23 00:56:25', '2019-09-26 23:22:27', NULL);
INSERT INTO `service_point` VALUES (2, '123', '21312', '123', '3', '123', '03', '2019-09-22 08:00:00', '123', '1', '213', '123', '123', '1', '1', '123', '123', '123', '2019-09-22 08:00:00', 123, '123', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-22 08:00:00', 1569254400, '1', '2019-09-24 00:12:20', '2019-09-26 23:22:21', NULL);
COMMIT;

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `yhrygh` varchar(30) NOT NULL COMMENT '医护人员工号/登陆账号',
  `yhryxm` varchar(30) NOT NULL COMMENT '医护人员姓名',
  `xb` char(1) NOT NULL COMMENT '性别',
  `csrq` timestamp NOT NULL COMMENT '出生日期',
  `sfzh` varchar(20) NOT NULL COMMENT '身份证号',
  `ksdm` varchar(10) NOT NULL COMMENT '所属科室代码',
  `zyjszwdm` varchar(3) NOT NULL COMMENT '专业技术职务代码',
  `zyjszwlbdm` varchar(3) NOT NULL COMMENT '专业技术职务类别代码',
  `zzlbmc` varchar(50) NOT NULL COMMENT '资质类别名称',
  `zgzsbm` varchar(30) NOT NULL COMMENT '资格证书编号',
  `zghdsj` timestamp NOT NULL COMMENT '资格获得时间',
  `zyzsbm` varchar(30) NOT NULL COMMENT '执业证书编码',
  `fzrq` varchar(30) NOT NULL COMMENT '发证日期',
  `zydd` varchar(70) NOT NULL COMMENT '执业地点',
  `zyfw` varchar(8) NOT NULL COMMENT '执业范围',
  `zyzyyljgdm` varchar(30) NOT NULL COMMENT '主要执业医疗机构代码',
  `zyzyyymc` varchar(70) NOT NULL COMMENT '主要执业医院名称',
  `qkysbz` char(1) NOT NULL COMMENT '全科医生标志',
  `sjhm` varchar(11) NOT NULL COMMENT '手机号码',
  `zc` text COMMENT '专长',
  `mc` varchar(2) DEFAULT NULL COMMENT '民族',
  `cjgzrq` timestamp NOT NULL COMMENT '参加工作日期',
  `zcsj` timestamp NOT NULL COMMENT '注册日期时间',
  `xl` varchar(2) DEFAULT NULL COMMENT '学历',
  `grzpcfdz` varchar(150) NOT NULL COMMENT '个人照片存放地址',
  `zgzcfdz` varchar(150) DEFAULT NULL COMMENT '资格证存放地址',
  `zyzcfdz` varchar(150) DEFAULT NULL COMMENT '执业证存放地址',
  `sjscsj` timestamp NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` int(11) NOT NULL COMMENT '填报日期',
  `cxbz` varchar(2) NOT NULL COMMENT '撤销标志',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='人力资源信息表';

-- ----------------------------
-- Records of staff
-- ----------------------------
BEGIN;
INSERT INTO `staff` VALUES (1, '123', '123', '13', '2', '2019-09-22 00:00:00', '123', '3', '231', '1', '123', '12', '2019-09-22 00:00:00', '1231', '2019-09-22', '123', '23', '123', '123', 'T', '123', '123', '1', '2019-09-22 00:00:00', '2019-09-22 00:00:00', NULL, '123', NULL, NULL, '2019-09-22 00:00:00', 1569168000, '2', '2019-09-24 00:14:58', '2019-10-18 19:07:26', NULL);
COMMIT;

-- ----------------------------
-- Table structure for treatment_diagnose
-- ----------------------------
DROP TABLE IF EXISTS `treatment_diagnose`;
CREATE TABLE `treatment_diagnose` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `fwwddm` varchar(30) NOT NULL COMMENT '服务网点代码',
  `zdxxid` varchar(30) NOT NULL COMMENT '诊断信息ID',
  `kh` varchar(30) NOT NULL COMMENT '卡号',
  `klx` varchar(30) NOT NULL COMMENT '卡类型',
  `mzh` varchar(20) NOT NULL COMMENT '门诊号',
  `xm` varchar(50) NOT NULL COMMENT '患者姓名',
  `xbdm` char(1) NOT NULL COMMENT '性别代码',
  `csrq` timestamp NOT NULL COMMENT '出生日期',
  `nls` int(3) NOT NULL COMMENT '年龄（岁）',
  `nly` varchar(10) DEFAULT NULL COMMENT '年龄（月）',
  `jzrqsj` timestamp NOT NULL COMMENT '就诊日期时间',
  `zdlxbm` varchar(2) NOT NULL COMMENT '诊断类型编码',
  `xyzdbm` varchar(20) DEFAULT NULL COMMENT '西医诊断编码',
  `xyzdmc` text NOT NULL COMMENT '西医诊断名称',
  `xyzdbmlx` varchar(2) NOT NULL COMMENT '西医诊断编码类型',
  `zyzdbm` varchar(20) DEFAULT NULL COMMENT '中医诊断编码',
  `zyzdmc` text COMMENT '中医诊断名称',
  `zyzdbmlx` varchar(2) NOT NULL COMMENT '中医诊断编码类型',
  `zdsm` varchar(100) NOT NULL COMMENT '诊断说明',
  `zdbz` char(1) NOT NULL COMMENT '诊断标志',
  `zdysgh` varchar(30) NOT NULL COMMENT '诊断医生工号',
  `zdysxm` varchar(50) NOT NULL COMMENT '诊断医生姓名',
  `zdsj` timestamp NULL DEFAULT NULL COMMENT '诊断时间',
  `yl1` varchar(100) DEFAULT NULL COMMENT '预留一',
  `sjscsj` timestamp NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` int(11) NOT NULL COMMENT '填报日期',
  `cxbz` char(1) NOT NULL COMMENT '撤销标志',
  `mj` varchar(2) DEFAULT NULL COMMENT '密级',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='医学诊断表';

-- ----------------------------
-- Records of treatment_diagnose
-- ----------------------------
BEGIN;
INSERT INTO `treatment_diagnose` VALUES (1, '123', '123', '213', '1233', '2', '213', '213', '1', '2019-09-24 00:00:00', 123, '12', '2019-09-24 00:00:00', '12', NULL, '123', '03', NULL, NULL, '03', '123', '4', '1232', '123', NULL, NULL, '2019-09-24 00:00:00', 1569340800, '1', NULL, '2019-09-26 23:26:34', '2019-10-18 19:05:05', NULL);
INSERT INTO `treatment_diagnose` VALUES (2, 'adsfads', 'adfdas', 'adf', 'asdfds', '0', 'adf', 'adf', '1', '2019-10-16 00:00:00', 35, '2', '2019-10-08 00:00:00', 'sd', 'sdfds', 'sdfsd', '01', 'sdfsd', 'sdf', '02', 'sdfds', '1', 'sfdsd', 'sfsd', NULL, NULL, '2019-10-22 00:00:00', 1571500800, '1', NULL, '2019-10-18 18:51:11', '2019-10-18 18:51:49', '2019-10-18 18:51:49');
COMMIT;

-- ----------------------------
-- Table structure for treatment_order
-- ----------------------------
DROP TABLE IF EXISTS `treatment_order`;
CREATE TABLE `treatment_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `fwwddm` varchar(30) NOT NULL COMMENT '服务网点代码',
  `cfbh` varchar(30) NOT NULL COMMENT '处方编号',
  `cfmxid` varchar(30) NOT NULL COMMENT '处方明细ID',
  `kh` varchar(30) NOT NULL COMMENT '卡号',
  `klx` varchar(30) NOT NULL COMMENT '卡类型',
  `cfklsj` timestamp NOT NULL COMMENT '处方开立日期',
  `cfyxts` int(2) NOT NULL COMMENT '处方有效天数',
  `xfklksbm` varchar(10) NOT NULL COMMENT '处方开立科室编码',
  `cfklksmc` varchar(50) NOT NULL COMMENT '处方开立科室名称',
  `mzh` varchar(20) NOT NULL COMMENT '门诊号',
  `xm` varchar(50) NOT NULL COMMENT '患者姓名',
  `xbdm` char(1) NOT NULL COMMENT '性别代码',
  `csrq` timestamp NOT NULL COMMENT '出生日期',
  `nls` int(3) NOT NULL COMMENT '年龄（岁）',
  `nly` varchar(10) DEFAULT NULL COMMENT '年龄（月）',
  `jzrqsj` timestamp NOT NULL COMMENT '就诊日期时间',
  `yzsm` varchar(100) DEFAULT NULL COMMENT '医嘱说明',
  `pxh` varchar(3) DEFAULT NULL COMMENT '排序号',
  `yzxmlxdm` varchar(2) NOT NULL COMMENT '医嘱项目类型代码',
  `ypcfsx` varchar(2) NOT NULL COMMENT '药品处方属性',
  `zylbdm` varchar(2) DEFAULT NULL COMMENT '中药类别代码',
  `cfmxybbm` varchar(30) DEFAULT NULL COMMENT '处方明细医保编码',
  `ypid` varchar(30) DEFAULT NULL COMMENT '药监药品ID',
  `cfmxmc` text NOT NULL COMMENT '处方明细名称',
  `ypmc` varchar(50) DEFAULT NULL COMMENT '药物名称',
  `ypgg` varchar(50) DEFAULT NULL COMMENT '药品规格',
  `dddz` float DEFAULT NULL COMMENT 'DDD值',
  `ywjxdm` varchar(2) DEFAULT NULL COMMENT '药物剂型代码',
  `ywsycjl` float DEFAULT NULL COMMENT '药物使用次剂量',
  `ywsyjldw` varchar(6) DEFAULT NULL COMMENT '药物使用剂量单位',
  `ywsypcdm` varchar(3) DEFAULT NULL COMMENT '药物使用频次代码',
  `ywsypcmc` varchar(50) DEFAULT NULL COMMENT '药物使用频次名称',
  `yytjdm` varchar(3) DEFAULT NULL COMMENT '用药途径代码',
  `yytjmc` varchar(50) DEFAULT NULL COMMENT '用药途径名称',
  `yysyzjl` float DEFAULT NULL COMMENT '药物使用总剂量',
  `cfypzh` varchar(50) DEFAULT NULL COMMENT '处方药品组号',
  `zyypcf` text COMMENT '中药饮片处方',
  `zyypjs` int(2) DEFAULT NULL COMMENT '中药饮片剂数',
  `zyypjzf` varchar(100) DEFAULT NULL COMMENT '中药饮片煎煮法',
  `zyyyff` varchar(100) DEFAULT NULL COMMENT '中药用药方法',
  `fyjl` float DEFAULT NULL COMMENT '发药剂量',
  `fyjldw` varchar(10) DEFAULT NULL COMMENT '发药剂量单位',
  `dj` float NOT NULL COMMENT '单价',
  `zje` float NOT NULL COMMENT '总金额',
  `cfklysgh` varchar(30) NOT NULL COMMENT '处方开立医师工号',
  `cfklysqm` varchar(50) NOT NULL COMMENT '处方开立医师签名',
  `cfshyjsgh` varchar(30) DEFAULT NULL COMMENT '处方审核药剂师工号',
  `cfshyjsqm` varchar(50) DEFAULT NULL COMMENT '处方审核药剂师签名',
  `cftpyjsgh` varchar(30) DEFAULT NULL COMMENT '处方调配药剂师工号',
  `cftpyjsqm` varchar(50) DEFAULT NULL COMMENT '处方调配药剂师签名',
  `cfhdyjsgh` varchar(30) DEFAULT NULL COMMENT '处方核对药剂师工号',
  `cfhdyjsqm` varchar(50) DEFAULT NULL COMMENT '处方核对药剂师签名',
  `cffyyjsgh` varchar(30) DEFAULT NULL COMMENT '处方发药药剂师工号',
  `cffyyjsqm` varchar(50) DEFAULT NULL COMMENT '处方发药药剂师签名',
  `zxjg` varchar(30) DEFAULT NULL COMMENT '执行结果',
  `bz` varchar(100) DEFAULT NULL COMMENT '备注',
  `qyjgdm` varchar(30) DEFAULT NULL COMMENT '取药机构代码',
  `qyjgmc` varchar(70) DEFAULT NULL COMMENT '取药机构名称',
  `sjscsj` timestamp NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` int(11) NOT NULL COMMENT '填报日期',
  `cxbz` char(1) NOT NULL COMMENT '撤销标志',
  `mj` varchar(2) DEFAULT NULL COMMENT '密级',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='门诊处方表';

-- ----------------------------
-- Records of treatment_order
-- ----------------------------
BEGIN;
INSERT INTO `treatment_order` VALUES (1, '123', '123', '123', '123', '123', '0', '2019-09-25 08:00:00', 99, '123', '123', '123', '123', '1', '2019-09-25 08:00:00', 12, NULL, '2019-09-25 08:00:00', NULL, '123', '02', '1', '1', NULL, NULL, '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 123, 123, '123', '213', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-25 08:00:00', 1569427200, '1', NULL, '2019-09-26 23:30:39', '2019-09-26 23:30:39', NULL);
COMMIT;

-- ----------------------------
-- Table structure for treatment_record
-- ----------------------------
DROP TABLE IF EXISTS `treatment_record`;
CREATE TABLE `treatment_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `fwwddm` varchar(30) NOT NULL COMMENT '服务网点代码',
  `jzlx` varchar(3) NOT NULL COMMENT '就诊类型',
  `kh` varchar(30) NOT NULL COMMENT '卡号',
  `klx` varchar(2) NOT NULL COMMENT '卡类型',
  `mzh` varchar(20) NOT NULL COMMENT '门诊号',
  `ksbm` varchar(10) NOT NULL COMMENT '科室编码',
  `ksmc` varchar(50) NOT NULL COMMENT '科室名称',
  `xm` varchar(50) NOT NULL COMMENT '患者姓名',
  `xbdm` char(1) NOT NULL COMMENT '性别代码',
  `csrq` timestamp NOT NULL COMMENT '出生日期',
  `nls` int(3) NOT NULL COMMENT '年龄（岁）',
  `nly` varchar(10) DEFAULT NULL COMMENT '年龄（月）',
  `gmsbs` char(1) NOT NULL COMMENT '过敏史标识',
  `gms` text COMMENT '过敏史',
  `cblb` varchar(2) DEFAULT NULL COMMENT '参保类别',
  `jzrqsj` timestamp NOT NULL COMMENT '就诊日期时间',
  `jzzdsm` text COMMENT '就诊诊断说明',
  `czbzdm` char(1) NOT NULL COMMENT '初诊标志代码',
  `zs` text COMMENT '主诉',
  `xbs` text COMMENT '现病史',
  `jws` text COMMENT '既往史',
  `fzjcxm` text COMMENT '辅助检查项目',
  `fzjcjg` text COMMENT '辅助检查结果',
  `mzzzzddm` text COMMENT '门诊症状-诊断代码',
  `mzzzzdmc` text COMMENT '门诊症状-诊断名称',
  `mzzzzdbmlx` varchar(2) NOT NULL COMMENT '门诊症状诊断编码类型',
  `zzms` text COMMENT '症状描述',
  `bzyj` text COMMENT '辨证依据',
  `zzzf` text COMMENT '治则治法',
  `jkzd` text COMMENT '健康指导',
  `czjh` text COMMENT '处置计划',
  `yzysgh` varchar(30) NOT NULL COMMENT '应诊医生工号',
  `yzysjm` varchar(50) NOT NULL COMMENT '应诊医师签名',
  `czylwsjgdm` varchar(30) NOT NULL COMMENT '初诊医疗卫生机构代码',
  `czylswjgmc` varchar(70) NOT NULL COMMENT '初诊医疗卫生机构名称',
  `jzjssj` timestamp NULL DEFAULT NULL COMMENT '就诊结束时间',
  `zzbz` char(1) DEFAULT NULL COMMENT '转诊标志',
  `hzmyd` int(2) DEFAULT NULL COMMENT '患者满意度',
  `yl1` varchar(100) DEFAULT NULL COMMENT '预留一',
  `yl2` varchar(100) DEFAULT NULL COMMENT '预留二',
  `dzcfwjcfdz` char(1) DEFAULT NULL COMMENT '电子处方文件存放地址',
  `ysdspwjcfdz` char(1) DEFAULT NULL COMMENT '医生端视频文件存放地址',
  `hzdspwjcfdz` char(1) DEFAULT NULL COMMENT '患者端视频文件存放地址',
  `jlypcfdz` char(1) DEFAULT NULL COMMENT '交流音频存放地址',
  `sjscsj` timestamp NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` int(11) NOT NULL COMMENT '填报日期',
  `mj` varchar(2) DEFAULT NULL COMMENT '密级',
  `cxbz` char(1) NOT NULL COMMENT '撤销标志',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='门诊病历表';

-- ----------------------------
-- Records of treatment_record
-- ----------------------------
BEGIN;
INSERT INTO `treatment_record` VALUES (1, '213', '213', '100', '123', '1', '123', '123', '213', '123', '1', '2019-09-25 00:00:00', 123, NULL, 'T', NULL, NULL, '2019-09-25 00:00:00', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '04', NULL, NULL, NULL, NULL, NULL, '213', '123', '123', '123', '2019-10-24 00:00:00', 'F', NULL, NULL, 'safadsf', NULL, NULL, NULL, NULL, '2019-09-25 00:00:00', 1569427200, NULL, '1', '2019-09-26 23:31:46', '2019-10-18 19:04:38', NULL);
COMMIT;

-- ----------------------------
-- Table structure for treatment_referral
-- ----------------------------
DROP TABLE IF EXISTS `treatment_referral`;
CREATE TABLE `treatment_referral` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `fwwddm` varchar(30) NOT NULL COMMENT '服务网点代码',
  `zzjlid` varchar(30) NOT NULL COMMENT '转诊记录ID',
  `kh` varchar(30) NOT NULL COMMENT '卡号',
  `klx` varchar(30) NOT NULL COMMENT '卡类型',
  `mzh` varchar(20) NOT NULL COMMENT '门诊号',
  `xm` varchar(50) NOT NULL COMMENT '患者姓名',
  `xbdm` char(1) NOT NULL COMMENT '性别代码',
  `csrq` timestamp NOT NULL COMMENT '出生日期',
  `nls` int(3) NOT NULL COMMENT '年龄（岁）',
  `nly` varchar(10) DEFAULT NULL COMMENT '年龄（月）',
  `jzrqsj` timestamp NOT NULL COMMENT '就诊日期时间',
  `fzysgh` varchar(30) DEFAULT NULL COMMENT '负责医生工号',
  `fzysxm` varchar(100) DEFAULT NULL COMMENT '负责医生姓名',
  `fzksbm` varchar(10) NOT NULL COMMENT '负责科室编码',
  `fzksmc` varchar(50) NOT NULL COMMENT '负责科室名称',
  `zzyy` varchar(100) DEFAULT NULL COMMENT '转诊原因',
  `zzsj` timestamp NOT NULL COMMENT '转诊日期及时间',
  `zxjgdm` varchar(30) NOT NULL COMMENT '转向医疗机构代码',
  `zxjgmc` varchar(70) NOT NULL COMMENT '转向医疗机构名称',
  `zxksbm` varchar(8) DEFAULT NULL COMMENT '转向科室编码',
  `zxksmc` varchar(32) DEFAULT NULL COMMENT '转向科室名称',
  `zxysgh` varchar(30) DEFAULT NULL COMMENT '转向医生工号',
  `zxysxm` varchar(50) DEFAULT NULL COMMENT '转向医生姓名',
  `zyjws` varchar(100) DEFAULT NULL COMMENT '主要既往史',
  `zljg` varchar(100) DEFAULT NULL COMMENT '治疗经过',
  `xybzlfa` varchar(100) DEFAULT NULL COMMENT '下一步治疗方案及康复建议',
  `zzbz` varchar(2) NOT NULL COMMENT '转诊标志',
  `sjscsj` timestamp NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` int(11) NOT NULL COMMENT '填报日期',
  `cxbz` char(1) NOT NULL COMMENT '撤销标志',
  `mj` varchar(2) DEFAULT NULL COMMENT '密级',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='转诊记录表';

-- ----------------------------
-- Records of treatment_referral
-- ----------------------------
BEGIN;
INSERT INTO `treatment_referral` VALUES (1, '123', '123', '123', '123', '0', '123', '213', '1', '2019-09-25 00:00:00', 123, NULL, '2019-09-27 00:00:00', NULL, NULL, '123', '123', 'fdsafasdf', '2019-09-25 00:00:00', '213', '213', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2019-09-25 00:00:00', 1569427200, '1', NULL, '2019-09-26 23:33:01', '2019-10-18 19:05:25', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
