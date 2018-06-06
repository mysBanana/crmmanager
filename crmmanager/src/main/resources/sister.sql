/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : sister

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-06-05 22:46:27
*/

create database sister;

use sister;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for askers
-- ----------------------------
DROP TABLE IF EXISTS `askers`;
CREATE TABLE `askers` (
  `AskerId` varchar(100) NOT NULL COMMENT '咨询师Id',
  `AskerName` varchar(100) DEFAULT NULL COMMENT '咨询师名称',
  `CheckState` varchar(50) DEFAULT '未签到' COMMENT '签到状态',
  `CheckInTime` timestamp NULL DEFAULT NULL COMMENT '签到时间',
  `ChangeState` varchar(50) DEFAULT '否' COMMENT '是否分配学生：是，否',
  `Weight` int(11) DEFAULT '0' COMMENT '权重',
  `RoleName` varchar(100) DEFAULT '咨询师' COMMENT '角色名称',
  `BakContent` varchar(2000) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`AskerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of askers
-- ----------------------------
INSERT INTO `askers` VALUES ('0a32c411-1420-11e7-b0ca-408d5cd46d51', '咨询师3', '已签到', '2018-06-05 11:11:47', '否', '8', '咨询师', '阿萨大 asd');
INSERT INTO `askers` VALUES ('26956c65-0af2-11e7-9a05-408d5cd46d51', '咨询师1', '已签到', '2018-06-05 12:05:41', '否', '15', '咨询师', 'null');
INSERT INTO `askers` VALUES ('4d357528-be0f-4f7c-ab6c-cc4d61c720d2', 'm1', '已签到', '2018-06-05 15:16:38', '是', '0', '咨询师', null);
INSERT INTO `askers` VALUES ('e57dad65-0d3d-11e7-b1d9-408d5cd46d51', '咨询师2', '已签到', '2018-05-26 11:10:48', '是', '6', '咨询师', '咨询师2效率高');

-- ----------------------------
-- Table structure for dynamicmessages
-- ----------------------------
DROP TABLE IF EXISTS `dynamicmessages`;
CREATE TABLE `dynamicmessages` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息Id',
  `StudentId` int(11) DEFAULT NULL COMMENT '学生Id',
  `StudentName` varchar(100) DEFAULT NULL COMMENT '学生名称',
  `MessageContent` varchar(2000) DEFAULT NULL COMMENT '消息内容',
  `IsOpen` varchar(50) DEFAULT '否' COMMENT '是否打开',
  `CreateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消息创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dynamicmessages
-- ----------------------------
INSERT INTO `dynamicmessages` VALUES ('1', '8', '王二', '王二的信息有变动，更改你电话为13588888888', '是', '2017-03-30 09:04:12');
INSERT INTO `dynamicmessages` VALUES ('2', '4', '张三三', '张三三需要修改qq号为789876', '是', '2017-03-30 10:24:59');
INSERT INTO `dynamicmessages` VALUES ('3', '4', '张三三', '修改张三三手机号为：13566668888111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', '是', '2017-03-31 11:56:20');
INSERT INTO `dynamicmessages` VALUES ('4', '16', '麻六', '麻溜需要跟踪回访', '是', '2017-03-31 12:01:06');
INSERT INTO `dynamicmessages` VALUES ('5', '4', '张三三', 'aaaaa', '是', '2017-03-31 17:59:17');
INSERT INTO `dynamicmessages` VALUES ('6', '18', '小龙', '小龙需要及时跟踪', '是', '2017-04-01 10:23:25');
INSERT INTO `dynamicmessages` VALUES ('7', '19', '小芳', '请立即跟踪回访小芳', '是', '2017-04-05 09:06:31');
INSERT INTO `dynamicmessages` VALUES ('8', '19', '小芳', '小芳修改了联系方式：13566668888', '是', '2017-04-05 09:43:53');
INSERT INTO `dynamicmessages` VALUES ('9', '4', '张三三', '修改该学生手机号：13566666666', '是', '2017-04-07 10:18:08');
INSERT INTO `dynamicmessages` VALUES ('10', '21', '狂人', '修改学生狂人的电话号码', '是', '2017-05-05 08:53:30');
INSERT INTO `dynamicmessages` VALUES ('13', '10', '阿飞', 'ss', '是', '2018-05-25 14:02:03');
INSERT INTO `dynamicmessages` VALUES ('14', '14', '小黑', '嘿嘿', '是', '2018-05-25 14:02:32');
INSERT INTO `dynamicmessages` VALUES ('15', '12', '小黄', 'asdasdad', '是', '2018-05-26 11:56:40');
INSERT INTO `dynamicmessages` VALUES ('17', '12', '小黄', 'sss', '是', '2018-05-31 17:07:51');
INSERT INTO `dynamicmessages` VALUES ('18', '12', '小黄', '', '是', '2018-05-31 17:08:54');
INSERT INTO `dynamicmessages` VALUES ('19', '2', '张三2', 'cc', '是', '2018-05-31 17:29:30');
INSERT INTO `dynamicmessages` VALUES ('20', '1', '张三', 'ww', '是', '2018-05-31 17:32:21');
INSERT INTO `dynamicmessages` VALUES ('21', '1', '张三', 'ww', '是', '2018-05-31 17:34:57');
INSERT INTO `dynamicmessages` VALUES ('22', '1', '张三', 'ww', '是', '2018-05-31 17:37:04');
INSERT INTO `dynamicmessages` VALUES ('23', '1', '张三', 'cc', '是', '2018-05-31 17:37:36');
INSERT INTO `dynamicmessages` VALUES ('24', '1', '张三', 'dddd', '是', '2018-05-31 17:38:38');
INSERT INTO `dynamicmessages` VALUES ('25', '1', '张三', 'fff', '是', '2018-05-31 17:38:57');
INSERT INTO `dynamicmessages` VALUES ('26', '3', '张三', '你好', '是', '2018-05-31 19:56:19');
INSERT INTO `dynamicmessages` VALUES ('27', '1', '张三', 'hh', '是', '2018-05-31 19:56:49');
INSERT INTO `dynamicmessages` VALUES ('28', '1', '张三', 'qq', '是', '2018-05-31 19:57:01');
INSERT INTO `dynamicmessages` VALUES ('29', '1', '张三', 'qq', '是', '2018-05-31 19:58:54');
INSERT INTO `dynamicmessages` VALUES ('30', '1', '张三', 'ww', '是', '2018-05-31 20:02:07');
INSERT INTO `dynamicmessages` VALUES ('31', '1', '张三', 'ccc', '是', '2018-06-03 15:51:38');
INSERT INTO `dynamicmessages` VALUES ('32', '2', '张三2', 'xx', '是', '2018-06-03 15:51:49');
INSERT INTO `dynamicmessages` VALUES ('33', '12', '小黄', 'laalala', '是', '2018-06-03 17:29:11');
INSERT INTO `dynamicmessages` VALUES ('34', '12', '小黄', 'lalala', '是', '2018-06-03 17:29:26');
INSERT INTO `dynamicmessages` VALUES ('35', '12', '小黄', 'ss', '是', '2018-06-03 17:32:40');
INSERT INTO `dynamicmessages` VALUES ('36', '12', '小黄', 'kk', '是', '2018-06-03 17:33:52');
INSERT INTO `dynamicmessages` VALUES ('37', '12', '小黄', 'jj', '是', '2018-06-03 17:34:47');
INSERT INTO `dynamicmessages` VALUES ('38', '12', '小黄', 'ss', '是', '2018-06-03 17:35:35');
INSERT INTO `dynamicmessages` VALUES ('39', '12', '小黄', 'ss', '是', '2018-06-03 17:37:29');
INSERT INTO `dynamicmessages` VALUES ('40', '12', '小黄', 'qq', '是', '2018-06-03 17:37:56');
INSERT INTO `dynamicmessages` VALUES ('41', '12', '小黄', 'ss', '是', '2018-06-03 17:38:55');
INSERT INTO `dynamicmessages` VALUES ('42', '12', '小黄', 'qqq', '是', '2018-06-03 17:39:36');
INSERT INTO `dynamicmessages` VALUES ('43', '12', '小黄', 'ee', '是', '2018-06-03 17:40:19');
INSERT INTO `dynamicmessages` VALUES ('44', '12', '小黄', 'ww', '是', '2018-06-03 17:40:37');
INSERT INTO `dynamicmessages` VALUES ('45', '12', '小黄', 'ww', '是', '2018-06-03 17:46:52');
INSERT INTO `dynamicmessages` VALUES ('46', '12', '小黄', 'ee', '是', '2018-06-03 17:47:01');
INSERT INTO `dynamicmessages` VALUES ('47', '12', '小黄', 'ww', '是', '2018-06-03 17:47:51');
INSERT INTO `dynamicmessages` VALUES ('48', '12', '小黄', 'ww', '是', '2018-06-03 17:48:08');
INSERT INTO `dynamicmessages` VALUES ('49', '17', '小华', 'sss', '是', '2018-06-03 17:48:54');

-- ----------------------------
-- Table structure for logginpermission
-- ----------------------------
DROP TABLE IF EXISTS `logginpermission`;
CREATE TABLE `logginpermission` (
  `id` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '日志id',
  `userid` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `isSuccess` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `string0` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `string1` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of logginpermission
-- ----------------------------
INSERT INTO `logginpermission` VALUES ('01260533-9e37-476c-aaa3-b2e44f58dec0', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '模块管理--分页条件查询获取所有模块', '2018-06-05 15:54:41', '是', null, null);
INSERT INTO `logginpermission` VALUES ('02f342a8-1456-4951-8bcd-7db2f687a446', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '权限管理--获取全部权限信息', '2018-06-05 15:57:57', '是', null, null);
INSERT INTO `logginpermission` VALUES ('04bda5c3-52c7-4891-81bf-35c7b3bd165c', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:14:57', '是', null, null);
INSERT INTO `logginpermission` VALUES ('054ddfff-8f6d-43d9-9d70-a08edf5937d7', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:28:32', '是', null, null);
INSERT INTO `logginpermission` VALUES ('07a47dc8-e0d4-4fff-b69b-4ddaf219f1bb', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '回收站管理--回收站删除 彻底删除', '2018-06-05 22:42:20', '是', null, null);
INSERT INTO `logginpermission` VALUES ('08028c6b-cb44-48ae-a1cc-6574345d4dd8', '579d1829-0d19-4b07-8659-52d2ec881880', '学生管理--查询学生', '2018-06-05 22:39:55', '是', null, null);
INSERT INTO `logginpermission` VALUES ('0c0e08ea-6993-4b01-9c06-e0556b8c023c', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:14:57', '是', null, null);
INSERT INTO `logginpermission` VALUES ('0c283206-b476-42b0-bd53-0214f545a65d', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:00:37', '是', null, null);
INSERT INTO `logginpermission` VALUES ('0cecabea-93a6-4ac6-90f5-b058d4a4d5cc', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '权限管理--获取全部权限信息', '2018-06-05 15:57:36', '是', null, null);
INSERT INTO `logginpermission` VALUES ('0ef91239-da83-4492-8e65-f57120ed4022', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:07:54', '是', null, null);
INSERT INTO `logginpermission` VALUES ('0f742e08-6f76-4cb2-9fcd-383346cbb36f', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--导出日志为excel', '2018-06-05 22:22:20', '是', null, null);
INSERT INTO `logginpermission` VALUES ('149142db-4a62-45db-9a8e-f3a15a4babb2', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '咨询师管理--获取所有咨询师', '2018-06-05 22:38:31', '是', null, null);
INSERT INTO `logginpermission` VALUES ('154d86bb-6c74-4489-98ad-9561f14710a1', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '学生管理--查询学生', '2018-06-05 22:38:44', '是', null, null);
INSERT INTO `logginpermission` VALUES ('16fe24f3-21c5-45a2-bdff-fbf156499c5d', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '角色管理--查询用户下的角色和不属于用户的角色', '2018-06-05 22:39:42', '是', null, null);
INSERT INTO `logginpermission` VALUES ('1d8b6427-012e-4d82-bf1c-5f01557294d6', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '角色权限关系管理--新增角色权限关系', '2018-06-05 15:57:52', '是', null, null);
INSERT INTO `logginpermission` VALUES ('1e73d440-6d18-4a08-934b-636c4fac4bbe', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '角色管理--分页查询角色', '2018-06-05 15:57:55', '是', null, null);
INSERT INTO `logginpermission` VALUES ('2073aa77-16c9-4eec-a0fa-e8d539ca9842', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '权限管理--获取全部权限信息', '2018-06-05 15:57:49', '是', null, null);
INSERT INTO `logginpermission` VALUES ('211b4d18-aaf8-4a36-ad76-ecb3eb0c03e6', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '学生管理--查询学生', '2018-06-05 22:38:02', '是', null, null);
INSERT INTO `logginpermission` VALUES ('243c0a07-e261-4d4f-9671-71d1cf4494c9', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '用户管理--给用户增加或者移除角色', '2018-06-05 22:39:44', '是', null, null);
INSERT INTO `logginpermission` VALUES ('2633a912-42fa-4669-a28d-ea80b5d35fd4', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:21:52', '是', null, null);
INSERT INTO `logginpermission` VALUES ('27f7e503-6316-4d28-8d54-3b9eaf1ba810', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:08:17', '是', null, null);
INSERT INTO `logginpermission` VALUES ('29f89e0b-00bc-43b0-95ec-c18b73df385c', '579d1829-0d19-4b07-8659-52d2ec881880', '学生管理--查询学生', '2018-06-05 22:40:21', '是', null, null);
INSERT INTO `logginpermission` VALUES ('2a72083a-443b-408d-90c0-c1b9b389ba88', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '学生管理--查询学生', '2018-06-05 22:36:52', '是', null, null);
INSERT INTO `logginpermission` VALUES ('2bea0b37-8c81-4efb-af5b-9c22f572ea80', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:28:30', '是', null, null);
INSERT INTO `logginpermission` VALUES ('2bfff181-10e5-4ca4-b08d-f5428f8fd521', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:14:00', '是', null, null);
INSERT INTO `logginpermission` VALUES ('2db0fc3c-eb92-451d-b8bb-9ed4a2963c94', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 16:53:36', '是', null, null);
INSERT INTO `logginpermission` VALUES ('305d14ac-26af-48cb-b314-bd5e3fab3554', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:13:52', '是', null, null);
INSERT INTO `logginpermission` VALUES ('31dfbdf1-32f7-4add-97f9-bd1d20653448', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '学生管理--查询学生', '2018-06-05 22:38:02', '是', null, null);
INSERT INTO `logginpermission` VALUES ('347a5c4d-9d36-4b97-b689-32105051f8f8', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:28:46', '是', null, null);
INSERT INTO `logginpermission` VALUES ('386183be-f339-43b6-b1ac-835b85f22ac0', '579d1829-0d19-4b07-8659-52d2ec881880', '学生管理--新增学生', '2018-06-05 22:41:45', '是', null, null);
INSERT INTO `logginpermission` VALUES ('3ab75977-7ea2-4ee3-8053-0b4eb0486dbe', '579d1829-0d19-4b07-8659-52d2ec881880', '学生管理--查询学生', '2018-06-05 22:40:21', '是', null, null);
INSERT INTO `logginpermission` VALUES ('3ae7df8f-586c-4835-a22f-64cefb04a621', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '回收站管理--分页查询回收站对象', '2018-06-05 22:41:06', '是', null, null);
INSERT INTO `logginpermission` VALUES ('3b3ae260-f2fc-4f67-8661-c5d5ab3d6777', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:08:07', '是', null, null);
INSERT INTO `logginpermission` VALUES ('3e24fc16-95a6-4566-862e-591edf13a356', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '咨询师管理--获取所有咨询师', '2018-06-05 22:36:52', '是', null, null);
INSERT INTO `logginpermission` VALUES ('3e5a9eb3-6e92-4261-81df-d3ea4d01870f', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:28:29', '是', null, null);
INSERT INTO `logginpermission` VALUES ('3f0a38a7-3f28-4a97-b1b2-d7aa6b7c2928', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '角色管理--分页查询角色', '2018-06-05 15:55:32', '是', null, null);
INSERT INTO `logginpermission` VALUES ('422ac936-c4f9-44ef-a7dd-59203f3bbe71', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:25:40', '是', null, null);
INSERT INTO `logginpermission` VALUES ('42d6899b-574a-48b4-b268-acb3629caa48', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--导出日志为excel', '2018-06-05 22:21:04', '是', null, null);
INSERT INTO `logginpermission` VALUES ('44456911-7df8-41b1-9ec1-a6a027799a24', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:18:16', '是', null, null);
INSERT INTO `logginpermission` VALUES ('470702ae-9269-4bdd-91ac-bfda7676e40b', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:07:47', '是', null, null);
INSERT INTO `logginpermission` VALUES ('47224cd3-de48-4cc9-9922-c51f3be08756', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:01:12', '是', null, null);
INSERT INTO `logginpermission` VALUES ('47c6684e-37a3-4e82-bb5b-58fcd5e2052c', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '权限管理--更新全部权限信息', '2018-06-05 15:57:34', '是', null, null);
INSERT INTO `logginpermission` VALUES ('495bc671-d60a-4beb-9464-18c060c21f76', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '权限管理--获取全部权限信息', '2018-06-05 15:57:25', '是', null, null);
INSERT INTO `logginpermission` VALUES ('4ed59b8e-2253-4025-988f-c4922c7565d6', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '用户管理--查询用户', '2018-06-05 22:39:40', '是', null, null);
INSERT INTO `logginpermission` VALUES ('5361ae26-7a8b-4328-a306-30a75acf0f58', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:19:32', '是', null, null);
INSERT INTO `logginpermission` VALUES ('547273d5-614c-4a7f-b13e-9173db6e8bb2', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:15:39', '是', null, null);
INSERT INTO `logginpermission` VALUES ('55fa863a-6854-43b5-b707-3e19285db3a6', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--导出日志为excel', '2018-06-05 22:21:38', '是', null, null);
INSERT INTO `logginpermission` VALUES ('5716af07-9eff-41f4-8445-a8935dd5b7df', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '回收站管理--分页查询回收站对象', '2018-06-05 22:42:20', '是', null, null);
INSERT INTO `logginpermission` VALUES ('5911e36d-906b-4de5-904c-fede5a31f087', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:22:19', '是', null, null);
INSERT INTO `logginpermission` VALUES ('59d36eb0-5935-4a7c-9594-7b94f1517067', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:07:43', '是', null, null);
INSERT INTO `logginpermission` VALUES ('5acd44e8-8a09-4348-a38f-868badfaedae', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '模块管理--分页条件查询获取所有模块', '2018-06-05 15:55:09', '是', null, null);
INSERT INTO `logginpermission` VALUES ('5d8110b4-dcc5-49fd-976c-a95bd426b5b7', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '用户管理--查询用户', '2018-06-05 15:54:02', '是', null, null);
INSERT INTO `logginpermission` VALUES ('5ee48f51-7cb3-4e6d-b0db-57a299abcba4', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:14:54', '是', null, null);
INSERT INTO `logginpermission` VALUES ('5f39fc13-5aab-4bb3-b085-72c008f54b9b', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:01:03', '是', null, null);
INSERT INTO `logginpermission` VALUES ('5fdc643b-3bd7-44f6-979a-27ce89ab32ad', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:01:03', '是', null, null);
INSERT INTO `logginpermission` VALUES ('602636fc-e0a6-40c1-aaa0-95aac955d771', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:01:10', '是', null, null);
INSERT INTO `logginpermission` VALUES ('6279786d-f210-4659-a62f-2f55c9d51771', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:28:26', '是', null, null);
INSERT INTO `logginpermission` VALUES ('64d3793a-b502-4350-9e60-867bf96de338', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '用户管理--删除用户', '2018-06-05 22:42:05', '是', null, null);
INSERT INTO `logginpermission` VALUES ('65f5abb3-cb06-4cab-8013-7a97e0dd2b79', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '角色管理--分页查询角色', '2018-06-05 15:57:23', '是', null, null);
INSERT INTO `logginpermission` VALUES ('67099207-9368-4091-bfde-8a6ad8830e8c', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '权限管理--更新全部权限信息', '2018-06-05 17:08:25', '是', null, null);
INSERT INTO `logginpermission` VALUES ('67b51919-addb-49ce-b0ba-b1864d7f31b1', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '用户管理--查询用户', '2018-06-05 22:39:16', '是', null, null);
INSERT INTO `logginpermission` VALUES ('6a00a291-31f3-42b9-aef2-85aee18f435d', '579d1829-0d19-4b07-8659-52d2ec881880', '学生管理--删除学生', '2018-06-05 22:40:50', '是', null, null);
INSERT INTO `logginpermission` VALUES ('6ab54d1a-30da-4e65-a3c2-4c3acb80a4b6', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:19:32', '是', null, null);
INSERT INTO `logginpermission` VALUES ('6dd737f7-15d3-4dab-98b3-b71acf4597cb', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '咨询师管理--获取所有咨询师', '2018-06-05 22:38:02', '是', null, null);
INSERT INTO `logginpermission` VALUES ('6facecb3-33d7-4e1c-990f-be9827a4d56a', '579d1829-0d19-4b07-8659-52d2ec881880', '学生管理--查询学生', '2018-06-05 22:39:55', '是', null, null);
INSERT INTO `logginpermission` VALUES ('703bfa68-cfb3-44cf-8d47-a46f4fe1e19a', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '角色管理--分页查询角色', '2018-06-05 15:57:23', '是', null, null);
INSERT INTO `logginpermission` VALUES ('709fb344-0b2a-4022-91a5-221e16f5ef39', '579d1829-0d19-4b07-8659-52d2ec881880', '学生管理--查询学生', '2018-06-05 22:41:40', '是', null, null);
INSERT INTO `logginpermission` VALUES ('7138d2ed-544d-42e0-8bb0-4f53700341fd', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '角色管理--分页查询角色', '2018-06-05 15:57:48', '是', null, null);
INSERT INTO `logginpermission` VALUES ('719d9189-dc85-4b67-b9ff-36709df04d70', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '角色管理--分页查询角色', '2018-06-05 15:57:55', '是', null, null);
INSERT INTO `logginpermission` VALUES ('75562289-8648-4472-9024-0824163649d6', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--导出日志为excel', '2018-06-05 22:18:17', '是', null, null);
INSERT INTO `logginpermission` VALUES ('770cee64-9573-47d9-9571-bf9ce22cdb21', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '模块管理--分页条件查询获取所有模块', '2018-06-05 15:54:41', '是', null, null);
INSERT INTO `logginpermission` VALUES ('775a8b44-ff7a-4ad3-84d4-6cb53eaace56', '579d1829-0d19-4b07-8659-52d2ec881880', '学生管理--查询学生', '2018-06-05 22:40:50', '是', null, null);
INSERT INTO `logginpermission` VALUES ('79b05088-4133-44fc-8830-3277aecfe320', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '学生管理--查询学生', '2018-06-05 22:38:44', '是', null, null);
INSERT INTO `logginpermission` VALUES ('79fa1c9f-0d62-43c9-ab56-ea71aa226096', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--导出日志为excel', '2018-06-05 22:14:58', '是', null, null);
INSERT INTO `logginpermission` VALUES ('7a980c02-a62f-47cf-accc-978c482279df', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:01:07', '是', null, null);
INSERT INTO `logginpermission` VALUES ('7b4816fd-4b3b-4a62-88bd-8edf5f3e5d3c', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--导出日志为excel', '2018-06-05 22:17:12', '是', null, null);
INSERT INTO `logginpermission` VALUES ('7c915aef-e5b8-4594-aac1-decc3de2f0f6', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:24:43', '是', null, null);
INSERT INTO `logginpermission` VALUES ('7cd2cb26-d66f-4c0f-9bfc-529da9f32007', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:28:36', '是', null, null);
INSERT INTO `logginpermission` VALUES ('7f4be101-fbfe-4405-9037-75a63b3f5809', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '回收站管理--分页查询回收站对象', '2018-06-05 22:42:12', '是', null, null);
INSERT INTO `logginpermission` VALUES ('7fa916b4-105b-4cf6-af85-ba8a311bed41', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '用户管理--查询用户', '2018-06-05 22:39:34', '是', null, null);
INSERT INTO `logginpermission` VALUES ('815e17c8-bf8c-4326-9918-9ddbbb115f46', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:01:15', '是', null, null);
INSERT INTO `logginpermission` VALUES ('8364e441-f8f3-4f4c-b61c-0029b606ad9e', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '回收站管理--分页查询回收站对象', '2018-06-05 22:27:48', '是', null, null);
INSERT INTO `logginpermission` VALUES ('87d52641-c47f-4f31-a9d3-9bbdde35d757', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '用户管理--查询用户', '2018-06-05 15:54:02', '是', null, null);
INSERT INTO `logginpermission` VALUES ('89203856-6fd2-4f61-8e9a-80bd1d53e6da', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--导出日志为excel', '2018-06-05 22:24:44', '是', null, null);
INSERT INTO `logginpermission` VALUES ('8b6f53c1-d5bb-4691-bd6d-e92cee6f0649', '579d1829-0d19-4b07-8659-52d2ec881880', '咨询师管理--获取所有咨询师', '2018-06-05 22:39:55', '是', null, null);
INSERT INTO `logginpermission` VALUES ('8ed18bca-1f25-4c8e-a94b-0009af154605', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:28:33', '是', null, null);
INSERT INTO `logginpermission` VALUES ('8f241acb-a7ae-4995-9263-acab95e801b8', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '模块管理--新增模块', '2018-06-05 15:55:08', '是', null, null);
INSERT INTO `logginpermission` VALUES ('930dc580-4944-467c-8244-ebcc5e4d6657', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:01:09', '是', null, null);
INSERT INTO `logginpermission` VALUES ('93122174-95b2-4c96-ae3b-272ac0df0175', '579d1829-0d19-4b07-8659-52d2ec881880', '学生管理--新增学生', '2018-06-05 22:40:07', '是', null, null);
INSERT INTO `logginpermission` VALUES ('9578a097-fad0-4a61-88cb-63871bff3e4e', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:07:04', '是', null, null);
INSERT INTO `logginpermission` VALUES ('987752a1-b9d1-4171-ad59-7f184d568599', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '权限管理--更新全部权限信息', '2018-06-05 22:25:48', '是', null, null);
INSERT INTO `logginpermission` VALUES ('98a34445-d9a2-4f03-ad9f-2c70859c3071', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:00:37', '是', null, null);
INSERT INTO `logginpermission` VALUES ('9901115d-0a66-4a56-a06b-b87cee87b6a4', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:07:47', '是', null, null);
INSERT INTO `logginpermission` VALUES ('992864c0-7c9a-4524-a847-75e2276e7ac2', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '用户管理--新增用户', '2018-06-05 22:39:34', '是', null, null);
INSERT INTO `logginpermission` VALUES ('9aa8ac77-d4bd-4df4-a2c4-b4c702ec33ae', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:28:46', '是', null, null);
INSERT INTO `logginpermission` VALUES ('9abb9d35-20e7-410d-8a0a-0367b6b857df', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:28:34', '是', null, null);
INSERT INTO `logginpermission` VALUES ('9b2e0d40-3a73-4669-a91c-ce4947ffeb5c', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:07:43', '是', null, null);
INSERT INTO `logginpermission` VALUES ('9d0b7f4e-10d4-4b7a-afd2-8efad5f640d7', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '用户管理--查询用户', '2018-06-05 22:42:03', '是', null, null);
INSERT INTO `logginpermission` VALUES ('a54ac857-8c32-42b8-97e3-b6fe79d181d8', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--导出日志为excel', '2018-06-05 22:17:02', '是', null, null);
INSERT INTO `logginpermission` VALUES ('a679f4d3-7c66-441f-9499-b0e5ddb25406', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '模块管理--获取所有模块,并选中角色拥有的树,树形', '2018-06-05 15:55:25', '是', null, null);
INSERT INTO `logginpermission` VALUES ('a75a1640-5010-4248-91cb-4bc65c795651', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--导出日志为excel', '2018-06-05 22:21:54', '是', null, null);
INSERT INTO `logginpermission` VALUES ('a8e99c12-f51e-4499-a83b-6c71e733a31c', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:08:09', '是', null, null);
INSERT INTO `logginpermission` VALUES ('aaa56c2f-6bec-43a3-a07b-deaafcc30e57', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '角色管理--分页查询角色', '2018-06-05 15:55:23', '是', null, null);
INSERT INTO `logginpermission` VALUES ('ac79ca2d-a6ea-4fe0-86d5-634ef2d74357', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '学生管理--查询学生', '2018-06-05 22:38:54', '是', null, null);
INSERT INTO `logginpermission` VALUES ('ad9b7320-03bd-4a98-b628-1370f32532ac', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '角色管理--分页查询角色', '2018-06-05 15:55:23', '是', null, null);
INSERT INTO `logginpermission` VALUES ('ae51096d-1b0c-4077-bae0-5c77d24f28e6', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 16:53:30', '是', null, null);
INSERT INTO `logginpermission` VALUES ('afc807aa-768c-4a9d-ad18-d87fd24daf5c', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '角色模块关系管理--给角色设置模块', '2018-06-05 15:55:38', '是', null, null);
INSERT INTO `logginpermission` VALUES ('b7468d0c-dd20-4198-ba0e-39a171447308', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '学生管理--查询学生', '2018-06-05 22:41:27', '是', null, null);
INSERT INTO `logginpermission` VALUES ('b9e565a0-fa20-40d9-8638-28daff68c259', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '回收站管理--分页查询回收站对象', '2018-06-05 22:41:06', '是', null, null);
INSERT INTO `logginpermission` VALUES ('bb615f59-ab8c-4e72-ad52-cc8f38daddb0', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '用户管理--查询用户', '2018-06-05 22:39:16', '是', null, null);
INSERT INTO `logginpermission` VALUES ('bbf68d06-f5fe-4538-93e5-22e681691219', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:28:11', '是', null, null);
INSERT INTO `logginpermission` VALUES ('bc2a6569-c871-42d9-bd52-5d6cd6ad6e7c', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '咨询师管理--获取所有咨询师', '2018-06-05 22:38:44', '是', null, null);
INSERT INTO `logginpermission` VALUES ('c17412b4-5418-4680-8d3a-584bea943447', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:24:43', '是', null, null);
INSERT INTO `logginpermission` VALUES ('c23f95a6-c3fa-4a8f-acf9-0385744465c5', '579d1829-0d19-4b07-8659-52d2ec881880', '学生管理--查询学生', '2018-06-05 22:41:40', '是', null, null);
INSERT INTO `logginpermission` VALUES ('c299c7dd-db63-4b71-9eb4-aa67ebcb26df', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--导出日志为excel', '2018-06-05 22:19:35', '是', null, null);
INSERT INTO `logginpermission` VALUES ('c29d407e-fe2f-4ab0-8290-44152f87d90b', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:14:00', '是', null, null);
INSERT INTO `logginpermission` VALUES ('c3fa4c93-a664-49ce-ab9e-bf46be9e7a91', null, '日志管理--导出日志为excel', '2018-06-05 22:16:45', '否', '请先登录', null);
INSERT INTO `logginpermission` VALUES ('c47869cc-f94a-4f24-ae5b-54239aa4cfd0', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:08:05', '是', null, null);
INSERT INTO `logginpermission` VALUES ('c4801246-663e-4d9a-a9ae-d9ba3e9c5f2e', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:28:18', '是', null, null);
INSERT INTO `logginpermission` VALUES ('c6cc85f4-5f7f-4bf2-847f-4600b8a69beb', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '用户管理--查询用户', '2018-06-05 22:42:00', '是', null, null);
INSERT INTO `logginpermission` VALUES ('c7b182fd-cfda-455f-bded-167d9e19ab14', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '模块管理--获取所有模块,并选中角色拥有的树,树形', '2018-06-05 15:55:33', '是', null, null);
INSERT INTO `logginpermission` VALUES ('c84a3d06-5df0-4a1e-a25c-f6ebcb9a949f', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:17:01', '是', null, null);
INSERT INTO `logginpermission` VALUES ('c8ea1f14-6558-47d7-a4b4-27b470ce4c4f', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '用户管理--查询用户', '2018-06-05 22:42:05', '是', null, null);
INSERT INTO `logginpermission` VALUES ('ca1a5f96-b58a-4ab6-b9bd-80627671ac15', null, '学生管理--查询学生', '2018-06-05 15:52:35', '否', '请先登录', null);
INSERT INTO `logginpermission` VALUES ('cc201ad1-0d49-4ab5-b6f8-245a988393ae', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:17:01', '是', null, null);
INSERT INTO `logginpermission` VALUES ('d0cf731b-b204-49cb-80a6-ca06ee3cf3f2', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '学生管理--查询学生', '2018-06-05 22:36:52', '是', null, null);
INSERT INTO `logginpermission` VALUES ('d347c352-2622-4195-9478-6c7fbf00beae', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:18:16', '是', null, null);
INSERT INTO `logginpermission` VALUES ('d404a0a2-d498-4908-9c9a-61a5d337e3da', null, '咨询师管理--获取所有咨询师', '2018-06-05 15:52:35', '否', '请先登录', null);
INSERT INTO `logginpermission` VALUES ('d59d6fb2-a13e-4112-8ba1-0883c53cec85', '579d1829-0d19-4b07-8659-52d2ec881880', '咨询师管理--获取所有咨询师', '2018-06-05 22:41:40', '是', null, null);
INSERT INTO `logginpermission` VALUES ('d6ca6a34-767c-42da-83b3-e2d2948c624b', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '回收站管理--分页查询回收站对象', '2018-06-05 15:57:16', '是', null, null);
INSERT INTO `logginpermission` VALUES ('d6e51365-a605-4890-90bc-a04a6ab16c16', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '回收站管理--回收站删除 彻底删除', '2018-06-05 22:41:10', '是', null, null);
INSERT INTO `logginpermission` VALUES ('d794dda8-7a71-43f4-82e9-430337e80cba', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:19:19', '是', null, null);
INSERT INTO `logginpermission` VALUES ('d9ed29ce-8ffb-40a7-a262-166422a53110', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '模块管理--级联选择父级模块获取的模块', '2018-06-05 15:54:43', '是', null, null);
INSERT INTO `logginpermission` VALUES ('db436d47-215e-40e5-a626-3a20bf908b28', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:08:00', '是', null, null);
INSERT INTO `logginpermission` VALUES ('dc179a45-f374-4789-aad5-05bbc0391cb2', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 16:59:57', '是', null, null);
INSERT INTO `logginpermission` VALUES ('dc5cdf28-c9b8-4025-928f-092dbf7e10e4', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '角色管理--查询用户下的角色和不属于用户的角色', '2018-06-05 22:39:44', '是', null, null);
INSERT INTO `logginpermission` VALUES ('dc64a19e-bfbc-41b8-970f-24afa903f290', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--导出日志为excel', '2018-06-05 22:19:20', '是', null, null);
INSERT INTO `logginpermission` VALUES ('dd6083ab-e637-4d2c-80f1-bb28aaf9dfb6', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:21:02', '是', null, null);
INSERT INTO `logginpermission` VALUES ('dd63994c-90d0-454b-8cda-0f3db8919349', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 16:59:57', '是', null, null);
INSERT INTO `logginpermission` VALUES ('dfacee2a-b805-48c2-a62a-7c1f42187d57', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '学生管理--查询学生', '2018-06-05 22:38:31', '是', null, null);
INSERT INTO `logginpermission` VALUES ('e765e244-3683-44e8-a187-11bfba0eff8a', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '回收站管理--分页查询回收站对象', '2018-06-05 22:41:11', '是', null, null);
INSERT INTO `logginpermission` VALUES ('e85ac31d-967f-4930-b01f-80d98f54148f', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:21:02', '是', null, null);
INSERT INTO `logginpermission` VALUES ('e8fe9a08-f748-4b5b-a6b2-496deaf40144', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '回收站管理--分页查询回收站对象', '2018-06-05 15:57:16', '是', null, null);
INSERT INTO `logginpermission` VALUES ('ecf66068-6ecf-4023-ac8a-af0f5e3b5383', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:19:19', '是', null, null);
INSERT INTO `logginpermission` VALUES ('ecfde26b-5a3a-49ed-8560-0e4cce09d243', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:25:40', '是', null, null);
INSERT INTO `logginpermission` VALUES ('ed126c9e-1a69-4728-a39d-9140eab6f721', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:21:36', '是', null, null);
INSERT INTO `logginpermission` VALUES ('edd2cd72-2251-4e43-9781-29f6c080f69b', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '学生管理--查询学生', '2018-06-05 22:41:27', '是', null, null);
INSERT INTO `logginpermission` VALUES ('f0daa3b2-0efa-4477-adb9-bbf5ea9250e3', null, '学生管理--查询学生', '2018-06-05 15:52:35', '否', '请先登录', null);
INSERT INTO `logginpermission` VALUES ('f2d927c2-a909-4387-bfc1-e7724e776f09', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:14:54', '是', null, null);
INSERT INTO `logginpermission` VALUES ('f4592548-b350-4885-8e4e-cd1e8e278a20', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '学生管理--查询学生', '2018-06-05 22:38:31', '是', null, null);
INSERT INTO `logginpermission` VALUES ('f66005f7-e4fd-489a-9836-0eb41f93f885', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '用户管理--查询用户', '2018-06-05 22:42:00', '是', null, null);
INSERT INTO `logginpermission` VALUES ('f78520e0-5de1-44be-a557-d6c72fd53f47', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '角色模块关系管理--给角色设置模块', '2018-06-05 15:55:30', '是', null, null);
INSERT INTO `logginpermission` VALUES ('f8a608fa-ec1d-4f30-a6ef-6e5edf4be948', '579d1829-0d19-4b07-8659-52d2ec881880', '咨询师管理--获取所有咨询师', '2018-06-05 22:40:21', '是', null, null);
INSERT INTO `logginpermission` VALUES ('fb47b8aa-1f7e-48ab-a102-aa1c85db9743', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '角色权限关系管理--新增角色权限关系', '2018-06-05 15:57:46', '是', null, null);
INSERT INTO `logginpermission` VALUES ('fb758e32-fe8b-4f36-a116-1f12a218c04f', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '回收站管理--分页查询回收站对象', '2018-06-05 22:42:12', '是', null, null);
INSERT INTO `logginpermission` VALUES ('fc974776-5597-40c6-8b0d-e2069b959d6c', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '咨询师管理--获取所有咨询师', '2018-06-05 22:41:27', '是', null, null);
INSERT INTO `logginpermission` VALUES ('fd4ada16-5fb2-4dbc-99b7-a1bec04e1644', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 22:13:52', '是', null, null);
INSERT INTO `logginpermission` VALUES ('fdc3ce92-9e48-4008-84f2-e240955fb4e2', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '回收站管理--分页查询回收站对象', '2018-06-05 22:27:47', '是', null, null);
INSERT INTO `logginpermission` VALUES ('ff915ee2-d47b-46a4-90b8-e208cfce18ae', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '日志管理--日志分页查询', '2018-06-05 17:07:04', '是', null, null);

-- ----------------------------
-- Table structure for modules
-- ----------------------------
DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模块编号',
  `Name` varchar(50) NOT NULL COMMENT '模块名称',
  `ParentId` int(11) DEFAULT '0' COMMENT '父模块编号',
  `Path` varchar(200) DEFAULT NULL COMMENT '模块路径',
  `Weight` int(11) DEFAULT NULL COMMENT '权重',
  `icon_class` varchar(20) DEFAULT NULL,
  `Ops` varchar(100) DEFAULT NULL COMMENT '预留字符串字段',
  `Int0` int(11) DEFAULT NULL COMMENT '预留整数字段',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1198 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modules
-- ----------------------------
INSERT INTO `modules` VALUES ('4', '系统管理', '0', '', '99', null, null, null);
INSERT INTO `modules` VALUES ('5', '用户管理', '4', 'sys/yh.jsp', '99', 'person-stalker', null, null);
INSERT INTO `modules` VALUES ('6', '角色管理', '4', 'sys/jdgl.jsp', '98', null, null, null);
INSERT INTO `modules` VALUES ('8', '模块管理', '4', 'syss/modules.jsp', '96', null, null, null);
INSERT INTO `modules` VALUES ('12', '字典类型', '4', 'sys/zdlx.html', '95', null, null, null);
INSERT INTO `modules` VALUES ('13', '数据字典', '4', 'sys/sjzd.html', '94', null, null, null);
INSERT INTO `modules` VALUES ('16', '课程资源', '0', '', '98', null, null, null);
INSERT INTO `modules` VALUES ('24', '课程管理', '16', 'dev/kcgl.html', '97', null, null, null);
INSERT INTO `modules` VALUES ('25', '章节开发', '16', 'dev/zjka.html', '95', null, null, null);
INSERT INTO `modules` VALUES ('27', '单词管理', '16', 'dev/dcgl.html', '91', null, null, null);
INSERT INTO `modules` VALUES ('34', '学期管理', '16', 'dev/xqgl.html', '99', null, null, null);
INSERT INTO `modules` VALUES ('35', '理论试卷库', '16', 'dev/llsjk.html', '89', null, null, null);
INSERT INTO `modules` VALUES ('36', '客观题库', '16', 'dev/kgtk.html', '90', null, null, null);
INSERT INTO `modules` VALUES ('37', '快捷服务', '0', '', '91', null, null, null);
INSERT INTO `modules` VALUES ('39', '学生管理', '0', '', '97', null, null, null);
INSERT INTO `modules` VALUES ('40', '新生报到', '39', 'stu/xsbd.html', '99', null, null, null);
INSERT INTO `modules` VALUES ('41', '学籍管理', '39', 'stu/xjgl.html', '98', null, null, null);
INSERT INTO `modules` VALUES ('42', '班级管理', '39', 'stu/bjgl.html', '95', null, null, null);
INSERT INTO `modules` VALUES ('78', '登记新员工', '4', 'emp/djxyg.html', '60', null, null, null);
INSERT INTO `modules` VALUES ('79', '员工管理', '4', 'emp/yggl.html', '86', null, null, null);
INSERT INTO `modules` VALUES ('80', '学生学习', '0', '', '96', null, null, null);
INSERT INTO `modules` VALUES ('81', '登记出勤', '39', 'stu/cqdj.html', '88', null, null, null);
INSERT INTO `modules` VALUES ('82', '请假管理', '39', 'stu/qjgl.html', '90', null, null, null);
INSERT INTO `modules` VALUES ('83', '学籍异动', '39', 'stu/xjyd.html', '92', null, null, null);
INSERT INTO `modules` VALUES ('84', '班级学习跟踪', '80', 'stuLearn/bjxxgz.html', '78', null, null, null);
INSERT INTO `modules` VALUES ('85', '班级评优', '80', 'stuLearn/bjpy.html', '89', null, null, null);
INSERT INTO `modules` VALUES ('86', '课表管理', '80', 'stu/kbgl.html', '99', null, null, null);
INSERT INTO `modules` VALUES ('87', '学生学习跟踪', '80', 'stuLearn/xsxxgz.html', '79', null, null, null);
INSERT INTO `modules` VALUES ('88', '登记上机', '80', 'stuLearn/djsj.html', '97', null, null, null);
INSERT INTO `modules` VALUES ('89', '登记任务单', '80', 'stuLearn/djrwd.html', '96', null, null, null);
INSERT INTO `modules` VALUES ('90', '登记作业', '80', 'stuLearn/djzy.html', '98', null, null, null);
INSERT INTO `modules` VALUES ('91', '积分与Z币', '0', '', '95', null, null, null);
INSERT INTO `modules` VALUES ('92', '学生规则', '91', 'marks/xsgz.html', '99', null, null, null);
INSERT INTO `modules` VALUES ('93', '班级规则', '91', 'marks/bjgz.html', '94', null, null, null);
INSERT INTO `modules` VALUES ('94', '学生积分管理', '91', 'marks/xsjfgl.html', '98', null, null, null);
INSERT INTO `modules` VALUES ('95', '班级积分管理', '91', 'marks/bjjfgl.html', '93', null, null, null);
INSERT INTO `modules` VALUES ('96', '学生考试', '0', '', '94', null, null, null);
INSERT INTO `modules` VALUES ('97', '考试管理', '96', 'exam/ksgl.html', '98', null, null, null);
INSERT INTO `modules` VALUES ('99', '发起考试', '96', 'exam/fqks.html', '97', null, null, null);
INSERT INTO `modules` VALUES ('102', '公告管理', '37', 'sys/gggl.html', '97', null, null, null);
INSERT INTO `modules` VALUES ('104', '课程授权', '16', 'dev/kcsq.html', '98', null, null, null);
INSERT INTO `modules` VALUES ('105', '学生信息', '39', 'stu/xsxx.html', '93', null, null, null);
INSERT INTO `modules` VALUES ('106', '登记请假', '39', 'stu/djqj.html', '91', null, null, null);
INSERT INTO `modules` VALUES ('116', '登记职务', '39', 'stu/djzw.html', '79', null, null, null);
INSERT INTO `modules` VALUES ('117', '职务管理', '39', 'stu/zwgl.html', '78', null, null, null);
INSERT INTO `modules` VALUES ('119', '主观题库', '16', 'dev/zgtk.html', '87', null, null, null);
INSERT INTO `modules` VALUES ('120', 'Z币发放', '91', 'marks/zbff.html', '89', null, null, null);
INSERT INTO `modules` VALUES ('121', 'Z币查看', '91', 'marks/zbck.html', '88', null, null, null);
INSERT INTO `modules` VALUES ('122', '我的授课', '37', 'sys/wdsk.html', '93', null, null, null);
INSERT INTO `modules` VALUES ('123', '课表查询', '37', 'stu/kbcx.html', '92', null, null, null);
INSERT INTO `modules` VALUES ('124', '通讯录', '37', 'emp/txl.html', '98', null, null, null);
INSERT INTO `modules` VALUES ('131', '阶段简报', '80', 'stuLearn/jdjb.html', '88', null, null, null);
INSERT INTO `modules` VALUES ('132', '学生打分', '91', 'marks/xsdf.html', '97', null, null, null);
INSERT INTO `modules` VALUES ('133', '班级打分', '91', 'marks/bjdf.html', '92', null, null, null);
INSERT INTO `modules` VALUES ('134', '学生积分查看', '91', 'marks/xsjfck.html', '96', null, null, null);
INSERT INTO `modules` VALUES ('135', '班级积分查看', '91', 'marks/bjjfck.html', '91', null, null, null);
INSERT INTO `modules` VALUES ('136', '课程章节', '16', 'dev/kczj.html', '85', null, null, null);
INSERT INTO `modules` VALUES ('137', '教学日历', '16', 'dev/jxrl.html', '84', null, null, null);
INSERT INTO `modules` VALUES ('139', '出勤管理', '39', 'stu/cqgl.html', '87', null, null, null);
INSERT INTO `modules` VALUES ('140', '作业查询', '80', 'stuLearn/zycx.html', '95', null, null, null);
INSERT INTO `modules` VALUES ('141', '上机查询', '80', 'stuLearn/sjcx.html', '94', null, null, null);
INSERT INTO `modules` VALUES ('142', '单词管理', '80', 'stuLearn/dcgl.html', '84', null, null, null);
INSERT INTO `modules` VALUES ('143', '任务单查询', '80', 'stuLearn/rwdcx.html', '93', null, null, null);
INSERT INTO `modules` VALUES ('144', '登记单词', '80', 'stuLearn/djdc.html', '85', null, null, null);
INSERT INTO `modules` VALUES ('145', '课时管理', '37', 'sys/ksgl.html', '91', null, null, null);
INSERT INTO `modules` VALUES ('146', '课时统计', '37', 'sys/kstj.html', '90', null, null, null);
INSERT INTO `modules` VALUES ('147', '单词测试', '96', 'exam/dccs.html', '94', null, null, null);
INSERT INTO `modules` VALUES ('148', '指定试卷', '96', 'exam/zdsj.html', '94', null, null, null);
INSERT INTO `modules` VALUES ('149', '分派批改任务', '96', 'exam/fppgrw.html', '93', null, null, null);
INSERT INTO `modules` VALUES ('150', '批改登记', '96', 'exam/pgdj.html', '92', null, null, null);
INSERT INTO `modules` VALUES ('157', '成绩查询', '80', 'stuLearn/cjcx.html', '92', null, null, null);
INSERT INTO `modules` VALUES ('170', '课程资源', '16', 'dev/kczy.html ', '98', null, null, null);
INSERT INTO `modules` VALUES ('171', '网络档案', '0', null, '90', null, null, null);
INSERT INTO `modules` VALUES ('172', '网络学生', '171', 'netFile/netStu.jsp', '99', null, null, null);
INSERT INTO `modules` VALUES ('173', '网络跟踪', '171', 'netFile/netFollow.jsp', '98', null, null, null);
INSERT INTO `modules` VALUES ('174', '分量设置', '171', 'netFile/weightSet.jsp', '97', null, null, null);
INSERT INTO `modules` VALUES ('175', '我的学生', '171', 'netFile/myStu.jsp', '96', null, null, null);
INSERT INTO `modules` VALUES ('176', '员工签到', '4', 'sysM/empCheckIn.jsp', '99', null, null, null);
INSERT INTO `modules` VALUES ('177', '调整分量顺序', '4', 'sysM/setEmpWeight.jsp', '89', null, null, null);
INSERT INTO `modules` VALUES ('178', '修改密码', '4', 'sysM/setPassword.jsp', '87', null, null, null);
INSERT INTO `modules` VALUES ('179', '权限管理', '0', null, '89', null, null, null);
INSERT INTO `modules` VALUES ('180', '用户管理', '179', 'sys/yh.jsp', '99', 'person-stalker', null, null);
INSERT INTO `modules` VALUES ('182', '角色管理', '179', 'sys/jdgl.jsp', '97', null, null, null);
INSERT INTO `modules` VALUES ('183', '模块管理', '179', 'syss/modules.jsp', '96', null, null, null);
INSERT INTO `modules` VALUES ('184', '网络学生_1', '171', 'netFile/netStu_1.jsp', '92', null, null, null);
INSERT INTO `modules` VALUES ('185', '我的学生_1', '171', 'netFile/myStu_1.jsp', '90', null, null, null);
INSERT INTO `modules` VALUES ('186', '网络跟踪_1', '171', 'netFile/netFollow_1.jsp', '88', null, null, null);
INSERT INTO `modules` VALUES ('187', '权限管理', '179', 'sys/qx.html', '7', '', null, null);
INSERT INTO `modules` VALUES ('188', '统计', '4', 'sys/chart.html', '5', null, null, null);
INSERT INTO `modules` VALUES ('1194', '回收站', '4', 'sys/recycling.html', '7', '', null, null);
INSERT INTO `modules` VALUES ('1195', 'qq', '5', 'qq', '0', '', null, null);
INSERT INTO `modules` VALUES ('1196', 'cc', '5', 'cc', '2', '', null, null);
INSERT INTO `modules` VALUES ('1197', '权限日志', '4', 'sys/loggin.html', '0', '', null, null);

-- ----------------------------
-- Table structure for netfollows
-- ----------------------------
DROP TABLE IF EXISTS `netfollows`;
CREATE TABLE `netfollows` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '跟踪Id',
  `StudentId` int(11) DEFAULT NULL COMMENT '学生Id',
  `StudentName` varchar(100) DEFAULT NULL COMMENT '学生名称',
  `FollowTime` timestamp NULL DEFAULT NULL COMMENT '跟踪时间',
  `NextFollowTime` timestamp NULL DEFAULT NULL COMMENT '下次跟踪时间',
  `Content` varchar(2000) DEFAULT NULL COMMENT '备注',
  `UserId` varchar(100) DEFAULT NULL COMMENT '用户Id',
  `FollowType` varchar(100) DEFAULT NULL COMMENT '跟踪类型',
  `CreateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `FollowState` varchar(100) DEFAULT NULL COMMENT '跟踪状态',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of netfollows
-- ----------------------------
INSERT INTO `netfollows` VALUES ('1', '7', '小明', '2017-03-26 14:58:18', '2017-03-31 14:58:43', '正在进一步跟踪。。。', 'e57dad65-0d3d-11e7-b1d9-408d5cd46d51', '面谈', '2017-03-28 14:59:01', '思量');
INSERT INTO `netfollows` VALUES ('4', '8', '王二', '2017-03-24 15:04:02', '2017-03-31 15:04:39', '该学生咨询了培训的所有流程以及就业前景之后，正在考虑当中，还需进一步跟踪回访。', 'e57dad65-0d3d-11e7-b1d9-408d5cd46d51', '面谈', '2017-03-28 15:05:46', '上门未报名');
INSERT INTO `netfollows` VALUES ('5', '4', '张三三', '2017-03-24 15:11:48', '2017-03-30 15:12:14', '该学生还有些顾虑，需进一步跟踪拿下。。。', '26956c65-0af2-11e7-9a05-408d5cd46d51', '电话', '2017-03-28 15:12:52', '上门未报名');
INSERT INTO `netfollows` VALUES ('6', '5', '李四', '2017-03-10 15:13:22', '2017-03-29 15:13:42', '该学生已报名但是费用还没缴纳，可能还存在着其它想法，需进一步跟踪回访做好思想工作。', '26956c65-0af2-11e7-9a05-408d5cd46d51', '面谈', '2017-03-28 15:14:58', '报名未进班');
INSERT INTO `netfollows` VALUES ('7', '10', '阿飞', '2017-03-22 10:42:19', '2017-04-05 10:42:33', '继续跟踪访谈继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。。。。继续跟踪访谈继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。。。。继续跟踪访谈继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。继续跟踪访谈。。。。。。。。。', '0a32c411-1420-11e7-b0ca-408d5cd46d51', '面谈', '2017-03-31 10:43:10', '报名未进班');
INSERT INTO `netfollows` VALUES ('8', '14', '小黑', '2017-03-18 10:57:50', '2017-04-05 10:58:06', '该学生还在考虑中，需进一步跟踪访谈，解决其疑虑。', '0a32c411-1420-11e7-b0ca-408d5cd46d51', '电话', '2017-03-31 10:58:47', '上门未报名');
INSERT INTO `netfollows` VALUES ('9', '12', '小黄', '2017-04-12 10:44:00', null, '跟踪完毕，已缴费单未进班。', '26956c65-0af2-11e7-9a05-408d5cd46d51', '面谈', '2017-04-01 10:49:47', '报名未进班');
INSERT INTO `netfollows` VALUES ('10', '19', '小芳', '2017-03-31 09:37:56', '2017-04-08 09:38:09', '还需进一步回访跟踪', 'e57dad65-0d3d-11e7-b1d9-408d5cd46d51', '网络', '2017-04-05 09:38:26', '上门未报名');
INSERT INTO `netfollows` VALUES ('22', '10', '阿飞', '2018-05-08 00:00:00', null, null, 'fa8d1ec1-0af1-11e7-9a05-408d5cd46d51', 'cc', '2018-05-25 17:34:28', 'cc');
INSERT INTO `netfollows` VALUES ('23', '10', '阿飞', '2018-05-01 00:00:00', '2018-05-17 00:00:00', 'zczxc', '04b2c8ec-0af1-11e7-9a05-408d5cd46d51', 'asd', '2018-05-25 21:49:29', 'asd');
INSERT INTO `netfollows` VALUES ('24', '12', '小黄', '2018-06-05 00:00:00', '2018-06-22 00:00:00', 'm', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', 'sf', '2018-06-03 17:28:25', '1');
INSERT INTO `netfollows` VALUES ('25', '6', '小红', '2018-05-17 00:00:00', '2018-05-30 00:00:00', 'zxczxc', '04b2c8ec-0af1-11e7-9a05-408d5cd46d51', 'asd', '2018-06-04 17:37:24', 'asd');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permissionId` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '权限id',
  `permissionValue` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '权限值',
  `permissionModule` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '权限模块',
  `permissionName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '权限名称',
  `permissionLastUpdateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`permissionId`),
  UNIQUE KEY `permissionValueUnique` (`permissionValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('005574b4-ad15-491f-8455-ce97727d2b8a', 'student:updateIsDistribution', '学生管理', '修改自动分配', '2018-05-26 11:48:46');
INSERT INTO `permission` VALUES ('03c54824-d223-4b4c-b084-9df2d5571495', 'user:add', '用户管理', '新增用户', '2018-05-20 10:15:36');
INSERT INTO `permission` VALUES ('05a3e1d7-47c5-4197-9233-bef96c3d9856', 'user:updateField', '用户管理', '修改用户某一列的值', '2018-05-21 21:21:34');
INSERT INTO `permission` VALUES ('0639d477-7e7a-48f3-939c-d4918d8d1c41', 'student:updateStudentAsker', '学生管理', '修改学生的咨询师', '2018-05-26 11:48:46');
INSERT INTO `permission` VALUES ('06affd90-b6b1-4cd3-abf3-06c5fd2cf986', 'role:query', '角色管理', '查询所有角色', '2018-05-20 10:15:36');
INSERT INTO `permission` VALUES ('0febe6a8-69d9-445d-9aad-7691c1f71791', 'asker:queryAskersAll', '咨询师管理', '获取所有咨询师', '2018-05-26 11:48:46');
INSERT INTO `permission` VALUES ('112b1fb9-73c1-4f38-9ee3-a3f8c18a01ed', 'asker:getTemplate', '咨询师管理', '获取咨询师列checkbox', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('13893971-be8e-46f9-8571-f8c36a04c1e3', 'role:queryUnAndNoqueryUn', '角色管理', '查询用户下的角色和不属于用户的角色', '2018-05-20 10:15:36');
INSERT INTO `permission` VALUES ('18dd9d2d-51d5-4994-b355-7f88fe9464b7', 'recycling:reductionList', '回收站管理', '回收站还原', '2018-06-05 15:57:34');
INSERT INTO `permission` VALUES ('1a0f7fee-a7e8-42d6-a855-a9e30d1acdb7', 'student:deleteStudentById', '学生管理', '删除学生', '2018-05-26 11:48:46');
INSERT INTO `permission` VALUES ('1af44803-d9a2-4652-8602-810193ca3bbf', 'permission:queryAll', '权限管理', '获取全部权限信息', '2018-05-20 21:02:43');
INSERT INTO `permission` VALUES ('208b98b0-71e5-4f51-9e10-dba5ff1d059f', 'user:query', '用户管理', '查询用户', '2018-05-20 10:15:36');
INSERT INTO `permission` VALUES ('285e6c8e-63ba-470d-8de3-b8ee683a62fa', 'module:expertModule', '模块管理', '导出模块为excel', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('289780a1-d7ad-432e-8423-2532357fe90b', 'chart:getIsplayDstribution', '图表管理', '查询学生的付费情况分布', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('29aeff54-4ac1-41df-8e32-c85765d6aa5e', 'userCheck:importUserCheck', '用户签到管理', '批量导入用户签到', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('2d1c6c0c-3f20-4b45-98e3-d39b5c83e769', 'asker:importAsker', '咨询师管理', '批量导入咨询师', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('2d6e62ee-6106-4a00-b713-4861216300b8', 'module:importModule', '模块管理', '批量导入模块', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('418a9468-c91b-4a93-96b1-11e6a279a88b', 'dynamicmessage:addDynamicmessage', '动态信息管理', '新增动态消息', '2018-05-26 11:48:46');
INSERT INTO `permission` VALUES ('4ae3d48a-9d95-43c9-b72e-0d7221344bca', 'rolePermission:addAll', '角色权限关系管理', '新增角色权限关系', '2018-05-20 21:02:43');
INSERT INTO `permission` VALUES ('4cd76921-989e-4cba-b548-45e7a675970b', 'permission:queryPaging', '权限管理', '分页获取权限信息', '2018-05-26 11:48:46');
INSERT INTO `permission` VALUES ('4f3612d0-d82b-43fc-bd93-627f657fdc75', 'netfollow:addNetFollow', '跟踪管理', '新增跟踪学生', '2018-05-26 11:48:46');
INSERT INTO `permission` VALUES ('505d982c-a36f-4f59-8e6b-6afe68d32585', 'recycling:queryRecyclingPaging', '回收站管理', '分页查询回收站对象', '2018-06-04 23:08:19');
INSERT INTO `permission` VALUES ('5093e639-ce61-4785-9c89-f9c797952569', 'student:importStudent', '学生管理', '批量导入学生', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('52cd0cca-964e-48df-a32e-f6258cce2bb5', 'role:deleteRole', '角色管理', '删除角色', '2018-05-21 14:56:51');
INSERT INTO `permission` VALUES ('58f5c0e2-7862-4314-b06d-b1851a5ad8a0', 'user:updateRole', '用户管理', '给用户增加或者移除角色', '2018-05-20 10:15:36');
INSERT INTO `permission` VALUES ('5d3eadd5-9a2b-4570-be7f-79ef7ede2740', 'user:delete', '用户管理', '删除用户', '2018-05-20 10:15:36');
INSERT INTO `permission` VALUES ('5da5f987-73ac-4a1f-afbf-ecb78b5b9899', 'module:queryModuleAllChe', '模块管理', '获取所有模块,并选中角色拥有的树,树形', '2018-06-03 12:44:39');
INSERT INTO `permission` VALUES ('5df915ae-c60b-444d-b356-19f22b7413a9', 'student:queryIsDistribution', '学生管理', '查看是否自动分配', '2018-05-26 11:48:46');
INSERT INTO `permission` VALUES ('5fd2eba2-ac76-4f1a-8158-66411a9b19bb', 'module:queryModuleTreePaging', '模块管理', '分页条件查询获取所有模块', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('6046dc33-2132-4832-809f-fad3f9e3dc70', 'recycling:updateString0Byid', '回收站管理', '回收名称修改', '2018-06-05 15:57:34');
INSERT INTO `permission` VALUES ('628768dc-9064-4bf0-904e-69ba8d02a06e', 'asker:queryAskersPaging', '咨询师管理', '获取所有咨询师分页', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('69b399a9-61a2-4504-a961-720e78722526', 'module:addModule', '模块管理', '新增模块', '2018-05-22 22:44:18');
INSERT INTO `permission` VALUES ('6aa4774e-6d6a-4751-8e53-decdafd4891d', 'userCheck:userCheckQueryPaging', '用户签到管理', '用户签到分页查询', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('6b7e3578-7436-48d2-9b0c-57e91dc1d95c', 'module:queryModuleTree', '模块管理', '获取所有模块,树的数据', '2018-05-22 08:45:18');
INSERT INTO `permission` VALUES ('6c2393e1-1dda-46dc-a5a4-28c9a14f2f30', 'module:updateAddModule', '模块管理', '修改模块', '2018-05-22 22:44:18');
INSERT INTO `permission` VALUES ('7761ab7c-3e7f-4b9f-98c8-14afd7e4c97a', 'module:queryAll', '模块管理', '获取所有模块,并选中角色拥有的', '2018-06-03 12:45:47');
INSERT INTO `permission` VALUES ('79b1c4b1-952a-417f-885d-fd3bb97b68f5', 'asker:queryAskersByAskerId', '咨询师管理', '根据id查询指定咨询师', '2018-05-26 11:48:46');
INSERT INTO `permission` VALUES ('88a69a12-3f86-4c3b-8399-a543fac2c50d', 'userCheck:expertUserCheck', '用户签到管理', '用户签到导出为表格', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('8a969e62-5c97-45e4-b997-b1b914aef7d9', 'chart:getStateDstribution', '图表管理', '查询学生的个人状态分布', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('8c2b2e24-79ed-478a-a98f-6977f61bb191', 'chart:getStudentByStuStatusdDstribution', '图表管理', '查询学生的学历分类分布', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('8d1c7a29-701e-46c4-bf7f-11e5d7a58d87', 'permission:queryByPermissionName', '权限管理', '根据权限名称查询所有权限', '2018-05-26 11:48:46');
INSERT INTO `permission` VALUES ('9408b081-c1ad-408e-a0b3-e764f1fa1a36', 'user:getTemplate', '用户管理', '获取用户列checkbox', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('972fe28f-2a23-4411-a9a9-29b4ed3034a5', 'loggin:expertLoggin', '日志管理', '导出日志为excel', '2018-06-05 22:25:48');
INSERT INTO `permission` VALUES ('99e3b240-c7a4-4434-a33e-d488f59892e1', 'netfollow:importNetfollow', '跟踪管理', '批量导入跟踪', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('9ba93842-d641-454b-807f-a07f5816175d', 'roleModule:roleSetModule', '角色模块关系管理', '给角色设置模块', '2018-05-21 14:56:51');
INSERT INTO `permission` VALUES ('9bd6a445-20eb-469b-8d6f-8372d8502263', 'student:addStudent', '学生管理', '新增学生', '2018-05-26 11:48:46');
INSERT INTO `permission` VALUES ('9df91c9f-0b6a-423b-8ea0-3838d0232c10', 'user:expertTemplate', '用户管理', '下载模板', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('9efc5405-4fc1-439b-8885-5bd5ffc8093b', 'permission:expertPermission', '权限管理', '导出权限为excel', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('9f32b9bf-d4c5-426b-a798-19118a74fe06', 'role:expertRoles', '角色管理', '导出角色为excel', '2018-06-01 01:30:45');
INSERT INTO `permission` VALUES ('a32710d5-a3e6-4821-9945-b512b8f67523', 'loggin:queryLogginPermissionPaging', '日志管理', '日志分页查询', '2018-06-05 17:08:25');
INSERT INTO `permission` VALUES ('a3339ab8-9e11-42f9-8cb6-5aa77b554d14', 'student:updateStudent', '学生管理', '修改学生信息', '2018-05-26 11:48:46');
INSERT INTO `permission` VALUES ('a681ce7e-2b83-404f-9c69-3871aa150d87', 'role:importUser', '角色管理', '批量导入角色', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('a7353d0d-e160-468a-842a-ebe8ec203f57', 'student:expertTemplate', '学生管理', '下载模板', '2018-06-03 12:40:13');
INSERT INTO `permission` VALUES ('a83c8e9d-b587-4c9c-b327-ecf3e976513e', 'user:updateTelEmail', '用户管理', '修改用户', '2018-05-20 10:15:36');
INSERT INTO `permission` VALUES ('ac165e35-6717-4035-9fb9-099eedabc307', 'role:expertTemplate', '角色管理', '下载模板', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('b442fb3e-1275-46c3-9c88-559bd4a34ad9', 'role:updateRole', '角色管理', '修改角色信息', '2018-05-21 14:56:51');
INSERT INTO `permission` VALUES ('c10f2be2-2f76-46a9-8f39-4e6e71a0ecbb', 'role:getTemplate', '角色管理', '获取角色列checkbox', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('c50f5604-6b89-49d7-871d-1ae6b3055a1f', 'student:expertStudent', '学生管理', '导出学生为表格', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('c9c2ed7d-d3c4-4219-9551-7290f41a1307', 'netfollow:queryNetFollowByStudentIdPaging', '跟踪管理', '根据学生id分页查询所有跟踪信息', '2018-05-26 11:48:46');
INSERT INTO `permission` VALUES ('cd16ac9d-fe52-441d-ac57-a13b91308beb', 'user:expertUser', '用户管理', '导出所有用户表格', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('cd7ee5f2-aa60-4891-87ff-19e2c36c4b26', 'netfollow:queryNetFollowsAllByNetfollQuery', '跟踪管理', '根据条件查询实体类分页查询所有跟踪信息', '2018-05-26 11:48:46');
INSERT INTO `permission` VALUES ('ce23ae72-42e3-4336-80d0-32f0755c7bac', 'chart:getAddressDstribution', '图表管理', '查询学生所在城市位置分布', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('cfcbff15-f850-4029-9ce6-6674c92ec909', 'module:getChartTreeById', '模块管理', '根据模块id返回他的表格树形图数据', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('d0c2ff59-6db5-453f-b6ba-9010f433ba85', 'module:deleteModule', '模块管理', '删除模块', '2018-05-22 22:44:18');
INSERT INTO `permission` VALUES ('d2226751-f111-4a90-ad1c-e62982ac3a40', 'permission:addAll', '权限管理', '更新全部权限信息', '2018-05-20 10:15:36');
INSERT INTO `permission` VALUES ('d754d0b4-b26b-4879-bd86-c9a85585b6ae', 'netfollow:expertNeyfollows', '跟踪管理', '导出跟踪信息为表格', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('d827b6e2-9ebc-4340-b136-1a48aba04a3d', 'role:addRole', '角色管理', '新增角色', '2018-05-21 14:56:51');
INSERT INTO `permission` VALUES ('dd215e48-f6cb-447b-9767-440b499e1c84', 'student:getTemplate', '学生管理', '获取学生列checkbox', '2018-06-03 12:40:13');
INSERT INTO `permission` VALUES ('df5f683d-88c6-4628-bd53-76fd8e36a63c', 'asker:expertAsker', '咨询师管理', '导出所有咨询师表格', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('e4213a84-b13e-42c7-ae93-03b71ea49f98', 'role:queryPaging', '角色管理', '分页查询角色', '2018-05-22 00:08:03');
INSERT INTO `permission` VALUES ('ea65adee-1ebe-4496-a9a6-5e06f9bc0cd6', 'module:getModulesCassade', '模块管理', '级联选择父级模块获取的模块', '2018-05-22 22:44:18');
INSERT INTO `permission` VALUES ('ec46857d-cf72-495c-922f-f3e7c4f19e28', 'user:importUser', '用户管理', '批量导入用户', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('ef48c893-c16d-4b12-8ea0-b7945484515a', 'chart:getStudentSourceChannel', '图表管理', '查询学生的来源渠道分类分布', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('f5b1005c-7043-42cd-9db7-6bbe171e7416', 'dynamicmessage:queryDynamicmessagesByAskerId', '动态信息管理', '根据咨询师的id查询未读消息', '2018-05-26 11:48:46');
INSERT INTO `permission` VALUES ('f839bd75-9fc7-4432-9449-aeae9b2fe86a', 'student:queryStudent', '学生管理', '查询学生', '2018-05-26 11:48:46');
INSERT INTO `permission` VALUES ('fa5cb406-217b-4cb9-93d1-b0882337afdf', 'recycling:deleteDRecyling', '回收站管理', '回收站删除 彻底删除', '2018-06-05 15:57:34');
INSERT INTO `permission` VALUES ('fe581a6d-2cf6-4e09-bbb9-0801f1962093', 'asker:updateAskerWeightAndContext', '咨询师管理', '修改咨询师的权重和备注', '2018-06-01 00:47:39');
INSERT INTO `permission` VALUES ('fffe32e3-3d27-4ec8-bdec-03a34a0d8673', 'asker:expertTemplate', '咨询师管理', '下载模板', '2018-06-01 00:47:39');

-- ----------------------------
-- Table structure for recycling
-- ----------------------------
DROP TABLE IF EXISTS `recycling`;
CREATE TABLE `recycling` (
  `recylingId` varchar(70) COLLATE utf8_bin NOT NULL COMMENT '回收站id',
  `deleteTable` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '删除表名称',
  `deleteId` varchar(70) COLLATE utf8_bin DEFAULT NULL COMMENT '删除表对应的id',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '删除创建时间',
  `string0` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展1',
  `string1` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展2',
  PRIMARY KEY (`recylingId`),
  UNIQUE KEY `deTable_id_unique` (`deleteTable`,`deleteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of recycling
-- ----------------------------
INSERT INTO `recycling` VALUES ('3d12e88d-2fc9-47fe-84a7-4e71f59d0092', 'users', '81fc33f2-f3c9-4b30-b0ec-3bf2c47d64cf', '2018-06-05 15:13:50', 'mw', null);
INSERT INTO `recycling` VALUES ('4bd1b1ea-788b-4364-89d9-6ae69212e0ab', 'users', '3a4d433f-acb4-4bd1-97f9-c86e189a0108', '2018-06-05 15:13:47', 'ma', null);
INSERT INTO `recycling` VALUES ('84b536e3-1e7a-4799-9210-f1518aeb07c2', 'users', '8d8bf51f-ea06-49b8-ba2f-187e205ece3b', '2018-06-05 15:13:49', 'me', null);

-- ----------------------------
-- Table structure for rolemodules
-- ----------------------------
DROP TABLE IF EXISTS `rolemodules`;
CREATE TABLE `rolemodules` (
  `Id` varchar(100) NOT NULL,
  `RoleId` varchar(100) NOT NULL,
  `ModuleId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `rolemod` (`RoleId`,`ModuleId`),
  KEY `FK_RoleModules_Modules_ModuleId` (`ModuleId`),
  KEY `FK_RoleModules_Roles_RoleId` (`RoleId`),
  CONSTRAINT `FK_RoleModules_Modules_ModuleId` FOREIGN KEY (`ModuleId`) REFERENCES `modules` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RoleModules_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rolemodules
-- ----------------------------
INSERT INTO `rolemodules` VALUES ('5156fed8-1b64-11e7-931a-408d5cd46d51', '1b063868-1374-47ad-8460-1441c1e6ec36', '4');
INSERT INTO `rolemodules` VALUES ('515e7f87-1b64-11e7-931a-408d5cd46d51', '1b063868-1374-47ad-8460-1441c1e6ec36', '5');
INSERT INTO `rolemodules` VALUES ('515e80c6-1b64-11e7-931a-408d5cd46d51', '1b063868-1374-47ad-8460-1441c1e6ec36', '6');
INSERT INTO `rolemodules` VALUES ('515e81b4-1b64-11e7-931a-408d5cd46d51', '1b063868-1374-47ad-8460-1441c1e6ec36', '8');
INSERT INTO `rolemodules` VALUES ('515e8239-1b64-11e7-931a-408d5cd46d51', '1b063868-1374-47ad-8460-1441c1e6ec36', '16');
INSERT INTO `rolemodules` VALUES ('515e845c-1b64-11e7-931a-408d5cd46d51', '1b063868-1374-47ad-8460-1441c1e6ec36', '24');
INSERT INTO `rolemodules` VALUES ('515e84de-1b64-11e7-931a-408d5cd46d51', '1b063868-1374-47ad-8460-1441c1e6ec36', '25');
INSERT INTO `rolemodules` VALUES ('515e8550-1b64-11e7-931a-408d5cd46d51', '1b063868-1374-47ad-8460-1441c1e6ec36', '27');
INSERT INTO `rolemodules` VALUES ('515e82be-1b64-11e7-931a-408d5cd46d51', '1b063868-1374-47ad-8460-1441c1e6ec36', '34');
INSERT INTO `rolemodules` VALUES ('515e8641-1b64-11e7-931a-408d5cd46d51', '1b063868-1374-47ad-8460-1441c1e6ec36', '35');
INSERT INTO `rolemodules` VALUES ('515e85c4-1b64-11e7-931a-408d5cd46d51', '1b063868-1374-47ad-8460-1441c1e6ec36', '36');
INSERT INTO `rolemodules` VALUES ('515e8339-1b64-11e7-931a-408d5cd46d51', '1b063868-1374-47ad-8460-1441c1e6ec36', '104');
INSERT INTO `rolemodules` VALUES ('515e86d4-1b64-11e7-931a-408d5cd46d51', '1b063868-1374-47ad-8460-1441c1e6ec36', '119');
INSERT INTO `rolemodules` VALUES ('515e874e-1b64-11e7-931a-408d5cd46d51', '1b063868-1374-47ad-8460-1441c1e6ec36', '136');
INSERT INTO `rolemodules` VALUES ('515e87c6-1b64-11e7-931a-408d5cd46d51', '1b063868-1374-47ad-8460-1441c1e6ec36', '137');
INSERT INTO `rolemodules` VALUES ('515e83b3-1b64-11e7-931a-408d5cd46d51', '1b063868-1374-47ad-8460-1441c1e6ec36', '170');
INSERT INTO `rolemodules` VALUES ('cmsaa00ce3b-27ea-554f-83f7-8a67d43c9ad4', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '4');
INSERT INTO `rolemodules` VALUES ('cmse20bbc79-5295-64f5-6244-003b313fd4dd', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '179');
INSERT INTO `rolemodules` VALUES ('cms609fb6fc-e632-1cd0-9b5d-75c2364dc3cf', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '180');
INSERT INTO `rolemodules` VALUES ('cmsd4e84f0e-948f-5e84-4d7d-0d07a1d5cfda', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '182');
INSERT INTO `rolemodules` VALUES ('cms8c290327-9505-c563-bdc8-ec1f79f50bc8', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '183');
INSERT INTO `rolemodules` VALUES ('cms49c2f841-cade-d60d-d782-75e59d14a419', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '187');
INSERT INTO `rolemodules` VALUES ('cmsbf4c0467-aa4e-1165-939c-f61b44ff6ee3', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '1194');
INSERT INTO `rolemodules` VALUES ('cms40990962-5d89-100c-e648-681789bea5f3', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '1197');
INSERT INTO `rolemodules` VALUES ('cms1613192a-584e-c869-6309-bdc5e22f68dd', '40cb9316-44e3-42db-a757-01bada1d49f4', '4');
INSERT INTO `rolemodules` VALUES ('cms721ab6df-d559-4bdc-0bd4-62fc280e265e', '40cb9316-44e3-42db-a757-01bada1d49f4', '5');
INSERT INTO `rolemodules` VALUES ('cms0cd7e6cb-e018-95d9-4f22-069115b21338', '40cb9316-44e3-42db-a757-01bada1d49f4', '6');
INSERT INTO `rolemodules` VALUES ('cmsb3f9f029-e1a1-a4af-5596-046ea7771e4a', '40cb9316-44e3-42db-a757-01bada1d49f4', '8');
INSERT INTO `rolemodules` VALUES ('cms62715c58-5716-3a07-23cc-55599aae49f5', '40cb9316-44e3-42db-a757-01bada1d49f4', '12');
INSERT INTO `rolemodules` VALUES ('cms61cc3f5e-d590-1d32-1bf5-d8f5a03c8a62', '40cb9316-44e3-42db-a757-01bada1d49f4', '13');
INSERT INTO `rolemodules` VALUES ('cms5cb05b39-ab06-f44b-1d04-90d0885e48ca', '40cb9316-44e3-42db-a757-01bada1d49f4', '78');
INSERT INTO `rolemodules` VALUES ('cms06ccc675-cf71-38f1-c451-12124e3a5554', '40cb9316-44e3-42db-a757-01bada1d49f4', '79');
INSERT INTO `rolemodules` VALUES ('cmsa8cff03f-f896-5af4-b8aa-3dda9a4319fb', '40cb9316-44e3-42db-a757-01bada1d49f4', '91');
INSERT INTO `rolemodules` VALUES ('cms6eb117e7-f11e-2dad-d7ed-d321dc4036da', '40cb9316-44e3-42db-a757-01bada1d49f4', '92');
INSERT INTO `rolemodules` VALUES ('cms1d1509b8-40e4-3383-d211-3dbb08775c24', '40cb9316-44e3-42db-a757-01bada1d49f4', '93');
INSERT INTO `rolemodules` VALUES ('cms0add264c-cfe0-a1fb-eedd-fec33b4cd2d8', '40cb9316-44e3-42db-a757-01bada1d49f4', '94');
INSERT INTO `rolemodules` VALUES ('cmsfd57bff5-4ccd-75ea-e355-8ac3fed2554c', '40cb9316-44e3-42db-a757-01bada1d49f4', '95');
INSERT INTO `rolemodules` VALUES ('cms7e4b279d-205d-1bcd-502c-d356d392568d', '40cb9316-44e3-42db-a757-01bada1d49f4', '120');
INSERT INTO `rolemodules` VALUES ('cms41d17ad9-3a3c-54c3-4b29-095cd3d22a54', '40cb9316-44e3-42db-a757-01bada1d49f4', '121');
INSERT INTO `rolemodules` VALUES ('cms6428a348-8b6a-21f0-f6fe-3c2759519749', '40cb9316-44e3-42db-a757-01bada1d49f4', '132');
INSERT INTO `rolemodules` VALUES ('cms4ac547b4-e1c4-1ea3-433c-0156db677887', '40cb9316-44e3-42db-a757-01bada1d49f4', '133');
INSERT INTO `rolemodules` VALUES ('cmsda5abad9-3621-8281-f08a-6b7127cb2061', '40cb9316-44e3-42db-a757-01bada1d49f4', '134');
INSERT INTO `rolemodules` VALUES ('cmscb5db737-b7ca-4aca-cf04-7911dd9159a1', '40cb9316-44e3-42db-a757-01bada1d49f4', '135');
INSERT INTO `rolemodules` VALUES ('cms57b52293-64b3-00c3-5de0-a397ae1a0672', '40cb9316-44e3-42db-a757-01bada1d49f4', '176');
INSERT INTO `rolemodules` VALUES ('cms247267bb-49fb-de35-f8d7-b0c06018add9', '40cb9316-44e3-42db-a757-01bada1d49f4', '177');
INSERT INTO `rolemodules` VALUES ('cms707dc067-73fa-764b-8ab7-e1d5f803f369', '40cb9316-44e3-42db-a757-01bada1d49f4', '178');
INSERT INTO `rolemodules` VALUES ('cmsc306f1db-0ad3-890d-b5a3-10b9ca0a3027', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '96');
INSERT INTO `rolemodules` VALUES ('cms656e0a87-df77-5a97-e214-a5fa789573c9', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '97');
INSERT INTO `rolemodules` VALUES ('cms76bc8121-03a3-65c7-cb7f-315c1b4a4194', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '99');
INSERT INTO `rolemodules` VALUES ('cmse58d5972-251c-d78e-cba2-b110e2754860', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '147');
INSERT INTO `rolemodules` VALUES ('cmsc4526f02-a47e-42c6-e5eb-9fd7cebc3ad3', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '148');
INSERT INTO `rolemodules` VALUES ('cms12f49c37-8f9a-774b-43a0-17fa1be3c7ad', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '149');
INSERT INTO `rolemodules` VALUES ('cmsc2383937-2265-fe97-691b-21badbb250ad', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '150');
INSERT INTO `rolemodules` VALUES ('cms85a5e37e-1ec3-975c-f91c-8cea1448a1ed', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '171');
INSERT INTO `rolemodules` VALUES ('cms5dd6e03f-4e6e-f1bf-e5b9-6968d30afa01', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '172');
INSERT INTO `rolemodules` VALUES ('cmsa1beea82-91fb-7dec-36ad-b58c82e0975d', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '173');
INSERT INTO `rolemodules` VALUES ('cms780ed05b-09d7-05cd-a9d5-79235eea9eb5', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '174');
INSERT INTO `rolemodules` VALUES ('cms15a812f2-4eb2-63e8-8aa7-32501eeec588', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '175');
INSERT INTO `rolemodules` VALUES ('cmsa363311f-a023-d777-478b-44859f51a914', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '179');
INSERT INTO `rolemodules` VALUES ('cms336db9a6-e6c6-efc6-2e2d-eea2dbd306d1', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '180');
INSERT INTO `rolemodules` VALUES ('cms4d3ec5e2-238b-6085-b7e5-f592c1a6fef3', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '184');
INSERT INTO `rolemodules` VALUES ('cms593e1444-80d3-3f76-4c9c-2332cc00513f', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '185');
INSERT INTO `rolemodules` VALUES ('cms02b7e7e5-9a44-df84-54bc-83d374f5974d', '675e5024-5a12-4c55-8c8f-7d9a9bda43db', '186');
INSERT INTO `rolemodules` VALUES ('cms3d7b6092-4ab1-c3b9-f6d3-07b3ad31973c', '6edb930f-e634-4180-8fb5-5b7bc8717701', '16');
INSERT INTO `rolemodules` VALUES ('cms447574b5-4862-d6db-a4d9-499269a11edf', '6edb930f-e634-4180-8fb5-5b7bc8717701', '24');
INSERT INTO `rolemodules` VALUES ('cms4ad02fe0-b8f8-900c-cbc2-31a245a50acd', '6edb930f-e634-4180-8fb5-5b7bc8717701', '25');
INSERT INTO `rolemodules` VALUES ('cmsae56a078-08a8-0c9f-9948-c064ff3013b8', '6edb930f-e634-4180-8fb5-5b7bc8717701', '27');
INSERT INTO `rolemodules` VALUES ('cmsb23da3b8-add8-b5dd-8e45-cb1eba7ef0f6', '6edb930f-e634-4180-8fb5-5b7bc8717701', '34');
INSERT INTO `rolemodules` VALUES ('cmse0dea79b-2aec-27bd-3f47-7d126c03161d', '6edb930f-e634-4180-8fb5-5b7bc8717701', '35');
INSERT INTO `rolemodules` VALUES ('cmsc96732b7-8be5-1029-1412-6c9059507751', '6edb930f-e634-4180-8fb5-5b7bc8717701', '36');
INSERT INTO `rolemodules` VALUES ('cms384614bd-64f7-4dd5-7d0e-cdcc23a1b477', '6edb930f-e634-4180-8fb5-5b7bc8717701', '104');
INSERT INTO `rolemodules` VALUES ('cmsff9ff02e-1c26-7066-b2d4-b7f5b473cd2f', '6edb930f-e634-4180-8fb5-5b7bc8717701', '119');
INSERT INTO `rolemodules` VALUES ('cms280c5bdd-fa4f-14c0-96e3-a6f75d6660f9', '6edb930f-e634-4180-8fb5-5b7bc8717701', '136');
INSERT INTO `rolemodules` VALUES ('cms74a0802d-3371-c773-47db-1568f6cf9b14', '6edb930f-e634-4180-8fb5-5b7bc8717701', '137');
INSERT INTO `rolemodules` VALUES ('cms9b392441-a46d-e7fd-feba-1056f46b387a', '6edb930f-e634-4180-8fb5-5b7bc8717701', '170');
INSERT INTO `rolemodules` VALUES ('cmsefc9b808-276d-a647-5296-4fe7415e25fa', '85aebb2d-7076-45c6-90c2-a679f98bae6b', '96');
INSERT INTO `rolemodules` VALUES ('cmse2970060-bc8b-0d4c-a257-0c0969c4bc72', '85aebb2d-7076-45c6-90c2-a679f98bae6b', '97');
INSERT INTO `rolemodules` VALUES ('cms97f22990-c222-c363-a082-f571383d2288', '85aebb2d-7076-45c6-90c2-a679f98bae6b', '171');
INSERT INTO `rolemodules` VALUES ('cmsfaec5d51-0e65-ae6c-452c-fac53bb53248', '85aebb2d-7076-45c6-90c2-a679f98bae6b', '172');
INSERT INTO `rolemodules` VALUES ('cms60af9951-1bdb-fd88-0563-3d425d0f9c7a', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '171');
INSERT INTO `rolemodules` VALUES ('cmsa6d512e6-16c0-b1ec-b1bc-ac079c789387', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '172');
INSERT INTO `rolemodules` VALUES ('cmsa5cfd24e-31ed-e58e-391a-a2f5bb941cfc', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '171');
INSERT INTO `rolemodules` VALUES ('cmsa3b41c39-b6f4-0ffe-49c6-5e9be804326e', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '173');
INSERT INTO `rolemodules` VALUES ('cmsc1cf0f80-aee4-8fd4-6575-3d9ec3b0deec', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '175');
INSERT INTO `rolemodules` VALUES ('cms410a5306-516b-44e1-08cf-f33e99b79393', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '4');
INSERT INTO `rolemodules` VALUES ('cmsf6c5a878-06c7-ab15-e7b2-a80cbaf4969e', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '171');
INSERT INTO `rolemodules` VALUES ('cmsa5ccf74c-3ed8-6726-e0dd-491552331ece', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '172');
INSERT INTO `rolemodules` VALUES ('cms1be79684-0ac9-9b17-dabb-e4b469e98601', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '173');
INSERT INTO `rolemodules` VALUES ('cms028be8e1-62aa-a6cd-e9b6-c91f7975507d', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '174');
INSERT INTO `rolemodules` VALUES ('cms7c63dddf-ae06-f69e-a9ca-538803c18679', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '175');
INSERT INTO `rolemodules` VALUES ('cmsc293af50-9e91-6285-0bbb-72a35253a2d5', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '176');
INSERT INTO `rolemodules` VALUES ('cmsd602a8b2-b45d-e041-ee2b-b332bf69deaa', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '177');
INSERT INTO `rolemodules` VALUES ('cms2dadef60-20ca-58ae-7a6d-54a762bab1d4', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '179');
INSERT INTO `rolemodules` VALUES ('cms7dd3415c-f37e-b114-036e-bd723d79d884', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '180');
INSERT INTO `rolemodules` VALUES ('cms532f6632-7ada-ba20-1b94-b47a53b2c20f', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '182');
INSERT INTO `rolemodules` VALUES ('cms7163e731-8884-c3f6-48bd-562511a5e766', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '183');
INSERT INTO `rolemodules` VALUES ('cmsfc92a233-f988-f410-931c-d8678ba025a3', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '187');
INSERT INTO `rolemodules` VALUES ('cms9f62bcb3-b2be-9e43-f62b-93432f8dacb3', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '188');
INSERT INTO `rolemodules` VALUES ('cms5c50cc89-8e16-6e1e-42cb-4cb3ef4a76c1', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '1194');
INSERT INTO `rolemodules` VALUES ('cmse3ba7dc7-b802-df55-7d68-46eb3da62fb8', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '1197');

-- ----------------------------
-- Table structure for rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission` (
  `rolePermissionId` varchar(100) COLLATE utf8_bin NOT NULL,
  `roleId` varchar(100) CHARACTER SET utf8 NOT NULL,
  `permissionId` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `rolePermissionLastUpdateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rolePermissionId`),
  UNIQUE KEY `roleperm` (`roleId`,`permissionId`),
  KEY `fk_rolepermission_permission` (`permissionId`),
  CONSTRAINT `fk_rolepermission_permission` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`permissionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rolepermission_role` FOREIGN KEY (`roleId`) REFERENCES `roles` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of rolepermission
-- ----------------------------
INSERT INTO `rolepermission` VALUES ('001c44c8-e2af-4576-b87f-ac774cfbb1ac', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '29aeff54-4ac1-41df-8e32-c85765d6aa5e', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('01fda0c2-1f0b-42ad-951d-25db459d868f', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '05a3e1d7-47c5-4197-9233-bef96c3d9856', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('021addcf-8826-4ac9-bd15-96623f04f935', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'cd16ac9d-fe52-441d-ac57-a13b91308beb', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('02fb325d-aadb-4666-8fe2-1b058a2dbd97', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '418a9468-c91b-4a93-96b1-11e6a279a88b', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('033c35a0-6602-4487-aef6-e088f581422e', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '8c2b2e24-79ed-478a-a98f-6977f61bb191', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('03544367-a653-4acc-97b0-bd926f462b05', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '8a969e62-5c97-45e4-b997-b1b914aef7d9', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('038c07ce-e9df-4e57-a0fd-72ef4ebb195a', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'ea65adee-1ebe-4496-a9a6-5e06f9bc0cd6', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('03c06d24-1719-4387-96d4-67163193bc69', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'a3339ab8-9e11-42f9-8cb6-5aa77b554d14', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('051eee17-f229-4790-88c2-72a0f60fe4be', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '9f32b9bf-d4c5-426b-a798-19118a74fe06', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('07620fe4-cd34-48e9-acef-3a1a09c766b3', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '6aa4774e-6d6a-4751-8e53-decdafd4891d', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('086ef656-eb00-412f-9c84-eefb1bbd4433', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '9df91c9f-0b6a-423b-8ea0-3838d0232c10', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('0987dd96-4943-456c-9644-162fc51f62bc', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '9408b081-c1ad-408e-a0b3-e764f1fa1a36', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('09b4289d-4f41-4160-a8ca-b5850d5a6c5d', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '418a9468-c91b-4a93-96b1-11e6a279a88b', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('09b7da04-efc9-436f-bb7c-c96da41b80f9', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '5da5f987-73ac-4a1f-afbf-ecb78b5b9899', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('09b94f01-3193-4eca-8421-374756372c12', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '628768dc-9064-4bf0-904e-69ba8d02a06e', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('0a7885fe-8104-4fa8-8928-7353a747e694', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'a3339ab8-9e11-42f9-8cb6-5aa77b554d14', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('0abe97a6-e1d0-4110-bae3-5aa51810a67b', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'd0c2ff59-6db5-453f-b6ba-9010f433ba85', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('0ae27ee4-95b7-4ea2-ab14-42885267e339', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '13893971-be8e-46f9-8571-f8c36a04c1e3', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('0d6fcbcc-1744-4463-84fc-c056df7187dc', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '208b98b0-71e5-4f51-9e10-dba5ff1d059f', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('0da5395e-3919-4052-bf76-49fa126dda6d', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'f839bd75-9fc7-4432-9449-aeae9b2fe86a', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('0ded5b9c-bccb-43b8-a86a-cb6d028455f1', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '88a69a12-3f86-4c3b-8399-a543fac2c50d', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('0df9af2b-358b-42d1-a6c0-de2d233920c6', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'df5f683d-88c6-4628-bd53-76fd8e36a63c', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('0e63c73b-1d74-4d09-bed7-5b5ed2335102', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '628768dc-9064-4bf0-904e-69ba8d02a06e', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('0fb1021a-5b48-42f7-a124-5934e39e4af9', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '99e3b240-c7a4-4434-a33e-d488f59892e1', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('134c43f4-3df3-482c-9929-f39876c066bf', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'ef48c893-c16d-4b12-8ea0-b7945484515a', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('143d0635-8719-4020-974f-f3277f939005', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'a7353d0d-e160-468a-842a-ebe8ec203f57', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('171dd05b-0bf7-4fc6-917b-dc55b4a965df', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '505d982c-a36f-4f59-8e6b-6afe68d32585', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('188b979b-288b-407c-b13a-3fd08de3c035', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'ce23ae72-42e3-4336-80d0-32f0755c7bac', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('18eb9e28-77f3-445b-b769-81a2ccf1823e', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '13893971-be8e-46f9-8571-f8c36a04c1e3', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('1a932404-fe8c-4646-93c3-6fe8a8700124', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '1af44803-d9a2-4652-8602-810193ca3bbf', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('1ab0c592-3970-4f1e-9812-8e304379e941', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '9bd6a445-20eb-469b-8d6f-8372d8502263', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('1affc83c-683f-48a2-aceb-2ec79d49d774', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '8d1c7a29-701e-46c4-bf7f-11e5d7a58d87', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('1c5e6381-0caf-427c-96fb-1b93dab1ac56', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '1af44803-d9a2-4652-8602-810193ca3bbf', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('1c74bb35-a738-4a7c-827b-9851b497f375', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '9efc5405-4fc1-439b-8885-5bd5ffc8093b', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('1d2da305-627f-44c8-bec8-0c5ae29ec07f', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '1a0f7fee-a7e8-42d6-a855-a9e30d1acdb7', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('1d6589ba-8da8-4d84-b717-cf82c736ad37', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'ce23ae72-42e3-4336-80d0-32f0755c7bac', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('1d6aa4eb-dea9-4e44-8892-16e994d561ed', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '58f5c0e2-7862-4314-b06d-b1851a5ad8a0', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('1eb2e37d-ce03-478d-8abe-88b05017707c', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'b442fb3e-1275-46c3-9c88-559bd4a34ad9', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('1f9fe3e1-ae5e-48a8-bf46-3813cbd9484d', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '79b1c4b1-952a-417f-885d-fd3bb97b68f5', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('207ee582-fc49-4cf3-a823-9bbcefc7d2f8', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '6b7e3578-7436-48d2-9b0c-57e91dc1d95c', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('21136233-e9bc-48bf-9b31-23d2cea21d7e', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '4cd76921-989e-4cba-b548-45e7a675970b', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('23e4fa92-7aba-4892-84af-1f95792db0ce', '85aebb2d-7076-45c6-90c2-a679f98bae6b', '03c54824-d223-4b4c-b084-9df2d5571495', '2018-05-22 22:44:31');
INSERT INTO `rolepermission` VALUES ('24be2c3a-51cf-41a2-b07f-3049af20e828', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '7761ab7c-3e7f-4b9f-98c8-14afd7e4c97a', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('2571c3cf-01f5-44d2-8250-086d55de7e94', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '285e6c8e-63ba-470d-8de3-b8ee683a62fa', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('25dabca4-3a6b-4bfe-bf12-ae933f9210dc', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '289780a1-d7ad-432e-8423-2532357fe90b', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('27366a4e-664a-45cc-ae23-68e803c0ceb4', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'ac165e35-6717-4035-9fb9-099eedabc307', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('2809a968-919d-45da-b3fb-ef3fd6f8f5b1', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'a83c8e9d-b587-4c9c-b327-ecf3e976513e', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('29e9dfd1-ef33-4c3f-8444-5e88c5e778a1', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '9df91c9f-0b6a-423b-8ea0-3838d0232c10', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('2a43b59d-66ab-4aca-bf61-ae12a88f3290', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '0febe6a8-69d9-445d-9aad-7691c1f71791', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('2aa73d89-7827-4cca-9de4-41877af8da4d', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'a681ce7e-2b83-404f-9c69-3871aa150d87', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('2b764000-2d36-446a-9f24-c4471ed58817', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '112b1fb9-73c1-4f38-9ee3-a3f8c18a01ed', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('2bcdb90f-17ff-474c-b262-220ba6204997', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '1af44803-d9a2-4652-8602-810193ca3bbf', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('2c8ca432-1abc-462a-8fb3-ccad3e8652d2', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'fe581a6d-2cf6-4e09-bbb9-0801f1962093', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('2d4d4c2b-a9fd-45fb-977d-d75c23baab91', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '418a9468-c91b-4a93-96b1-11e6a279a88b', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('2da3a5a5-7337-4a20-90c8-a22cce3cc444', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'ef48c893-c16d-4b12-8ea0-b7945484515a', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('30d0ddba-7862-40e6-97df-5bcf43df0bfa', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '5df915ae-c60b-444d-b356-19f22b7413a9', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('31c1e747-ddce-472b-9d69-889721d697d0', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '06affd90-b6b1-4cd3-abf3-06c5fd2cf986', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('3346eae3-8a70-4462-8b6b-24b5c47c8580', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'ec46857d-cf72-495c-922f-f3e7c4f19e28', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('33794913-7715-4ccf-be84-13c5a11fb62d', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'cd16ac9d-fe52-441d-ac57-a13b91308beb', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('36156b72-f223-485f-a7f1-f0ff2087b18d', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'd827b6e2-9ebc-4340-b136-1a48aba04a3d', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('36cc30da-369e-4b05-a36b-0ab05e11d905', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'df5f683d-88c6-4628-bd53-76fd8e36a63c', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('381114ba-67d9-474a-bd9c-4d4cb2a22b8b', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'd0c2ff59-6db5-453f-b6ba-9010f433ba85', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('388bd3b7-b928-446b-9f8b-4e57d2f53d30', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'f839bd75-9fc7-4432-9449-aeae9b2fe86a', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('39648e04-f193-43c4-8d64-11808beb6f24', '85aebb2d-7076-45c6-90c2-a679f98bae6b', '6b7e3578-7436-48d2-9b0c-57e91dc1d95c', '2018-05-22 22:44:31');
INSERT INTO `rolepermission` VALUES ('3b129255-0acc-421f-85be-32f9c207b3aa', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '5093e639-ce61-4785-9c89-f9c797952569', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('3d5ea25d-d9b7-414a-9acc-4a1d70a7887c', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '9ba93842-d641-454b-807f-a07f5816175d', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('3dae6f87-aa86-4483-9e54-36a259b4ed03', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'cd7ee5f2-aa60-4891-87ff-19e2c36c4b26', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('3e0c9a44-9f98-4e39-a100-93cd7c914c67', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '2d1c6c0c-3f20-4b45-98e3-d39b5c83e769', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('3f2ced69-abb8-466c-a6e2-6fdc0c9a487f', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '8a969e62-5c97-45e4-b997-b1b914aef7d9', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('3f3a02a8-4f97-4384-880c-69da2111afe2', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'c10f2be2-2f76-46a9-8f39-4e6e71a0ecbb', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('406875fe-283e-4f18-b58b-edc4feb2e60c', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '4ae3d48a-9d95-43c9-b72e-0d7221344bca', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('40864a1d-a91b-46ea-bf5c-113c19d0a12e', '1b063868-1374-47ad-8460-1441c1e6ec36', '5d3eadd5-9a2b-4570-be7f-79ef7ede2740', '2018-05-20 21:30:36');
INSERT INTO `rolepermission` VALUES ('412ddc5a-d5d3-4c87-a2c0-6699b9fc9414', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'ec46857d-cf72-495c-922f-f3e7c4f19e28', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('427d898c-4aee-4471-851c-635ccb24c035', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'b442fb3e-1275-46c3-9c88-559bd4a34ad9', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('4510fba5-1c97-4570-95d9-4c338975bea3', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '0febe6a8-69d9-445d-9aad-7691c1f71791', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('451117a8-c0b9-4aec-928b-a110bb0feec3', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'cd7ee5f2-aa60-4891-87ff-19e2c36c4b26', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('4537a8bf-25a8-4325-bb7f-231e3449812f', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '4f3612d0-d82b-43fc-bd93-627f657fdc75', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('45ab401f-1a68-4f58-9a54-223bbc0b0cf4', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '5df915ae-c60b-444d-b356-19f22b7413a9', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('462f7ac2-38ab-43fb-905c-cd5bce08f8b6', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '5d3eadd5-9a2b-4570-be7f-79ef7ede2740', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('46f99034-2894-4426-b7cf-008cd31213e9', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '52cd0cca-964e-48df-a32e-f6258cce2bb5', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('4853ba56-8d7b-4e9c-9c0a-4f347d599711', '85aebb2d-7076-45c6-90c2-a679f98bae6b', 'e4213a84-b13e-42c7-ae93-03b71ea49f98', '2018-05-22 22:44:31');
INSERT INTO `rolepermission` VALUES ('498ffc2e-126d-4ad8-bcf4-f6032eb50af1', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '58f5c0e2-7862-4314-b06d-b1851a5ad8a0', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('49d276c8-8e10-4de5-b257-f0686a3f3067', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'a3339ab8-9e11-42f9-8cb6-5aa77b554d14', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('4ac07cd8-fe2f-43c5-8209-34260c737563', '85aebb2d-7076-45c6-90c2-a679f98bae6b', '5d3eadd5-9a2b-4570-be7f-79ef7ede2740', '2018-05-22 22:44:31');
INSERT INTO `rolepermission` VALUES ('4bdceebc-c6ac-41cd-bd98-9b67b7088bf3', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '9ba93842-d641-454b-807f-a07f5816175d', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('4d4910c4-86f0-423e-8ca4-53e0b3472c11', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'fe581a6d-2cf6-4e09-bbb9-0801f1962093', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('4e7ff585-32b3-4f64-bf47-ee9d90cfc649', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '52cd0cca-964e-48df-a32e-f6258cce2bb5', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('4f0018be-b3aa-4c5e-9fd9-81afffb34563', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '1a0f7fee-a7e8-42d6-a855-a9e30d1acdb7', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('50402007-01ae-4000-9b3f-7e834d4816e4', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'b442fb3e-1275-46c3-9c88-559bd4a34ad9', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('52d5e348-1b42-4ab4-9e2c-01b3197394bf', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '289780a1-d7ad-432e-8423-2532357fe90b', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('53dad38a-70aa-4663-bc83-2653b54387ee', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '0febe6a8-69d9-445d-9aad-7691c1f71791', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('5427b585-26ab-4b81-8d5d-9ccefed10ff7', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '112b1fb9-73c1-4f38-9ee3-a3f8c18a01ed', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('54811fd3-165e-4941-a3a0-109b9ea9207f', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'd827b6e2-9ebc-4340-b136-1a48aba04a3d', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('5502bd3d-ca5d-44e0-b144-f14cab2ec6b4', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '79b1c4b1-952a-417f-885d-fd3bb97b68f5', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('55b423f1-2175-4e77-8c09-5401a58f15f9', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'c9c2ed7d-d3c4-4219-9551-7290f41a1307', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('572e1851-4c54-48b0-94e6-759d8d3e9587', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'fe581a6d-2cf6-4e09-bbb9-0801f1962093', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('59a1fea8-9ef2-485e-a52b-48caa3ac66a1', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '9bd6a445-20eb-469b-8d6f-8372d8502263', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('59a35627-6975-4559-bee0-944a5dfb0c6f', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '9f32b9bf-d4c5-426b-a798-19118a74fe06', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('5af061c1-ac21-4ae5-949e-db32361ea7aa', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '5d3eadd5-9a2b-4570-be7f-79ef7ede2740', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('5c2bcf56-bf09-4a2a-8051-8bc14f31a5ba', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '208b98b0-71e5-4f51-9e10-dba5ff1d059f', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('5cd5f1a0-8d03-40ed-bce0-3ba150895516', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'cd16ac9d-fe52-441d-ac57-a13b91308beb', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('5dc3c920-2f0e-4af2-a9e4-33da9f91c0ad', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '112b1fb9-73c1-4f38-9ee3-a3f8c18a01ed', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('5efa606a-b63c-4971-aebd-573d1ac6e70a', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '5093e639-ce61-4785-9c89-f9c797952569', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('5f20e3c4-7f61-4119-a0e5-19249ff6c74b', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '13893971-be8e-46f9-8571-f8c36a04c1e3', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('5fbaf631-15c6-4422-a291-038b562e6e7a', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '0639d477-7e7a-48f3-939c-d4918d8d1c41', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('5fd4adcf-904a-4444-ad96-10f1c3e21e34', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'c10f2be2-2f76-46a9-8f39-4e6e71a0ecbb', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('5fe0af61-7253-4056-85af-9b76a7da8adb', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'ea65adee-1ebe-4496-a9a6-5e06f9bc0cd6', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('5fe8f604-ea1a-47d8-94ea-d437386e86be', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '628768dc-9064-4bf0-904e-69ba8d02a06e', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('61d8e86f-e28b-4011-8f31-5bde8547fb26', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'c50f5604-6b89-49d7-871d-1ae6b3055a1f', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('622ae76f-cea4-41db-a207-99dadf5be34b', '1b063868-1374-47ad-8460-1441c1e6ec36', '208b98b0-71e5-4f51-9e10-dba5ff1d059f', '2018-05-20 21:30:36');
INSERT INTO `rolepermission` VALUES ('6241c22e-cf56-44a8-acc4-a4e2c5300ebb', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '06affd90-b6b1-4cd3-abf3-06c5fd2cf986', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('6252d6d2-8fbd-471b-86dd-a0b95d24e87e', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'fffe32e3-3d27-4ec8-bdec-03a34a0d8673', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('6362a8e8-8dda-471c-871c-9305884337de', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '69b399a9-61a2-4504-a961-720e78722526', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('63f67cb3-a8a2-40fc-a130-3dfbaf9724be', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '285e6c8e-63ba-470d-8de3-b8ee683a62fa', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('64341b7f-8a54-43a0-bbed-e15817c1e5fb', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '8d1c7a29-701e-46c4-bf7f-11e5d7a58d87', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('6643975f-1835-420c-b84c-ed91fcc99f7d', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '8c2b2e24-79ed-478a-a98f-6977f61bb191', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('66fccfe5-ab54-4a9b-a712-82ff47244c14', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '005574b4-ad15-491f-8455-ce97727d2b8a', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('673b3133-62b8-4c88-a07a-83bd8cac1c76', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '0639d477-7e7a-48f3-939c-d4918d8d1c41', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('6793de22-1fb8-41f3-b318-3a3a670401f6', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'dd215e48-f6cb-447b-9767-440b499e1c84', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('67eaa685-9881-40d1-8a53-edd8c93c283d', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '99e3b240-c7a4-4434-a33e-d488f59892e1', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('6846b5e6-ea66-4a8e-a7eb-503e01c2f927', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'fffe32e3-3d27-4ec8-bdec-03a34a0d8673', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('68623608-9d31-40a6-9d48-2261c9aef7e5', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '8d1c7a29-701e-46c4-bf7f-11e5d7a58d87', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('6895605b-dc66-499f-8773-2e37da5ae982', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '18dd9d2d-51d5-4994-b355-7f88fe9464b7', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('69281dbd-4580-4548-a03e-1a70c55ad5f0', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'cd7ee5f2-aa60-4891-87ff-19e2c36c4b26', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('6982e936-fa62-451d-877e-a05d0640128f', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '005574b4-ad15-491f-8455-ce97727d2b8a', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('6a6afaf5-2ad7-4c9d-8d73-e1f2c7a54f9a', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '005574b4-ad15-491f-8455-ce97727d2b8a', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('6a9c1092-0442-4a7c-8e4d-4ae48c54269b', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '9df91c9f-0b6a-423b-8ea0-3838d0232c10', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('6b28fc2a-8f4c-4e93-83d9-c3330ed77e53', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '2d1c6c0c-3f20-4b45-98e3-d39b5c83e769', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('6c37966f-bedf-477e-b07a-865a5d5861c1', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '03c54824-d223-4b4c-b084-9df2d5571495', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('6c8c2a37-0d5e-403b-871f-9e1327038420', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '2d1c6c0c-3f20-4b45-98e3-d39b5c83e769', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('6d2e707c-1fbb-4827-8217-b35a38b3549d', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '9bd6a445-20eb-469b-8d6f-8372d8502263', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('6f3dd058-707a-47b3-bc9c-c6c77159670f', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'a3339ab8-9e11-42f9-8cb6-5aa77b554d14', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('72555e48-a78c-453e-bcb4-33157d8c0456', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '03c54824-d223-4b4c-b084-9df2d5571495', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('7273236d-4579-4b7c-8432-64a32dd72117', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '4ae3d48a-9d95-43c9-b72e-0d7221344bca', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('735a8002-f0a6-439c-8783-79b814ade3a8', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'fffe32e3-3d27-4ec8-bdec-03a34a0d8673', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('73c8c45b-8bb2-4319-b7b8-0167c4e3946e', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '2d6e62ee-6106-4a00-b713-4861216300b8', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('7489965b-dbb1-4481-a456-a2b465445c84', '85aebb2d-7076-45c6-90c2-a679f98bae6b', '06affd90-b6b1-4cd3-abf3-06c5fd2cf986', '2018-05-22 22:44:31');
INSERT INTO `rolepermission` VALUES ('74b3f555-5729-4a07-99f0-9d4c032d4496', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'f5b1005c-7043-42cd-9db7-6bbe171e7416', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('7574e9ef-a4d2-4ef3-a9f2-2dffdb31526b', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'd754d0b4-b26b-4879-bd86-c9a85585b6ae', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('7576dba2-ff1f-463d-93f4-27db7b727519', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '69b399a9-61a2-4504-a961-720e78722526', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('760d8272-68cf-4474-990f-23f9f2c26dcf', '1b063868-1374-47ad-8460-1441c1e6ec36', '03c54824-d223-4b4c-b084-9df2d5571495', '2018-05-20 21:30:36');
INSERT INTO `rolepermission` VALUES ('76b174d2-e688-4fed-9ccc-a8a52c639bef', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '2d6e62ee-6106-4a00-b713-4861216300b8', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('775fee8b-60e5-491a-96ec-35d298a3f9d2', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'dd215e48-f6cb-447b-9767-440b499e1c84', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('778e0488-3f08-43b8-9a60-1fcdcec26392', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '6aa4774e-6d6a-4751-8e53-decdafd4891d', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('7aafb32c-d9b3-4925-9e8e-3d093e2c10d9', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '9408b081-c1ad-408e-a0b3-e764f1fa1a36', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('7ac6f478-e484-4fbf-aa75-44a851ca1aeb', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '5fd2eba2-ac76-4f1a-8158-66411a9b19bb', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('7bcb72c8-56fe-4ddc-be7b-6a5179b0aab0', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'cd16ac9d-fe52-441d-ac57-a13b91308beb', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('7cae40ae-27d9-41f9-a2d1-a479c8342567', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '06affd90-b6b1-4cd3-abf3-06c5fd2cf986', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('7d771018-5fd8-4b17-8f04-49f4538bf520', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'e4213a84-b13e-42c7-ae93-03b71ea49f98', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('7e40cf2f-d5e5-4897-a327-9d4d67758039', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'c50f5604-6b89-49d7-871d-1ae6b3055a1f', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('7e45fa89-5006-4171-8847-960051e692b9', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '9efc5405-4fc1-439b-8885-5bd5ffc8093b', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('7e7208ff-86fe-4010-90b6-44597c9c0ee2', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '285e6c8e-63ba-470d-8de3-b8ee683a62fa', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('7f2e317f-9174-469f-b517-db4793cea184', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '0639d477-7e7a-48f3-939c-d4918d8d1c41', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('7fe778de-85e2-48ec-aea0-186dbd57e0ad', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '99e3b240-c7a4-4434-a33e-d488f59892e1', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('7fff406b-921a-4227-b7f0-5162a5a27028', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '9ba93842-d641-454b-807f-a07f5816175d', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('826ed843-8d9d-43fc-8441-6e85159c730b', '1b063868-1374-47ad-8460-1441c1e6ec36', '58f5c0e2-7862-4314-b06d-b1851a5ad8a0', '2018-05-20 21:30:36');
INSERT INTO `rolepermission` VALUES ('82b823c8-4626-45db-9a0a-2cd3f3eadc77', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'cfcbff15-f850-4029-9ce6-6674c92ec909', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('82dffa2b-7b90-43a5-9934-a14a23c8bcda', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '6c2393e1-1dda-46dc-a5a4-28c9a14f2f30', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('83418257-0667-4435-b1d9-1a929f70efb8', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '5d3eadd5-9a2b-4570-be7f-79ef7ede2740', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('83c46dcd-1105-47ac-99eb-0d3e76ee2c00', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'ef48c893-c16d-4b12-8ea0-b7945484515a', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('83c4ce4e-4dbb-4842-bfd8-ff70bcfec409', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '5fd2eba2-ac76-4f1a-8158-66411a9b19bb', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('840e3346-d7b5-4c39-9edd-7fc3e9974ae6', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'f839bd75-9fc7-4432-9449-aeae9b2fe86a', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('843a6a43-7d0a-4233-b51b-63b9a6c36397', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '88a69a12-3f86-4c3b-8399-a543fac2c50d', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('85e2bf8f-2baa-4879-a170-94b23ba09e29', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '8c2b2e24-79ed-478a-a98f-6977f61bb191', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('8654a0bd-3772-4db5-b684-d883c2f90a1a', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '4f3612d0-d82b-43fc-bd93-627f657fdc75', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('8738c0a0-520d-4a24-b0c1-3dcd1f4cba94', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'e4213a84-b13e-42c7-ae93-03b71ea49f98', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('8788e47d-ff51-401f-9d34-d47df1b25cdf', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '29aeff54-4ac1-41df-8e32-c85765d6aa5e', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('87b3a8d4-139b-4737-88fd-9af67f5c6421', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'b442fb3e-1275-46c3-9c88-559bd4a34ad9', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('87b6cd9e-f545-4808-9c48-f48a97c989f3', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '0febe6a8-69d9-445d-9aad-7691c1f71791', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('8875b21e-05de-423c-974c-b754f59e5433', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'd2226751-f111-4a90-ad1c-e62982ac3a40', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('88b7e92e-0f34-47cf-8e7b-f031d6ed4285', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '88a69a12-3f86-4c3b-8399-a543fac2c50d', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('8a5bd80d-7ca3-4632-85b0-360cb68b527a', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'fffe32e3-3d27-4ec8-bdec-03a34a0d8673', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('8a84f75f-8c43-4421-80d8-f14a8d1326dd', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '289780a1-d7ad-432e-8423-2532357fe90b', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('8cd1674d-fdda-471c-9066-e638c173259c', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '4f3612d0-d82b-43fc-bd93-627f657fdc75', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('8e792aa9-ed8b-4d0e-aa0e-1413d978dc69', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'ac165e35-6717-4035-9fb9-099eedabc307', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('8f1e7db1-aee2-416f-81c0-41307a8613c3', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '29aeff54-4ac1-41df-8e32-c85765d6aa5e', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('90994b01-ca41-4555-8869-8852c5763ec9', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '79b1c4b1-952a-417f-885d-fd3bb97b68f5', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('91389c8f-c9e8-49fa-aa9e-717939ae813d', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '7761ab7c-3e7f-4b9f-98c8-14afd7e4c97a', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('91bd9bd2-e8e7-43a5-bf73-618e385be012', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '9ba93842-d641-454b-807f-a07f5816175d', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('92a8de4c-c624-42e0-833f-76cdfd06ea9e', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '208b98b0-71e5-4f51-9e10-dba5ff1d059f', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('92c16154-7607-4910-b6f1-93e730df83fa', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '99e3b240-c7a4-4434-a33e-d488f59892e1', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('92ea2acc-ccd6-449b-9d50-6fa7570370f6', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'e4213a84-b13e-42c7-ae93-03b71ea49f98', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('931106e0-cc22-4152-b47c-e310535a8f0d', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '285e6c8e-63ba-470d-8de3-b8ee683a62fa', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('948abdf6-54c6-4c3d-ad47-67f17cf7b721', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '6c2393e1-1dda-46dc-a5a4-28c9a14f2f30', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('94c12901-b7f7-4378-a4c2-a6e81feb28bd', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'fa5cb406-217b-4cb9-93d1-b0882337afdf', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('950584e6-fe04-430a-a5b3-31c50f7e2f0a', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'c9c2ed7d-d3c4-4219-9551-7290f41a1307', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('95a83898-1387-4696-9436-fcf501fc1819', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '05a3e1d7-47c5-4197-9233-bef96c3d9856', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('95f1fdf8-c13d-46f5-b019-dddd786596fc', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'c50f5604-6b89-49d7-871d-1ae6b3055a1f', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('96bc2282-e8bf-4759-b69f-12fcd00e3b10', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'd754d0b4-b26b-4879-bd86-c9a85585b6ae', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('97e077be-74fd-4080-95d9-aa1297133b6b', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '4ae3d48a-9d95-43c9-b72e-0d7221344bca', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('99e9900f-fe99-4c28-acc0-9f9c78ae15be', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '5df915ae-c60b-444d-b356-19f22b7413a9', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('9a01e4fa-9505-4ef0-bf41-30d27d202169', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'ef48c893-c16d-4b12-8ea0-b7945484515a', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('9c73ca09-beb2-4c5f-b3e1-2ee4f140950e', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '4ae3d48a-9d95-43c9-b72e-0d7221344bca', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('9c816e88-89c0-4c78-b389-1ed525fab736', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'c10f2be2-2f76-46a9-8f39-4e6e71a0ecbb', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('9d48afd7-9f6b-407b-9dbb-156d3d7cb8ed', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '6b7e3578-7436-48d2-9b0c-57e91dc1d95c', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('9d6d9c21-7960-4d00-90f9-486ea7684108', '85aebb2d-7076-45c6-90c2-a679f98bae6b', 'ea65adee-1ebe-4496-a9a6-5e06f9bc0cd6', '2018-05-22 22:44:31');
INSERT INTO `rolepermission` VALUES ('9e6db333-a42d-4697-ac4e-de88e7862ea2', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '6046dc33-2132-4832-809f-fad3f9e3dc70', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('9fd42121-4586-40be-b680-1537333722e5', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'c9c2ed7d-d3c4-4219-9551-7290f41a1307', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('a10de7de-7652-4845-8d74-ff447f823e2c', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '289780a1-d7ad-432e-8423-2532357fe90b', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('a1b16128-da99-4ba5-ab9a-d3d9554be581', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '5da5f987-73ac-4a1f-afbf-ecb78b5b9899', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('a1f6e857-adc0-472f-891f-e72ebb08f4e6', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'a7353d0d-e160-468a-842a-ebe8ec203f57', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('a36dd6f0-a909-4e31-8e1e-5ddaf72bb6fa', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '5093e639-ce61-4785-9c89-f9c797952569', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('a425ea7b-3379-46ea-a11e-d58b6ddbe2b7', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '6aa4774e-6d6a-4751-8e53-decdafd4891d', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('a427e155-ad45-4ffe-ae54-e2e5e1e2433f', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '7761ab7c-3e7f-4b9f-98c8-14afd7e4c97a', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('a4e2b98d-d6bb-4343-90e7-88ea4e01ec32', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'd0c2ff59-6db5-453f-b6ba-9010f433ba85', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('a65e448d-08bc-47ac-99bd-15495fdcb578', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'd754d0b4-b26b-4879-bd86-c9a85585b6ae', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('a680956f-f4c4-44fd-baeb-5c219e4dd480', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'a681ce7e-2b83-404f-9c69-3871aa150d87', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('a87baaf3-7805-4d64-aa81-a18790b9deaa', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '1af44803-d9a2-4652-8602-810193ca3bbf', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('a8de9fe1-7a9a-44c1-acab-9b6df1ea274b', '1b063868-1374-47ad-8460-1441c1e6ec36', '06affd90-b6b1-4cd3-abf3-06c5fd2cf986', '2018-05-20 21:30:36');
INSERT INTO `rolepermission` VALUES ('ad0b2fe1-950e-4aed-b50b-2d501700b4a3', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'ac165e35-6717-4035-9fb9-099eedabc307', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('ad76e1f8-1d92-470f-9652-83c4f92378ab', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '5093e639-ce61-4785-9c89-f9c797952569', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('ada6d9c4-8b29-4e80-810d-864f9d94c8d5', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '1a0f7fee-a7e8-42d6-a855-a9e30d1acdb7', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('ae0b8203-a176-472f-bee0-44b426de602f', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'd2226751-f111-4a90-ad1c-e62982ac3a40', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('affcac4f-4c76-4a9f-9b44-5ac5b74b54e9', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '6aa4774e-6d6a-4751-8e53-decdafd4891d', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('b1753e93-4f8e-4912-82a6-8a66ea984cc8', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '4cd76921-989e-4cba-b548-45e7a675970b', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('b196e42f-e13a-49e4-af96-ce2c095dabbd', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'ce23ae72-42e3-4336-80d0-32f0755c7bac', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('b26e0abe-2683-46a1-a1a6-d91377b97230', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '8a969e62-5c97-45e4-b997-b1b914aef7d9', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('b3741ba6-86ae-4c6e-b5f0-b847d9c2ffec', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'f5b1005c-7043-42cd-9db7-6bbe171e7416', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('b4d1efcc-4aa5-45a2-9b22-885a4fc15abe', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '05a3e1d7-47c5-4197-9233-bef96c3d9856', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('b4f332da-5826-4246-95b4-5adaa02ed99a', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'df5f683d-88c6-4628-bd53-76fd8e36a63c', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('b511b080-007a-4af5-b056-0b509258c811', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '13893971-be8e-46f9-8571-f8c36a04c1e3', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('b5315114-d11b-4415-b799-a9df48200e34', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'c9c2ed7d-d3c4-4219-9551-7290f41a1307', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('b5ccb311-c1e1-4f48-b0ff-43ee3d273573', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '6c2393e1-1dda-46dc-a5a4-28c9a14f2f30', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('b5f62877-7887-4b65-a6f0-ca4f193a946f', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'ec46857d-cf72-495c-922f-f3e7c4f19e28', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('b634469f-60b7-4431-97db-06b270a73c0d', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '52cd0cca-964e-48df-a32e-f6258cce2bb5', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('b9987043-52e4-485b-859e-c28b576a6b2a', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '69b399a9-61a2-4504-a961-720e78722526', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('ba1182ed-9016-412f-9b4f-c5bed0e78e84', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '18dd9d2d-51d5-4994-b355-7f88fe9464b7', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('ba8eca7b-6b83-49ff-bf0b-535488f58b4a', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '112b1fb9-73c1-4f38-9ee3-a3f8c18a01ed', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('bc1492e7-efbf-4709-865b-2783ffbce7c4', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '9df91c9f-0b6a-423b-8ea0-3838d0232c10', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('bc2b2730-d4bf-4e5f-9b90-3bafffcca4f7', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '29aeff54-4ac1-41df-8e32-c85765d6aa5e', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('bca79965-261d-4120-8d7c-3562b01fc6e5', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '4f3612d0-d82b-43fc-bd93-627f657fdc75', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('bcd66663-0fd2-48c5-9827-c217a9381406', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'd754d0b4-b26b-4879-bd86-c9a85585b6ae', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('bd5868af-6715-4faa-bcc7-a5c0306f884a', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '9f32b9bf-d4c5-426b-a798-19118a74fe06', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('be13a384-dd33-46a1-8c82-4b0fd1d50823', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'df5f683d-88c6-4628-bd53-76fd8e36a63c', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('be7abb45-d4a8-4717-811d-d5ebf94acb92', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '5fd2eba2-ac76-4f1a-8158-66411a9b19bb', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('bf00ab2b-ea01-4e67-8261-0dae2c7b0dbb', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '8a969e62-5c97-45e4-b997-b1b914aef7d9', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('bfd48983-d3d3-4e1c-86f2-1847af60410b', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'd827b6e2-9ebc-4340-b136-1a48aba04a3d', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('c109df54-b8c6-416a-9957-dd4c1a3f2b71', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '05a3e1d7-47c5-4197-9233-bef96c3d9856', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('c3578669-791d-40d1-8481-94b2c77541b3', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '0639d477-7e7a-48f3-939c-d4918d8d1c41', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('c55f757c-05dc-4feb-99af-e338bf6b7a17', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '2d1c6c0c-3f20-4b45-98e3-d39b5c83e769', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('c5c1cf47-6846-4189-bbc5-d34522819165', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '9efc5405-4fc1-439b-8885-5bd5ffc8093b', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('c5cfe69a-13f6-4044-8184-3e06d0991135', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '88a69a12-3f86-4c3b-8399-a543fac2c50d', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('c605d28a-982d-4d38-b6c8-b1cd4a9b326e', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '03c54824-d223-4b4c-b084-9df2d5571495', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('c6597d80-9c51-4a58-97a5-3f2ad6577cab', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '505d982c-a36f-4f59-8e6b-6afe68d32585', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('c671632f-9371-46f9-ad92-81da973c4dba', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'a83c8e9d-b587-4c9c-b327-ecf3e976513e', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('ca286c60-8157-4387-bc5e-072ff2d43b9c', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '6c2393e1-1dda-46dc-a5a4-28c9a14f2f30', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('ca9514ee-6fb5-49cf-9c1f-8673daa6db5c', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '5da5f987-73ac-4a1f-afbf-ecb78b5b9899', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('caef4cde-09c9-4b8f-9be1-d60938978b08', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '6b7e3578-7436-48d2-9b0c-57e91dc1d95c', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('cb1b0653-1e61-457e-9ee1-d79647a8e299', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'f5b1005c-7043-42cd-9db7-6bbe171e7416', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('cb4435c4-73b8-4ec7-b68f-cdb41d6f281d', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '005574b4-ad15-491f-8455-ce97727d2b8a', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('cc1c7a2d-8144-4999-a332-bcfa2d9d795f', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'd2226751-f111-4a90-ad1c-e62982ac3a40', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('cc76843e-e677-41da-be94-68ac69e83cfa', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'a83c8e9d-b587-4c9c-b327-ecf3e976513e', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('cd19b92f-d8c1-47fb-a789-677699000b58', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '9f32b9bf-d4c5-426b-a798-19118a74fe06', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('ce0977e0-8737-4234-96ee-4e7241bd6317', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'fe581a6d-2cf6-4e09-bbb9-0801f1962093', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('ce1ee92d-f00b-4afb-b88c-a8ad777d0aa1', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'ac165e35-6717-4035-9fb9-099eedabc307', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('cf8e8251-659c-4c5d-9dea-acd9386c6389', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '2d6e62ee-6106-4a00-b713-4861216300b8', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('d096659b-4eb8-416c-8a19-33001183ce8c', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'ea65adee-1ebe-4496-a9a6-5e06f9bc0cd6', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('d0c7276a-d2a6-4a95-9a44-8041b9461284', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '5d3eadd5-9a2b-4570-be7f-79ef7ede2740', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('d1e8c086-7127-47b4-a42d-4ef7b4bc3064', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '06affd90-b6b1-4cd3-abf3-06c5fd2cf986', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('d2949724-f84d-4627-abd7-fc20fce629a6', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '418a9468-c91b-4a93-96b1-11e6a279a88b', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('d32f0d49-a0ef-4696-940c-e80b25b156ff', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'e4213a84-b13e-42c7-ae93-03b71ea49f98', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('d36d3a81-c2f6-48dc-a9f5-e897216b596b', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'cd7ee5f2-aa60-4891-87ff-19e2c36c4b26', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('d40f1de4-64d4-4387-bfcd-375ed8048b46', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '6b7e3578-7436-48d2-9b0c-57e91dc1d95c', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('d4245b5d-a8ce-4972-bca2-33482a1c1113', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'f839bd75-9fc7-4432-9449-aeae9b2fe86a', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('d470e7e6-ac94-465e-829b-006b0b4bc2ac', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'a83c8e9d-b587-4c9c-b327-ecf3e976513e', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('d49dd3d0-b639-478e-b630-7610fb402052', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'a681ce7e-2b83-404f-9c69-3871aa150d87', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('d512fb66-57a8-4b22-8dc0-8b732a2db4cd', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'cfcbff15-f850-4029-9ce6-6674c92ec909', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('d547ca38-e8f9-498a-9e6c-b5f9758ac77b', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '208b98b0-71e5-4f51-9e10-dba5ff1d059f', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('d569280e-b393-4517-beb4-4cc15696a843', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '58f5c0e2-7862-4314-b06d-b1851a5ad8a0', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('d5bdbe03-1c02-4e79-ba9e-cb2e5b205ece', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'd0c2ff59-6db5-453f-b6ba-9010f433ba85', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('d698cd37-0b38-451b-8014-153b99815ab5', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '8d1c7a29-701e-46c4-bf7f-11e5d7a58d87', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('d8f689b6-fec7-41d8-81e7-9e42780a9cb6', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'ce23ae72-42e3-4336-80d0-32f0755c7bac', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('d8f96b9d-1fe7-481f-8f27-8234ea50df3d', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'c10f2be2-2f76-46a9-8f39-4e6e71a0ecbb', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('d96f7865-a836-46c8-9561-f3656d7c86ce', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '5fd2eba2-ac76-4f1a-8158-66411a9b19bb', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('d9a1a6e6-c4f3-47e2-8592-5770162f1f68', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '6046dc33-2132-4832-809f-fad3f9e3dc70', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('da0a0e1f-633e-4dcc-b049-cfc058b913d1', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '8c2b2e24-79ed-478a-a98f-6977f61bb191', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('da6a7d0c-3b05-4ce9-af33-df4efff3bf23', '1b063868-1374-47ad-8460-1441c1e6ec36', 'a83c8e9d-b587-4c9c-b327-ecf3e976513e', '2018-05-20 21:30:36');
INSERT INTO `rolepermission` VALUES ('dab98318-7e0f-4a2e-89a7-fe43742869a1', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '9efc5405-4fc1-439b-8885-5bd5ffc8093b', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('dadf0f5e-dccd-41e4-ab59-af0ba9e1711d', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'ec46857d-cf72-495c-922f-f3e7c4f19e28', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('db06dfd8-4811-4118-b033-85b886896b1b', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'dd215e48-f6cb-447b-9767-440b499e1c84', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('dbe9a72e-e8cf-45c7-8d3c-231db0dda463', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '69b399a9-61a2-4504-a961-720e78722526', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('dc348a32-9655-4a09-a978-8fc642005fc5', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'a7353d0d-e160-468a-842a-ebe8ec203f57', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('dcb4cc58-3046-4288-93fe-27e2cf564f9b', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '628768dc-9064-4bf0-904e-69ba8d02a06e', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('dcf0a50c-33b6-458f-b0f5-673e2e8e52f2', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '5df915ae-c60b-444d-b356-19f22b7413a9', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('df334948-5333-43e7-b6e5-8dd54ea31980', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'ea65adee-1ebe-4496-a9a6-5e06f9bc0cd6', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('df4be908-c115-4c14-a0ab-e713ca1b9bfc', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'a7353d0d-e160-468a-842a-ebe8ec203f57', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('dfb1fdff-6301-479c-8334-8abec60d602c', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', 'cfcbff15-f850-4029-9ce6-6674c92ec909', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('dfef7a5f-bc5c-462d-ab95-478f5def4d89', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '4cd76921-989e-4cba-b548-45e7a675970b', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('e0632579-13b7-4799-bc56-cd663f247536', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '79b1c4b1-952a-417f-885d-fd3bb97b68f5', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('e08b4142-c936-4249-8327-73d7a7937cb6', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '52cd0cca-964e-48df-a32e-f6258cce2bb5', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('e24d8f64-bf7c-41ec-ac2f-cdeca946f5a6', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '2d6e62ee-6106-4a00-b713-4861216300b8', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('e362a8e4-4eeb-4612-ad37-71d37d3fdab0', '1b063868-1374-47ad-8460-1441c1e6ec36', '05a3e1d7-47c5-4197-9233-bef96c3d9856', '2018-05-20 21:30:36');
INSERT INTO `rolepermission` VALUES ('e3ad1302-94f5-45fb-a265-792526297303', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'f5b1005c-7043-42cd-9db7-6bbe171e7416', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('e4b5f3ea-9fd2-4b88-a13b-918fedf4f640', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '58f5c0e2-7862-4314-b06d-b1851a5ad8a0', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('e52b6757-75db-4f3d-945e-7e70cbdc59e2', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '4cd76921-989e-4cba-b548-45e7a675970b', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('ec209ae6-f68a-4b95-93cd-c5e2e12266ee', '1b063868-1374-47ad-8460-1441c1e6ec36', '13893971-be8e-46f9-8571-f8c36a04c1e3', '2018-05-20 21:30:36');
INSERT INTO `rolepermission` VALUES ('ed5a75ba-6475-4523-9fde-8ed8c27df5f9', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '9408b081-c1ad-408e-a0b3-e764f1fa1a36', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('ee7adf6f-7eea-467f-95a8-f2d6cca53250', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'fa5cb406-217b-4cb9-93d1-b0882337afdf', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('ef120a08-48f2-4084-a3d7-ffc1539c1d70', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'd2226751-f111-4a90-ad1c-e62982ac3a40', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('f104eed4-6035-4d83-a681-79345c8e3c88', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '9bd6a445-20eb-469b-8d6f-8372d8502263', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('f163f81e-cab7-4676-93bc-987db760c13e', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '5da5f987-73ac-4a1f-afbf-ecb78b5b9899', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('f28f0642-eeaf-4a27-956a-ace4de355a6d', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'd827b6e2-9ebc-4340-b136-1a48aba04a3d', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('f561470c-62f8-4caa-8977-e68075533b08', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'dd215e48-f6cb-447b-9767-440b499e1c84', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('f612b274-2fe1-41b4-8901-03996b046ee7', '85aebb2d-7076-45c6-90c2-a679f98bae6b', '208b98b0-71e5-4f51-9e10-dba5ff1d059f', '2018-05-22 22:44:31');
INSERT INTO `rolepermission` VALUES ('f614c739-fd3f-4503-aa82-6fb5fb90c383', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51', '03c54824-d223-4b4c-b084-9df2d5571495', '2018-06-03 12:49:29');
INSERT INTO `rolepermission` VALUES ('f64abbf4-ffb7-4427-b241-3555d7ba0051', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', '1a0f7fee-a7e8-42d6-a855-a9e30d1acdb7', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('f7a139c4-ead3-4161-8bcd-df08bf33e7a2', '85aebb2d-7076-45c6-90c2-a679f98bae6b', '05a3e1d7-47c5-4197-9233-bef96c3d9856', '2018-05-22 22:44:31');
INSERT INTO `rolepermission` VALUES ('f82d0f2b-87fd-441d-9450-4a9c42afe28d', 'c846926d-0aec-11e7-9a05-408d5cd46d51', 'cfcbff15-f850-4029-9ce6-6674c92ec909', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('f984b434-792d-432b-a375-cc5dbd8aa2dc', 'c846926d-0aec-11e7-9a05-408d5cd46d51', '7761ab7c-3e7f-4b9f-98c8-14afd7e4c97a', '2018-06-05 15:57:52');
INSERT INTO `rolepermission` VALUES ('fa370f1e-256b-4eb5-a959-7125ad6bef30', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '9408b081-c1ad-408e-a0b3-e764f1fa1a36', '2018-06-05 15:57:46');
INSERT INTO `rolepermission` VALUES ('fa4ef4b0-3532-4b56-b82c-e7a3233d2239', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'a681ce7e-2b83-404f-9c69-3871aa150d87', '2018-06-03 12:49:21');
INSERT INTO `rolepermission` VALUES ('ff275e78-6170-4fd5-a630-59cbdc853fa2', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51', 'c50f5604-6b89-49d7-871d-1ae6b3055a1f', '2018-06-03 12:49:21');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `Id` varchar(100) NOT NULL COMMENT '用户组编号',
  `Name` varchar(50) NOT NULL COMMENT '角色(用户组)名称',
  `Int0` int(11) DEFAULT NULL COMMENT '预留Int',
  `String0` varchar(50) DEFAULT NULL COMMENT '预留字符串',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IndexUnique_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1b063868-1374-47ad-8460-1441c1e6ec36', '教员', null, null);
INSERT INTO `roles` VALUES ('37da0768-4100-4ff3-b9d7-0cc58aae2a7c', '管理员', null, null);
INSERT INTO `roles` VALUES ('40cb9316-44e3-42db-a757-01bada1d49f4', '辅导员', null, null);
INSERT INTO `roles` VALUES ('675e5024-5a12-4c55-8c8f-7d9a9bda43db', '研发专员', null, null);
INSERT INTO `roles` VALUES ('6edb930f-e634-4180-8fb5-5b7bc8717701', '教务', null, null);
INSERT INTO `roles` VALUES ('7ec1b580-6ded-4e06-b8e7-4f4356b109a0', '教质部经理', null, null);
INSERT INTO `roles` VALUES ('85aebb2d-7076-45c6-90c2-a679f98bae6b', '单词采集员', null, null);
INSERT INTO `roles` VALUES ('a9317937-0d3d-11e7-b1d9-408d5cd46d51', '网络推广专员', null, null);
INSERT INTO `roles` VALUES ('b1fecad6-0aec-11e7-9a05-408d5cd46d51', '网络咨询', null, null);
INSERT INTO `roles` VALUES ('bab0aa41-0aec-11e7-9a05-408d5cd46d51', '咨询师', null, null);
INSERT INTO `roles` VALUES ('c4c4b861-1ff4-42eb-bf29-7117832657ac', '学术经理', null, null);
INSERT INTO `roles` VALUES ('c7751731-abcf-4aba-aeae-ae11451d97a7', '学生', null, null);
INSERT INTO `roles` VALUES ('c846926d-0aec-11e7-9a05-408d5cd46d51', '咨询经理', null, null);
INSERT INTO `roles` VALUES ('d46fd018-92f4-4ad8-b531-f5490333d085', '项目主任', null, null);
INSERT INTO `roles` VALUES ('d5dce30d-3326-430c-9b5d-7f2580abdb21', '研发经理', null, null);
INSERT INTO `roles` VALUES ('f5d9cdb1-fc16-464a-a27a-860d2d3c6b00', '助教', null, null);
INSERT INTO `roles` VALUES ('f624bb7b-afc7-4bde-8c32-b2659eeba527', '总经理', null, null);

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生编号',
  `Name` varchar(50) NOT NULL COMMENT '学员姓名',
  `Age` int(11) DEFAULT NULL COMMENT '年龄',
  `Sex` varchar(50) DEFAULT NULL COMMENT '性别 ',
  `Phone` varchar(50) DEFAULT NULL COMMENT '学员电话',
  `StuStatus` varchar(50) DEFAULT NULL COMMENT '学历',
  `PerState` varchar(50) DEFAULT NULL COMMENT '个人状态',
  `MsgSource` varchar(50) DEFAULT NULL COMMENT '来源渠道',
  `SourceUrl` varchar(100) DEFAULT NULL COMMENT '来源网址',
  `SourceKeyWord` varchar(100) DEFAULT NULL COMMENT '来源关键词',
  `Address` varchar(100) DEFAULT NULL COMMENT '所在区域',
  `NetPusherId` varchar(100) DEFAULT NULL COMMENT '网络咨询Id',
  `AskerId` varchar(100) DEFAULT NULL COMMENT '咨询师Id',
  `QQ` varchar(50) DEFAULT NULL COMMENT '学员QQ',
  `WeiXin` varchar(50) DEFAULT NULL COMMENT '学员微信',
  `Content` varchar(2000) DEFAULT NULL COMMENT '备注',
  `CreateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `LearnForward` varchar(100) DEFAULT NULL COMMENT '课程方向',
  `IsValid` varchar(50) DEFAULT '待定' COMMENT '是否有效',
  `Record` varchar(100) DEFAULT NULL COMMENT '打分',
  `IsReturnVist` varchar(50) DEFAULT '否' COMMENT '是否回访',
  `FirstVisitTime` timestamp NULL DEFAULT NULL COMMENT '首次回访时间',
  `IsHome` varchar(50) DEFAULT '否' COMMENT '是否上门',
  `HomeTime` timestamp NULL DEFAULT NULL COMMENT '上门时间',
  `LostValid` varchar(2000) DEFAULT NULL COMMENT '无效原因',
  `IsPay` varchar(50) DEFAULT '否' COMMENT '是否付款',
  `PayTime` timestamp NULL DEFAULT NULL COMMENT '付款时间',
  `Money` double DEFAULT '0' COMMENT '付款金额',
  `IsReturnMoney` varchar(50) DEFAULT '否' COMMENT '是否退费',
  `IsInClass` varchar(50) DEFAULT '否' COMMENT '是否进班',
  `InClassTime` timestamp NULL DEFAULT NULL COMMENT '进班时间',
  `InClassContent` varchar(2000) DEFAULT NULL COMMENT '进班备注',
  `AskerContent` varchar(2000) DEFAULT NULL COMMENT '咨询师备注',
  `IsDel` varchar(50) DEFAULT '否' COMMENT '是否删除',
  `FromPart` varchar(100) DEFAULT NULL COMMENT '来源部门',
  `StuConcern` varchar(100) DEFAULT NULL COMMENT '学员关注',
  `IsBaoBei` varchar(50) DEFAULT NULL COMMENT '是否报备',
  `ZiXunName` varchar(50) DEFAULT NULL COMMENT '咨询师填写的姓名',
  `CreateUser` varchar(50) DEFAULT NULL COMMENT '录入人姓名',
  `ReturnMoneyReason` varchar(2000) DEFAULT NULL COMMENT '退费原因',
  `PreMoney` double DEFAULT '0' COMMENT '预付定金',
  `PreMoneyTime` timestamp NULL DEFAULT NULL COMMENT '预付定金时间',
  PRIMARY KEY (`Id`),
  KEY `fk_student_askers` (`AskerId`),
  CONSTRAINT `fk_student_askers` FOREIGN KEY (`AskerId`) REFERENCES `askers` (`AskerId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('3', '张三', '20', '男', '13552143099', '高中', '在读', '百度', '高考站', '互联网+', '郑州', 'fa8d1ec1-0af1-11e7-9a05-408d5cd46d51', null, '123456', '123456', '在读学生张三有意向软件开发工作。。。', '2017-03-23 11:31:23', null, null, null, '否', null, null, null, null, null, null, '0', null, null, null, null, null, '是', '就业', '就业', '是', null, '网络咨询1', null, '0', null);
INSERT INTO `students` VALUES ('4', '张三三', '20', '男', '13588888888', '高中', '在读', '百度', '职英B站', '互联网+', '郑州', 'fa8d1ec1-0af1-11e7-9a05-408d5cd46d51', null, '123456', '456789', '张三三同学想学习软件开发。。。', '2017-03-23 11:47:23', '软件开发', '待定', 'A', '否', '2017-05-04 17:38:50', '否', '2017-05-04 17:38:52', '', '否', '2017-05-04 17:38:55', '10000', '否', '否', '2017-05-04 17:38:58', '', '咨询师已备注', '否', '就业', '就业', '是', '咨询师1', '网络咨询1', '', '1000', '2017-05-04 17:38:54');
INSERT INTO `students` VALUES ('5', '李四', '26', '女', '15766666666', '高中', '在读', '360', '职英B站', '软件开发', '洛阳', '', 'e57dad65-0d3d-11e7-b1d9-408d5cd46d51', '123456', '234567', '已在线备注完成。。。', '2017-03-23 16:33:49', '网络营销', '待定', 'C', '是', '2017-03-23 16:35:38', '是', '2017-03-12 16:35:27', '', '是', '2017-03-20 16:35:43', '20000', '否', '否', '2017-03-21 16:35:53', '备注。。。。', '咨询师已备注', '否', '市场', '就业', '是', '咨询师2', '网络咨询1', '', '2000', '2017-03-21 16:35:24');
INSERT INTO `students` VALUES ('6', '小红', '18', '女', '15888888888', '高中', '在读', '360', '高考站', '云时代', '洛阳', 'fa8d1ec1-0af1-11e7-9a05-408d5cd46d51', '0a32c411-1420-11e7-b0ca-408d5cd46d51', '123456', '234567', '在读生小红咨询了公司的培训流程以及就业前景。', '2017-03-28 11:09:39', null, '待定', null, '否', null, '否', null, null, '否', null, '0', '否', '否', null, null, null, '否', '市场', '学费', '是', null, '网络咨询2', null, '0', null);
INSERT INTO `students` VALUES ('7', '小明', '22', '男', '15888888666', '大专', '待业', '百度', '职英A站', '软件工程师', '开封', 'fa8d1ec1-0af1-11e7-9a05-408d5cd46d51', null, '2345678', '123456', '大专生小明了解了咱们公司的课程信息和就业前景。', '2017-03-28 11:13:17', '软件开发', '待定', 'A', '是', '2017-03-21 14:56:25', '是', '2017-03-26 14:56:31', '', '是', '2017-03-28 14:56:54', '10000', '否', '否', '2017-03-30 14:57:07', '已进班学习', '信息已录入完毕。。。。', '否', '就业', '就业', '否', '咨询师2', '网络咨询2', '', '1000', '2017-03-27 14:56:45');
INSERT INTO `students` VALUES ('8', '王二', '25', '男', '15866666666', '其它', '待业', '搜狗', '其它', '互联网改变生活', '南阳', 'fa8d1ec1-0af1-11e7-9a05-408d5cd46d51', null, '123456', '666666', '王二了解了公司的课程以及就业方向。', '2017-03-28 11:42:34', null, '待定', null, '否', null, '否', null, null, '否', null, '0', '否', '否', null, null, null, '否', '市场', '就业', '是', null, '网络咨询1', null, '0', null);
INSERT INTO `students` VALUES ('9', '小李', '30', '男', '13588886666', '本科', '在读', '百度移动端', '其它', '互联网+时代', '郑州', 'd3c66ff8-0d3d-11e7-b1d9-408d5cd46d51', 'e57dad65-0d3d-11e7-b1d9-408d5cd46d51', '123456789', '34567', '研究生小李想从事软件开发的工作 ，有意向咱们公司的软件培训。', '2017-03-29 14:50:40', null, '待定', null, '否', null, '否', null, null, '否', null, '0', '否', '否', null, null, null, '否', '就业', '就业', '否', null, '网络咨询2', null, '0', null);
INSERT INTO `students` VALUES ('10', '阿飞', '28', '男', '13588885555', '本科', '待业', '百度移动端', '其它', '互联网+时代', '郑州', 'daecc098-0d3d-11e7-b1d9-408d5cd46d51', '26956c65-0af2-11e7-9a05-408d5cd46d51', '123456789', '34567', '阿飞想从事软件开发的工作 ，有意向咱们公司的软件培训。', '2017-03-29 14:55:54', '软件开发', '是', 'A', '是', '2015-02-04 00:00:00', '是', '2017-03-20 08:58:42', '', '是', '2017-03-30 08:59:03', '8000', '否', '否', null, '', '冯飞费用已缴纳，近期可以进班学习。。。', '否', '就业', '就业', '否', '冯飞', '网络咨询2', '', '611', '2017-03-27 08:58:53');
INSERT INTO `students` VALUES ('11', '小毛', '28', '男', '13588885555', '本科', '待业', '百度移动端', '其它', '互联网+时代', '郑州', 'daecc098-0d3d-11e7-b1d9-408d5cd46d51', null, '123456789', '34567', '想从事软件开发的工作 ，有意向咱们公司的软件培训。', '2017-03-29 15:00:08', null, '待定', null, '否', null, '否', null, null, '否', null, '0', '否', '否', null, null, null, '否', '就业', '就业', '否', null, '网络咨询2', null, '0', null);
INSERT INTO `students` VALUES ('12', '小黄', '28', '男', '13588885555', '本科', '待业', '百度移动端', '其它', '互联网+时代', '郑州', 'daecc098-0d3d-11e7-b1d9-408d5cd46d51', '26956c65-0af2-11e7-9a05-408d5cd46d51', '123456789', '34567', '想从事软件开发的工作 ，有意向咱们公司的软件培训。', '2017-03-29 15:04:44', '软件开发', '是', 'A', '是', '2017-04-18 10:30:54', '是', '2017-04-20 10:31:04', '', '是', '2017-04-24 10:31:19', '16000', '否', '否', null, '', '跟踪完毕，近期可以进班。。。', '否', '就业', '就业', '否', '张黄帝', '网络咨询2', '', '100', '2017-04-23 10:31:13');
INSERT INTO `students` VALUES ('13', '小绿', '28', '男', '13588885555', '本科', '待业', '百度移动端', '其它', '互联网+时代', '郑州', 'd3c66ff8-0d3d-11e7-b1d9-408d5cd46d51', null, '123456789', '34567', '想从事软件开发的工作 ，有意向咱们公司的软件培训。', '2017-03-29 15:08:15', null, '待定', null, '否', null, '否', null, null, '否', null, '0', '否', '否', null, null, null, '否', '就业', '就业', '否', null, '网络咨询2', null, '0', null);
INSERT INTO `students` VALUES ('14', '小黑', '28', '男', '13588885555', '本科', '待业', '百度移动端', '其它', '互联网+时代', '郑州', 'd3c66ff8-0d3d-11e7-b1d9-408d5cd46d51', '26956c65-0af2-11e7-9a05-408d5cd46d51', '123456789', '34567', '想从事软件开发的工作 ，有意向咱们公司的软件培训。', '2017-03-29 15:09:30', '网络营销', '是', 'B', '是', '2017-03-16 10:45:36', '否', null, '', '是', '2017-03-29 10:45:56', '6000', '否', '否', null, '', '陈黑同学费用以及缴纳，近期可进班学习。', '否', '就业', '就业', '否', '陈黑', '网络咨询2', '', '800', '2017-03-28 10:45:46');
INSERT INTO `students` VALUES ('15', '小白', '28', '男', '13588885555', '本科', '待业', '百度移动端', '其它', '互联网+时代', '郑州', 'd3c66ff8-0d3d-11e7-b1d9-408d5cd46d51', '26956c65-0af2-11e7-9a05-408d5cd46d51', '123456789', '34567', '想从事软件开发的工作 ，有意向咱们公司的软件培训。', '2017-03-29 15:24:37', null, '待定', null, '否', null, '否', null, null, '否', null, '0', '否', '否', null, null, null, '否', '就业', '就业', '否', null, '网络咨询2', null, '0', null);
INSERT INTO `students` VALUES ('16', '麻六', '27', '男', '15866666666', '本科', '待业', '微信', '职英B站', '人工智能', '新乡', null, '26956c65-0af2-11e7-9a05-408d5cd46d51', '242424242', '131313', '麻六有意向互联网开发。', '2017-03-31 11:58:46', null, '待定', null, '否', null, '否', null, null, '否', null, '0', '否', '否', null, null, null, '否', '市场', '就业', '否', null, '网络咨询1', null, '0', null);
INSERT INTO `students` VALUES ('17', '小华', '30', '男', '15866666666', '大专', '待业', '360移动端', '高考站', '创客', '其它', null, null, '13131313', '131313', '小华想了解互联网创业。。。', '2017-03-31 17:57:24', null, '待定', null, '否', null, '否', null, null, '否', null, '0', '否', '否', null, null, null, '否', '就业', '就业', '否', null, '网络咨询1', null, '0', null);
INSERT INTO `students` VALUES ('18', '小龙', '20', '男', '13588888888', '本科', '在读', '搜狗移动端', '职英B站', '软件开发', '郑州', null, null, '131313', '454545', '小龙有意向从事软件开发行业，想来在咱们学校学习。。', '2017-04-01 10:22:40', null, '待定', null, '否', null, '否', null, null, '否', null, '0', '否', '否', null, null, null, '否', '学术', '课程', '否', null, '网络咨询1', null, '0', null);
INSERT INTO `students` VALUES ('19', '小芳', '28', '女', '13566668888', '本科', '在职', '百度移动端', '职英B站', '云计算', '郑州', null, 'e57dad65-0d3d-11e7-b1d9-408d5cd46d51', '123456', '234567', '在读本科生小芳通过市场就业部了解了公司的软件开发课程。', '2017-04-05 09:05:30', '软件开发', '待定', 'B', '否', '2017-03-30 09:21:29', '是', '2017-04-02 09:22:36', '', '否', null, '0', '否', '否', null, '', '', '否', '就业', '就业', '否', '李芳', '网络咨询1', '', '100', '2017-04-03 09:22:49');
INSERT INTO `students` VALUES ('20', '李刚', '30', '男', '13566666666', '本科', '在职', '百度', '职英A站', '网络', '郑州', null, null, '131313', '1313131', '撒发发发', '2017-05-05 08:48:05', null, '待定', null, '否', null, '否', null, null, '否', null, '0', '否', '否', null, null, null, '否', '教质', '学时', '否', null, '咨询经理1', null, '0', null);
INSERT INTO `students` VALUES ('21', '狂人', '30', '男', '13588888888', '中专', '在职', '百度', '职英A站', '高薪资', '郑州', null, '26956c65-0af2-11e7-9a05-408d5cd46d51', '123131', '131313', '阿什顿发放啊', '2017-05-05 08:52:48', null, '待定', null, '否', null, '否', null, null, '否', null, '0', '否', '否', null, null, null, '否', '网络', '课程', '否', null, '网络咨询1', null, '0', null);
INSERT INTO `students` VALUES ('22', '六子', '28', '男', '15266666666', '大专', '待业', '百度', '职英A站', '高薪', '郑州', null, 'e57dad65-0d3d-11e7-b1d9-408d5cd46d51', '1231313', '131313', '嘎啊大嘎达手感大', '2017-05-05 16:46:52', null, '待定', null, '否', null, '否', null, null, '否', null, '0', '否', '否', null, null, null, '否', '网络', '课程', '否', null, '咨询经理1', null, '0', null);
INSERT INTO `students` VALUES ('68', 'we', '20', '', '', '', '', '', '', '', null, null, null, '', '', '', '2018-06-05 22:41:45', null, '待定', null, '否', null, '否', null, null, '否', null, '0', '否', '否', null, null, null, '否', null, null, '', null, 'mm', null, '0', null);

-- ----------------------------
-- Table structure for userchecks
-- ----------------------------
DROP TABLE IF EXISTS `userchecks`;
CREATE TABLE `userchecks` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '签到Id',
  `UserId` varchar(100) DEFAULT NULL COMMENT '用户Id',
  `UserName` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `CheckInTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '签到时间',
  `CheckState` varchar(50) DEFAULT NULL COMMENT '签到状态',
  `IsCancel` varchar(50) DEFAULT '否' COMMENT '是否取消签到',
  `CheckOutTime` timestamp NULL DEFAULT NULL COMMENT '取消签到时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userchecks
-- ----------------------------
INSERT INTO `userchecks` VALUES ('2', '04b2c8ec-0af1-11e7-9a05-408d5cd46d51', '咨询经理1', '2018-05-27 18:09:32', '已签退', '是', '2018-05-27 15:28:50');
INSERT INTO `userchecks` VALUES ('3', '26956c65-0af2-11e7-9a05-408d5cd46d51', '咨询师1', '2018-05-17 09:23:58', '已签退', '是', '2017-04-05 10:09:57');
INSERT INTO `userchecks` VALUES ('5', '0a32c411-1420-11e7-b0ca-408d5cd46d51', '咨询师3', '2018-05-27 09:39:42', '已签退', '是', '2017-03-29 15:16:01');
INSERT INTO `userchecks` VALUES ('6', '1eff73ec-1423-11e7-b0ca-408d5cd46d51', '咨询师4', '2018-05-27 10:00:33', '已签退', '是', '2017-04-05 10:14:28');
INSERT INTO `userchecks` VALUES ('7', '26956c65-0af2-11e7-9a05-408d5cd46d51', '咨询师1', '2018-05-14 10:02:00', '已签退', '是', '2017-04-05 10:09:57');
INSERT INTO `userchecks` VALUES ('9', '26956c65-0af2-11e7-9a05-408d5cd46d51', '咨询师1', '2018-05-21 08:44:54', '已签退', '是', '2017-04-05 10:09:57');
INSERT INTO `userchecks` VALUES ('11', 'fa8d1ec1-0af1-11e7-9a05-408d5cd46d51', '网络咨询1', '2018-05-27 09:02:14', '已签到', '否', null);
INSERT INTO `userchecks` VALUES ('12', '0a32c411-1420-11e7-b0ca-408d5cd46d51', '咨询师3', '2018-05-27 11:41:20', '已签到', '否', null);
INSERT INTO `userchecks` VALUES ('13', '04b2c8ec-0af1-11e7-9a05-408d5cd46d51', '咨询经理1', '2018-05-27 09:58:10', '已签到', '否', null);
INSERT INTO `userchecks` VALUES ('14', '1eff73ec-1423-11e7-b0ca-408d5cd46d51', '咨询师4', '2018-05-27 10:00:01', '已签退', '是', '2017-04-05 10:14:28');
INSERT INTO `userchecks` VALUES ('15', '26956c65-0af2-11e7-9a05-408d5cd46d51', '咨询师1', '2018-05-01 10:25:14', '已签退', '是', '2017-04-05 10:09:57');
INSERT INTO `userchecks` VALUES ('20', 'e57dad65-0d3d-11e7-b1d9-408d5cd46d51', '咨询师2', '2018-05-27 11:10:48', '已签退', '是', '2018-05-27 15:28:57');
INSERT INTO `userchecks` VALUES ('22', '0a32c411-1420-11e7-b0ca-408d5cd46d51', '咨询师3', '2017-04-05 11:11:47', '已签到', '否', null);
INSERT INTO `userchecks` VALUES ('23', '1eff73ec-1423-11e7-b0ca-408d5cd46d51', '咨询师4', '2017-04-05 11:12:41', '已签到', '否', null);
INSERT INTO `userchecks` VALUES ('25', '04b2c8ec-0af1-11e7-9a05-408d5cd46d51', '咨询经理1', '2017-04-11 09:01:00', '已签到', '否', null);
INSERT INTO `userchecks` VALUES ('26', '04b2c8ec-0af1-11e7-9a05-408d5cd46d51', '咨询经理1', '2017-04-12 10:36:58', '已签到', '否', null);
INSERT INTO `userchecks` VALUES ('27', 'd7d54059-48da-4f76-8517-b45b5d0e1b39', '管理员', '2017-04-12 17:26:59', '已签到', '否', null);
INSERT INTO `userchecks` VALUES ('28', '04b2c8ec-0af1-11e7-9a05-408d5cd46d51', '咨询经理1', '2017-05-02 09:42:54', '已签退', '是', '2017-05-02 10:02:02');
INSERT INTO `userchecks` VALUES ('29', '26956c65-0af2-11e7-9a05-408d5cd46d51', '咨询师1', '2017-05-05 08:49:43', '已签退', '是', '2017-05-05 16:23:52');
INSERT INTO `userchecks` VALUES ('31', 'c97d9590-f7d7-48bd-a01f-0439a7828a1d', 'm2', '2018-05-27 20:00:27', '已签退', '是', '2018-05-27 20:00:36');
INSERT INTO `userchecks` VALUES ('32', '26956c65-0af2-11e7-9a05-408d5cd46d51', '咨询师1', '2018-05-27 20:14:26', '已签退', '是', '2018-05-27 20:14:35');
INSERT INTO `userchecks` VALUES ('33', '26956c65-0af2-11e7-9a05-408d5cd46d51', '咨询师1', '2018-06-03 17:20:11', '已签到', '否', null);
INSERT INTO `userchecks` VALUES ('34', '26956c65-0af2-11e7-9a05-408d5cd46d51', '咨询师1', '2018-06-04 22:17:36', '已签到', '否', null);
INSERT INTO `userchecks` VALUES ('35', '76da27d2-d891-4a3e-85e3-ec4a5855d285', 'm2', '2018-06-04 23:52:02', '已签到', '否', null);
INSERT INTO `userchecks` VALUES ('36', '26956c65-0af2-11e7-9a05-408d5cd46d51', '咨询师1', '2018-06-05 12:05:41', '已签到', '否', null);
INSERT INTO `userchecks` VALUES ('37', '76da27d2-d891-4a3e-85e3-ec4a5855d285', 'm2', '2018-06-05 12:06:19', '已签到', '否', null);
INSERT INTO `userchecks` VALUES ('38', '4d357528-be0f-4f7c-ab6c-cc4d61c720d2', 'm1', '2018-06-05 15:16:37', '已签到', '否', null);

-- ----------------------------
-- Table structure for userroles
-- ----------------------------
DROP TABLE IF EXISTS `userroles`;
CREATE TABLE `userroles` (
  `Id` varchar(100) NOT NULL,
  `UserId` varchar(100) NOT NULL,
  `RoleId` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `roleperm` (`RoleId`,`UserId`),
  KEY `FK_UserRoles_Roles_RoleId` (`RoleId`),
  KEY `FK_UserRoles_Users_UserId` (`UserId`),
  CONSTRAINT `FK_UserRoles_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_UserRoles_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userroles
-- ----------------------------
INSERT INTO `userroles` VALUES ('1b063868-1374-47ad-8460-1441c1e6ec36', 'c8033529-c2f7-4b32-877f-06004f05f7fe', '1b063868-1374-47ad-8460-1441c1e6ec36');
INSERT INTO `userroles` VALUES ('97698f4d-336b-4c3e-b5dd-fe34c535170f', '9826bf93-e499-4b53-9ed9-8bbf1a4fec61', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c');
INSERT INTO `userroles` VALUES ('37da0768-4100-4ff3-b9d7-0cc58aae2a7c', 'c8033529-c2f7-4b32-877f-06004f05f7fe', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c');
INSERT INTO `userroles` VALUES ('5fbafd9c-b304-4925-a636-fbb69259df62', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', '37da0768-4100-4ff3-b9d7-0cc58aae2a7c');
INSERT INTO `userroles` VALUES ('65b648f3-f1e5-4835-9ae3-ca3ea690e4c1', '32c8242b-ebc2-4c88-b367-65a0b46101e6', '40cb9316-44e3-42db-a757-01bada1d49f4');
INSERT INTO `userroles` VALUES ('eeb07965-d3a9-4483-8baf-8db5c68f9f4e', '04b555d5-508a-47b9-86eb-af44095fb729', '85aebb2d-7076-45c6-90c2-a679f98bae6b');
INSERT INTO `userroles` VALUES ('97b6bfc4-bdb9-4501-9109-de0e494c9d91', '04b555d5-508a-47b9-86eb-af44095fb729', 'a9317937-0d3d-11e7-b1d9-408d5cd46d51');
INSERT INTO `userroles` VALUES ('2e3c15ec-163e-42b9-b805-4399cd409b83', '2cc0fe62-8762-4ece-8658-e9b7b233a44f', 'a9317937-0d3d-11e7-b1d9-408d5cd46d51');
INSERT INTO `userroles` VALUES ('11a11cf4-0d3e-11e7-b1d9-408d5cd46d51', 'd3c66ff8-0d3d-11e7-b1d9-408d5cd46d51', 'a9317937-0d3d-11e7-b1d9-408d5cd46d51');
INSERT INTO `userroles` VALUES ('171f7c7a-0d3e-11e7-b1d9-408d5cd46d51', 'daecc098-0d3d-11e7-b1d9-408d5cd46d51', 'a9317937-0d3d-11e7-b1d9-408d5cd46d51');
INSERT INTO `userroles` VALUES ('e97d0e7b-a47f-4b90-9f6e-98d4a8579737', '2cc0fe62-8762-4ece-8658-e9b7b233a44f', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51');
INSERT INTO `userroles` VALUES ('0a7a2506-0af2-11e7-9a05-408d5cd46d51', 'fa8d1ec1-0af1-11e7-9a05-408d5cd46d51', 'b1fecad6-0aec-11e7-9a05-408d5cd46d51');
INSERT INTO `userroles` VALUES ('34453441-0af2-11e7-9a05-408d5cd46d51', '26956c65-0af2-11e7-9a05-408d5cd46d51', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51');
INSERT INTO `userroles` VALUES ('ed158a70-d706-4938-8767-cd0ef8580349', '4d357528-be0f-4f7c-ab6c-cc4d61c720d2', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51');
INSERT INTO `userroles` VALUES ('2a19c932-0d3e-11e7-b1d9-408d5cd46d51', 'e57dad65-0d3d-11e7-b1d9-408d5cd46d51', 'bab0aa41-0aec-11e7-9a05-408d5cd46d51');
INSERT INTO `userroles` VALUES ('df1e40be-fa01-4b2e-b231-a8321c60a4b7', 'f73e34b0-b687-4eab-9a01-b13cca479319', 'c7751731-abcf-4aba-aeae-ae11451d97a7');
INSERT INTO `userroles` VALUES ('0eacef41-0af1-11e7-9a05-408d5cd46d51', '04b2c8ec-0af1-11e7-9a05-408d5cd46d51', 'c846926d-0aec-11e7-9a05-408d5cd46d51');
INSERT INTO `userroles` VALUES ('b042a734-6a5c-454f-bd71-d35dc769971f', 'd9593347-b0c7-4bb4-9a83-789c12cb7055', 'c846926d-0aec-11e7-9a05-408d5cd46d51');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Id` varchar(100) NOT NULL COMMENT '编号',
  `LoginName` varchar(50) NOT NULL COMMENT '登录名',
  `Password` varchar(50) NOT NULL COMMENT '密码',
  `IsLockout` char(2) DEFAULT '否' COMMENT '是否锁定',
  `LastLoginTime` timestamp NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `PsdWrongTime` int(11) DEFAULT '0' COMMENT '密码错误次数',
  `LockTime` timestamp NULL DEFAULT NULL COMMENT '被锁定时间',
  `ProtectEMail` varchar(200) DEFAULT NULL COMMENT '密保邮箱',
  `protectMTel` varchar(11) DEFAULT NULL COMMENT '密保手机号',
  `CreateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '账户创立时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IndexUnique_LoginName` (`LoginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('04b2c8ec-0af1-11e7-9a05-408d5cd46d51', '咨询经理1', '67b6d1d5f7855230ddf8dcdadfc732d5', '否', '2018-06-04 17:36:51', '0', null, 'zyjl@163.com', '13552143099', '2017-03-17 17:06:34');
INSERT INTO `users` VALUES ('04b555d5-508a-47b9-86eb-af44095fb729', '张磊', 'ysd123', '否', '2018-05-19 00:44:57', '0', null, '123@qq.com', '15238311712', '2017-03-03 10:46:57');
INSERT INTO `users` VALUES ('26956c65-0af2-11e7-9a05-408d5cd46d51', '咨询师1', '978042ffceedb78349bd316b8ca9ae4c', '否', '2018-06-05 15:17:21', '0', null, 'zxs1@163.com', '15511111111', '2017-03-17 17:14:40');
INSERT INTO `users` VALUES ('2cc0fe62-8762-4ece-8658-e9b7b233a44e', '冯建浩1', 'ysd123', '否', null, '0', null, null, null, null);
INSERT INTO `users` VALUES ('2cc0fe62-8762-4ece-8658-e9b7b233a44f', '冯建浩', 'ysd123', '否', null, '0', null, 'null', 'null', null);
INSERT INTO `users` VALUES ('32c8242b-ebc2-4c88-b367-65a0b46101e6', '褚庆瑞', 'ysd123', '否', null, '3', null, '1231@163.com', '131313', '2017-03-05 10:47:00');
INSERT INTO `users` VALUES ('32c8242b-ebc2-4c88-b367-65a0b46101e9', '褚庆瑞1', 'ysd123', '否', null, '3', null, '1231@163.com', '131313', '2017-03-05 10:47:00');
INSERT INTO `users` VALUES ('351035f9-0ec4-43d7-8d7d-b66207ee85f5', '王化', 'ysd123', '否', '2017-03-01 10:43:53', '0', null, '123@qq.com', '15623562365', null);
INSERT INTO `users` VALUES ('3a3a9eae-30ac-11e7-8602-408d5cd46d51', '张三三', 'ysd123', '否', '2017-05-04 17:31:49', '0', null, '12313@163.com', '13552143099', '2017-05-04 17:29:53');
INSERT INTO `users` VALUES ('3a4d433f-acb4-4bd1-97f9-c86e189a0108', '4bd1b1ea-788b-4364-89d9-6ae69212e0ab', 'beec059270d0de706ccc563e4991331c', '否', null, '0', null, 'qqq', 'qqq', '2018-06-05 15:13:26');
INSERT INTO `users` VALUES ('3aa8a351-aa72-4925-9376-d647678c998b', '张海宁', 'ysd123', '否', '2017-03-08 10:43:57', '0', null, null, '4545', null);
INSERT INTO `users` VALUES ('4b920d7a-60d8-4f41-85f2-bdccbee3b259', '蔡振华', 'ysd123', '否', '2017-03-03 10:44:01', '0', null, null, null, null);
INSERT INTO `users` VALUES ('4d01ff82-2f88-4e56-afe1-bef2ed1dd789', '王亚丹', 'ysd123', '否', '2017-03-14 10:44:04', '0', null, null, null, null);
INSERT INTO `users` VALUES ('4d357528-be0f-4f7c-ab6c-cc4d61c720d2', 'm1', '5a6ec39d4301765d66d8df92b41ab39d', '否', '2018-06-05 15:16:35', '0', null, 'asd', 'asd', '2018-06-05 15:15:55');
INSERT INTO `users` VALUES ('4f476d37-c750-455f-8844-f42de2b25df8', '靳培', 'ysd123', '否', '2017-02-26 10:44:12', '0', null, null, null, null);
INSERT INTO `users` VALUES ('554678c1-6be0-4234-a4d1-b4ca8c785afc', '姜涛', 'ysd123', '否', '2017-03-20 10:44:16', '0', null, null, null, null);
INSERT INTO `users` VALUES ('55fc1ea7-3fd0-4538-b151-688096eb40c7', '何芦', 'ysd123', '否', '2017-03-15 10:44:18', '0', null, null, null, null);
INSERT INTO `users` VALUES ('5a5c02bb-29c6-4604-84a0-aab33b1973fd', '罗欣怡', 'ysd123', '否', '2017-03-17 10:44:21', '0', null, '1231@qq.com', '1213', null);
INSERT INTO `users` VALUES ('5a9b5595-0246-11e7-8001-408d5cd46d51', 'qinkui', '123456', '否', '2017-03-12 10:44:26', '0', null, '123@163.com', '13552143099', '2017-03-06 16:24:45');
INSERT INTO `users` VALUES ('69a8e982-a031-4109-81a2-aacbf0c81cf2', '刘丽', 'ysd123', '否', '2017-03-06 10:44:28', '4', null, null, null, null);
INSERT INTO `users` VALUES ('6ae6cffc-e617-47e7-bb51-78f7f00054a2', '赵云', 'ysd123', '否', '2017-03-04 10:44:36', '1', null, null, '54545', null);
INSERT INTO `users` VALUES ('71893b53-5e48-483a-ad60-b30cac0d1a82', '肇慧慧', 'ysd123', '否', '2017-03-03 10:44:33', '3', null, null, null, null);
INSERT INTO `users` VALUES ('72a64cb4-56f0-4b39-b194-e158d7e54c51', '王彤', 'ysd123', '否', '2017-02-28 10:44:31', '0', null, null, null, null);
INSERT INTO `users` VALUES ('748073b2-faeb-45c1-974d-327dfb5abfdc', '安坤', 'ysd123', '否', '2017-03-19 10:44:38', '0', null, null, '4545', '2017-02-27 10:47:08');
INSERT INTO `users` VALUES ('75e3dac3-ef02-4304-b4f5-f1ce983605f7', '杜俊霞', 'ysd123', '否', '2017-02-26 10:44:44', '0', '2017-03-09 10:45:51', '1231@163.com', null, null);
INSERT INTO `users` VALUES ('805bbe23-2a1d-4cc3-9bd3-9ae402d68257', '刘丹', 'ysd123', '否', '2017-02-27 10:44:40', '0', '2017-03-07 10:45:55', null, null, null);
INSERT INTO `users` VALUES ('817a479e-bba9-4937-9457-5d99aafa3bbb', '王伟', 'ysd123', '是', '2017-02-06 10:44:47', '0', null, null, null, null);
INSERT INTO `users` VALUES ('81fc33f2-f3c9-4b30-b0ec-3bf2c47d64cf', '3d12e88d-2fc9-47fe-84a7-4e71f59d0092', '7e628ad7662eb162242197e93d830942', '否', null, '0', null, 'qqqq', 'qqqq', '2018-06-05 15:13:36');
INSERT INTO `users` VALUES ('826ac62a-be24-44b4-9a9b-d60ad5683a58', '刘慧芳', 'ysd123', '否', '2017-03-13 10:44:51', '0', null, null, null, null);
INSERT INTO `users` VALUES ('8441bbd5-24f2-4dba-abc3-467b626dc564', '钟方方', 'ysd123', '否', '2017-03-20 10:45:21', '0', null, null, '45454545', '2017-02-26 10:47:11');
INSERT INTO `users` VALUES ('84eb42f1-5715-4bde-b935-7680e964cf6e', '史晓伦', 'ysd123', '否', '2017-02-14 10:45:24', '0', null, '1231@163.com', null, null);
INSERT INTO `users` VALUES ('872a596e-65a4-40ed-8d00-ff04f7f9513c', '赵华伟', 'ysd123', '否', '2017-03-12 10:45:30', '0', null, null, null, null);
INSERT INTO `users` VALUES ('89bb4648-c560-47a0-af0b-92a812412cb6', '刘珂江', 'ysd123', '否', '2017-03-04 10:45:34', '0', '2017-03-03 10:45:58', null, null, null);
INSERT INTO `users` VALUES ('8d8bf51f-ea06-49b8-ba2f-187e205ece3b', '84b536e3-1e7a-4799-9210-f1518aeb07c2', '41dc45922a70721481738e679ed3b9db', '否', null, '0', null, 'qqq', 'qqq', '2018-06-05 15:13:43');
INSERT INTO `users` VALUES ('8fc76093-86a2-473e-b4a9-64bf6bb2a56f', '杨明明', 'ysd123', '否', '2017-03-06 10:45:32', '0', null, null, '86787868', null);
INSERT INTO `users` VALUES ('92036539-2261-4113-9afe-640b1fd7287d', '高真真', 'ysd123', '否', '2017-03-05 10:45:37', '0', null, '1231@163.com', null, '2017-03-03 10:47:14');
INSERT INTO `users` VALUES ('92ef5f19-f92d-494e-97f5-7f162d80ce09', '葛海洋', 'ysd123', '否', '2017-02-26 10:45:40', '0', null, null, null, null);
INSERT INTO `users` VALUES ('964a4ce2-cbbd-4822-b925-8fa203154565', '韩静', 'ysd123', '否', '2017-03-14 10:45:43', '0', '2017-03-04 10:46:00', null, '131313', null);
INSERT INTO `users` VALUES ('9826bf93-e499-4b53-9ed9-8bbf1a4fec61', '郭震', 'ysd123', '否', null, '0', null, null, null, null);
INSERT INTO `users` VALUES ('9f098f85-0477-11e7-b821-408d5cd46d51', '秦奎', 'ysd123', '否', null, '0', null, '123@163.com', '110', '2017-03-09 11:22:27');
INSERT INTO `users` VALUES ('9f314cd8-fadb-4258-b260-bfe372ae492b', '杨俊', 'ysd123', '否', null, '0', null, '1231@163.com', null, '2017-03-05 10:47:16');
INSERT INTO `users` VALUES ('af76b57d-3f79-4ff0-91fa-10566ed27d56', '楚佳佳', 'ysd123', '否', null, '0', null, '1231@163.com', null, null);
INSERT INTO `users` VALUES ('afb32aba-c0a5-444b-ba54-199a15d6beb5', '张丹', 'ysd123', '否', null, '0', '2017-03-13 10:46:02', '1231@163.com', '131313131', null);
INSERT INTO `users` VALUES ('b5b99bae-0def-42c3-9a4e-abb6945f81f4', '余娜', 'ysd123', '否', null, '0', null, null, null, null);
INSERT INTO `users` VALUES ('b6fdee58-e9e4-4efc-bb4b-44c46fd81893', '张轩', 'ysd123', '否', null, '0', null, null, null, '2017-03-11 10:47:20');
INSERT INTO `users` VALUES ('bad4ab93-ee61-4d7a-81ae-50df256c86ac', '汤旦', 'ysd123', '否', null, '0', '2017-03-11 10:46:05', null, '3453535', null);
INSERT INTO `users` VALUES ('c477e0dd-d136-4009-9ebe-60dea0bb621e', 'admin2', 'ysd123', '否', null, '0', null, '1231@163.com', null, null);
INSERT INTO `users` VALUES ('c631f2ba-934d-49c4-a216-4b2da648b86b', '张丹莉', 'ysd123', '否', null, '0', null, null, null, null);
INSERT INTO `users` VALUES ('c67e271b-ee1c-4f03-985b-b79c1cabdc83', '马帅', 'ysd123', '否', null, '0', null, null, '13131313', null);
INSERT INTO `users` VALUES ('c8033529-c2f7-4b32-877f-06004f05f7fe', '孙磊', 'ysd123', '否', null, '0', null, '1231@163.com', null, null);
INSERT INTO `users` VALUES ('c97d9590-f7d7-48bd-a01f-0439a7828a1d', 'www', '604d98c5543894c49122b885c7b917bc', '否', '2018-05-27 20:00:04', '0', '2018-05-26 17:54:35', '1121@qq.com', '152', '2018-05-19 19:42:14');
INSERT INTO `users` VALUES ('cb2829be-bad3-4c05-98f7-17a7aa973bcc', '张国钰', 'ysd123', '否', '2017-03-25 10:45:17', '0', '2017-03-12 10:46:08', null, null, '2017-03-02 10:47:22');
INSERT INTO `users` VALUES ('cea22fdc-1d03-4b8b-918a-3813e7b47bbb', '武丹丹', 'ysd123', '否', '2017-03-29 10:45:14', '0', null, null, null, null);
INSERT INTO `users` VALUES ('cea22fdc-1d03-4b8b-918a-3813e7b47bbc', '武丹丹1', 'ysd123', '否', '2017-03-29 10:45:14', '0', null, null, null, null);
INSERT INTO `users` VALUES ('d3c66ff8-0d3d-11e7-b1d9-408d5cd46d51', '网推1', 'ysd123', '否', null, '0', null, '123@163.com', '13552143099', '2017-03-20 15:21:34');
INSERT INTO `users` VALUES ('d3c66ff8-0d3d-11e7-b1d9-408d5cd46d52', '网推11', 'ysd123', '否', null, '0', null, '123@163.com', '13552143099', '2017-03-20 15:21:34');
INSERT INTO `users` VALUES ('d9593347-b0c7-4bb4-9a83-789c12cb7055', '管理员', '66675f1cc5517db624c3290f7eda34fd', '否', '2018-06-05 22:41:56', '0', null, '123456@qq.com', '123333', '2018-06-03 15:47:05');
INSERT INTO `users` VALUES ('d9dc826c-8d01-467b-9d70-d337f22068dc', '孙新丽', 'ysd123', '否', '2017-03-19 10:45:09', '3', null, null, '13131313', null);
INSERT INTO `users` VALUES ('d9dc826c-8d01-467b-9d70-d337f22068dd', '孙新丽1', 'ysd123', '否', '2017-03-19 10:45:09', '3', null, null, '13131313', null);
INSERT INTO `users` VALUES ('daecc098-0d3d-11e7-b1d9-408d5cd46d51', '网推2', 'ysd123', '否', null, '0', null, '123@163.com', '13552143099', '2017-03-20 15:21:46');
INSERT INTO `users` VALUES ('daecc098-0d3d-11e7-b1d9-408d5cd46d52', '网推21', 'ysd123', '否', null, '0', null, '123@163.com', '13552143099', '2017-03-20 15:21:46');
INSERT INTO `users` VALUES ('dbebb83a-7d09-494d-89fb-2333b0576978', '马纪垒', 'ysd123', '否', '2017-03-13 10:45:01', '0', '2017-03-05 10:46:11', null, null, '2017-03-06 10:47:25');
INSERT INTO `users` VALUES ('dbebb83a-7d09-494d-89fb-2333b0576979', '马纪垒1', 'ysd123', '否', '2017-03-13 10:45:01', '0', '2017-03-05 10:46:11', null, null, '2017-03-06 10:47:25');
INSERT INTO `users` VALUES ('e1ff3dd0-3644-4ffd-bb36-1fb7f306aa5e', '李孟秋1', 'ysd123', '否', '2017-03-04 10:45:03', '0', null, '1231@163.com', null, null);
INSERT INTO `users` VALUES ('e1ff3dd0-3644-4ffd-bb36-1fb7f306aa5f', '李孟秋', 'ysd123', '否', '2017-03-04 10:45:03', '0', null, '1231@163.com', null, null);
INSERT INTO `users` VALUES ('e57dad65-0d3d-11e7-b1d9-408d5cd46d51', '咨询师2', 'ysd123', '否', '2017-04-05 10:49:12', '0', null, '123@163.com', '13552143099', '2017-03-20 15:22:04');
INSERT INTO `users` VALUES ('e57dad65-0d3d-11e7-b1d9-408d5cd46d52', '咨询师21', 'ysd123', '否', '2017-04-05 10:49:12', '0', null, '123@163.com', '13552143099', '2017-03-20 15:22:04');
INSERT INTO `users` VALUES ('f2c0fa95-9c5f-4337-aaf5-0bd9c5b79833', '贾会桃', 'ysd123', '否', '2017-02-28 10:45:06', '0', null, null, null, null);
INSERT INTO `users` VALUES ('f2c0fa95-9c5f-4337-aaf5-0bd9c5b79834', '贾会桃1', 'ysd123', '否', '2017-02-28 10:45:06', '0', null, null, null, null);
INSERT INTO `users` VALUES ('f5c32fb0-740d-49bf-aaa0-70772d2acfc5', '张沛杰', 'ysd123', '否', '2017-03-13 10:44:56', '0', null, null, '4353535', null);
INSERT INTO `users` VALUES ('f5c32fb0-740d-49bf-aaa0-70772d2acfc6', '张沛杰1', 'ysd123', '否', '2017-03-13 10:44:56', '0', null, null, '4353535', null);
INSERT INTO `users` VALUES ('f73e34b0-b687-4eab-9a01-b13cca479318', '杨长岭', 'ysd123', '否', '2017-02-26 10:44:59', '0', '2017-03-01 10:46:16', '1231@163.com', null, null);
INSERT INTO `users` VALUES ('f73e34b0-b687-4eab-9a01-b13cca479319', '杨长岭1', 'ysd123', '否', '2017-02-26 10:44:59', '0', '2017-03-01 10:46:16', '1231@163.com', null, null);
INSERT INTO `users` VALUES ('fa8d1ec1-0af1-11e7-9a05-408d5cd46d51', '网络咨询1', '53e027460f3548d1561a85d17ba8abfb', '否', '2018-06-03 14:13:49', '0', null, '123@163.com', '13345678900', '2017-03-17 17:13:26');

-- ----------------------------
-- Procedure structure for askerId_dynamicmessage_proc
-- ----------------------------
DROP PROCEDURE IF EXISTS `askerId_dynamicmessage_proc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `askerId_dynamicmessage_proc`(IN `askerId` varchar(50))
BEGIN
	
select * from dynamicmessages where StudentId in (select id from students where AskerId=`askerId`) and IsOpen='否';

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for noroleid_permission_proc
-- ----------------------------
DROP PROCEDURE IF EXISTS `noroleid_permission_proc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `noroleid_permission_proc`(IN `roleId` varchar(50))
BEGIN
	#Routine body goes here...
SELECT * from permission where permissionId not in( select permissionId from rolepermission where roleid=`roleId` );
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for noUser_role_proc
-- ----------------------------
DROP PROCEDURE IF EXISTS `noUser_role_proc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `noUser_role_proc`(in un VARCHAR(50))
BEGIN
	#Routine body goes here...
	select * from roles where Id 
not in (select RoleId from users `user` left join userroles ur on user.id=ur.UserId where LoginName=`un`) and Id not in(select deleteId from recycling where deleteTable='roles');
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for roleId_permission_proc
-- ----------------------------
DROP PROCEDURE IF EXISTS `roleId_permission_proc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `roleId_permission_proc`(IN  rolesId varchar(50))
BEGIN
	#Routine body goes here...
SELECT * from permission where permissionId  in( select permissionId from rolepermission where roleid=`rolesId` );
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for roleName_permission_proc
-- ----------------------------
DROP PROCEDURE IF EXISTS `roleName_permission_proc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `roleName_permission_proc`(IN `f_string` varchar(1000))
BEGIN
	#Routine body goes here...
  declare cnt int default 0;
  declare i int default 0;
  set cnt = func_get_split_string_total(f_string,",");
  drop table if exists tmp_print;
  create temporary table tmp_print (num varchar(200) not null);
  while i < cnt
  do
    set i = i + 1;
    insert into tmp_print(num) values (func_get_split_string(f_string,",",i));
  end while;
	SELECT * from permission where permissionId in (select permissionId from roles r left join rolepermission rm on r.id=rm.roleId where Name in (select * from tmp_print));
  

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for role_module_proc
-- ----------------------------
DROP PROCEDURE IF EXISTS `role_module_proc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `role_module_proc`(IN f_string varchar(1000))
BEGIN
  -- Get the separated string.
  declare cnt int default 0;
  declare i int default 0;
  set cnt = func_get_split_string_total(f_string,",");
  drop table if exists tmp_print;
  create temporary table tmp_print (num varchar(200) not null);
  while i < cnt
  do
    set i = i + 1;
    insert into tmp_print(num) values (func_get_split_string(f_string,",",i));
  end while;
	SELECT * from modules where id in 
(select ModuleId from roles r left join rolemodules rm on r.id=rm.RoleId where Name in (select * from tmp_print)) 
and Id not in(select deleteId from recycling where deleteTable='modules')
ORDER BY Weight desc;
  

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for user_role_proc
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_role_proc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_role_proc`(in un VARCHAR(50))
BEGIN
    select * from roles where Id in 
(select RoleId from users `user` left join userroles ur on user.id=ur.UserId where LoginName=`un`) and Id not in(select deleteId from recycling where deleteTable='roles');
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for user_role_procall
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_role_procall`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_role_procall`(in un VARCHAR(50))
BEGIN
	#Routine body goes here...
    select * from roles where Id in 
(select RoleId from users `user` left join userroles ur on user.id=ur.UserId where LoginName=`un`);
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for func_get_split_string
-- ----------------------------
DROP FUNCTION IF EXISTS `func_get_split_string`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_get_split_string`(f_string varchar(1000),f_delimiter varchar(5),f_order int) RETURNS varchar(255) CHARSET utf8 COLLATE utf8_bin
BEGIN
  -- Get the separated number of given string.
  declare result varchar(255) default '';
  set result = reverse(substring_index(reverse(substring_index(f_string,f_delimiter,f_order)),f_delimiter,1));
  return result;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for func_get_split_string_total
-- ----------------------------
DROP FUNCTION IF EXISTS `func_get_split_string_total`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_get_split_string_total`(f_string varchar(1000),f_delimiter varchar(5)) RETURNS int(11)
BEGIN
  -- Get the total number of given string.
  return 1+(length(f_string) - length(replace(f_string,f_delimiter,'')));
END
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
