/*
Navicat MySQL Data Transfer

Source Server         : weixin
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : wexin

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2017-09-12 10:11:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '活动标题',
  `content` text NOT NULL COMMENT '活动内容',
  `start` int(255) unsigned NOT NULL COMMENT '活动开始日期',
  `end` int(255) unsigned NOT NULL COMMENT '结束日期',
  `time` int(10) unsigned NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for codes
-- ----------------------------
DROP TABLE IF EXISTS `codes`;
CREATE TABLE `codes` (
  `cide_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '代码',
  `user_id` int(10) unsigned NOT NULL COMMENT '所属会员',
  `money` decimal(9,2) unsigned NOT NULL COMMENT '代金卷金额',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1表示未使用，2表示已使用',
  PRIMARY KEY (`cide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of codes
-- ----------------------------

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `name` varchar(255) NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------

-- ----------------------------
-- Table structure for histories
-- ----------------------------
DROP TABLE IF EXISTS `histories`;
CREATE TABLE `histories` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `member_id` int(10) unsigned NOT NULL COMMENT '服务员工id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型，1为充值2为消费',
  `amount` decimal(9,2) unsigned NOT NULL COMMENT '金额',
  `content` text NOT NULL COMMENT '消费内容',
  `time` int(10) unsigned NOT NULL COMMENT '消费时间',
  `remainder` decimal(9,2) unsigned NOT NULL COMMENT '余额',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of histories
-- ----------------------------

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `member_id` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT '员工ID',
  `username` varchar(255) NOT NULL COMMENT '员工姓名',
  `password` varchar(255) NOT NULL COMMENT '员工密码',
  `realname` varchar(255) NOT NULL COMMENT '姓名',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1代表男，2代表女',
  `telephone` int(11) unsigned NOT NULL COMMENT '电话号码',
  `group_id` int(10) unsigned NOT NULL COMMENT '所在部门的ID',
  `last_login` int(255) unsigned NOT NULL COMMENT '最后登录时间',
  `last_loginip` int(15) NOT NULL COMMENT '最后登录ip',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1表示不是管理员，2表示是管理员',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES ('1', 'zhagnsan', '123456', 'zhangsan1', '1', '112123213', '1', '3123133123', '123224', '2', '');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `phone` int(11) unsigned NOT NULL COMMENT '电话',
  `realname` varchar(255) NOT NULL COMMENT '姓名',
  `barber` varchar(255) NOT NULL COMMENT '预约美发师',
  `content` text NOT NULL COMMENT '备注',
  `date` int(20) unsigned NOT NULL COMMENT '预约时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '预约状态，1表示未处理，2表示成功，3表示失败',
  `reply` text NOT NULL COMMENT '回复信息',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for plans
-- ----------------------------
DROP TABLE IF EXISTS `plans`;
CREATE TABLE `plans` (
  `plan_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '套餐名称',
  `des` text NOT NULL COMMENT '套餐描述',
  `money` decimal(9,2) unsigned NOT NULL COMMENT '套餐金额',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，1表示上线，2表示下线',
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plans
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '会员名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `realname` varchar(255) NOT NULL COMMENT '姓名',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1表示男，2表示女',
  `telephone` int(11) NOT NULL COMMENT '电话号码',
  `remark` text NOT NULL COMMENT '备注',
  `money` decimal(9,2) unsigned zerofill NOT NULL COMMENT '余额',
  `is_vip` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1代表不是VIP 2代表是Vip',
  `photo` varchar(255) NOT NULL COMMENT '头像',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '落幕', '123456', '黄鑫', '1', '1878245100', '很牛逼的Vip', '0500000.60', '2', '');
