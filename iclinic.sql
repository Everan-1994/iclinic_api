/*
 Navicat Premium Data Transfer

 Source Server         : Everan-localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : iclinic

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 21/09/2019 10:51:02
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
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `realname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链接地址',
  `imagePath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片路径',
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `flag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='ABO血型代码';

-- ----------------------------
-- Table structure for code_advice
-- ----------------------------
DROP TABLE IF EXISTS `code_advice`;
CREATE TABLE `code_advice` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='医嘱项目类型代码表';

-- ----------------------------
-- Table structure for code_career
-- ----------------------------
DROP TABLE IF EXISTS `code_career`;
CREATE TABLE `code_career` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='职业类别代码';

-- ----------------------------
-- Table structure for code_cm_category
-- ----------------------------
DROP TABLE IF EXISTS `code_cm_category`;
CREATE TABLE `code_cm_category` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='中药使用类别代码';

-- ----------------------------
-- Table structure for code_country
-- ----------------------------
DROP TABLE IF EXISTS `code_country`;
CREATE TABLE `code_country` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='国籍代码';

-- ----------------------------
-- Table structure for code_diagnose
-- ----------------------------
DROP TABLE IF EXISTS `code_diagnose`;
CREATE TABLE `code_diagnose` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='诊断类型编码';

-- ----------------------------
-- Table structure for code_disease
-- ----------------------------
DROP TABLE IF EXISTS `code_disease`;
CREATE TABLE `code_disease` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='疾病诊断编码';

-- ----------------------------
-- Table structure for code_disease_cn
-- ----------------------------
DROP TABLE IF EXISTS `code_disease_cn`;
CREATE TABLE `code_disease_cn` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='中医疾病编码';

-- ----------------------------
-- Table structure for code_drug
-- ----------------------------
DROP TABLE IF EXISTS `code_drug`;
CREATE TABLE `code_drug` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='药品编码';

-- ----------------------------
-- Table structure for code_drug_category
-- ----------------------------
DROP TABLE IF EXISTS `code_drug_category`;
CREATE TABLE `code_drug_category` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用药种类编码';

-- ----------------------------
-- Table structure for code_drug_form
-- ----------------------------
DROP TABLE IF EXISTS `code_drug_form`;
CREATE TABLE `code_drug_form` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='药物剂型代码';

-- ----------------------------
-- Table structure for code_drug_frequency
-- ----------------------------
DROP TABLE IF EXISTS `code_drug_frequency`;
CREATE TABLE `code_drug_frequency` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='药物使用频次代码表';

-- ----------------------------
-- Table structure for code_drug_usage
-- ----------------------------
DROP TABLE IF EXISTS `code_drug_usage`;
CREATE TABLE `code_drug_usage` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='药物使用途径编码';

-- ----------------------------
-- Table structure for code_education
-- ----------------------------
DROP TABLE IF EXISTS `code_education`;
CREATE TABLE `code_education` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文化程度代码';

-- ----------------------------
-- Table structure for code_gender
-- ----------------------------
DROP TABLE IF EXISTS `code_gender`;
CREATE TABLE `code_gender` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='性别代码';

-- ----------------------------
-- Table structure for code_idcard
-- ----------------------------
DROP TABLE IF EXISTS `code_idcard`;
CREATE TABLE `code_idcard` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='身份证件类别代码';

-- ----------------------------
-- Table structure for code_insurance
-- ----------------------------
DROP TABLE IF EXISTS `code_insurance`;
CREATE TABLE `code_insurance` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='参保类别代码';

-- ----------------------------
-- Table structure for code_marriage
-- ----------------------------
DROP TABLE IF EXISTS `code_marriage`;
CREATE TABLE `code_marriage` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='婚姻状况代码';

-- ----------------------------
-- Table structure for code_nation
-- ----------------------------
DROP TABLE IF EXISTS `code_nation`;
CREATE TABLE `code_nation` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='民族代码';

-- ----------------------------
-- Table structure for code_position
-- ----------------------------
DROP TABLE IF EXISTS `code_position`;
CREATE TABLE `code_position` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='专业技术职务代码';

-- ----------------------------
-- Table structure for code_position_class
-- ----------------------------
DROP TABLE IF EXISTS `code_position_class`;
CREATE TABLE `code_position_class` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='专业技术职务类别代码';

-- ----------------------------
-- Table structure for code_rh
-- ----------------------------
DROP TABLE IF EXISTS `code_rh`;
CREATE TABLE `code_rh` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Rh血型类别代码';

-- ----------------------------
-- Table structure for code_symptom
-- ----------------------------
DROP TABLE IF EXISTS `code_symptom`;
CREATE TABLE `code_symptom` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='症状编码';

-- ----------------------------
-- Table structure for code_treatment
-- ----------------------------
DROP TABLE IF EXISTS `code_treatment`;
CREATE TABLE `code_treatment` (
  `code` varchar(20) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='就诊类型';

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `ksbm` varchar(10) NOT NULL COMMENT '科室编码',
  `ksmc` varchar(32) NOT NULL COMMENT '科室名称',
  `bzksdm` varchar(8) NOT NULL COMMENT '标准科室代码',
  `ybjdm` varchar(8) DEFAULT NULL COMMENT '医保局代码',
  `ksjs` text COMMENT '科室简介',
  `sjscsj` datetime NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` datetime NOT NULL COMMENT '填报日期',
  `cxbz` varchar(2) NOT NULL COMMENT '撤销标志'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='科室字典表';

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `sbdh` varchar(30) NOT NULL COMMENT '设备代号',
  `sbmc` varchar(20) NOT NULL COMMENT '设备名称',
  `tpsbts` int(3) NOT NULL COMMENT '同批购进相同型号设备台数',
  `cd` varchar(2) NOT NULL COMMENT '产地',
  `sccj` varchar(120) DEFAULT NULL COMMENT '生产厂家',
  `sbxh` varchar(120) DEFAULT NULL COMMENT '设备型号',
  `sbcs` text COMMENT '备参数',
  `sblx` varchar(2) DEFAULT NULL COMMENT '设备类型',
  `gmrq` date NOT NULL COMMENT '购买日期',
  `yt` text COMMENT '用途',
  `sbjzje` float DEFAULT NULL COMMENT '设备价值金额',
  `gjsxqk` varchar(2) DEFAULT NULL COMMENT '购进时新旧情况',
  `llsjsm` int(3) DEFAULT NULL COMMENT '理论设计寿命',
  `syqk` char(1) NOT NULL COMMENT '使用情况',
  `bz` varchar(100) DEFAULT NULL COMMENT '备注',
  `sjscsj` datetime NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` datetime NOT NULL COMMENT '填报日期',
  `cxbz` varchar(2) NOT NULL COMMENT '撤销标志'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='设备资源信息表';

-- ----------------------------
-- Table structure for institution
-- ----------------------------
DROP TABLE IF EXISTS `institution`;
CREATE TABLE `institution` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `zzjgdm` varchar(30) NOT NULL COMMENT '统一社会信用代码',
  `jgmc` varchar(70) NOT NULL COMMENT '机构名称',
  `xzqhdm` varchar(6) NOT NULL COMMENT '行政区划代码',
  `jglx` varchar(3) NOT NULL COMMENT '机构类型',
  `jgclrq` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '机构成立日期',
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
  `xkzyxq` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '许可证有效期',
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
  `sjscsj` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据生成日期时间',
  `tbrqsj` int(11) NOT NULL COMMENT '填报日期',
  `cxbz` varchar(2) NOT NULL COMMENT '撤销标志',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='机构信息表';

-- ----------------------------
-- Records of institution
-- ----------------------------
BEGIN;
INSERT INTO `institution` VALUES (1, '123', '123', '123', '123', '1', '2019-09-19 07:13:05', '123', '1', '123', '123', '123', '123', '123', '1', '1', '123', '123', '123', '2019-09-17 00:00:00', '1', '123', 123, '123', '1', '1', '123', '123', '123', '123', '123', '123', '2019-09-17 00:00:00', 1568736000, '2', '2019-09-19 06:15:49', '2019-09-19 07:13:05', '2019-09-19 07:13:05');
COMMIT;

-- ----------------------------
-- Table structure for institution_business
-- ----------------------------
DROP TABLE IF EXISTS `institution_business`;
CREATE TABLE `institution_business` (
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `nf` varchar(6) NOT NULL COMMENT '月份',
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
  `sjscsj` datetime NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` datetime NOT NULL COMMENT '填报日期',
  `cxbz` varchar(2) NOT NULL COMMENT '撤销标志'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='机构业务开展情况表';

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2018_11_13_174053_create_fast_pregnancy_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for operation_log
-- ----------------------------
DROP TABLE IF EXISTS `operation_log`;
CREATE TABLE `operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ipInfo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of operation_log
-- ----------------------------
BEGIN;
INSERT INTO `operation_log` VALUES (1, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36', '/admin/login', '登录', NULL, '{\"email\":\"admin@qq.com\",\"password\":\"admin\"}', 'POST', '172.19.0.1', '局域网', '0', 'success', '2019-09-16 04:41:28', '2019-09-16 04:41:28');
INSERT INTO `operation_log` VALUES (2, 'admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36', '/admin/login', '登录', NULL, '{\"email\":\"admin@qq.com\",\"password\":\"admin\"}', 'POST', '172.19.0.1', '局域网', '0', 'success', '2019-09-17 12:35:03', '2019-09-17 12:35:03');
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
  `csrq` date NOT NULL COMMENT '出生日期',
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
  `mj` varchar(2) DEFAULT NULL COMMENT '密级',
  `cxbz` char(1) NOT NULL COMMENT '撤销标志',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='患者基本信息表';

-- ----------------------------
-- Records of person
-- ----------------------------
BEGIN;
INSERT INTO `person` VALUES (1, 'qwe', 'wqewqe', '1', '', '', 'qwewqe', '1', '男', '', '', NULL, '2019-09-15', '1', NULL, '', NULL, '', '', '', '', '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', NULL, 1568563200, '', '1', '2019-09-16 13:29:31', '2019-09-16 14:02:40', '0000-00-00 00:00:00');
INSERT INTO `person` VALUES (2, 'jdksdd', 'dsadsad', '1', '', '', '赵云', '1', '男', '', '', NULL, '2019-09-15', '', NULL, '', NULL, '', '', '', '', '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', NULL, 1568563200, '', '1', '2019-09-16 13:49:24', '2019-09-16 14:02:45', '0000-00-00 00:00:00');
INSERT INTO `person` VALUES (3, '123456', '123456', '1', '', '', '123456', '1', '男', '', '', NULL, '2019-09-16', '', NULL, '', NULL, '', '', '', '', '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', NULL, 1568390400, '1', '2', '2019-09-17 12:36:43', '2019-09-17 14:30:04', NULL);
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
  `fwdclrq` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '服务点成立日期',
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
  `xkzyxq` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '许可证有效期',
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
  `sjscsj` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据生成日期时间',
  `tbrqsj` int(11) NOT NULL COMMENT '填报日期',
  `cxbz` varchar(2) NOT NULL COMMENT '撤销标志',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='服务点字典表';

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `yhrygh` varchar(30) NOT NULL COMMENT '医护人员工号/登陆账号',
  `yhryxm` varchar(30) NOT NULL COMMENT '医护人员姓名',
  `xb` char(1) NOT NULL COMMENT '性别',
  `csrq` date NOT NULL COMMENT '出生日期',
  `sfzh` varchar(20) NOT NULL COMMENT '身份证号',
  `ksdm` varchar(10) NOT NULL COMMENT '所属科室代码',
  `zyjszwdm` varchar(3) NOT NULL COMMENT '专业技术职务代码',
  `zyjszwlbdm` varchar(3) NOT NULL COMMENT '专业技术职务类别代码',
  `zzlbmc` varchar(50) NOT NULL COMMENT '资质类别名称',
  `zgzsbm` varchar(30) NOT NULL COMMENT '资格证书编号',
  `zghdsj` date NOT NULL COMMENT '资格获得时间',
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
  `cjgzrq` date NOT NULL COMMENT '参加工作日期',
  `zcsj` datetime NOT NULL COMMENT '注册日期时间',
  `xl` varchar(2) DEFAULT NULL COMMENT '学历',
  `grzpcfdz` varchar(150) NOT NULL COMMENT '个人照片存放地址',
  `zgzcfdz` varchar(150) DEFAULT NULL COMMENT '资格证存放地址',
  `zyzcfdz` varchar(150) DEFAULT NULL COMMENT '执业证存放地址',
  `sjscsj` datetime NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` datetime NOT NULL COMMENT '填报日期',
  `cxbz` varchar(2) NOT NULL COMMENT '撤销标志'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='人力资源信息表';

-- ----------------------------
-- Table structure for treatment_diagnose
-- ----------------------------
DROP TABLE IF EXISTS `treatment_diagnose`;
CREATE TABLE `treatment_diagnose` (
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `fwwddm` varchar(30) NOT NULL COMMENT '服务网点代码',
  `zdxxid` varchar(30) NOT NULL COMMENT '诊断信息ID',
  `kh` varchar(30) NOT NULL COMMENT '卡号',
  `klx` varchar(30) NOT NULL COMMENT '卡类型',
  `mzh` varchar(20) NOT NULL COMMENT '门诊号',
  `xm` varchar(50) NOT NULL COMMENT '患者姓名',
  `xbdm` char(1) NOT NULL COMMENT '性别代码',
  `csrq` date NOT NULL COMMENT '出生日期',
  `nls` int(3) NOT NULL COMMENT '年龄（岁）',
  `nly` varchar(10) DEFAULT NULL COMMENT '年龄（月）',
  `jzrqsj` datetime NOT NULL COMMENT '就诊日期时间',
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
  `zdsj` datetime DEFAULT NULL COMMENT '诊断时间',
  `yl1` varchar(100) DEFAULT NULL COMMENT '预留一',
  `sjscsj` datetime NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` datetime NOT NULL COMMENT '填报日期',
  `cxbz` char(1) NOT NULL COMMENT '撤销标志',
  `mj` varchar(2) DEFAULT NULL COMMENT '密级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='医学诊断表';

-- ----------------------------
-- Table structure for treatment_order
-- ----------------------------
DROP TABLE IF EXISTS `treatment_order`;
CREATE TABLE `treatment_order` (
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `fwwddm` varchar(30) NOT NULL COMMENT '服务网点代码',
  `cfbh` varchar(30) NOT NULL COMMENT '处方编号',
  `cfmxid` varchar(30) NOT NULL COMMENT '处方明细ID',
  `kh` varchar(30) NOT NULL COMMENT '卡号',
  `klx` varchar(30) NOT NULL COMMENT '卡类型',
  `cfklsj` datetime NOT NULL COMMENT '处方开立日期',
  `cfyxts` int(2) NOT NULL COMMENT '处方有效天数',
  `xfklksbm` varchar(10) NOT NULL COMMENT '处方开立科室编码',
  `cfklksmc` varchar(50) NOT NULL COMMENT '处方开立科室名称',
  `mzh` varchar(20) NOT NULL COMMENT '门诊号',
  `xm` varchar(50) NOT NULL COMMENT '患者姓名',
  `xbdm` char(1) NOT NULL COMMENT '性别代码',
  `csrq` date NOT NULL COMMENT '出生日期',
  `nls` int(3) NOT NULL COMMENT '年龄（岁）',
  `nly` varchar(10) DEFAULT NULL COMMENT '年龄（月）',
  `jzrqsj` datetime NOT NULL COMMENT '就诊日期时间',
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
  `sjscsj` datetime NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` datetime NOT NULL COMMENT '填报日期',
  `cxbz` char(1) NOT NULL COMMENT '撤销标志',
  `mj` varchar(2) DEFAULT NULL COMMENT '密级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='门诊处方表';

-- ----------------------------
-- Table structure for treatment_record
-- ----------------------------
DROP TABLE IF EXISTS `treatment_record`;
CREATE TABLE `treatment_record` (
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
  `csrq` date NOT NULL COMMENT '出生日期',
  `nls` int(3) NOT NULL COMMENT '年龄（岁）',
  `nly` varchar(10) DEFAULT NULL COMMENT '年龄（月）',
  `gmsbs` char(1) NOT NULL COMMENT '过敏史标识',
  `gms` text COMMENT '过敏史',
  `cblb` varchar(2) DEFAULT NULL COMMENT '参保类别',
  `jzrqsj` datetime NOT NULL COMMENT '就诊日期时间',
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
  `jzjssj` datetime DEFAULT NULL COMMENT '就诊结束时间',
  `zzbz` char(1) DEFAULT NULL COMMENT '转诊标志',
  `hzmyd` int(2) DEFAULT NULL COMMENT '患者满意度',
  `yl1` varchar(100) DEFAULT NULL COMMENT '预留一',
  `yl2` varchar(100) DEFAULT NULL COMMENT '预留二',
  `dzcfwjcfdz` char(1) DEFAULT NULL COMMENT '电子处方文件存放地址',
  `ysdspwjcfdz` char(1) DEFAULT NULL COMMENT '医生端视频文件存放地址',
  `hzdspwjcfdz` char(1) DEFAULT NULL COMMENT '患者端视频文件存放地址',
  `jlypcfdz` char(1) DEFAULT NULL COMMENT '交流音频存放地址',
  `sjscsj` datetime NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '填报日期',
  `mj` varchar(2) DEFAULT NULL COMMENT '密级',
  `cxbz` char(1) NOT NULL COMMENT '撤销标志'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='门诊病历表';

-- ----------------------------
-- Table structure for treatment_referral
-- ----------------------------
DROP TABLE IF EXISTS `treatment_referral`;
CREATE TABLE `treatment_referral` (
  `jgdm` varchar(30) NOT NULL COMMENT '机构标识',
  `fwwddm` varchar(30) NOT NULL COMMENT '服务网点代码',
  `zzjlid` varchar(30) NOT NULL COMMENT '转诊记录ID',
  `kh` varchar(30) NOT NULL COMMENT '卡号',
  `klx` varchar(30) NOT NULL COMMENT '卡类型',
  `mzh` varchar(20) NOT NULL COMMENT '门诊号',
  `xm` varchar(50) NOT NULL COMMENT '患者姓名',
  `xbdm` char(1) NOT NULL COMMENT '性别代码',
  `csrq` date NOT NULL COMMENT '出生日期',
  `nls` int(3) NOT NULL COMMENT '年龄（岁）',
  `nly` varchar(10) DEFAULT NULL COMMENT '年龄（月）',
  `jzrqsj` datetime NOT NULL COMMENT '就诊日期时间',
  `fzysgh` varchar(30) DEFAULT NULL COMMENT '负责医生工号',
  `fzysxm` varchar(100) DEFAULT NULL COMMENT '负责医生姓名',
  `fzksbm` varchar(10) NOT NULL COMMENT '负责科室编码',
  `fzksmc` varchar(50) NOT NULL COMMENT '负责科室名称',
  `zzyy` varchar(100) DEFAULT NULL COMMENT '转诊原因',
  `zzsj` datetime NOT NULL COMMENT '转诊日期及时间',
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
  `sjscsj` datetime NOT NULL COMMENT '数据生成日期时间',
  `tbrqsj` datetime NOT NULL COMMENT '填报日期',
  `cxbz` char(1) NOT NULL COMMENT '撤销标志',
  `mj` varchar(2) DEFAULT NULL COMMENT '密级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='转诊记录表';

SET FOREIGN_KEY_CHECKS = 1;
