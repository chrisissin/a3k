-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jun 29, 2009 at 03:16 AM
-- Server version: 5.0.67
-- PHP Version: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `a3k`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_brohood`
-- 

CREATE TABLE `a3k_brohood` (
  `pkid` int(11) NOT NULL auto_increment COMMENT 'pk',
  `p_id` int(10) default '0' COMMENT 'me',
  `b_p_id` int(10) default '0' COMMENT 'my friend',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT 'timestamp',
  PRIMARY KEY  (`pkid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='a3k brother hood' AUTO_INCREMENT=15 ;

-- 
-- Dumping data for table `a3k_brohood`
-- 

INSERT INTO `a3k_brohood` VALUES (1, 21, 1, '2009-06-26 11:34:16');
INSERT INTO `a3k_brohood` VALUES (2, 21, 22, '2009-06-26 11:34:16');
INSERT INTO `a3k_brohood` VALUES (3, 21, 1, '2009-06-26 11:45:55');
INSERT INTO `a3k_brohood` VALUES (4, 21, 22, '2009-06-26 11:45:55');
INSERT INTO `a3k_brohood` VALUES (5, 21, 1, '2009-06-26 11:45:55');
INSERT INTO `a3k_brohood` VALUES (6, 21, 22, '2009-06-26 11:45:55');
INSERT INTO `a3k_brohood` VALUES (7, 21, 1, '2009-06-26 11:46:40');
INSERT INTO `a3k_brohood` VALUES (8, 21, 22, '2009-06-26 11:46:40');
INSERT INTO `a3k_brohood` VALUES (9, 21, 1, '2009-06-26 11:46:53');
INSERT INTO `a3k_brohood` VALUES (10, 21, 22, '2009-06-26 11:46:53');
INSERT INTO `a3k_brohood` VALUES (11, 21, 1, '2009-06-26 11:46:56');
INSERT INTO `a3k_brohood` VALUES (12, 21, 22, '2009-06-26 11:46:56');
INSERT INTO `a3k_brohood` VALUES (13, 21, 1, '2009-06-26 12:09:31');
INSERT INTO `a3k_brohood` VALUES (14, 21, 22, '2009-06-26 12:09:31');

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_fellow`
-- 

CREATE TABLE `a3k_fellow` (
  `p_owner` varchar(10) NOT NULL default '0' COMMENT '五將主人',
  `p_id` int(10) unsigned NOT NULL auto_increment,
  `p_at` int(10) unsigned NOT NULL default '0' COMMENT '攻擊力',
  `p_df` int(10) unsigned NOT NULL default '0' COMMENT '防禦力',
  `p_agl` int(10) unsigned NOT NULL default '0' COMMENT '速度',
  `p_rankname` varchar(20) NOT NULL COMMENT '官階',
  `p_str` int(10) unsigned NOT NULL COMMENT '力量',
  `p_smart` int(10) unsigned NOT NULL COMMENT '智力',
  `p_vit` int(10) unsigned NOT NULL COMMENT '體質',
  `p_bone` int(10) unsigned NOT NULL COMMENT '根骨',
  `p_name` varchar(20) NOT NULL default '--' COMMENT '五將名',
  `p_hp` int(10) unsigned NOT NULL default '0' COMMENT '體力',
  `p_lv` int(10) unsigned NOT NULL default '0' COMMENT '等級',
  `p_img` varchar(25) default NULL COMMENT '圖檔名',
  `p_hpmax` int(10) unsigned NOT NULL default '0' COMMENT '體力最大',
  `p_mn` int(10) unsigned NOT NULL default '0' COMMENT '精神力',
  `p_mnmax` int(10) unsigned NOT NULL default '0' COMMENT '精神力最大',
  `p_exp` int(10) unsigned NOT NULL default '0' COMMENT '目前經驗值',
  `p_nextexp` int(10) unsigned NOT NULL COMMENT '升級所需經驗職',
  `role_id` varchar(10) NOT NULL COMMENT '職業',
  `faith` int(10) unsigned NOT NULL COMMENT '忠誠',
  `fl_id` varchar(10) NOT NULL default '0' COMMENT '武將類行(fk to a3k_fellowshop.fl_id)',
  PRIMARY KEY  USING BTREE (`p_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='玩家的武將' AUTO_INCREMENT=49 ;

-- 
-- Dumping data for table `a3k_fellow`
-- 

INSERT INTO `a3k_fellow` VALUES ('4', 1, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '獵戶小鐵', 50, 1, 'h0010', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('2', 2, 20, 20, 17, '墨門弟子', 17, 15, 15, 15, '獵戶小鐵', 73, 4, 'h0020', 73, 49, 49, 99, 175, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('3', 3, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '獵戶小鐵', 50, 1, 'h0030', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('4', 4, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '獵戶小鐵', 45, 1, 'h0040', 50, 30, 30, 52, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('27', 5, 20, 20, 15, '墨門弟子', 15, 10, 13, 15, '少年馬超', 50, 1, 'h0030', 57, 30, 30, 88, 100, 'a02', 10, '50');
INSERT INTO `a3k_fellow` VALUES ('6', 6, 20, 20, 13, '墨門弟子', 12, 12, 11, 11, '胡車兒', 29, 2, 'h0060', 57, 30, 37, 2, 150, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('7', 7, 20, 20, 13, '墨門弟子', 11, 11, 12, 12, '胡車兒', 58, 2, 'h0070', 58, 35, 35, 100, 150, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('8', 8, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '胡車兒', 50, 1, 'h0080', 50, 30, 30, 45, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('5', 9, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '劉備', 50, 1, 'h0010', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('5', 10, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '關羽', 50, 1, 'h0020', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('5', 11, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '張飛', 50, 1, 'h0030', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('5', 12, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '諸葛亮', 50, 1, 'h0040', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('5', 13, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '馬超', 50, 1, 'h0050', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('1', 14, 20, 20, 36, '墨者', 34, 33, 28, 30, '胡車兒', 138, 14, 'h0060', 142, 115, 115, 257, 375, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('15', 15, 20, 20, 13, '墨門弟子', 12, 11, 12, 11, '胡車兒', 58, 2, 'h0070', 58, 35, 35, 2, 150, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('3', 16, 20, 20, 12, '墨門弟子', 12, 12, 11, 11, '胡車兒', 57, 2, 'h0080', 57, 37, 37, 5, 150, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('1', 17, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '劉備', 41, 1, 'h0010', 50, 30, 30, 64, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('1', 18, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '關羽', 50, 1, 'h0020', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('1', 19, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '張飛', 50, 1, 'h0030', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('1', 20, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '諸葛亮', 50, 1, 'h0040', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('1', 21, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '馬超', 50, 1, 'h0050', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('2', 22, 20, 20, 16, '墨門弟子', 13, 15, 14, 16, '劉備', 23, 4, 'h0010', 71, 37, 49, 60, 175, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('2', 23, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '關羽', 50, 1, 'h0020', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('2', 24, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '張飛', 50, 1, 'h0030', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('2', 25, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '諸葛亮', 50, 1, 'h0040', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('2', 26, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '馬超', 50, 1, 'h0050', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('3', 27, 20, 20, 14, '墨門弟子', 15, 12, 13, 13, '劉備', 65, 3, 'h0010', 65, 40, 40, 144, 200, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('3', 28, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '關羽', 50, 1, 'h0020', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('3', 29, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '張飛', 50, 1, 'h0030', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('3', 30, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '諸葛亮', 50, 1, 'h0040', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('3', 31, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '馬超', 50, 1, 'h0050', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('4', 32, 20, 20, 22, '墨門弟子', 17, 19, 17, 19, '劉備', 86, 6, 'h0010', 86, 63, 63, 129, 350, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('4', 33, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '關羽', 50, 1, 'h0020', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('4', 34, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '張飛', 50, 1, 'h0030', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('4', 35, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '諸葛亮', 50, 1, 'h0040', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('4', 36, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '馬超', 50, 1, 'h0050', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('5', 37, 20, 20, 17, '墨門弟子', 16, 17, 15, 16, '劉備', 78, 5, 'h0010', 78, 56, 56, 14, 300, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('5', 38, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '關羽', 50, 1, 'h0020', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('5', 39, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '張飛', 50, 1, 'h0030', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('5', 40, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '諸葛亮', 50, 1, 'h0040', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('5', 41, 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '馬超', 50, 1, 'h0050', 50, 30, 30, 0, 100, 'a01', 10, '0');
INSERT INTO `a3k_fellow` VALUES ('1', 42, 100, 100, 100, '墨者', 100, 100, 100, 100, '革離', 100, 100, 'h0020', 100, 100, 100, 0, 10, 'a02', 100, '1');
INSERT INTO `a3k_fellow` VALUES ('16', 43, 20, 20, 25, '墨門弟子', 24, 16, 20, 23, '少年馬超', 22, 5, 'h0050', 85, 49, 54, 11, 300, 'a02', 10, '50');
INSERT INTO `a3k_fellow` VALUES ('1', 44, 20, 20, 15, '墨門弟子', 15, 10, 13, 15, '少年馬超', 50, 1, 'h0050', 50, 30, 30, 0, 100, 'a02', 10, '50');
INSERT INTO `a3k_fellow` VALUES ('17', 45, 127, 81, 61, '伍長', 68, 39, 44, 46, '少年馬超', 204, 21, 'h0050', 204, 148, 148, 641, 900, 'a02', 10, '50');
INSERT INTO `a3k_fellow` VALUES ('27', 46, 66, 46, 32, '墨門弟子', 35, 21, 25, 28, '少年馬超', 95, 9, 'h0050', 117, 59, 76, 229, 500, 'a02', 10, '50');
INSERT INTO `a3k_fellow` VALUES ('17', 47, 20, 20, 12, '墨門弟子', 12, 13, 20, 11, '少年劉備', 50, 1, 'h0010', 50, 30, 30, 0, 100, 'b01', 10, '51');
INSERT INTO `a3k_fellow` VALUES ('17', 48, 20, 20, 12, '墨門弟子', 12, 13, 20, 11, '少年劉備', 50, 1, 'h0010', 50, 30, 30, 0, 100, 'b01', 10, '51');

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_fellowshop`
-- 

CREATE TABLE `a3k_fellowshop` (
  `fl_id` varchar(10) NOT NULL default '0',
  `p_at` int(10) unsigned NOT NULL,
  `p_df` int(10) unsigned NOT NULL,
  `p_agl` int(10) unsigned NOT NULL,
  `p_rankname` varchar(20) NOT NULL,
  `p_str` int(10) unsigned NOT NULL,
  `p_smart` int(10) unsigned NOT NULL,
  `p_vit` int(10) unsigned NOT NULL,
  `p_bone` int(10) unsigned NOT NULL,
  `p_name` varchar(20) NOT NULL,
  `p_hp` int(10) unsigned NOT NULL,
  `p_lv` int(10) unsigned NOT NULL,
  `p_img` varchar(30) NOT NULL,
  `p_hpmax` int(10) unsigned NOT NULL,
  `p_mn` int(10) unsigned NOT NULL,
  `p_mnmax` int(10) unsigned NOT NULL,
  `p_exp` int(10) unsigned NOT NULL,
  `p_nextexp` bigint(10) unsigned NOT NULL,
  `role_id` varchar(10) NOT NULL,
  `faith` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`fl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 
-- Dumping data for table `a3k_fellowshop`
-- 

INSERT INTO `a3k_fellowshop` VALUES ('1', 100, 100, 100, '墨者', 100, 100, 100, 100, '革離', 100, 100, 'h0020', 100, 100, 100, 0, 10, 'a02', 100);
INSERT INTO `a3k_fellowshop` VALUES ('2', 100, 100, 100, '墨者', 100, 200, 100, 200, 'momo', 100, 100, 'h0050', 100, 100, 100, 100, 1000, 'a02', 0);
INSERT INTO `a3k_fellowshop` VALUES ('3', 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '劉備', 50, 1, 'h0010', 50, 30, 30, 0, 100, 'b01', 10);
INSERT INTO `a3k_fellowshop` VALUES ('4', 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '關羽', 50, 1, 'h0020', 50, 30, 30, 0, 100, 'a01', 10);
INSERT INTO `a3k_fellowshop` VALUES ('5', 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '張飛', 50, 1, 'h0030', 50, 30, 30, 0, 100, 'a01', 10);
INSERT INTO `a3k_fellowshop` VALUES ('50', 20, 20, 15, '墨門弟子', 15, 10, 13, 15, '少年馬超', 50, 1, 'h0050', 50, 30, 30, 0, 100, 'a02', 10);
INSERT INTO `a3k_fellowshop` VALUES ('51', 20, 20, 12, '墨門弟子', 12, 13, 20, 11, '少年劉備', 50, 1, 'h0010', 50, 30, 30, 0, 100, 'b01', 10);
INSERT INTO `a3k_fellowshop` VALUES ('6', 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '諸葛亮', 50, 1, 'h0040', 50, 30, 30, 0, 100, 'a01', 10);
INSERT INTO `a3k_fellowshop` VALUES ('7', 20, 20, 10, '墨門弟子', 10, 10, 10, 10, '馬超', 50, 1, 'h0050', 50, 30, 30, 0, 100, 'a01', 10);

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_items`
-- 

CREATE TABLE `a3k_items` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `item_id` varchar(10) NOT NULL,
  `item_name` varchar(20) NOT NULL default '--' COMMENT '名稱',
  `item_type1` smallint(5) unsigned NOT NULL default '0' COMMENT '物品類別1',
  `item_type2` smallint(5) unsigned NOT NULL default '0' COMMENT '物品類別2',
  `item_img` varchar(10) default NULL COMMENT '圖像名稱',
  `item_ef_at` int(10) unsigned default NULL COMMENT '攻擊力',
  `item_ef_df` int(10) unsigned default NULL COMMENT '防禦力',
  `item_ef_str` int(10) unsigned default NULL COMMENT '力量',
  `item_ef_bone` int(10) unsigned default NULL COMMENT '根骨',
  `item_ef_vit` int(10) unsigned default NULL COMMENT '體魄',
  `item_ef_agl` int(10) unsigned default NULL COMMENT '速度',
  `item_ef_smart` int(10) unsigned default NULL COMMENT '智力',
  `item_ef_hp` int(10) unsigned NOT NULL default '0' COMMENT 'HP',
  `item_ef_mn` int(10) unsigned NOT NULL default '0' COMMENT 'MN',
  `item_stackable` tinyint(1) default '0' COMMENT '可否堆疊',
  `item_storeid` varchar(10) default NULL COMMENT '商店',
  `item_tradable` tinyint(1) NOT NULL default '0' COMMENT '榜定',
  `item_desc` varchar(200) default NULL COMMENT '物品說明',
  `item_price` int(10) unsigned default '0' COMMENT '物品售價',
  `item_r_price` int(10) unsigned NOT NULL default '0' COMMENT '商城幣(0=不是商城物)',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=81 ;

-- 
-- Dumping data for table `a3k_items`
-- 

INSERT INTO `a3k_items` VALUES (1, 'a0001', '新手頭巾', 1, 1, 'a001', 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 'NULL', 1, '新手使用的頭巾', 1, 0);
INSERT INTO `a3k_items` VALUES (2, 'a0002', '麻布頭巾', 1, 1, 'a004', 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 'z01', 1, '麻布頭巾', 100, 0);
INSERT INTO `a3k_items` VALUES (3, 'a0003', '布帽', 1, 1, 'a007', 0, 0, 0, 2, 7, 0, 0, 0, 0, 0, 'z01', 1, '布帽', 150, 0);
INSERT INTO `a3k_items` VALUES (4, 'a0004', '麻布帽', 1, 1, 'a001', 0, 0, 0, 0, 15, 0, 0, 0, 0, 0, 'z01', 1, '麻布帽', 200, 0);
INSERT INTO `a3k_items` VALUES (5, 'a0005', '木製頭盔', 1, 1, 'a004', 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 'z02', 1, '木製頭盔', 250, 0);
INSERT INTO `a3k_items` VALUES (6, 'a0006', '蠶絲帽', 1, 1, 'a007', 0, 0, 0, 5, 12, 0, 0, 0, 0, 0, 'z02', 1, '蠶絲帽', 300, 0);
INSERT INTO `a3k_items` VALUES (7, 'a0007', '硬木頭盔', 1, 1, 'a001', 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 'z02', 1, '硬木頭盔', 350, 0);
INSERT INTO `a3k_items` VALUES (8, 'a0008', '破舊頭盔', 1, 1, 'a001', 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 'NULL', 1, '破舊頭盔', 400, 0);
INSERT INTO `a3k_items` VALUES (9, 'a0009', '鐵頭盔', 1, 1, 'a001', 0, 0, 0, 8, 22, 0, 0, 0, 0, 0, 'NULL', 1, '鐵頭盔', 450, 0);
INSERT INTO `a3k_items` VALUES (10, 'b0001', '新手服', 1, 2, 'b001', 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 'NULL', 1, '新手使用的服裝', 1, 0);
INSERT INTO `a3k_items` VALUES (11, 'b0002', '麻布服', 1, 2, 'b004', 0, 0, 0, 0, 15, 0, 0, 0, 0, 0, 'z01', 1, '麻布服', 100, 0);
INSERT INTO `a3k_items` VALUES (12, 'b0003', '布裝', 1, 2, 'b007', 0, 0, 0, 0, 13, 2, 0, 0, 0, 0, 'z01', 1, '布裝', 150, 0);
INSERT INTO `a3k_items` VALUES (13, 'b0004', '麻布長袍', 1, 2, 'b001', 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 'z01', 1, '麻布長袍', 200, 0);
INSERT INTO `a3k_items` VALUES (14, 'b0005', '皮製長袍', 1, 2, 'b004', 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 'z02', 1, '皮製長袍', 250, 0);
INSERT INTO `a3k_items` VALUES (15, 'b0006', '蠶絲長袍', 1, 2, 'b007', 0, 0, 0, 0, 22, 5, 0, 0, 0, 0, 'z02', 1, '蠶絲長袍', 300, 0);
INSERT INTO `a3k_items` VALUES (16, 'b0007', '皮甲', 1, 2, 'b001', 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 'z02', 1, '皮甲', 350, 0);
INSERT INTO `a3k_items` VALUES (17, 'b0008', '破舊鎧甲', 1, 2, 'b001', 0, 0, 0, 0, 35, 0, 0, 0, 0, 0, 'NULL', 1, '破舊鎧甲', 400, 0);
INSERT INTO `a3k_items` VALUES (18, 'b0009', '鐵鎧甲', 1, 2, 'b001', 0, 0, 0, 0, 33, 7, 0, 0, 0, 0, 'NULL', 1, '鐵鎧甲', 450, 0);
INSERT INTO `a3k_items` VALUES (19, 'c0001', '新手披肩', 1, 3, 'c001', 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 'NULL', 1, '新手使用的披肩', 1, 0);
INSERT INTO `a3k_items` VALUES (20, 'c0002', '麻布披肩', 1, 3, 'c004', 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 'z01', 1, '麻布披肩', 100, 0);
INSERT INTO `a3k_items` VALUES (21, 'c0003', '布披肩', 1, 3, 'c007', 0, 0, 0, 0, 0, 0, 0, 8, 10, 0, 'z01', 1, '布披肩', 150, 0);
INSERT INTO `a3k_items` VALUES (22, 'c0004', '麻布披風', 1, 3, 'c001', 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 'z01', 1, '麻布披風', 200, 0);
INSERT INTO `a3k_items` VALUES (23, 'c0005', '皮製披風', 1, 3, 'c004', 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 'z02', 1, '皮製披風', 250, 0);
INSERT INTO `a3k_items` VALUES (24, 'c0006', '蠶絲披風', 1, 3, 'c007', 0, 0, 0, 0, 0, 0, 0, 8, 10, 0, 'z02', 1, '蠶絲披風', 300, 0);
INSERT INTO `a3k_items` VALUES (25, 'c0007', '獸皮披肩', 1, 3, 'c001', 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 'z02', 1, '獸皮披肩', 350, 0);
INSERT INTO `a3k_items` VALUES (26, 'c0008', '狼皮披風', 1, 3, 'c001', 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 'NULL', 1, '狼皮披風', 400, 0);
INSERT INTO `a3k_items` VALUES (27, 'c0009', '虎皮披風', 1, 3, 'c001', 0, 0, 0, 0, 0, 0, 0, 8, 10, 0, 'NULL', 1, '虎皮披風', 450, 0);
INSERT INTO `a3k_items` VALUES (28, 'd0001', '新手鞋', 1, 4, 'd001', 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 'NULL', 1, '新手使用的鞋', 1, 0);
INSERT INTO `a3k_items` VALUES (29, 'd0002', '麻布鞋', 1, 4, 'd004', 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 'z01', 1, '麻布鞋', 100, 0);
INSERT INTO `a3k_items` VALUES (30, 'd0003', '布鞋', 1, 4, 'd007', 0, 0, 0, 0, 7, 5, 0, 0, 0, 0, 'z01', 1, '布鞋', 150, 0);
INSERT INTO `a3k_items` VALUES (31, 'd0004', '麻布長鞋', 1, 4, 'd001', 0, 0, 0, 0, 15, 0, 0, 0, 0, 0, 'z01', 1, '麻布長鞋', 200, 0);
INSERT INTO `a3k_items` VALUES (32, 'd0005', '皮鞋', 1, 4, 'd004', 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 'z02', 1, '皮鞋', 250, 0);
INSERT INTO `a3k_items` VALUES (33, 'd0006', '蠶絲鞋', 1, 4, 'd007', 0, 0, 0, 0, 12, 8, 0, 0, 0, 0, 'z02', 1, '蠶絲鞋', 300, 0);
INSERT INTO `a3k_items` VALUES (34, 'd0007', '皮製長鞋', 1, 4, 'd001', 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 'z02', 1, '皮製長鞋', 350, 0);
INSERT INTO `a3k_items` VALUES (35, 'd0008', '精緻皮鞋', 1, 4, 'd001', 0, 0, 0, 0, 30, 0, 0, 0, 0, 0, 'NULL', 1, '精緻皮鞋', 400, 0);
INSERT INTO `a3k_items` VALUES (36, 'd0009', '精緻短靴', 1, 4, 'd001', 0, 0, 0, 0, 22, 10, 0, 0, 0, 0, 'NULL', 1, '精緻短靴', 450, 0);
INSERT INTO `a3k_items` VALUES (37, 'e0001', '新手指環', 1, 5, 'e001', 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 'NULL', 1, '新手使用的指環', 1, 0);
INSERT INTO `a3k_items` VALUES (38, 'e0002', '木製指環', 1, 5, 'e004', 0, 0, 5, 0, 5, 0, 0, 0, 0, 0, 'z01', 1, '木製指環', 100, 0);
INSERT INTO `a3k_items` VALUES (39, 'e0003', '陶土指環', 1, 5, 'e007', 0, 0, 2, 0, 2, 0, 0, 5, 5, 0, 'z01', 1, '陶土指環', 150, 0);
INSERT INTO `a3k_items` VALUES (40, 'e0004', '玉指環', 1, 5, 'e001', 0, 0, 8, 0, 8, 0, 0, 0, 0, 0, 'z01', 1, '玉指環', 200, 0);
INSERT INTO `a3k_items` VALUES (41, 'e0005', '銀指環', 1, 5, 'e004', 0, 0, 10, 0, 10, 0, 0, 0, 0, 0, 'z02', 1, '銀指環', 250, 0);
INSERT INTO `a3k_items` VALUES (42, 'e0006', '鐵指環', 1, 5, 'e007', 0, 0, 8, 0, 8, 0, 0, 10, 10, 0, 'z02', 1, '鐵指環', 300, 0);
INSERT INTO `a3k_items` VALUES (43, 'e0007', '銅指環', 1, 5, 'e001', 0, 0, 13, 0, 13, 0, 0, 0, 0, 0, 'z02', 1, '銅指環', 350, 0);
INSERT INTO `a3k_items` VALUES (44, 'e0008', '青銅指環', 1, 5, 'e001', 0, 0, 15, 0, 15, 0, 0, 0, 0, 0, 'NULL', 1, '青銅指環', 400, 0);
INSERT INTO `a3k_items` VALUES (45, 'e0009', '翡翠指環', 1, 5, 'e001', 0, 0, 13, 0, 13, 0, 0, 15, 15, 0, 'NULL', 1, '翡翠指環', 450, 0);
INSERT INTO `a3k_items` VALUES (46, 'f0001', '新手劍', 1, 6, 'f001', 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 'NULL', 1, '新手使用的劍', 1, 0);
INSERT INTO `a3k_items` VALUES (47, 'f0002', '木劍', 1, 6, 'f001', 0, 0, 15, 0, 0, 0, 0, 0, 0, 0, 'z01', 1, '木劍', 100, 0);
INSERT INTO `a3k_items` VALUES (48, 'f0003', '短匕首', 1, 6, 'f004', 0, 0, 13, 0, 0, 1, 0, 0, 0, 0, 'z01', 1, '短匕首', 150, 0);
INSERT INTO `a3k_items` VALUES (49, 'f0004', '柴刀', 1, 6, 'f007', 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 'z01', 1, '柴刀', 200, 0);
INSERT INTO `a3k_items` VALUES (50, 'f0005', '長劍', 1, 6, 'f001', 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 'z02', 1, '長劍', 250, 0);
INSERT INTO `a3k_items` VALUES (51, 'f0006', '斧頭', 1, 6, 'f004', 0, 0, 22, 0, 0, 3, 0, 0, 0, 0, 'z02', 1, '斧頭', 300, 0);
INSERT INTO `a3k_items` VALUES (52, 'f0007', '長槍', 1, 6, 'f007', 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 'z02', 1, '長槍', 350, 0);
INSERT INTO `a3k_items` VALUES (53, 'f0008', '鐵劍', 1, 6, 'f001', 0, 0, 35, 0, 0, 0, 0, 0, 0, 0, 'NULL', 1, '鐵劍', 400, 0);
INSERT INTO `a3k_items` VALUES (54, 'f0009', '鐵斧', 1, 6, 'f001', 0, 0, 33, 0, 0, 5, 0, 0, 0, 0, 'NULL', 1, '鐵斧', 450, 0);
INSERT INTO `a3k_items` VALUES (55, 'g0001', '小補散', 2, 1, 'g001', 0, 0, 0, 0, 0, 0, 0, 50, 0, 1, 'z01', 1, '小補散', 20, 0);
INSERT INTO `a3k_items` VALUES (56, 'g0002', '小補丹', 2, 1, 'g002', 0, 0, 0, 0, 0, 0, 0, 80, 0, 1, 'z01', 1, '小補丹', 35, 0);
INSERT INTO `a3k_items` VALUES (57, 'g0003', '大補散', 2, 1, 'g003', 0, 0, 0, 0, 0, 0, 0, 100, 0, 1, 'z01', 1, '大補散', 50, 0);
INSERT INTO `a3k_items` VALUES (58, 'g0004', '大埔丹', 2, 1, 'h001', 0, 0, 0, 0, 0, 0, 0, 150, 0, 1, 'z01', 1, '大埔丹', 100, 0);
INSERT INTO `a3k_items` VALUES (59, 'g0005', '小還散', 2, 2, 'g004', 0, 0, 0, 0, 0, 0, 0, 0, 30, 1, 'z01', 1, '小還散', 20, 0);
INSERT INTO `a3k_items` VALUES (60, 'g0006', '小還丹', 2, 2, 'g005', 0, 0, 0, 0, 0, 0, 0, 0, 50, 1, 'z01', 1, '小還丹', 35, 0);
INSERT INTO `a3k_items` VALUES (61, 'g0007', '大還散', 2, 2, 'g006', 0, 0, 0, 0, 0, 0, 0, 0, 80, 1, 'z01', 1, '大還散', 50, 0);
INSERT INTO `a3k_items` VALUES (62, 'g0008', '大還丹', 2, 2, 'h001', 0, 0, 0, 0, 0, 0, 0, 0, 100, 1, 'z01', 1, '大還丹', 100, 0);
INSERT INTO `a3k_items` VALUES (63, 'g0009', '回春散', 2, 3, 'g007', 0, 0, 0, 0, 0, 0, 0, 40, 40, 1, 'z01', 1, '回春散', 40, 0);
INSERT INTO `a3k_items` VALUES (64, 'g0010', '回春丹', 2, 3, 'g008', 0, 0, 0, 0, 0, 0, 0, 100, 100, 1, 'z01', 1, '回春丹', 80, 0);
INSERT INTO `a3k_items` VALUES (65, 'h0001', '雜物', 3, 1, 'a001', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'NULL', 1, '雜物', 5, 0);
INSERT INTO `a3k_items` VALUES (66, 'i0001', '熊膽', 3, 2, 'l006', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'NULL', 0, '飛熊山麓的熊膽', 0, 0);
INSERT INTO `a3k_items` VALUES (67, 'i0002', '毒蛇血', 3, 2, 'l006', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'NULL', 0, '毒蛇血', 0, 0);
INSERT INTO `a3k_items` VALUES (68, 'i0003', '張仕的藥材', 3, 2, 'l006', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'NULL', 0, '張仕的藥材', 0, 0);
INSERT INTO `a3k_items` VALUES (69, 'i0004', '山賊的密件', 3, 2, 'l006', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'NULL', 0, '山賊的密件', 0, 0);
INSERT INTO `a3k_items` VALUES (70, 'i0005', '赤焰蛇膽', 3, 2, 'l006', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'NULL', 0, '赤焰蛇膽', 0, 0);
INSERT INTO `a3k_items` VALUES (71, 'i0006', '王老先生的屍首', 3, 2, 'l006', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'NULL', 0, '王老先生的屍首', 0, 0);
INSERT INTO `a3k_items` VALUES (72, 'i0007', '山賊頭目的首級', 3, 2, 'l006', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'NULL', 0, '山賊頭目的首級', 0, 0);
INSERT INTO `a3k_items` VALUES (73, 'i0008', '軍事情報', 3, 2, 'l006', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'NULL', 0, '軍事情報', 0, 0);
INSERT INTO `a3k_items` VALUES (74, 'i0009', '羌族服裝', 3, 2, 'l006', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'NULL', 0, '羌族服裝', 0, 0);
INSERT INTO `a3k_items` VALUES (75, 'i0010', '狼牙', 3, 2, 'l006', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'NULL', 0, '狼牙', 0, 0);
INSERT INTO `a3k_items` VALUES (76, 'i0011', '羌王求救信', 3, 2, 'l006', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'NULL', 0, '羌王求救信', 0, 0);
INSERT INTO `a3k_items` VALUES (77, 'i0012', '羌族參謀信物', 3, 2, 'l006', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'NULL', 0, '羌族參謀信物', 0, 0);
INSERT INTO `a3k_items` VALUES (78, 'i0020', '羌族單于的首級', 3, 2, 'l006', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'NULL', 0, '羌兵寶刀', 0, 0);
INSERT INTO `a3k_items` VALUES (79, 'j0001', '商城大補散', 2, 1, 'l001', 0, 0, 0, 0, 0, 0, 0, 200, 0, 1, 'sp', 1, '大補散', 1, 10);
INSERT INTO `a3k_items` VALUES (80, 'j0002', '商城大還散', 2, 2, 'l001', 0, 0, 0, 0, 0, 0, 0, 0, 160, 1, 'sp', 1, '大還散', 1, 20);

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_lvlchart`
-- 

CREATE TABLE `a3k_lvlchart` (
  `lvlchart_id` int(10) unsigned NOT NULL auto_increment,
  `level` int(10) unsigned default '0' COMMENT '等級',
  `nextexp` int(10) unsigned default '0' COMMENT '所需經驗值',
  `lvl_rankname` varchar(10) NOT NULL COMMENT '等級稱為',
  PRIMARY KEY  (`lvlchart_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='升級所需經驗 + 稱號; InnoDB free: 11264 kB' AUTO_INCREMENT=101 ;

-- 
-- Dumping data for table `a3k_lvlchart`
-- 

INSERT INTO `a3k_lvlchart` VALUES (1, 1, 100, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (2, 2, 150, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (3, 3, 200, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (4, 4, 250, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (5, 5, 300, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (6, 6, 350, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (7, 7, 400, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (8, 8, 450, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (9, 9, 500, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (10, 10, 450, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (11, 11, 500, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (12, 12, 550, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (13, 13, 600, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (14, 14, 650, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (15, 15, 700, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (16, 16, 750, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (17, 17, 800, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (18, 18, 850, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (19, 19, 900, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (20, 20, 950, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (21, 21, 900, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (22, 22, 950, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (23, 23, 1000, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (24, 24, 1050, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (25, 25, 1100, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (26, 26, 1150, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (27, 27, 1200, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (28, 28, 1250, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (29, 29, 1300, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (30, 30, 1350, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (31, 31, 1300, '什長');
INSERT INTO `a3k_lvlchart` VALUES (32, 32, 1350, '什長');
INSERT INTO `a3k_lvlchart` VALUES (33, 33, 1400, '什長');
INSERT INTO `a3k_lvlchart` VALUES (34, 34, 1450, '什長');
INSERT INTO `a3k_lvlchart` VALUES (35, 35, 1500, '什長');
INSERT INTO `a3k_lvlchart` VALUES (36, 36, 1550, '什長');
INSERT INTO `a3k_lvlchart` VALUES (37, 37, 1600, '什長');
INSERT INTO `a3k_lvlchart` VALUES (38, 38, 1650, '什長');
INSERT INTO `a3k_lvlchart` VALUES (39, 39, 1700, '什長');
INSERT INTO `a3k_lvlchart` VALUES (40, 40, 1750, '什長');
INSERT INTO `a3k_lvlchart` VALUES (41, 41, 1700, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (42, 42, 1750, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (43, 43, 1800, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (44, 44, 1850, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (45, 45, 1900, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (46, 46, 1950, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (47, 47, 2000, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (48, 48, 2050, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (49, 49, 2100, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (50, 50, 2150, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (51, 51, 2150, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (52, 52, 2150, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (53, 53, 2150, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (54, 54, 2150, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (55, 55, 2150, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (56, 56, 2150, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (57, 57, 2150, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (58, 58, 2150, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (59, 59, 2150, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (60, 60, 2150, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (61, 61, 2150, '尉');
INSERT INTO `a3k_lvlchart` VALUES (62, 62, 2150, '尉');
INSERT INTO `a3k_lvlchart` VALUES (63, 63, 2150, '尉');
INSERT INTO `a3k_lvlchart` VALUES (64, 64, 2150, '尉');
INSERT INTO `a3k_lvlchart` VALUES (65, 65, 2150, '尉');
INSERT INTO `a3k_lvlchart` VALUES (66, 66, 2150, '尉');
INSERT INTO `a3k_lvlchart` VALUES (67, 67, 2150, '尉');
INSERT INTO `a3k_lvlchart` VALUES (68, 68, 2150, '尉');
INSERT INTO `a3k_lvlchart` VALUES (69, 69, 2150, '尉');
INSERT INTO `a3k_lvlchart` VALUES (70, 70, 2150, '尉');
INSERT INTO `a3k_lvlchart` VALUES (71, 71, 2150, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (72, 72, 2150, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (73, 73, 2150, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (74, 74, 2150, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (75, 75, 2150, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (76, 76, 2150, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (77, 77, 2150, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (78, 78, 2150, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (79, 79, 2150, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (80, 80, 2150, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (81, 81, 2150, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (82, 82, 2150, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (83, 83, 2150, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (84, 84, 2150, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (85, 85, 2150, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (86, 86, 2150, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (87, 87, 2150, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (88, 88, 2150, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (89, 89, 2150, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (90, 90, 2150, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (91, 91, 2150, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (92, 92, 2150, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (93, 93, 2150, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (94, 94, 2150, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (95, 95, 2150, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (96, 96, 2150, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (97, 97, 2150, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (98, 98, 2150, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (99, 99, 2150, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (100, 100, 2150, '裨將軍');

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_map`
-- 

CREATE TABLE `a3k_map` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `map_state_name` varchar(20) default NULL,
  `map_city_name` varchar(20) default NULL,
  `map_player_lv` int(10) unsigned default NULL,
  `map_img` varchar(10) default NULL COMMENT '戰鬥背景圖檔名(多個) (rand)',
  `map_html` varchar(30) default NULL COMMENT 'reserve for mission like, when move jump to other page',
  `map_id` varchar(10) NOT NULL,
  `map_control` tinyint(1) NOT NULL default '0' COMMENT '地圖控制 0=> 戰鬥 1=> 城內',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='地圖表' AUTO_INCREMENT=16 ;

-- 
-- Dumping data for table `a3k_map`
-- 

INSERT INTO `a3k_map` VALUES (1, '涼州', '墨家邨(城鎮)', 0, 'c1', 'city140.html', 'z01', 1);
INSERT INTO `a3k_map` VALUES (2, '涼州', '飛熊山麓(5)', 5, 'm0070', '', 'a01', 0);
INSERT INTO `a3k_map` VALUES (3, '涼州', '飛熊山道(10)', 10, 'm0090', '', 'a02', 0);
INSERT INTO `a3k_map` VALUES (4, '涼州', '金城沙漠(15)', 0, 'm0170', '', 'a03', 0);
INSERT INTO `a3k_map` VALUES (5, '涼州', '金城羌營(20)', 15, 'm0110', '', 'a04', 0);
INSERT INTO `a3k_map` VALUES (6, '雍州', '雍州府(城鎮)', 20, 'c2', 'city141.html', 'z02', 1);
INSERT INTO `a3k_map` VALUES (7, '雍州', '隴西郡城(25)', 0, 'm0130', '', 'b01', 0);
INSERT INTO `a3k_map` VALUES (8, '雍州', '黑風洞(30)', 25, 'm0200', '', 'b02', 0);
INSERT INTO `a3k_map` VALUES (9, '雍州', '安定市集(35)', 30, 'm0060', '', 'b03', 0);
INSERT INTO `a3k_map` VALUES (10, '雍州', '董璜府(40)', 30, 'm0040', '', 'b04', 0);
INSERT INTO `a3k_map` VALUES (11, '司州', '洛陽(城鎮)', 30, 'c3', 'city149.html', 'z03', 1);
INSERT INTO `a3k_map` VALUES (12, '司州', '董卓大營(45)', 30, 'm0110', '', 'c01', 0);
INSERT INTO `a3k_map` VALUES (13, '司州', '河內城下(50)', 30, 'm0140', '', 'c02', 0);
INSERT INTO `a3k_map` VALUES (14, '司州', '虎嘯林(55)', 30, 'm0180', '', 'c03', 0);
INSERT INTO `a3k_map` VALUES (15, '司州', '盤蛇洞(60)', 30, 'm0200', '', 'c04', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_monster`
-- 

CREATE TABLE `a3k_monster` (
  `p_id` int(10) unsigned NOT NULL auto_increment,
  `p_at` int(10) unsigned NOT NULL default '0' COMMENT '攻擊力',
  `p_df` int(10) unsigned NOT NULL default '0' COMMENT '防禦力',
  `p_agl` int(10) unsigned NOT NULL default '0' COMMENT '速度',
  `p_name` varchar(10) NOT NULL default '--' COMMENT '怪名',
  `p_hp` int(10) unsigned NOT NULL default '0' COMMENT '體力',
  `p_lv` int(10) unsigned NOT NULL default '0' COMMENT '等級',
  `d_id` varchar(100) default '0' COMMENT '掉落物ID',
  `p_topr` smallint(5) unsigned default '0' COMMENT '調物機率',
  `p_map` varchar(10) NOT NULL COMMENT '出現地圖',
  `p_img` varchar(10) default NULL COMMENT '圖檔名',
  `pf_ids` varchar(100) default NULL COMMENT '帶的同伴(seperate by `  )',
  `p_1001_id` varchar(10) NOT NULL default '0' COMMENT '1001ya 企劃用',
  PRIMARY KEY  (`p_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=262 ;

-- 
-- Dumping data for table `a3k_monster`
-- 

INSERT INTO `a3k_monster` VALUES (1, 15, 11, 10, '野熊', 30, 3, 'i0001', 80, 'a01', 'n0541', 'a00004`a00007`a00013', 'a00003');
INSERT INTO `a3k_monster` VALUES (4, 15, 11, 10, '毒蛇', 35, 3, 'g0002`d0002', 5, 'a01', 'n0550', 'a00004`a00007`a00013', 'a00004');
INSERT INTO `a3k_monster` VALUES (7, 18, 13, 10, '吃人野熊', 40, 3, 'g0001`c0002`i0001', 5, 'a01', 'n0542', 'a00004`a00007`a00013', 'a00007');
INSERT INTO `a3k_monster` VALUES (10, 18, 13, 10, '致命毒蛇', 50, 5, 'i0002', 80, 'a01', 'n0555', 'a00004`a00007`a00013', 'a00010');
INSERT INTO `a3k_monster` VALUES (13, 20, 16, 10, '山賊嘍嘍', 50, 5, 'g0001', 5, 'a01', 'n0330', 'a00004`a00007`a00013', 'a00013');
INSERT INTO `a3k_monster` VALUES (16, 21, 16, 13, '山賊雜兵', 70, 8, 'i0003`i0004', 60, 'a02', 'n0330', 'a00022`a00025`a00028', 'a00016');
INSERT INTO `a3k_monster` VALUES (22, 24, 18, 13, '赤焰毒蛇', 80, 10, 'i0005', 50, 'a02', 'n0552', 'a00022`a00025`a00028', 'a00022');
INSERT INTO `a3k_monster` VALUES (25, 25, 20, 13, '山賊精兵', 80, 10, 'i0006', 50, 'a02', 'n0330', 'a00022`a00025`a00028', 'a00025');
INSERT INTO `a3k_monster` VALUES (28, 26, 21, 13, '山賊頭目', 80, 10, 'i0007', 50, 'a02', 'n0332', 'a00022`a00025`a00028', 'a00028');
INSERT INTO `a3k_monster` VALUES (31, 27, 22, 15, '惡狼', 90, 13, 'i0010', 50, 'a03', 'n0561', 'a00040`a00042`a00043', 'a00031');
INSERT INTO `a3k_monster` VALUES (34, 29, 23, 15, '金城雜兵', 90, 13, 'i0008', 50, 'a03', 'n0312', 'a00040`a00042`a00043', 'a00034');
INSERT INTO `a3k_monster` VALUES (37, 30, 24, 15, '荒漠惡狼', 90, 13, 'i0010', 50, 'a03', 'n0560', 'a00040`a00042`a00043', 'a00037');
INSERT INTO `a3k_monster` VALUES (40, 31, 25, 15, '羌族參謀', 100, 15, 'g0003', 5, 'a03', 'n0312', 'a00040`a00042`a00043', 'a00040');
INSERT INTO `a3k_monster` VALUES (41, 31, 25, 15, '羌族參謀', 100, 15, 'g0003', 5, 'a03', 'n0312', 'a00040`a00042`a00043', 'a00041');
INSERT INTO `a3k_monster` VALUES (42, 31, 25, 15, '羌族信差', 100, 15, 'i0011`i0012', 50, 'a03', 'n0312', 'a00040`a00042`a00043', 'a00042');
INSERT INTO `a3k_monster` VALUES (43, 33, 26, 15, '羌兵小隊長', 100, 15, 'i0013', 50, 'a03', 'n0313', 'a00040`a00042`a00043', 'a00043');
INSERT INTO `a3k_monster` VALUES (46, 34, 28, 15, '羌兵小頭目', 100, 15, 'g0003', 4, 'a03', 'n0313', 'a00040`a00042`a00043', 'a00046');
INSERT INTO `a3k_monster` VALUES (47, 34, 28, 15, '羌兵頭目', 100, 15, 'g0002`e0004', 4, 'a03', 'n0313', 'a00040`a00042`a00043', 'a00047');
INSERT INTO `a3k_monster` VALUES (48, 34, 28, 15, '羌族先鋒將', 100, 15, 'g0003`f0004', 4, 'a03', 'n0313', 'a00040`a00042`a00043', 'a00048');
INSERT INTO `a3k_monster` VALUES (49, 35, 29, 15, '羌兵大盜', 110, 18, 'g0003`a0005', 4, 'a04', 'n0335', 'a00049`a00054`a00065', 'a00049');
INSERT INTO `a3k_monster` VALUES (50, 35, 29, 15, '羌兵盜賊', 110, 18, 'g0002`b0005', 4, 'a04', 'n0335', 'a00049`a00054`a00065', 'a00050');
INSERT INTO `a3k_monster` VALUES (51, 35, 29, 15, '羌兵盜賊', 110, 18, 'g0003`c0005', 4, 'a04', 'n0335', 'a00049`a00054`a00065', 'a00051');
INSERT INTO `a3k_monster` VALUES (52, 36, 30, 15, '塞上惡虎', 110, 18, 'g0002`d0005', 4, 'a04', 'n0535', 'a00049`a00054`a00065', 'a00052');
INSERT INTO `a3k_monster` VALUES (53, 36, 30, 15, '塞上老虎', 110, 18, 'g0003`a0005', 4, 'a04', 'n0535', 'a00049`a00054`a00065', 'a00053');
INSERT INTO `a3k_monster` VALUES (54, 36, 30, 15, '塞上老虎', 110, 18, 'g0002`b0005', 4, 'a04', 'n0535', 'a00049`a00054`a00065', 'a00054');
INSERT INTO `a3k_monster` VALUES (55, 38, 31, 15, '羌兵統領', 110, 18, 'g0003`c0005', 4, 'a04', 'n0313', 'a00049`a00054`a00065', 'a00055');
INSERT INTO `a3k_monster` VALUES (56, 38, 31, 15, '羌兵小統領', 110, 18, 'g0003`d0005', 4, 'a04', 'n0313', 'a00049`a00054`a00065', 'a00056');
INSERT INTO `a3k_monster` VALUES (57, 38, 31, 15, '羌兵小統領', 110, 18, 'g0003', 4, 'a04', 'n0313', 'a00049`a00054`a00065', 'a00057');
INSERT INTO `a3k_monster` VALUES (58, 39, 32, 15, '嗜血惡虎', 120, 20, 'g0003', 4, 'a04', 'n0532', 'a00049`a00054`a00065', 'a00058');
INSERT INTO `a3k_monster` VALUES (59, 39, 32, 15, '嗜血老虎', 120, 20, 'g0003', 4, 'a04', 'n0532', 'a00049`a00054`a00065', 'a00059');
INSERT INTO `a3k_monster` VALUES (60, 39, 32, 15, '嗜血老虎', 120, 20, 'g0003', 4, 'a04', 'n0532', 'a00049`a00054`a00065', 'a00060');
INSERT INTO `a3k_monster` VALUES (61, 40, 33, 15, '羌族軍師', 120, 20, 'g0003', 4, 'a04', 'n0155', 'a00049`a00054`a00065', 'a00061');
INSERT INTO `a3k_monster` VALUES (62, 40, 33, 15, '羌族小軍師', 120, 20, 'g0002`e0005', 4, 'a04', 'n0155', 'a00049`a00054`a00065', 'a00062');
INSERT INTO `a3k_monster` VALUES (63, 40, 33, 15, '羌族小軍師', 120, 20, 'g0003`f0005', 4, 'a04', 'n0155', 'a00049`a00054`a00065', 'a00063');
INSERT INTO `a3k_monster` VALUES (64, 42, 34, 15, '羌族單于', 120, 20, 'g0003', 4, 'a04', 'n0305', 'a00049`a00054`a00065', 'a00064');
INSERT INTO `a3k_monster` VALUES (65, 42, 34, 15, '羌族小單于', 120, 20, 'g0002`e0005', 4, 'a04', 'n0305', 'a00049`a00054`a00065', 'a00065');
INSERT INTO `a3k_monster` VALUES (66, 42, 34, 15, '羌族單于', 120, 20, 'g0003`f0005', 4, 'a04', 'n0305', 'a00049`a00054`a00065', 'a00066');
INSERT INTO `a3k_monster` VALUES (67, 43, 36, 15, '黑風土匪', 130, 23, 'g0003`a0006', 4, 'b01', 'n0331', 'a00067`a00072`a00077', 'a00067');
INSERT INTO `a3k_monster` VALUES (68, 43, 36, 15, '黑風土匪', 130, 23, 'g0002`b0006', 4, 'b01', 'n0331', 'a00067`a00072`a00077', 'a00068');
INSERT INTO `a3k_monster` VALUES (69, 43, 36, 15, '黑風土匪', 130, 23, 'g0003`c0006', 4, 'b01', 'n0331', 'a00067`a00072`a00077', 'a00069');
INSERT INTO `a3k_monster` VALUES (70, 44, 37, 15, '黑風斥候', 130, 23, 'g0002`d0006', 4, 'b01', 'n0331', 'a00067`a00072`a00077', 'a00070');
INSERT INTO `a3k_monster` VALUES (71, 44, 37, 15, '黑風斥候', 130, 23, 'g0003`a0006', 4, 'b01', 'n0331', 'a00067`a00072`a00077', 'a00071');
INSERT INTO `a3k_monster` VALUES (72, 44, 37, 15, '黑風斥候', 130, 23, 'g0002`b0006', 4, 'b01', 'n0331', 'a00067`a00072`a00077', 'a00072');
INSERT INTO `a3k_monster` VALUES (73, 45, 38, 15, '黑風搶匪', 130, 23, 'g0003`c0006', 4, 'b01', 'n0331', 'a00067`a00072`a00077', 'a00073');
INSERT INTO `a3k_monster` VALUES (74, 45, 38, 15, '黑風搶匪', 130, 23, 'g0003`d0006', 4, 'b01', 'n0331', 'a00067`a00072`a00077', 'a00074');
INSERT INTO `a3k_monster` VALUES (75, 45, 38, 15, '黑風搶匪', 130, 23, 'g0003', 4, 'b01', 'n0331', 'a00067`a00072`a00077', 'a00075');
INSERT INTO `a3k_monster` VALUES (76, 47, 39, 15, '黑風尖兵', 140, 25, 'g0003', 4, 'b01', 'n0333', 'a00067`a00072`a00077', 'a00076');
INSERT INTO `a3k_monster` VALUES (77, 47, 39, 15, '黑風尖兵', 140, 25, 'g0003', 4, 'b01', 'n0333', 'a00067`a00072`a00077', 'a00077');
INSERT INTO `a3k_monster` VALUES (78, 47, 39, 15, '黑風尖兵', 140, 25, 'g0003', 4, 'b01', 'n0333', 'a00067`a00072`a00077', 'a00078');
INSERT INTO `a3k_monster` VALUES (79, 48, 40, 15, '黑風精兵', 140, 25, 'g0003', 4, 'b01', 'n0333', 'a00067`a00072`a00077', 'a00079');
INSERT INTO `a3k_monster` VALUES (80, 48, 40, 15, '黑風精兵', 140, 25, 'g0002`e0006', 4, 'b01', 'n0333', 'a00067`a00072`a00078', 'a00080');
INSERT INTO `a3k_monster` VALUES (81, 48, 40, 15, '黑風精兵', 140, 25, 'g0003`f0006', 4, 'b01', 'n0333', 'a00067`a00072`a00079', 'a00081');
INSERT INTO `a3k_monster` VALUES (82, 49, 41, 15, '黑風二當家', 140, 25, 'g0003', 4, 'b01', 'n0382', 'a00067`a00072`a00080', 'a00082');
INSERT INTO `a3k_monster` VALUES (83, 49, 41, 15, '黑風二當家', 140, 25, 'g0002`e0006', 4, 'b01', 'n0382', 'a00067`a00072`a00081', 'a00083');
INSERT INTO `a3k_monster` VALUES (84, 49, 41, 15, '黑風二當家', 140, 25, 'g0003`f0006', 4, 'b01', 'n0382', 'a00067`a00072`a00082', 'a00084');
INSERT INTO `a3k_monster` VALUES (85, 51, 42, 15, '黑風大盜', 150, 28, 'g0003`a0007', 4, 'b02', 'n0330', 'a00029', 'a00085');
INSERT INTO `a3k_monster` VALUES (86, 51, 42, 15, '黑風大盜', 150, 28, 'g0002`b0007', 4, 'b02', 'n0330', 'a00029', 'a00086');
INSERT INTO `a3k_monster` VALUES (87, 51, 42, 15, '黑風大盜', 150, 28, 'g0003`c0007', 4, 'b02', 'n0330', 'a00029', 'a00087');
INSERT INTO `a3k_monster` VALUES (88, 52, 44, 15, '黑風衛隊', 150, 28, 'g0002`d0007', 4, 'b02', 'n0330', 'a00030', 'a00088');
INSERT INTO `a3k_monster` VALUES (89, 52, 44, 15, '黑風衛隊', 150, 28, 'g0003`a0007', 4, 'b02', 'n0330', 'a00030', 'a00089');
INSERT INTO `a3k_monster` VALUES (90, 52, 44, 15, '黑風衛隊', 150, 28, 'g0002`b0007', 4, 'b02', 'n0330', 'a00030', 'a00090');
INSERT INTO `a3k_monster` VALUES (91, 53, 45, 15, '黑風力士', 150, 28, 'g0003`c0007', 4, 'b02', 'n0340', 'a00031', 'a00091');
INSERT INTO `a3k_monster` VALUES (92, 53, 45, 15, '黑風力士', 150, 28, 'g0003`d0007', 4, 'b02', 'n0340', 'a00031', 'a00092');
INSERT INTO `a3k_monster` VALUES (93, 53, 45, 15, '黑風力士', 150, 28, 'g0003', 4, 'b02', 'n0340', 'a00031', 'a00093');
INSERT INTO `a3k_monster` VALUES (94, 54, 46, 15, '黑風參謀', 160, 30, 'g0003', 4, 'b02', 'n0124', 'a00032', 'a00094');
INSERT INTO `a3k_monster` VALUES (95, 54, 46, 15, '黑風參謀', 160, 30, 'g0003', 4, 'b02', 'n0124', 'a00032', 'a00095');
INSERT INTO `a3k_monster` VALUES (96, 54, 46, 15, '黑風參謀', 160, 30, 'g0003', 4, 'b02', 'n0124', 'a00032', 'a00096');
INSERT INTO `a3k_monster` VALUES (97, 56, 47, 15, '黑風二當家', 160, 30, 'g0003', 4, 'b02', 'n0382', 'a00033', 'a00097');
INSERT INTO `a3k_monster` VALUES (98, 56, 47, 15, '黑風二當家', 160, 30, 'g0002`e0006', 4, 'b02', 'n0382', 'a00033', 'a00098');
INSERT INTO `a3k_monster` VALUES (99, 56, 47, 15, '黑風二當家', 160, 30, 'g0003`f0006', 4, 'b02', 'n0382', 'a00033', 'a00099');
INSERT INTO `a3k_monster` VALUES (100, 57, 48, 15, '黑風大當家', 160, 30, 'g0003', 4, 'b02', 'n0324', 'a00034', 'a00100');
INSERT INTO `a3k_monster` VALUES (101, 57, 48, 15, '黑風大當家', 160, 30, 'g0002`e0006', 4, 'b02', 'n0324', 'a00034', 'a00101');
INSERT INTO `a3k_monster` VALUES (102, 57, 48, 15, '黑風大當家', 160, 30, 'g0003`f0006', 4, 'b02', 'n0324', 'a00034', 'a00102');
INSERT INTO `a3k_monster` VALUES (103, 58, 49, 25, '董家惡僕', 180, 33, 'g0003', 4, 'b03', 'n0280', 'a00035`a00036', 'a00103');
INSERT INTO `a3k_monster` VALUES (104, 58, 49, 25, '董家惡僕', 180, 33, 'g0003', 4, 'b03', 'n0280', 'a00035`a00036', 'a00104');
INSERT INTO `a3k_monster` VALUES (105, 58, 49, 25, '董家惡僕', 180, 33, 'g0003', 4, 'b03', 'n0280', 'a00035`a00036', 'a00105');
INSERT INTO `a3k_monster` VALUES (106, 60, 50, 25, '董家惡奴', 180, 33, 'g0003', 4, 'b03', 'n0280', 'a00035`a00036', 'a00106');
INSERT INTO `a3k_monster` VALUES (107, 60, 50, 25, '董家惡奴', 180, 33, 'g0003', 4, 'b03', 'n0280', 'a00035`a00036', 'a00107');
INSERT INTO `a3k_monster` VALUES (108, 60, 50, 25, '董家惡奴', 180, 33, 'g0003', 4, 'b03', 'n0280', 'a00035`a00036', 'a00108');
INSERT INTO `a3k_monster` VALUES (109, 61, 52, 25, '董家惡管事', 180, 33, 'g0003', 4, 'b03', 'n0284', 'a00035`a00036', 'a00109');
INSERT INTO `a3k_monster` VALUES (110, 61, 52, 25, '董家惡管事', 180, 33, 'g0003', 4, 'b03', 'n0284', 'a00035`a00036', 'a00110');
INSERT INTO `a3k_monster` VALUES (111, 61, 52, 25, '董家惡管事', 180, 33, 'g0003', 4, 'b03', 'n0284', 'a00035`a00036', 'a00111');
INSERT INTO `a3k_monster` VALUES (112, 62, 53, 30, '董家武師', 200, 35, 'g0003', 4, 'b03', 'n0364', 'a00035`a00036`a00037', 'a00112');
INSERT INTO `a3k_monster` VALUES (113, 62, 53, 30, '董家武師', 200, 35, 'g0003', 4, 'b03', 'n0364', 'a00035`a00036`a00037', 'a00113');
INSERT INTO `a3k_monster` VALUES (114, 62, 53, 30, '董家武師', 200, 35, 'g0003', 4, 'b03', 'n0364', 'a00035`a00036`a00037', 'a00114');
INSERT INTO `a3k_monster` VALUES (115, 63, 54, 30, '董家武師頭子', 200, 35, 'g0003', 4, 'b03', 'n0362', 'a00037`a00038', 'a00115');
INSERT INTO `a3k_monster` VALUES (116, 63, 54, 30, '董家武師頭子', 200, 35, 'g0003', 4, 'b03', 'n0362', 'a00037`a00038', 'a00116');
INSERT INTO `a3k_monster` VALUES (117, 63, 54, 30, '董家武師頭子', 200, 35, 'g0003', 4, 'b03', 'n0362', 'a00037`a00038', 'a00117');
INSERT INTO `a3k_monster` VALUES (118, 65, 55, 35, '董璜', 200, 35, 'g0003', 4, 'b03', 'n0395', 'a00038`a00039', 'a00118');
INSERT INTO `a3k_monster` VALUES (119, 65, 55, 35, '董璜', 200, 35, 'g0003', 4, 'b03', 'n0395', 'a00038`a00039', 'a00119');
INSERT INTO `a3k_monster` VALUES (120, 65, 55, 35, '董璜', 200, 35, 'g0003', 4, 'b03', 'n0395', 'a00038`a00039', 'a00120');
INSERT INTO `a3k_monster` VALUES (121, 66, 56, 35, '董府凶僕', 250, 37, 'g0003', 4, 'b04', 'n0280', 'a00041`a00042', 'a00121');
INSERT INTO `a3k_monster` VALUES (122, 66, 56, 35, '董府凶僕', 250, 37, 'g0003', 4, 'b04', 'n0280', 'a00041`a00042', 'a00122');
INSERT INTO `a3k_monster` VALUES (123, 66, 56, 35, '董府凶僕', 250, 37, 'g0003', 4, 'b04', 'n0280', 'a00041`a00042', 'a00123');
INSERT INTO `a3k_monster` VALUES (124, 67, 57, 35, '董府謢院', 250, 37, 'g0003', 4, 'b04', 'n0280', 'a00041`a00042', 'a00124');
INSERT INTO `a3k_monster` VALUES (125, 67, 57, 35, '董府謢院', 250, 37, 'g0003', 4, 'b04', 'n0280', 'a00041`a00042', 'a00125');
INSERT INTO `a3k_monster` VALUES (126, 67, 57, 35, '董府謢院', 250, 37, 'g0003', 4, 'b04', 'n0280', 'a00041`a00042', 'a00126');
INSERT INTO `a3k_monster` VALUES (127, 69, 58, 40, '董府護院總管', 270, 38, 'g0003', 4, 'b04', 'n0281', 'a00041`a00042', 'a00127');
INSERT INTO `a3k_monster` VALUES (128, 69, 58, 40, '董府護院總管', 270, 38, 'g0003', 4, 'b04', 'n0281', 'a00041`a00042', 'a00128');
INSERT INTO `a3k_monster` VALUES (129, 69, 58, 40, '董府護院總管', 270, 38, 'g0003', 4, 'b04', 'n0281', 'a00041`a00042', 'a00129');
INSERT INTO `a3k_monster` VALUES (130, 70, 60, 40, '董府親兵', 270, 38, 'g0003', 4, 'b04', 'n0575', 'a00043`a00045', 'a00130');
INSERT INTO `a3k_monster` VALUES (131, 70, 60, 40, '董府親兵', 270, 38, 'g0003', 4, 'b04', 'n0575', 'a00043`a00045', 'a00131');
INSERT INTO `a3k_monster` VALUES (132, 70, 60, 40, '董府親兵', 270, 38, 'g0003', 4, 'b04', 'n0575', 'a00043`a00045', 'a00132');
INSERT INTO `a3k_monster` VALUES (133, 71, 61, 40, '董府衛兵', 270, 38, 'g0003', 4, 'b04', 'n0575', 'a00044`a00045', 'a00133');
INSERT INTO `a3k_monster` VALUES (134, 71, 61, 40, '董府衛兵', 270, 38, 'g0003', 4, 'b04', 'n0575', 'a00044`a00045', 'a00134');
INSERT INTO `a3k_monster` VALUES (135, 71, 61, 40, '董府衛兵', 270, 38, 'g0003', 4, 'b04', 'n0575', 'a00044`a00045', 'a00135');
INSERT INTO `a3k_monster` VALUES (136, 72, 62, 45, '董府兵長', 300, 40, 'g0003', 4, 'b04', 'n0572', 'a00044`a00045', 'a00136');
INSERT INTO `a3k_monster` VALUES (137, 72, 62, 45, '董府兵長', 300, 40, 'g0003', 4, 'b04', 'n0572', 'a00044`a00045', 'a00137');
INSERT INTO `a3k_monster` VALUES (138, 72, 62, 45, '董府兵長', 300, 40, 'g0003', 4, 'b04', 'n0572', 'a00044`a00045', 'a00138');
INSERT INTO `a3k_monster` VALUES (139, 74, 63, 45, '董璜', 330, 40, 'g0003', 4, 'b04', 'n0395', 'a00044`a00045', 'a00139');
INSERT INTO `a3k_monster` VALUES (140, 74, 63, 45, '董璜', 330, 40, 'g0003', 4, 'b04', 'n0395', 'a00044`a00045', 'a00140');
INSERT INTO `a3k_monster` VALUES (141, 74, 63, 45, '董璜', 330, 40, 'g0003', 4, 'b04', 'n0395', 'a00044`a00045', 'a00141');
INSERT INTO `a3k_monster` VALUES (142, 75, 64, 50, '牛輔', 350, 40, 'g0003', 4, 'b04', 'n0485', 'a00046`a00047', 'a00142');
INSERT INTO `a3k_monster` VALUES (143, 75, 64, 50, '牛輔', 350, 40, 'g0003', 4, 'b04', 'n0485', 'a00046`a00047', 'a00143');
INSERT INTO `a3k_monster` VALUES (144, 75, 64, 50, '牛輔', 350, 40, 'g0003', 4, 'b04', 'n0485', 'a00046`a00047', 'a00144');
INSERT INTO `a3k_monster` VALUES (145, 76, 65, 50, '河東軍士兵', 400, 42, 'g0003', 4, 'c01', 'n0445', 'a00049`a00050', 'a00145');
INSERT INTO `a3k_monster` VALUES (146, 76, 65, 50, '河東軍士兵', 400, 42, 'g0003', 4, 'c01', 'n0445', 'a00049`a00050', 'a00146');
INSERT INTO `a3k_monster` VALUES (147, 76, 65, 50, '河東軍士兵', 400, 42, 'g0003', 4, 'c01', 'n0445', 'a00049`a00050', 'a00147');
INSERT INTO `a3k_monster` VALUES (148, 78, 66, 50, '河東軍精兵', 400, 42, 'g0003', 4, 'c01', 'n0445', 'a00049`a00050', 'a00148');
INSERT INTO `a3k_monster` VALUES (149, 78, 66, 50, '河東軍精兵', 400, 42, 'g0003', 4, 'c01', 'n0445', 'a00049`a00050', 'a00149');
INSERT INTO `a3k_monster` VALUES (150, 78, 66, 50, '河東軍精兵', 400, 42, 'g0003', 4, 'c01', 'n0445', 'a00049`a00050', 'a00150');
INSERT INTO `a3k_monster` VALUES (151, 79, 68, 50, '河東軍兵長', 400, 42, 'g0003', 4, 'c01', 'n0442', 'a00049`a00050', 'a00151');
INSERT INTO `a3k_monster` VALUES (152, 79, 68, 50, '河東軍兵長', 400, 42, 'g0003', 4, 'c01', 'n0442', 'a00049`a00050', 'a00152');
INSERT INTO `a3k_monster` VALUES (153, 79, 68, 50, '河東軍兵長', 400, 42, 'g0003', 4, 'c01', 'n0442', 'a00049`a00050', 'a00153');
INSERT INTO `a3k_monster` VALUES (154, 80, 69, 52, '西涼鐵衛', 460, 44, 'g0003', 4, 'c01', 'n0470', 'a00052`a00053', 'a00154');
INSERT INTO `a3k_monster` VALUES (155, 80, 69, 52, '西涼鐵衛', 460, 44, 'g0003', 4, 'c01', 'n0470', 'a00052`a00053', 'a00155');
INSERT INTO `a3k_monster` VALUES (156, 80, 69, 52, '西涼鐵衛', 460, 44, 'g0003', 4, 'c01', 'n0470', 'a00052`a00053', 'a00156');
INSERT INTO `a3k_monster` VALUES (157, 81, 70, 52, '西涼鐵衛兵長', 500, 44, 'g0003', 4, 'c01', 'n0472', 'a00052`a00053', 'a00157');
INSERT INTO `a3k_monster` VALUES (158, 81, 70, 52, '西涼鐵衛兵長', 500, 44, 'g0003', 4, 'c01', 'n0472', 'a00052`a00053', 'a00158');
INSERT INTO `a3k_monster` VALUES (159, 81, 70, 52, '西涼鐵衛兵長', 500, 44, 'g0003', 4, 'c01', 'n0472', 'a00052`a00053', 'a00159');
INSERT INTO `a3k_monster` VALUES (160, 83, 71, 52, '李傕', 530, 45, 'g0003', 4, 'c01', 'n0464', 'a00052`a00053', 'a00160');
INSERT INTO `a3k_monster` VALUES (161, 83, 71, 52, '李傕', 530, 45, 'g0003', 4, 'c01', 'n0464', 'a00052`a00053', 'a00161');
INSERT INTO `a3k_monster` VALUES (162, 83, 71, 52, '李傕', 530, 45, 'g0003', 4, 'c01', 'n0464', 'a00052`a00053', 'a00162');
INSERT INTO `a3k_monster` VALUES (163, 84, 72, 52, '郭汜', 540, 45, 'g0003', 4, 'c01', 'n0464', 'a00052`a00054', 'a00163');
INSERT INTO `a3k_monster` VALUES (164, 84, 72, 52, '郭汜', 540, 45, 'g0003', 4, 'c01', 'n0464', 'a00052`a00054', 'a00164');
INSERT INTO `a3k_monster` VALUES (165, 84, 72, 52, '郭汜', 540, 45, 'g0003', 4, 'c01', 'n0464', 'a00052`a00054', 'a00165');
INSERT INTO `a3k_monster` VALUES (166, 85, 73, 52, '牛輔', 550, 45, 'g0003', 4, 'c01', 'n0485', 'a00052`a00055', 'a00166');
INSERT INTO `a3k_monster` VALUES (167, 85, 73, 52, '牛輔', 550, 45, 'g0003', 4, 'c01', 'n0485', 'a00052`a00055', 'a00167');
INSERT INTO `a3k_monster` VALUES (168, 85, 73, 52, '牛輔', 550, 45, 'g0003', 4, 'c01', 'n0485', 'a00052`a00055', 'a00168');
INSERT INTO `a3k_monster` VALUES (169, 87, 74, 53, '李儒', 560, 45, 'g0004', 4, 'c01', 'n0121', 'a00052`a00056', 'a00169');
INSERT INTO `a3k_monster` VALUES (170, 87, 74, 53, '李儒', 560, 45, 'g0004', 4, 'c01', 'n0121', 'a00052`a00056', 'a00170');
INSERT INTO `a3k_monster` VALUES (171, 87, 74, 53, '李儒', 560, 45, 'g0004', 4, 'c01', 'n0121', 'a00052`a00056', 'a00171');
INSERT INTO `a3k_monster` VALUES (172, 88, 76, 54, '華雄', 580, 45, 'g0004', 4, 'c01', 'h0190', 'a00052`a00057', 'a00172');
INSERT INTO `a3k_monster` VALUES (173, 88, 76, 54, '華雄', 580, 45, 'g0004', 4, 'c01', 'h0190', 'a00052`a00057', 'a00173');
INSERT INTO `a3k_monster` VALUES (174, 88, 76, 54, '華雄', 580, 45, 'g0004', 4, 'c01', 'h0190', 'a00052`a00057', 'a00174');
INSERT INTO `a3k_monster` VALUES (175, 89, 77, 55, '董卓', 600, 45, 'g0004', 4, 'c01', 'h0200', 'a00057`a00058', 'a00175');
INSERT INTO `a3k_monster` VALUES (176, 89, 77, 55, '董卓', 600, 45, 'g0004', 4, 'c01', 'h0200', 'a00057`a00058', 'a00176');
INSERT INTO `a3k_monster` VALUES (177, 89, 77, 55, '董卓', 600, 45, 'g0004', 4, 'c01', 'h0200', 'a00057`a00058', 'a00177');
INSERT INTO `a3k_monster` VALUES (178, 90, 78, 56, '黑風殘兵', 630, 46, 'g0004', 4, 'c02', 'n0411', 'a00060`a00061', 'a00178');
INSERT INTO `a3k_monster` VALUES (179, 90, 78, 56, '黑風殘兵', 630, 46, 'g0004', 4, 'c02', 'n0411', 'a00060`a00061', 'a00179');
INSERT INTO `a3k_monster` VALUES (180, 90, 78, 56, '黑風殘兵', 630, 46, 'g0004', 4, 'c02', 'n0411', 'a00060`a00061', 'a00180');
INSERT INTO `a3k_monster` VALUES (181, 92, 79, 56, '黑風殘兵長', 630, 46, 'g0004', 4, 'c02', 'n0411', 'a00060`a00061', 'a00181');
INSERT INTO `a3k_monster` VALUES (182, 92, 79, 56, '黑風殘兵長', 630, 46, 'g0004', 4, 'c02', 'n0411', 'a00060`a00061', 'a00182');
INSERT INTO `a3k_monster` VALUES (183, 92, 79, 56, '黑風殘兵長', 630, 46, 'g0004', 4, 'c02', 'n0411', 'a00060`a00061', 'a00183');
INSERT INTO `a3k_monster` VALUES (184, 93, 80, 56, '神秘道士', 660, 47, 'g0004', 4, 'c02', 'n0215', 'a00062`a00063', 'a00184');
INSERT INTO `a3k_monster` VALUES (185, 93, 80, 56, '神秘道士', 660, 47, 'g0004', 4, 'c02', 'n0215', 'a00062`a00063', 'a00185');
INSERT INTO `a3k_monster` VALUES (186, 93, 80, 56, '神秘道士', 660, 47, 'g0004', 4, 'c02', 'n0215', 'a00062`a00063', 'a00186');
INSERT INTO `a3k_monster` VALUES (187, 94, 81, 56, '神密道長', 660, 47, 'g0004', 4, 'c02', 'n0165', 'a00062`a00063', 'a00187');
INSERT INTO `a3k_monster` VALUES (188, 94, 81, 56, '神密道長', 660, 47, 'g0004', 4, 'c02', 'n0165', 'a00062`a00063', 'a00188');
INSERT INTO `a3k_monster` VALUES (189, 94, 81, 56, '神密道長', 660, 47, 'g0004', 4, 'c02', 'n0165', 'a00062`a00063', 'a00189');
INSERT INTO `a3k_monster` VALUES (190, 96, 82, 56, '流寇軍士兵', 690, 48, 'g0004', 4, 'c02', 'n0405', 'a00064`a00065', 'a00190');
INSERT INTO `a3k_monster` VALUES (191, 96, 82, 56, '流寇軍士兵', 690, 48, 'g0004', 4, 'c02', 'n0405', 'a00064`a00065', 'a00191');
INSERT INTO `a3k_monster` VALUES (192, 96, 82, 56, '流寇軍士兵', 690, 48, 'g0004', 4, 'c02', 'n0405', 'a00064`a00065', 'a00192');
INSERT INTO `a3k_monster` VALUES (193, 97, 84, 56, '流寇軍精兵', 690, 48, 'g0004', 4, 'c02', 'n0405', 'a00064`a00065', 'a00193');
INSERT INTO `a3k_monster` VALUES (194, 97, 84, 56, '流寇軍精兵', 690, 48, 'g0004', 4, 'c02', 'n0405', 'a00064`a00065', 'a00194');
INSERT INTO `a3k_monster` VALUES (195, 97, 84, 56, '流寇軍精兵', 690, 48, 'g0004', 4, 'c02', 'n0405', 'a00064`a00065', 'a00195');
INSERT INTO `a3k_monster` VALUES (196, 98, 85, 56, '流寇軍兵長', 690, 48, 'g0004', 4, 'c02', 'n0402', 'a00064`a00065', 'a00196');
INSERT INTO `a3k_monster` VALUES (197, 98, 85, 56, '流寇軍兵長', 690, 48, 'g0004', 4, 'c02', 'n0402', 'a00064`a00065', 'a00197');
INSERT INTO `a3k_monster` VALUES (198, 98, 85, 56, '流寇軍兵長', 690, 48, 'g0004', 4, 'c02', 'n0402', 'a00064`a00065', 'a00198');
INSERT INTO `a3k_monster` VALUES (199, 99, 86, 56, '波才', 720, 50, 'g0004', 4, 'c02', 'n0423', 'a00066`a00068', 'a00199');
INSERT INTO `a3k_monster` VALUES (200, 99, 86, 56, '波才', 720, 50, 'g0004', 4, 'c02', 'n0423', 'a00066`a00068', 'a00200');
INSERT INTO `a3k_monster` VALUES (201, 99, 86, 56, '波才', 720, 50, 'g0004', 4, 'c02', 'n0423', 'a00066`a00068', 'a00201');
INSERT INTO `a3k_monster` VALUES (202, 101, 87, 56, '趙弘', 750, 50, 'g0004', 4, 'c02', 'n0424', 'a00066`a00067', 'a00202');
INSERT INTO `a3k_monster` VALUES (203, 101, 87, 56, '趙弘', 750, 50, 'g0004', 4, 'c02', 'n0424', 'a00066`a00067', 'a00203');
INSERT INTO `a3k_monster` VALUES (204, 101, 87, 56, '趙弘', 750, 50, 'g0004', 4, 'c02', 'n0424', 'a00066`a00067', 'a00204');
INSERT INTO `a3k_monster` VALUES (205, 102, 88, 57, '食人虎', 750, 51, 'g0004', 4, 'c03', 'n0535', 'a00069`a00070', 'a00205');
INSERT INTO `a3k_monster` VALUES (206, 102, 88, 57, '食人虎', 750, 51, 'g0004', 4, 'c03', 'n0535', 'a00069`a00070', 'a00206');
INSERT INTO `a3k_monster` VALUES (207, 102, 88, 57, '食人虎', 750, 51, 'g0004', 4, 'c03', 'n0535', 'a00069`a00070', 'a00207');
INSERT INTO `a3k_monster` VALUES (208, 103, 89, 57, '食人餓虎', 750, 51, 'g0004', 4, 'c03', 'n0532', 'a00069`a00070', 'a00208');
INSERT INTO `a3k_monster` VALUES (209, 103, 89, 57, '食人餓虎', 750, 51, 'g0004', 4, 'c03', 'n0532', 'a00069`a00070', 'a00209');
INSERT INTO `a3k_monster` VALUES (210, 103, 89, 57, '食人餓虎', 750, 51, 'g0004', 4, 'c03', 'n0532', 'a00069`a00070', 'a00210');
INSERT INTO `a3k_monster` VALUES (211, 105, 90, 57, '虎嘯惡漢', 770, 52, 'g0004', 4, 'c03', 'n0344', 'a00071`a00072', 'a00211');
INSERT INTO `a3k_monster` VALUES (212, 105, 90, 57, '虎嘯惡漢', 770, 52, 'g0004', 4, 'c03', 'n0344', 'a00071`a00072', 'a00212');
INSERT INTO `a3k_monster` VALUES (213, 105, 90, 57, '虎嘯惡漢', 770, 52, 'g0004', 4, 'c03', 'n0344', 'a00071`a00072', 'a00213');
INSERT INTO `a3k_monster` VALUES (214, 106, 92, 57, '虎嘯惡盜', 770, 52, 'g0004', 4, 'c03', 'n0344', 'a00071`a00072', 'a00214');
INSERT INTO `a3k_monster` VALUES (215, 106, 92, 57, '虎嘯惡盜', 770, 52, 'g0004', 4, 'c03', 'n0344', 'a00071`a00072', 'a00215');
INSERT INTO `a3k_monster` VALUES (216, 106, 92, 57, '虎嘯惡盜', 770, 52, 'g0004', 4, 'c03', 'n0344', 'a00071`a00072', 'a00216');
INSERT INTO `a3k_monster` VALUES (217, 107, 93, 57, '神秘道士', 790, 53, 'g0004', 4, 'c03', 'n0215', 'a00073`a00074', 'a00217');
INSERT INTO `a3k_monster` VALUES (218, 107, 93, 57, '神秘道士', 790, 53, 'g0004', 4, 'c03', 'n0215', 'a00073`a00074', 'a00218');
INSERT INTO `a3k_monster` VALUES (219, 107, 93, 57, '神秘道士', 790, 53, 'g0004', 4, 'c03', 'n0215', 'a00073`a00074', 'a00219');
INSERT INTO `a3k_monster` VALUES (220, 108, 94, 57, '神秘道長', 790, 53, 'g0004', 4, 'c03', 'n0165', 'a00073`a00074', 'a00220');
INSERT INTO `a3k_monster` VALUES (221, 108, 94, 57, '神秘道長', 790, 53, 'g0004', 4, 'c03', 'n0165', 'a00073`a00074', 'a00221');
INSERT INTO `a3k_monster` VALUES (222, 108, 94, 57, '神秘道長', 790, 53, 'g0004', 4, 'c03', 'n0165', 'a00073`a00074', 'a00222');
INSERT INTO `a3k_monster` VALUES (223, 110, 95, 57, '虎嘯殺手', 800, 54, 'g0004', 4, 'c03', 'n0583', 'a00075`a00076', 'a00223');
INSERT INTO `a3k_monster` VALUES (224, 110, 95, 57, '虎嘯殺手', 800, 54, 'g0004', 4, 'c03', 'n0583', 'a00075`a00076', 'a00224');
INSERT INTO `a3k_monster` VALUES (225, 110, 95, 57, '虎嘯殺手', 800, 54, 'g0004', 4, 'c03', 'n0583', 'a00075`a00076', 'a00225');
INSERT INTO `a3k_monster` VALUES (226, 111, 96, 57, '虎嘯刺客', 820, 55, 'g0004', 4, 'c03', 'n0583', 'a00075`a00076', 'a00226');
INSERT INTO `a3k_monster` VALUES (227, 111, 96, 57, '虎嘯刺客', 820, 55, 'g0004', 4, 'c03', 'n0583', 'a00075`a00076', 'a00227');
INSERT INTO `a3k_monster` VALUES (228, 111, 96, 57, '虎嘯刺客', 820, 55, 'g0004', 4, 'c03', 'n0583', 'a00075`a00076', 'a00228');
INSERT INTO `a3k_monster` VALUES (229, 112, 97, 57, '虎嘯幫主', 850, 55, 'g0004', 4, 'c03', 'n0322', 'a00075`a00076', 'a00229');
INSERT INTO `a3k_monster` VALUES (230, 112, 97, 57, '虎嘯幫主', 850, 55, 'g0004', 4, 'c03', 'n0322', 'a00075`a00076', 'a00230');
INSERT INTO `a3k_monster` VALUES (231, 112, 97, 57, '虎嘯幫主', 850, 55, 'g0004', 4, 'c03', 'n0322', 'a00075`a00076', 'a00231');
INSERT INTO `a3k_monster` VALUES (232, 114, 98, 58, '銀線毒蛇', 875, 56, 'g0004', 4, 'c04', 'n0550', 'a00078`a00079', 'a00232');
INSERT INTO `a3k_monster` VALUES (233, 114, 98, 58, '銀線毒蛇', 875, 56, 'g0004', 4, 'c04', 'n0550', 'a00078`a00079', 'a00233');
INSERT INTO `a3k_monster` VALUES (234, 114, 98, 58, '銀線毒蛇', 875, 56, 'g0004', 4, 'c04', 'n0550', 'a00078`a00079', 'a00234');
INSERT INTO `a3k_monster` VALUES (235, 115, 100, 58, '青花毒蛇', 875, 56, 'g0004', 4, 'c04', 'n0553', 'a00078`a00079', 'a00235');
INSERT INTO `a3k_monster` VALUES (236, 115, 100, 58, '青花毒蛇', 875, 56, 'g0004', 4, 'c04', 'n0553', 'a00078`a00079', 'a00236');
INSERT INTO `a3k_monster` VALUES (237, 115, 100, 58, '青花毒蛇', 875, 56, 'g0004', 4, 'c04', 'n0553', 'a00078`a00079', 'a00237');
INSERT INTO `a3k_monster` VALUES (238, 116, 101, 58, '金線毒蛇', 900, 57, 'g0004', 4, 'c04', 'n0555', 'a00078`a00079', 'a00238');
INSERT INTO `a3k_monster` VALUES (239, 116, 101, 58, '金線毒蛇', 900, 57, 'g0004', 4, 'c04', 'n0555', 'a00078`a00079', 'a00239');
INSERT INTO `a3k_monster` VALUES (240, 116, 101, 58, '金線毒蛇', 900, 57, 'g0004', 4, 'c04', 'n0555', 'a00078`a00079', 'a00240');
INSERT INTO `a3k_monster` VALUES (241, 117, 102, 58, '神秘道士', 900, 57, 'g0004', 4, 'c04', 'n0215', 'a00080`a00081', 'a00241');
INSERT INTO `a3k_monster` VALUES (242, 117, 102, 58, '神秘道士', 900, 57, 'g0004', 4, 'c04', 'n0215', 'a00080`a00081', 'a00242');
INSERT INTO `a3k_monster` VALUES (243, 117, 102, 58, '神秘道士', 900, 57, 'g0004', 4, 'c04', 'n0215', 'a00080`a00081', 'a00243');
INSERT INTO `a3k_monster` VALUES (244, 119, 103, 58, '神密道長', 900, 57, 'g0004', 4, 'c04', 'n0165', 'a00080`a00081', 'a00244');
INSERT INTO `a3k_monster` VALUES (245, 119, 103, 58, '神密道長', 900, 57, 'g0004', 4, 'c04', 'n0165', 'a00080`a00081', 'a00245');
INSERT INTO `a3k_monster` VALUES (246, 119, 103, 58, '神密道長', 900, 57, 'g0004', 4, 'c04', 'n0165', 'a00080`a00081', 'a00246');
INSERT INTO `a3k_monster` VALUES (247, 120, 104, 58, '黃巾訓練兵', 930, 58, 'g0004', 4, 'c04', 'n0235', 'a00083`a00084', 'a00247');
INSERT INTO `a3k_monster` VALUES (248, 120, 104, 58, '黃巾訓練兵', 930, 58, 'g0004', 4, 'c04', 'n0235', 'a00083`a00084', 'a00248');
INSERT INTO `a3k_monster` VALUES (249, 120, 104, 58, '黃巾訓練兵', 930, 58, 'g0004', 4, 'c04', 'n0235', 'a00083`a00084', 'a00249');
INSERT INTO `a3k_monster` VALUES (250, 121, 105, 58, '黃巾訓練兵長', 930, 58, 'g0004', 4, 'c04', 'n0235', 'a00083`a00084', 'a00250');
INSERT INTO `a3k_monster` VALUES (251, 121, 105, 58, '黃巾訓練兵長', 930, 58, 'g0004', 4, 'c04', 'n0235', 'a00083`a00084', 'a00251');
INSERT INTO `a3k_monster` VALUES (252, 121, 105, 58, '黃巾訓練兵長', 930, 58, 'g0004', 4, 'c04', 'n0235', 'a00083`a00084', 'a00252');
INSERT INTO `a3k_monster` VALUES (253, 123, 106, 58, '波才', 960, 59, 'g0004', 4, 'c04', 'n0423', 'a00084`a00085', 'a00253');
INSERT INTO `a3k_monster` VALUES (254, 123, 106, 58, '波才', 960, 59, 'g0004', 4, 'c04', 'n0423', 'a00084`a00085', 'a00254');
INSERT INTO `a3k_monster` VALUES (255, 123, 106, 58, '波才', 960, 59, 'g0004', 4, 'c04', 'n0423', 'a00084`a00085', 'a00255');
INSERT INTO `a3k_monster` VALUES (256, 124, 108, 58, '趙弘', 975, 60, 'g0004', 4, 'c04', 'n0424', 'a00084`a00085', 'a00256');
INSERT INTO `a3k_monster` VALUES (257, 124, 108, 58, '趙弘', 975, 60, 'g0004', 4, 'c04', 'n0424', 'a00084`a00085', 'a00257');
INSERT INTO `a3k_monster` VALUES (258, 124, 108, 58, '趙弘', 975, 60, 'g0004', 4, 'c04', 'n0424', 'a00084`a00085', 'a00258');
INSERT INTO `a3k_monster` VALUES (259, 125, 109, 58, '管亥', 1000, 60, 'g0004', 4, 'c04', 'n0195', 'a00085`a00086', 'a00259');
INSERT INTO `a3k_monster` VALUES (260, 125, 109, 58, '管亥', 1000, 60, 'g0004', 4, 'c04', 'n0195', 'a00085`a00086', 'a00260');
INSERT INTO `a3k_monster` VALUES (261, 125, 109, 58, '管亥', 1000, 60, 'g0004', 4, 'c04', 'n0195', 'a00085`a00086', 'a00261');

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_player`
-- 

CREATE TABLE `a3k_player` (
  `p_id` int(10) unsigned NOT NULL auto_increment,
  `p_name` varchar(20) NOT NULL default '--' COMMENT '玩家名稱',
  `p_at` int(10) unsigned NOT NULL default '0' COMMENT '物理攻擊力',
  `p_df` int(10) unsigned NOT NULL default '0' COMMENT '物理防禦力',
  `p_str` smallint(10) unsigned NOT NULL default '0' COMMENT '力量',
  `p_vit` smallint(10) unsigned NOT NULL default '0' COMMENT '體魄',
  `p_smart` smallint(10) unsigned NOT NULL default '0' COMMENT '智力',
  `p_agl` smallint(10) unsigned NOT NULL default '0' COMMENT '敏捷',
  `p_hp` int(10) unsigned NOT NULL default '0' COMMENT 'HP(體力)現在值',
  `p_hpmax` int(10) unsigned NOT NULL default '0' COMMENT 'HP(體力)最大值',
  `role_id` varchar(10) NOT NULL COMMENT '職業ID',
  `p_money` int(10) unsigned NOT NULL default '0' COMMENT '金錢現在值(最大值暫定為100萬)',
  `p_lv` int(10) unsigned NOT NULL default '0' COMMENT '等級',
  `p_exp` int(10) unsigned NOT NULL default '0' COMMENT '目前經驗值',
  `p_nextexp` int(10) unsigned NOT NULL default '0' COMMENT '升級所需經驗',
  `p_win` int(10) unsigned NOT NULL default '0' COMMENT '勝場數',
  `p_lost` int(10) unsigned NOT NULL default '0' COMMENT '敗場數',
  `p_sex` tinyint(1) unsigned NOT NULL default '0' COMMENT '玩家性別',
  `p_img` varchar(10) NOT NULL default '0' COMMENT '頭像ID',
  `p_act_time` datetime default NULL COMMENT '最後動作時間',
  `p_createdate` datetime default NULL COMMENT '帳號建立時間',
  `p_map` varchar(10) NOT NULL COMMENT '玩家在哪',
  `p_bank` int(10) unsigned NOT NULL default '0' COMMENT '銀行',
  `f_1001ya` varchar(100) default NULL COMMENT '1001ya key',
  `p_mn` int(10) unsigned NOT NULL default '0' COMMENT 'Mana(精神力)最大值',
  `p_mnmax` int(10) unsigned NOT NULL default '0' COMMENT 'Mana(精神力)最大值',
  `pf_id` int(10) unsigned default NULL COMMENT '帶的武將',
  `p_rankname` varchar(20) default NULL COMMENT '官職(稱號)',
  `p_bone` int(10) unsigned NOT NULL default '0' COMMENT '根骨',
  `p_fight_time` datetime default NULL COMMENT '最後戰鬥時間',
  `p_guild` int(10) unsigned NOT NULL default '0' COMMENT '工會',
  `p_team` int(10) unsigned NOT NULL default '0' COMMENT '組隊',
  `p_blacklist` text NOT NULL COMMENT '黑名單',
  `p_packsize_1` int(10) NOT NULL default '25' COMMENT '背包大小 for type 1;1',
  `p_packsize_2` int(11) NOT NULL default '25',
  `p_packsize_3` int(11) NOT NULL default '25',
  `p_packsize_4` int(11) NOT NULL default '25',
  `p_learn` int(10) unsigned NOT NULL default '0' COMMENT '學點',
  `p_r_money` int(10) unsigned NOT NULL default '0' COMMENT '商城幣',
  `promo_code` varchar(45) default NULL COMMENT '行銷碼',
  PRIMARY KEY  USING BTREE (`p_id`),
  KEY `p_name` (`p_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=23 ;

-- 
-- Dumping data for table `a3k_player`
-- 

INSERT INTO `a3k_player` VALUES (1, 'test1強襲', 20, 20, 16, 16, 16, 16, 78, 89, 'a04', 280, 7, 53, 400, 65, 5, 1, 'p0050', NULL, NULL, 'a01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 55, 60, 14, '墨門弟子', 31, NULL, 0, 0, '', 25, 25, 25, 25, 0, 80, '21');
INSERT INTO `a3k_player` VALUES (2, 'test2必殺', 20, 17, 10, 12, 10, 10, 0, 50, 'b01', 106, 1, 45, 100, 2, 2, 1, 'p0050', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 99, 99, 2, '墨門弟子', 18, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL);
INSERT INTO `a3k_player` VALUES (3, 'test3虛弱', 20, 40, 16, 13, 14, 15, 62, 65, 'a01', 157, 3, 153, 200, 20, 0, 1, 'p0050', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 44, 44, 27, '墨門弟子', 14, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL);
INSERT INTO `a3k_player` VALUES (4, 'test4施毒', 20, 22, 10, 10, 10, 10, 49, 50, 'a07', 106, 1, 52, 100, 2, 0, 1, 'p0050', NULL, NULL, 'a01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 99, 99, 4, '墨門弟子', 11, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL);
INSERT INTO `a3k_player` VALUES (5, 'test5閃避', 20, 20, 10, 10, 10, 10, 55, 55, 'a08', 124, 2, 81, 150, 8, 2, 1, 'p0050', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 33, 33, 37, '墨門弟子', 15, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL);
INSERT INTO `a3k_player` VALUES (6, 'test6連擊', 20, 20, 10, 10, 10, 10, 41, 55, 'a09', 115, 2, 2, 150, 5, 4, 1, 'p0060', NULL, NULL, 'a02', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 19, 33, 6, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL);
INSERT INTO `a3k_player` VALUES (7, 'test7武將', 20, 30, 10, 10, 10, 10, 55, 55, 'a10', 24, 8, 100, 150, 9, 2, 1, 'p0010', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 33, 33, 7, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL);
INSERT INTO `a3k_player` VALUES (8, 'test8定身', 20, 20, 10, 10, 10, 10, 50, 50, 'a11', 106, 8, 45, 100, 2, 8, 1, 'p0020', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 99, 99, 8, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL);
INSERT INTO `a3k_player` VALUES (9, 'test9反彈', 20, 20, 10, 10, 10, 10, 54, 55, 'a12', 124, 2, 67, 150, 8, 1, 1, 'p0030', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 18, 33, 5, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL);
INSERT INTO `a3k_player` VALUES (10, 'test10減傷', 20, 20, 10, 10, 10, 10, 47, 50, 'a13', 103, 1, 19, 100, 1, 0, 1, 'p0050', NULL, NULL, 'a01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 30, 99, 17, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL);
INSERT INTO `a3k_player` VALUES (11, 'test11回血', 20, 20, 10, 10, 10, 10, 50, 50, 'a14', 100, 1, 0, 100, 0, 0, 1, 'p0050', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 30, 99, 22, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL);
INSERT INTO `a3k_player` VALUES (12, 'test12自爆', 20, 20, 10, 10, 10, 10, 50, 50, 'a15', 100, 1, 0, 100, 0, 0, 1, 'p0050', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 30, 99, 27, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL);
INSERT INTO `a3k_player` VALUES (13, 'test13混亂', 20, 30, 10, 10, 10, 10, 60, 60, 'a16', 145, 3, 91, 200, 16, 0, 1, 'p0050', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 36, 36, 32, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL);
INSERT INTO `a3k_player` VALUES (14, 'test14吸血', 20, 20, 10, 10, 10, 10, 50, 50, 'a17', 100, 1, 0, 100, 0, 0, 1, 'p0050', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 30, 99, 37, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL);
INSERT INTO `a3k_player` VALUES (15, 'test15反間', 20, 20, 10, 10, 10, 10, 55, 55, 'a18', 115, 2, 2, 150, 5, 5, 1, 'p0050', NULL, NULL, 'a02', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 33, 33, 15, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL);
INSERT INTO `a3k_player` VALUES (16, '21312', 20, 20, 10, 10, 10, 10, 50, 50, 'b01', 100, 1, 0, 100, 0, 0, 1, 'p0010', '2009-04-13 15:21:59', '2009-04-13 15:03:42', 'c04', 0, 'YTFjMDZjY2QtZjQwNi00OTAwLThmNTMtZTU0NmNjYmMxMTVl', 30, 30, NULL, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, '12312');
INSERT INTO `a3k_player` VALUES (17, 'sadpy', 23, 19, 14, 11, 12, 14, 0, 62, 'a01', 500, 3, 150, 200, 0, 1, 0, 'p0060', '2009-04-14 17:02:59', '2009-04-14 12:34:01', 'z03', 0, 'OWZmNTkxOWQtYThmYi00M2RjLTk0N2UtZDg0YmUwOTkxOWJk', 30, 40, NULL, '墨門弟子', 12, NULL, 0, 0, '', 25, 25, 25, 25, 0, 450, '');
INSERT INTO `a3k_player` VALUES (18, '南瓜', 20, 20, 10, 10, 10, 10, 50, 50, 'b01', 100, 1, 0, 100, 0, 0, 1, 'p0010', '2009-04-23 16:23:45', '2009-04-23 16:23:41', 'z01', 0, ' ', 30, 30, NULL, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, '');
INSERT INTO `a3k_player` VALUES (19, '角', 20, 20, 10, 10, 10, 10, 50, 50, 'c01', 100, 1, 0, 100, 0, 0, 1, 'p0020', '2009-04-23 16:26:34', '2009-04-23 16:26:31', 'z01', 0, ' ', 30, 30, NULL, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, '');
INSERT INTO `a3k_player` VALUES (20, 'sadpyy', 20, 20, 10, 10, 10, 10, 50, 50, 'a01', 100, 1, 0, 100, 0, 0, 1, 'p0030', '2009-04-23 16:30:44', '2009-04-23 16:30:37', 'z01', 0, 'YjAxNjM3YTctMGRhMi00NWZmLTg2MDktMjM2NjRkM2I5M2E0', 30, 30, NULL, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, '');
INSERT INTO `a3k_player` VALUES (21, '21323', 20, 20, 10, 10, 10, 10, 50, 50, 'a01', 57, 1, 0, 100, 0, 1, 0, 'p0060', '2009-06-26 12:09:31', '2009-05-21 09:47:57', 'z01', 31, 'MzIzMTE2MjEtN2Q4NS00MTZiLTkzZmYtOWZjNjZhZWQ4M2Iw', 30, 30, NULL, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, '');
INSERT INTO `a3k_player` VALUES (22, '2312312', 20, 20, 10, 10, 10, 10, 50, 50, 'a01', 100, 1, 0, 100, 0, 0, 1, 'p0030', '2009-06-24 18:27:13', '2009-06-24 18:27:11', 'z01', 0, 'YjQyMTliMTYtMDNjOC00NDVjLWFhMTctYzMzYTJhYjU4ZTJk', 30, 30, NULL, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, '21');

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_player_item`
-- 

CREATE TABLE `a3k_player_item` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `p_id` int(10) unsigned NOT NULL,
  `item_id` varchar(10) NOT NULL,
  `item_eq` tinyint(1) default '0',
  `item_stacknum` smallint(5) unsigned default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

-- 
-- Dumping data for table `a3k_player_item`
-- 

INSERT INTO `a3k_player_item` VALUES (1, 16, 'i0001', 0, 18);
INSERT INTO `a3k_player_item` VALUES (2, 16, 'i0002', 0, 20);
INSERT INTO `a3k_player_item` VALUES (4, 3, 'i0001', 0, 1);
INSERT INTO `a3k_player_item` VALUES (5, 3, 'i0002', 0, 1);
INSERT INTO `a3k_player_item` VALUES (7, 16, 'g0002', 0, 3);
INSERT INTO `a3k_player_item` VALUES (8, 17, 'g0001', 0, 1);
INSERT INTO `a3k_player_item` VALUES (9, 16, 'i0005', 0, 5);
INSERT INTO `a3k_player_item` VALUES (10, 16, 'i0007', 0, 3);
INSERT INTO `a3k_player_item` VALUES (11, 16, 'i0004', 0, 5);
INSERT INTO `a3k_player_item` VALUES (12, 17, 'i0002', 0, 17);
INSERT INTO `a3k_player_item` VALUES (13, 17, 'i0001', 0, 15);
INSERT INTO `a3k_player_item` VALUES (14, 16, 'i0003', 0, 4);
INSERT INTO `a3k_player_item` VALUES (15, 16, 'i0006', 0, 4);
INSERT INTO `a3k_player_item` VALUES (16, 7, 'i0001', 0, 1);
INSERT INTO `a3k_player_item` VALUES (17, 7, 'i0002', 0, 1);
INSERT INTO `a3k_player_item` VALUES (18, 10, 'i0001', 0, 1);
INSERT INTO `a3k_player_item` VALUES (19, 17, 'a0003', 0, 1);
INSERT INTO `a3k_player_item` VALUES (21, 17, 'j0002', 0, 2);
INSERT INTO `a3k_player_item` VALUES (22, 19, 'i0002', 0, 1);
INSERT INTO `a3k_player_item` VALUES (23, 17, 'i0003', 0, 18);
INSERT INTO `a3k_player_item` VALUES (24, 17, 'i0004', 0, 18);
INSERT INTO `a3k_player_item` VALUES (25, 17, 'i0005', 0, 25);
INSERT INTO `a3k_player_item` VALUES (26, 17, 'i0006', 0, 19);
INSERT INTO `a3k_player_item` VALUES (27, 17, 'i0007', 0, 17);
INSERT INTO `a3k_player_item` VALUES (28, 17, 'j0001', 0, 1);
INSERT INTO `a3k_player_item` VALUES (29, 17, 'e0002', 1, 1);
INSERT INTO `a3k_player_item` VALUES (30, 17, 'i0010', 0, 12);
INSERT INTO `a3k_player_item` VALUES (31, 17, 'i0008', 0, 9);
INSERT INTO `a3k_player_item` VALUES (32, 17, 'i0012', 0, 5);
INSERT INTO `a3k_player_item` VALUES (33, 17, 'i0011', 0, 5);
INSERT INTO `a3k_player_item` VALUES (34, 17, 'e0004', 0, 1);
INSERT INTO `a3k_player_item` VALUES (35, 17, 'g0003', 0, 1);
INSERT INTO `a3k_player_item` VALUES (36, 26, 'i0002', 0, 9);
INSERT INTO `a3k_player_item` VALUES (37, 26, 'i0001', 0, 8);
INSERT INTO `a3k_player_item` VALUES (38, 26, 'g0001', 0, 1);
INSERT INTO `a3k_player_item` VALUES (39, 26, 'i0007', 0, 2);
INSERT INTO `a3k_player_item` VALUES (40, 26, 'i0004', 0, 2);
INSERT INTO `a3k_player_item` VALUES (41, 26, 'i0006', 0, 1);
INSERT INTO `a3k_player_item` VALUES (42, 27, 'i0002', 0, 14);
INSERT INTO `a3k_player_item` VALUES (43, 26, 'i0008', 0, 1);
INSERT INTO `a3k_player_item` VALUES (44, 29, 'i0003', 0, 2);
INSERT INTO `a3k_player_item` VALUES (45, 29, 'i0004', 0, 1);
INSERT INTO `a3k_player_item` VALUES (46, 27, 'i0001', 0, 17);
INSERT INTO `a3k_player_item` VALUES (47, 27, 'i0007', 0, 13);
INSERT INTO `a3k_player_item` VALUES (48, 27, 'i0004', 0, 13);
INSERT INTO `a3k_player_item` VALUES (49, 27, 'a0001', 1, 1);
INSERT INTO `a3k_player_item` VALUES (50, 27, 'b0001', 1, 1);
INSERT INTO `a3k_player_item` VALUES (51, 27, 'c0001', 1, 1);
INSERT INTO `a3k_player_item` VALUES (52, 27, 'f0001', 1, 1);
INSERT INTO `a3k_player_item` VALUES (53, 27, 'i0006', 0, 8);
INSERT INTO `a3k_player_item` VALUES (54, 27, 'i0003', 0, 17);
INSERT INTO `a3k_player_item` VALUES (55, 27, 'i0005', 0, 11);
INSERT INTO `a3k_player_item` VALUES (56, 17, 'f0001', 0, 1);
INSERT INTO `a3k_player_item` VALUES (57, 17, 'a0001', 1, 1);
INSERT INTO `a3k_player_item` VALUES (58, 17, 'f0001', 0, 1);
INSERT INTO `a3k_player_item` VALUES (59, 17, 'a0001', 0, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_player_store`
-- 

CREATE TABLE `a3k_player_store` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `p_id` int(10) unsigned NOT NULL,
  `item_id` varchar(50) NOT NULL,
  `usetime` datetime default NULL COMMENT '領取時間',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `a3k_player_store`
-- 

INSERT INTO `a3k_player_store` VALUES (1, 17, 'j0001', '2009-03-19 18:09:45');
INSERT INTO `a3k_player_store` VALUES (2, 17, 'j0002', '2009-03-19 18:09:51');
INSERT INTO `a3k_player_store` VALUES (3, 17, 'j0002', '2009-03-20 19:23:10');
INSERT INTO `a3k_player_store` VALUES (4, 17, 'j0001', '2009-03-23 10:49:27');

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_quest`
-- 

CREATE TABLE `a3k_quest` (
  `q_id` varchar(10) NOT NULL,
  `q_title` varchar(50) default NULL,
  `q_requester` varchar(20) default NULL,
  `q_img` varchar(10) default NULL,
  `q_map_name` varchar(20) default NULL,
  `q_map_id` varchar(10) default NULL,
  `q_show_lv` int(10) default NULL,
  `q_description` varchar(255) default NULL,
  `q_dest_map` varchar(50) default NULL,
  `q_expireTime` int(10) default NULL,
  PRIMARY KEY  (`q_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `a3k_quest`
-- 

INSERT INTO `a3k_quest` VALUES ('q00001', '孝子的熊膽', '墨雲師父', 'n0062', '墨家邨', 'z01', 0, '王孝廉的母親病了,徒兒你去飛熊山麓幫他打一些熊膽來給母親燉湯補身吧', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00002', '驅蛇除害', '墨雲師父', 'n0062', '墨家邨', 'z01', 0, '飛熊山麓最近毒蛇肆虐,徒兒你去幫大夥兒驅蛇除害', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00003', '飛熊山修行(一)', '墨雲師父', 'n0062', '墨家邨', 'z01', 0, '修行之路就是挑戰自我,現在起到飛熊山麓修行,修行完回來找我', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00004', '飛熊山修行(二)', '墨雲師父', 'n0062', '墨家邨', 'z01', 3, '修行之路就是持續挑戰,繼續到飛熊山麓修行,修行完回來找我', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00005', '吃人的野熊', '墨雲師父', 'n0062', '墨家邨', 'z01', 3, '飛熊山麓裡最近有好幾名樵夫遭到吃人野熊的毒手,徒兒你快去把這些禍首清一清', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00006', '飛熊山修行(三)', '墨雲師父', 'n0062', '墨家邨', 'z01', 4, '恩…很好,看你快速進步為師也感到高興,繼續到飛熊山麓修行,修行完回來找我', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00007', '毒蛇的血清', '墨雲師父', 'n0062', '墨家邨', 'z01', 4, '飛熊山麓裡的致命毒蛇咬傷了我墨家邨多位村民,為師的解毒丸已經不夠用了,快去找致命毒蛇身上的血來給為師煉製解藥', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00008', '山賊的騷擾', '墨雲師父', 'n0062', '墨家邨', 'z01', 4, '飛熊山麓裡的來了一批山賊嘍嘍,經常騷擾過往村民,你代為師去去好好教訓他們一番', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00009', '小師弟豋場', '墨雲師父', 'n0062', '墨家邨', 'z01', 4, '為師最近新收一名弟子,你帶他去增加一些經驗閱歷,順便聯絡一下師兄弟感情吧', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00010', '張仕的藥材', '藥商張仕', 'n0062', '墨家邨', 'z01', 4, '前天小弟運送一批藥材,途經飛熊山道時,藥材給一票山賊雜兵給搶走了,請大俠為我做主找回那些藥材', '飛熊山道', NULL);
INSERT INTO `a3k_quest` VALUES ('q00011', '打通飛熊山道', '墨雲師父', 'n0062', '墨家邨', 'z01', 4, '飛熊山道被一票山賊佔據,聽說有一票山賊雜兵把道路給封了,在那兒強收過路費,你快去教訓他們,把被封鎖的道路打通', '飛熊山道', NULL);
INSERT INTO `a3k_quest` VALUES ('q00012', '山道巡邏(一)', '墨雲師父', 'n0062', '墨家邨', 'z01', 5, '最近飛熊山道山賊盤據,你帶著師弟多多巡邏,保護往來行商安全', '飛熊山道', NULL);
INSERT INTO `a3k_quest` VALUES ('q00013', '山賊的密件', '墨雲師父', 'n0062', '墨家邨', 'z01', 5, '根據投降的山賊供稱,山賊組織似乎和某秘密教會有往來,徒兒你和山賊作戰時順便搜看看有無蛛絲馬跡', '飛熊山道', NULL);
INSERT INTO `a3k_quest` VALUES ('q00014', '山道巡邏(二)', '墨雲師父', 'n0062', '墨家邨', 'z01', 6, '飛熊山道的山賊們依舊猖獗,繼續維持警戒巡邏,如遇賊人,一律嚴懲', '飛熊山道', NULL);
INSERT INTO `a3k_quest` VALUES ('q00015', '赤焰毒蛇', '涼州牧', 'n0140', '墨家邨', 'z01', 6, '本官派往飛熊山道的官軍,被山賊所飼養的赤焰毒蛇咬傷甚多,在此重賞徵招智勇兼備壯士協助斬蛇', '飛熊山道', NULL);
INSERT INTO `a3k_quest` VALUES ('q00016', '山道巡邏(二)', '墨雲師父', 'n0062', '墨家邨', 'z01', 7, '對飛熊山道山賊們的打壓已經有了效果,繼續執行巡邏任務,只要有賊人出現,決不寬貸', '飛熊山道', NULL);
INSERT INTO `a3k_quest` VALUES ('q00017', '赤練毒蛇膽', '藥商張仕', 'n0062', '墨家邨', 'z01', 7, '赤練毒蛇膽對補氣解毒大有助益,聽說壯士善於獵殺赤練毒蛇,請幫小弟代為收集,小弟必當備妥厚重謝禮', '飛熊山道', NULL);
INSERT INTO `a3k_quest` VALUES ('q00018', '警告山賊頭目', '墨雲師父', 'n0062', '墨家邨', 'z01', 7, '所謂擒賊先擒王,先找出佔據飛熊山道這票山賊的頭兒,好好告誡一番', '飛熊山道', NULL);
INSERT INTO `a3k_quest` VALUES ('q00019', '找尋王善人', '墨雲師父', 'n0062', '墨家邨', 'z01', 8, '不好了,平日在鄉里樂善好施,勤做功德的善人王老先生,居然被山賊擄了去,懇請壯士出手相救', '飛熊山道', 1237009900);
INSERT INTO `a3k_quest` VALUES ('q00020', '找尋王善人', '涼州牧', 'n0140', '墨家邨', 'z01', 8, '不好了,平日在鄉里樂善好施,勤做功德的善人王老先生,居然被山賊擄了去,懇請壯士出手相救', '飛熊山道', NULL);
INSERT INTO `a3k_quest` VALUES ('q00021', '殲滅山賊', '涼州牧', 'n0140', '墨家邨', 'z01', 8, '可惡的山賊,王老先生被折磨的半死不活,還沒回到家門就斷了氣,本官這就發出討伐令,誓必剿滅這些兇手', '飛熊山道', NULL);
INSERT INTO `a3k_quest` VALUES ('q00022', '頭目的首級', '涼州牧', 'n0140', '墨家邨', 'z01', 8, '山賊頭目居然讓他溜了,誰要是取回他的首級來,本官重重有賞', '飛熊山道', NULL);
INSERT INTO `a3k_quest` VALUES ('q00023', '金城沙漠探查', '涼州牧', 'n0140', '墨家邨', 'z01', 9, '原來飛熊山這票山賊是金城沙漠的羌族所假扮,近來邊關蠢蠢欲動,請少俠為我們前往金城沙漠一探究竟', '飛熊山道', NULL);
INSERT INTO `a3k_quest` VALUES ('q00024', '師父的禮物', '墨雲師父', 'n0062', '墨家邨', 'z01', 9, '徒兒,恭喜你的修為進入了新的領域,這是為師給你的獎勵', '金城沙漠', NULL);
INSERT INTO `a3k_quest` VALUES ('q00025', '新夥伴加入', '墨雲師父', 'n0062', '墨家邨', 'z01', 9, '徒兒,派給你一名師弟當左右手,協助你闖蕩江湖,彼此要好好相互照應', '金城沙漠', NULL);
INSERT INTO `a3k_quest` VALUES ('q00026', '蒐集羌族情報', '涼州牧', 'n0140', '墨家邨', 'z01', 9, '最近金城沙漠羌族活動頻繁,去羌兵身上搜出一些軍情回來分析', '金城沙漠', NULL);
INSERT INTO `a3k_quest` VALUES ('q00027', '獵殺惡狼', '墨雲師父', 'n0062', '墨家邨', 'z01', 10, '荒漠狼族橫行,時常咬傷旅人,把他們趕離沙漠一點', '金城沙漠', NULL);
INSERT INTO `a3k_quest` VALUES ('q00028', '刺殺羌族參謀', '墨雲師父', 'n0062', '墨家邨', 'z01', 10, '羌族最近來了一批詭計多端的參謀,換上支前魯貨的羌族服裝,去刺殺那些參謀', '金城沙漠', NULL);
INSERT INTO `a3k_quest` VALUES ('q00029', '沙漠巡邏', '墨雲師父', 'n0062', '墨家邨', 'z01', 10, '在金城沙漠巡邏,維護往來行商安全', '金城沙漠', NULL);
INSERT INTO `a3k_quest` VALUES ('q00030', '沙漠巡邏', '墨雲師父', 'n0062', '墨家邨', 'z01', 10, '在金城沙漠巡邏,維護往來行商安全', '金城沙漠', NULL);
INSERT INTO `a3k_quest` VALUES ('q00031', '沙漠巡邏', '墨雲師父', 'n0062', '墨家邨', 'z01', 10, '在金城沙漠巡邏,維護往來行商安全', '金城沙漠', NULL);
INSERT INTO `a3k_quest` VALUES ('q00032', '找尋狼牙', '墨雲師父', 'n0062', '墨家邨', 'z01', 12, '打鐵舖老闆鄭再打造一隻狼牙棒,正欠缺狼牙,徒弟你去金城沙漠的狼群中,幫他找一些來', '金城沙漠', NULL);
INSERT INTO `a3k_quest` VALUES ('q00033', '攔截羌王求救信', '墨雲師父', 'n0062', '墨家邨', 'z01', 12, '上次的軍事行動,讓羌族參謀深感害怕,據說已經寫信向羌族大王求援,快趕去金城沙漠將信差攔截下來', '金城沙漠', NULL);
INSERT INTO `a3k_quest` VALUES ('q00034', '殺光羌族信差', '墨雲師父', 'n0062', '墨家邨', 'z01', 12, '原來出發求救的信差有好幾批,一股作氣通通都殺了', '金城沙漠', NULL);
INSERT INTO `a3k_quest` VALUES ('q00035', '羌族寶刀', '墨雲師父', 'n0062', '墨家邨', 'z01', 13, '打鐵舖老闆又為了打造新兵器煩惱了,據說羌兵小隊長所被帶的羌兵寶刀設計特殊,去金城沙漠找幾把回來看看', '金城沙漠', NULL);
INSERT INTO `a3k_quest` VALUES ('q00036', '羌兵小隊長的復仇', '墨雲師父', 'n0062', '墨家邨', 'z01', 13, '掉了寶刀的小隊長們,準備來找鐵匠舖老闆尋仇,快趕在他們來到之前,在金城沙漠中將他們擊退', '金城沙漠', NULL);
INSERT INTO `a3k_quest` VALUES ('q00037', '懸賞羌族先鋒將', '涼州牧', 'n0142', '墨家邨', 'z01', 13, '本官派出去的部隊居然在金城沙漠被槍哫部隊帶頭的羌族先鋒將給擊敗了,若能取得其首級者有重賞', '金城沙漠', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_quest_status`
-- 

CREATE TABLE `a3k_quest_status` (
  `p_id` varchar(10) NOT NULL default '',
  `q_id` varchar(10) NOT NULL default '',
  `q_status` tinyint(3) default NULL,
  `q_data` text,
  `q_end_time` int(10) default NULL,
  PRIMARY KEY  (`p_id`,`q_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `a3k_quest_status`
-- 

INSERT INTO `a3k_quest_status` VALUES ('1', 'q00001', 1, 'a:2:{s:7:"monster";N;s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('1', 'q00002', 1, 'a:2:{s:7:"monster";a:1:{s:6:"a00004";i:3;}s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('1', 'q00003', 1, 'a:2:{s:7:"monster";N;s:5:"fight";a:1:{s:3:"a01";i:4;}}', 0);
INSERT INTO `a3k_quest_status` VALUES ('1', 'q00004', 1, 'a:2:{s:7:"monster";N;s:5:"fight";a:1:{s:3:"a01";i:4;}}', 0);
INSERT INTO `a3k_quest_status` VALUES ('1', 'q00005', 1, 'a:2:{s:7:"monster";a:1:{s:6:"a00007";i:6;}s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('1', 'q00006', 1, 'a:2:{s:7:"monster";N;s:5:"fight";a:1:{s:3:"a01";i:9;}}', 0);
INSERT INTO `a3k_quest_status` VALUES ('1', 'q00007', 1, 'a:2:{s:7:"monster";N;s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('1', 'q00008', 1, 'a:2:{s:7:"monster";a:1:{s:6:"a00013";i:10;}s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('1', 'q00009', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('13', 'q00001', 1, 'a:2:{s:7:"monster";N;s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('13', 'q00002', 1, 'a:2:{s:7:"monster";a:1:{s:6:"a00004";i:5;}s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('16', 'q00001', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('16', 'q00002', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('16', 'q00003', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('16', 'q00004', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('16', 'q00005', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('16', 'q00006', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('16', 'q00007', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('16', 'q00008', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('16', 'q00009', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('16', 'q00010', 1, 'a:2:{s:7:"monster";N;s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('16', 'q00011', 1, 'a:2:{s:7:"monster";a:1:{s:6:"a00016";i:3;}s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('16', 'q00015', 2, 'a:2:{s:7:"monster";a:0:{}s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00001', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00002', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00003', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00004', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00005', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00006', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00007', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00008', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00009', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00010', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00011', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00012', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00013', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00014', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00015', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00016', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00017', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00018', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00020', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00021', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00022', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00023', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00024', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00026', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00027', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00032', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00033', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00034', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('17', 'q00035', 1, 'a:2:{s:7:"monster";N;s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('26', 'q00001', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('26', 'q00002', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('26', 'q00003', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('26', 'q00004', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('26', 'q00005', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('26', 'q00006', 1, 'a:2:{s:7:"monster";N;s:5:"fight";a:1:{s:3:"a01";i:10;}}', 0);
INSERT INTO `a3k_quest_status` VALUES ('26', 'q00007', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('26', 'q00008', 1, 'a:2:{s:7:"monster";a:1:{s:6:"a00013";i:10;}s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00001', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00002', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00003', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00004', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00005', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00006', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00007', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00008', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00009', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00010', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00011', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00012', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00013', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00014', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00015', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00016', 1, 'a:2:{s:7:"monster";N;s:5:"fight";a:1:{s:3:"a02";i:17;}}', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00017', 1, 'a:2:{s:7:"monster";N;s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00018', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00020', 1, 'a:2:{s:7:"monster";a:1:{s:6:"a00025";i:2;}s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00024', 1, 'a:2:{s:7:"monster";N;s:5:"fight";a:1:{s:3:"a03";i:1;}}', 0);
INSERT INTO `a3k_quest_status` VALUES ('27', 'q00027', 1, 'a:2:{s:7:"monster";a:2:{s:6:"a00031";i:10;s:6:"a00037";i:10;}s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('3', 'q00001', 1, 'a:2:{s:7:"monster";N;s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('3', 'q00002', 1, 'a:2:{s:7:"monster";a:1:{s:6:"a00004";i:5;}s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('7', 'q00001', 1, 'a:2:{s:7:"monster";N;s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('7', 'q00003', 1, 'a:2:{s:7:"monster";N;s:5:"fight";a:0:{}}', 0);
INSERT INTO `a3k_quest_status` VALUES ('7', 'q00005', 1, 'a:2:{s:7:"monster";a:1:{s:6:"a00007";i:1;}s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('7', 'q00007', 1, 'a:2:{s:7:"monster";N;s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('8', 'q00001', 1, 'a:2:{s:7:"monster";N;s:5:"fight";i:0;}', 0);
INSERT INTO `a3k_quest_status` VALUES ('8', 'q00002', 1, 'a:2:{s:7:"monster";a:1:{s:6:"a00004";i:5;}s:5:"fight";i:0;}', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_quest_time`
-- 

CREATE TABLE `a3k_quest_time` (
  `q_id` varchar(10) default NULL,
  `q_week` tinyint(3) unsigned default NULL,
  `q_hour` mediumint(8) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `a3k_quest_time`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_role`
-- 

CREATE TABLE `a3k_role` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `role_id` varchar(45) NOT NULL COMMENT '職業id',
  `role_name` varchar(45) NOT NULL COMMENT '職業名稱',
  `role_skillpointmax` int(10) unsigned NOT NULL default '0' COMMENT '熟練度場次',
  `role_parentid` varchar(45) NOT NULL default '' COMMENT '父系職業ID',
  `role_lmt_lvl` int(10) unsigned NOT NULL default '0' COMMENT '等級限制',
  `role_lmt_str` int(10) unsigned NOT NULL default '0' COMMENT '力量限制',
  `role_lmt_bone` int(11) NOT NULL default '0' COMMENT '根骨限制',
  `role_lmt_agl` int(10) unsigned NOT NULL default '0' COMMENT '速度限制',
  `role_lmt_smart` int(10) unsigned NOT NULL default '0' COMMENT '智力限制',
  `role_lmt_vit` int(10) unsigned NOT NULL default '0' COMMENT '體魄限制',
  `role_skill_str_init` int(10) unsigned NOT NULL default '0' COMMENT 'skill提昇力量init',
  `role_skill_str_max` int(10) unsigned NOT NULL default '0' COMMENT 'skill提昇力量max',
  `role_skill_bone_init` int(10) unsigned NOT NULL default '0' COMMENT 'skill提昇根骨init',
  `role_skill_bone_max` int(10) unsigned NOT NULL default '0' COMMENT 'skill提昇根骨max',
  `role_skill_agl_init` int(10) unsigned NOT NULL default '0' COMMENT 'skill提昇速度init',
  `role_skill_agl_max` int(10) unsigned NOT NULL default '0' COMMENT 'skill提昇速度max',
  `role_skill_smart_init` int(10) unsigned NOT NULL default '0' COMMENT 'skill提昇智力init',
  `role_skill_smart_max` int(10) unsigned NOT NULL default '0' COMMENT 'skill提昇智力max',
  `role_skill_vit_init` int(10) unsigned NOT NULL default '0' COMMENT 'skill提昇體魄init',
  `role_skill_vit_max` int(10) unsigned NOT NULL default '0' COMMENT 'skill提昇體魄max',
  `role_skillname` varchar(45) default NULL COMMENT 'skill 名稱',
  `role_descri` varchar(500) default NULL COMMENT '職業的介紹',
  `role_theegg` varchar(45) NOT NULL default '0' COMMENT '職業的頭',
  `role_parentname` varchar(45) default NULL COMMENT '父系職業name',
  `role_img` varchar(45) NOT NULL default '' COMMENT '職業圖',
  `role_skillimg` varchar(45) NOT NULL default '' COMMENT '技能圖',
  `skill_default_turns` tinyint(10) unsigned NOT NULL default '1' COMMENT '技能初始影響回合數',
  `skill_active` tinyint(1) unsigned NOT NULL default '0' COMMENT '技能 0主動1被動',
  `skill_type` varchar(45) NOT NULL default '-' COMMENT '技能種類',
  `skill_animat_img` varchar(10) default NULL COMMENT '技能 特效 圖',
  `skill_descr` varchar(45) NOT NULL default '--' COMMENT '技能說明',
  PRIMARY KEY  USING BTREE (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='職業表; InnoDB free: 11264 kB' AUTO_INCREMENT=25 ;

-- 
-- Dumping data for table `a3k_role`
-- 

INSERT INTO `a3k_role` VALUES (1, 'a01', '俠客', 50, '0', 1, 1, 1, 1, 1, 1, 1, 3, 1, 2, 1, 3, 1, 2, 1, 2, '強襲', '學習武功為主的墨門弟子，升級時最多可提昇屬性（力量：3、智力：2、敏捷：3、體質：2、根骨：2）', 'a01', '無', 'm001', 'n007', 1, 0, 'addattack', 'e03', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_role` VALUES (2, 'b01', '秀才', 50, '0', 1, 1, 1, 1, 1, 1, 0, 1, 0, 2, 1, 2, 1, 3, 0, 2, '強襲', '學習計謀為主的墨門弟子，升級時最多可提昇屬性（力量：1、智力：3、敏捷：2、體質：2、根骨：2）', 'b01', '無', 'm004', 'n001', 1, 0, 'addattack', 'e03', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_role` VALUES (3, 'c01', '校衛', 50, '0', 1, 1, 1, 1, 1, 1, 1, 3, 1, 2, 0, 2, 0, 1, 1, 3, '強襲', '學習兵法為主的墨門弟子，升級時最多可提昇屬性（力量：3、智力：1、敏捷：2、體質：3、根骨：2）', 'c01', '無', 'm007', 'n004', 1, 0, 'addattack', 'e03', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_role` VALUES (4, 'a02', '劍客', 100, 'a01', 10, 20, 12, 12, 12, 12, 2, 3, 1, 2, 1, 3, 1, 2, 1, 2, '施毒', '專研劍法的俠客，升級時最多可提昇屬性（力量：3、智力：2、敏捷：3、體質：2、根骨：2）', 'a01', '俠客', 'm002', 'n008', 3, 0, 'poison', 'e03', '讓敵人中毒');
INSERT INTO `a3k_role` VALUES (5, 'a03', '道士', 100, 'a01', 10, 20, 12, 12, 12, 12, 1, 2, 1, 3, 0, 2, 1, 2, 1, 3, '回血', '學習計謀的俠客，升級時最多可提昇屬性（力量：2、智力：2、敏捷：2、體質：2、根骨：2）', 'a01', '俠客', 'm003', 'n009', 1, 0, 'getHP', 'e03', '使敵方混亂');
INSERT INTO `a3k_role` VALUES (6, 'b02', '參謀', 100, 'b01', 10, 12, 12, 12, 20, 12, 0, 2, 1, 2, 1, 2, 1, 2, 1, 2, '定身', '專研謀略的秀才，升級時最多可提昇屬性（力量：1、智力：3、敏捷：2、體質：2、根骨：2）', 'b01', '秀才', 'm005', 'n002', 1, 1, 'dodge', 'e03', '使敵人無法動彈');
INSERT INTO `a3k_role` VALUES (7, 'b03', '辯士', 100, 'b01', 10, 12, 12, 12, 20, 12, 0, 1, 1, 2, 0, 2, 1, 3, 0, 2, '混亂', '學習兵法的秀才，升級時最多可提昇屬性（力量：3、智力：2、敏捷：2、體質：2、根骨：2）', 'b01', '秀才', 'm006', 'n003', 1, 0, 'toConfuse', 'e03', '俠客學會的技能');
INSERT INTO `a3k_role` VALUES (8, 'c02', '先鋒營', 100, 'c01', 10, 12, 12, 12, 12, 20, 2, 3, 1, 2, 1, 2, 1, 2, 1, 2, '必殺', '專研兵法的校尉，升級時最多可提昇屬性（力量：3、智力：2、敏捷：2、體質：2、根骨：2）', 'c01', '校衛', 'm008', 'n005', 1, 1, 'tokill', 'e03', '增加必殺攻擊機率');
INSERT INTO `a3k_role` VALUES (9, 'c03', '鐵甲營', 100, 'c01', 10, 12, 12, 12, 12, 20, 1, 3, 1, 3, 1, 2, 1, 2, 1, 3, '反彈', '學習武功的校尉，升級時最多可提昇屬性（力量：3、智力：2、敏捷：2、體質：3、根骨：3）', 'c01', '校衛', 'm009', 'n006', 5, 0, 'tobunceback', 'e03', '反彈部份傷害');
INSERT INTO `a3k_role` VALUES (10, 'a04', '強襲', 3, 'a01', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '強襲', '強襲', 'a01', '俠客', 'icon_2', 'n007', 1, 0, 'addattack', 'e03', '強襲');
INSERT INTO `a3k_role` VALUES (11, 'a05', '必殺', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '必殺', '必殺', 'a01', '俠客', 'icon_2', 'n001', 1, 1, 'tokill', 'e03', '必殺');
INSERT INTO `a3k_role` VALUES (12, 'a06', '虛弱', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '虛弱', '虛弱', 'a01', '俠客', 'icon_2', 'n004', 5, 0, 'weaken', 'e03', '虛弱');
INSERT INTO `a3k_role` VALUES (13, 'a07', '施毒', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '施毒', '施毒', 'a01', '俠客', 'icon_2', 'n008', 3, 0, 'poison', 'e03', '施毒');
INSERT INTO `a3k_role` VALUES (14, 'a08', '閃避', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '閃避', '閃避', 'a01', '俠客', 'icon_2', 'n009', 1, 1, 'dodge', 'e03', '閃避');
INSERT INTO `a3k_role` VALUES (15, 'a09', '連擊', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '連擊', '連擊', 'a01', '俠客', 'icon_2', 'n002', 5, 0, 'multiply', 'e03', '連擊');
INSERT INTO `a3k_role` VALUES (16, 'a10', '武將', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '武將', '武將', 'a01', '俠客', 'icon_2', 'n003', 3, 0, 'fellowgain', 'e03', '武將');
INSERT INTO `a3k_role` VALUES (17, 'a11', '定身', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '定身', '定身', 'a01', '俠客', 'icon_2', 'n005', 1, 0, 'tofreeze', 'e03', '定身');
INSERT INTO `a3k_role` VALUES (18, 'a12', '反彈', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '反彈', '反彈', 'a01', '俠客', 'icon_2', 'n006', 5, 0, 'tobunceback', 'e03', '反彈');
INSERT INTO `a3k_role` VALUES (19, 'a13', '減傷', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '減傷', '減傷', 'a01', '俠客', 'icon_2', 'n007', 3, 0, 'deductDamage', 'e03', '減傷');
INSERT INTO `a3k_role` VALUES (20, 'a14', '回血', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '回血', '回血', 'a01', '俠客', 'icon_2', 'n001', 1, 0, 'getHP', 'e03', '回血');
INSERT INTO `a3k_role` VALUES (21, 'a15', '自爆', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '自爆', '自爆', 'a01', '俠客', 'icon_2', 'n004', 1, 0, 'toNuc', 'e03', '自爆');
INSERT INTO `a3k_role` VALUES (22, 'a16', '混亂', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '混亂', '混亂', 'a01', '俠客', 'icon_2', 'n008', 1, 0, 'toConfuse', 'e03', '混亂');
INSERT INTO `a3k_role` VALUES (23, 'a17', '吸血', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '吸血', '吸血', 'a01', '俠客', 'icon_2', 'n009', 1, 0, 'toGetHP', 'e03', '吸血');
INSERT INTO `a3k_role` VALUES (24, 'a18', '反間', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '反間', '反間', 'a01', '俠客', 'icon_2', 'n002', 1, 0, 'toSuic', 'e03', '反間');

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_shortcut`
-- 

CREATE TABLE `a3k_shortcut` (
  `sc_id` int(10) unsigned NOT NULL auto_increment COMMENT 'id',
  `p_id` varchar(45) NOT NULL COMMENT '玩家id',
  `sc_pos` varchar(45) NOT NULL default '0' COMMENT '快捷位子',
  `sc_type` varchar(45) NOT NULL default '0' COMMENT '快捷內容種類(1:skill / 2:item)',
  `sc_status` tinyint(1) NOT NULL default '0' COMMENT '快捷''狀態(1:clicked/0:not)',
  `sc_type_id` varchar(45) NOT NULL COMMENT '快捷內容id',
  `sc_img` varchar(45) NOT NULL default ' ' COMMENT '快捷圖',
  `sc_usename` varchar(45) NOT NULL default ' ' COMMENT '快捷內容名子',
  PRIMARY KEY  (`sc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='玩家快捷' AUTO_INCREMENT=14 ;

-- 
-- Dumping data for table `a3k_shortcut`
-- 

INSERT INTO `a3k_shortcut` VALUES (3, '3', '1', '1', 0, '41', 'f0001', 'deductDamage');
INSERT INTO `a3k_shortcut` VALUES (4, '17', '5', '1', 0, '56', 'icon_2', '強襲');
INSERT INTO `a3k_shortcut` VALUES (5, '7', '1', '1', 0, '7', 'icon_2', '武將');
INSERT INTO `a3k_shortcut` VALUES (6, '23', '1', '1', 1, '62', 'icon_2', '強襲');
INSERT INTO `a3k_shortcut` VALUES (7, '19', '1', '1', 0, '58', 'icon_2', '強襲');
INSERT INTO `a3k_shortcut` VALUES (8, '26', '9', '1', 0, '66', 'icon_2', '強襲');
INSERT INTO `a3k_shortcut` VALUES (9, '29', '1', '1', 0, '69', 'icon_2', '強襲');
INSERT INTO `a3k_shortcut` VALUES (10, '27', '1', '1', 0, '67', 'icon_2', '強襲');
INSERT INTO `a3k_shortcut` VALUES (11, '17', '6', '1', 0, '65', 'n006', '反彈');
INSERT INTO `a3k_shortcut` VALUES (12, '16', '1', '1', 0, '71', 'icon_2', '強襲');
INSERT INTO `a3k_shortcut` VALUES (13, '17', '1', '2', 0, 'j0002', 'l001', '商城大還散');

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_skill`
-- 

CREATE TABLE `a3k_skill` (
  `skill_id` int(10) unsigned NOT NULL auto_increment,
  `role_id` varchar(45) NOT NULL default '0' COMMENT '職業id',
  `user_id` int(10) unsigned NOT NULL default '0' COMMENT '玩家id',
  `skill_point` int(10) unsigned NOT NULL default '0' COMMENT '技能/職業熟練度',
  `role_skillpointmax` int(10) unsigned NOT NULL default '0' COMMENT '熟練度需要場次',
  `skill_lvl` int(45) NOT NULL default '1' COMMENT '技能等級',
  `skill_type` varchar(45) NOT NULL default '0' COMMENT '技能種類',
  `skill_effect_turns` int(10) unsigned NOT NULL default '0' COMMENT '技能影響次數',
  `skill_active` tinyint(3) unsigned NOT NULL default '0' COMMENT '0主動1被動',
  `skill_default_turns` tinyint(10) unsigned NOT NULL default '1' COMMENT '技能初始影響回合數',
  `skill_img` varchar(10) default NULL COMMENT '技能 icon 圖',
  `skill_animat_img` varchar(10) default NULL COMMENT '技能 特效 圖',
  `skill_name` varchar(45) default NULL COMMENT '技能名子',
  `skill_descr` varchar(45) NOT NULL default '--' COMMENT '技能說明',
  PRIMARY KEY  (`skill_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='玩家技能' AUTO_INCREMENT=87 ;

-- 
-- Dumping data for table `a3k_skill`
-- 

INSERT INTO `a3k_skill` VALUES (2, 'a05', 2, 0, 0, 1, 'tokill', 0, 1, 1, 'icon_2', 'e03', '必殺', '--');
INSERT INTO `a3k_skill` VALUES (3, 'a06', 3, 1, 0, 1, 'weaken', 0, 0, 5, 'icon_2', 'e03', '虛弱', '--');
INSERT INTO `a3k_skill` VALUES (4, 'a07', 4, 1, 1, 1, 'poison', 0, 0, 3, 'icon_2', 'e03', '施毒', '--');
INSERT INTO `a3k_skill` VALUES (5, 'a08', 5, 1, 0, 1, 'dodge', 1, 0, 1, 'icon_2', 'e03', '閃避', '--');
INSERT INTO `a3k_skill` VALUES (6, 'a09', 6, 0, 0, 1, 'multiply', 5, 0, 5, 'icon_2', 'e03', '連擊', '--');
INSERT INTO `a3k_skill` VALUES (7, 'a10', 7, 0, 0, 1, 'fellowgain', 0, 0, 3, 'icon_2', 'e03', '武將', '--');
INSERT INTO `a3k_skill` VALUES (8, 'a11', 8, 0, 0, 1, 'tofreeze', 0, 0, 1, 'icon_2', 'e03', '定身', '--');
INSERT INTO `a3k_skill` VALUES (9, 'a12', 9, 0, 0, 1, 'tobunceback', 0, 0, 5, 'icon_2', 'e03', '反彈', '--');
INSERT INTO `a3k_skill` VALUES (10, 'a13', 10, 0, 0, 1, 'deductDamage', 0, 0, 3, 'icon_2', 'e03', '減傷', '--');
INSERT INTO `a3k_skill` VALUES (11, 'a14', 11, 0, 0, 1, 'getHP', 0, 0, 1, 'icon_2', 'e03', '回血', '--');
INSERT INTO `a3k_skill` VALUES (12, 'a15', 12, 0, 0, 1, 'toNuc', 0, 0, 1, 'icon_2', 'e03', '自爆', '--');
INSERT INTO `a3k_skill` VALUES (13, 'a17', 13, 0, 0, 1, 'toConfuse', 1, 0, 1, 'icon_2', 'e03', '混亂', '--');
INSERT INTO `a3k_skill` VALUES (14, 'a18', 14, 0, 0, 1, 'toGetHP', 0, 0, 1, 'icon_2', 'e03', '吸血', '--');
INSERT INTO `a3k_skill` VALUES (15, 'a19', 15, 0, 0, 1, 'toSuic', 0, 0, 1, 'icon_2', 'e03', '反間', '--');
INSERT INTO `a3k_skill` VALUES (17, 'a04', 1, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '--');
INSERT INTO `a3k_skill` VALUES (18, 'a16', 13, 1, 1, 1, 'toConfuse', 0, 0, 1, 'icon_2', 'e03', '混亂', '--');
INSERT INTO `a3k_skill` VALUES (39, 'b01', 2, 1, 50, 1, 'addattack', 0, 0, 1, 'f0001', 'e03', '秀才的技能', '');
INSERT INTO `a3k_skill` VALUES (41, 'a02', 3, 0, 0, 1, 'deductDamage', 0, 0, 3, 'f0001', 'e03', 'deductDamage', '俠客學會的技能');
INSERT INTO `a3k_skill` VALUES (42, 'a01', 3, 0, 0, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '俠客的技能', '俠客學會的技能');
INSERT INTO `a3k_skill` VALUES (43, 'a18', 15, 1, 1, 1, 'toSuic', 1, 0, 1, 'icon_2', 'e03', '反間', '');
INSERT INTO `a3k_skill` VALUES (54, 'a01', 16, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (55, 'a02', 16, 91, 100, 1, 'deductDamage', 0, 0, 3, 'f0001', 'e03', 'deductDamage', '俠客學會的技能');
INSERT INTO `a3k_skill` VALUES (56, 'c01', 17, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (57, 'a01', 18, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (58, 'a01', 19, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (59, 'a01', 20, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (60, 'a01', 21, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (61, 'a01', 22, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (62, 'b01', 23, 3, 3, 1, 'addattack', 1, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (63, 'c01', 24, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (64, 'a01', 25, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (65, 'c03', 17, 100, 100, 1, 'tobunceback', 0, 0, 5, 'n006', 'e03', '反彈', '反彈部份傷害');
INSERT INTO `a3k_skill` VALUES (66, 'a01', 26, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (67, 'a01', 27, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (68, 'c01', 28, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (69, 'a01', 29, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (70, 'a01', 30, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (71, 'a01', 16, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (72, 'a01', 16, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (73, 'a01', 16, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (74, 'b01', 17, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (75, 'b01', 17, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (76, 'a01', 17, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (77, 'a01', 17, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (78, 'a01', 17, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (79, 'b01', 16, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (80, 'b01', 16, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (81, 'a01', 17, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (82, 'b01', 18, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (83, 'c01', 19, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (84, 'a01', 20, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (85, 'a01', 21, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');
INSERT INTO `a3k_skill` VALUES (86, 'a01', 22, 3, 3, 1, 'addattack', 0, 0, 1, 'icon_2', 'e03', '強襲', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害');

-- --------------------------------------------------------

-- 
-- Table structure for table `chat`
-- 

CREATE TABLE `chat` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `content` varchar(21000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `chat`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `chatbk`
-- 

CREATE TABLE `chatbk` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `content` varchar(21000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `chatbk`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `chatindex`
-- 

CREATE TABLE `chatindex` (
  `cindextime` int(10) NOT NULL default '0',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`cindextime`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `chatindex`
-- 

