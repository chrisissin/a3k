-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Aug 06, 2009 at 03:33 AM
-- Server version: 5.0.67
-- PHP Version: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `a3k`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_role`
-- 

DROP TABLE IF EXISTS `a3k_role`;
CREATE TABLE IF NOT EXISTS `a3k_role` (
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
  PRIMARY KEY  USING BTREE (`id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='職業表; InnoDB free: 11264 kB' AUTO_INCREMENT=25 ;

-- 
-- Dumping data for table `a3k_role`
-- 

INSERT INTO `a3k_role` (`id`, `role_id`, `role_name`, `role_skillpointmax`, `role_parentid`, `role_lmt_lvl`, `role_lmt_str`, `role_lmt_bone`, `role_lmt_agl`, `role_lmt_smart`, `role_lmt_vit`, `role_skill_str_init`, `role_skill_str_max`, `role_skill_bone_init`, `role_skill_bone_max`, `role_skill_agl_init`, `role_skill_agl_max`, `role_skill_smart_init`, `role_skill_smart_max`, `role_skill_vit_init`, `role_skill_vit_max`, `role_skillname`, `role_descri`, `role_theegg`, `role_parentname`, `role_img`, `role_skillimg`, `skill_default_turns`, `skill_active`, `skill_type`, `skill_animat_img`, `skill_descr`) VALUES 
(1, 'a01', '俠客', 50, '0', 1, 1, 1, 1, 1, 1, 1, 3, 1, 2, 1, 3, 1, 2, 1, 2, '強襲', '學習武功為主的墨門弟子，升級時最多可提昇屬性（力量：3、智力：2、敏捷：3、體質：2、根骨：2）', 'a01', '無', 'm3002', 'n1001', 1, 0, 'addattack', 'e03', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害'),
(2, 'b01', '秀才', 50, '0', 1, 1, 1, 1, 1, 1, 0, 1, 0, 2, 1, 2, 1, 3, 0, 2, '強襲', '學習計謀為主的墨門弟子，升級時最多可提昇屬性（力量：1、智力：3、敏捷：2、體質：2、根骨：2）', 'b01', '無', 'm1001', 'n1001', 1, 0, 'addattack', 'e03', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害'),
(3, 'c01', '校衛', 50, '0', 1, 1, 1, 1, 1, 1, 1, 3, 1, 2, 0, 2, 0, 1, 1, 3, '強襲', '學習兵法為主的墨門弟子，升級時最多可提昇屬性（力量：3、智力：1、敏捷：2、體質：3、根骨：2）', 'c01', '無', 'm2001', 'n1001', 1, 0, 'addattack', 'e03', '所有墨家子弟學會的最初技能，能發揮自身潛能造成較大的傷害'),
(4, 'a02', '劍客', 100, 'a01', 10, 20, 12, 12, 12, 12, 2, 3, 1, 2, 1, 3, 1, 2, 1, 2, '施毒', '專研劍法的俠客，升級時最多可提昇屬性（力量：3、智力：2、敏捷：3、體質：2、根骨：2）', 'a01', '俠客', 'm3002', 'n4002', 3, 0, 'poison', 'e03', '讓敵人中毒'),
(5, 'a03', '道士', 100, 'a01', 10, 20, 12, 12, 12, 12, 1, 2, 1, 3, 0, 2, 1, 2, 1, 3, '回血', '學習計謀的俠客，升級時最多可提昇屬性（力量：2、智力：2、敏捷：2、體質：2、根骨：2）', 'a01', '俠客', 'm3003', 'n2001', 1, 0, 'getHP', 'e03', '恢復體力值'),
(6, 'b02', '參謀', 100, 'b01', 10, 12, 12, 12, 20, 12, 0, 2, 1, 2, 1, 2, 1, 2, 1, 2, '定身', '專研謀略的秀才，升級時最多可提昇屬性（力量：1、智力：3、敏捷：2、體質：2、根骨：2）', 'b01', '秀才', 'm1003', 'n6001', 1, 1, 'dodge', 'e03', '增加閃避機率'),
(7, 'b03', '辯士', 100, 'b01', 10, 12, 12, 12, 20, 12, 0, 1, 1, 2, 0, 2, 1, 3, 0, 2, '混亂', '學習兵法的秀才，升級時最多可提昇屬性（力量：3、智力：2、敏捷：2、體質：2、根骨：2）', 'b01', '秀才', 'm1004', 'n2002', 1, 0, 'toConfuse', 'e03', '造成敵人混亂'),
(8, 'c02', '先鋒營', 100, 'c01', 10, 12, 12, 12, 12, 20, 2, 3, 1, 2, 1, 2, 1, 2, 1, 2, '必殺', '專研兵法的校尉，升級時最多可提昇屬性（力量：3、智力：2、敏捷：2、體質：2、根骨：2）', 'c01', '校衛', 'm2002', 'n1003', 1, 1, 'tokill', 'e03', '增加必殺攻擊機率'),
(9, 'c03', '鐵甲營', 100, 'c01', 10, 12, 12, 12, 12, 20, 1, 3, 1, 3, 1, 2, 1, 2, 1, 3, '反彈', '學習武功的校尉，升級時最多可提昇屬性（力量：3、智力：2、敏捷：2、體質：3、根骨：3）', 'c01', '校衛', 'm2004', 'n3001', 5, 0, 'tobunceback', 'e03', '反彈部份傷害'),
(10, 'a04', '強襲', 3, 'a01', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '強襲', '強襲', 'a01', '俠客', 'm3006', 'n1001', 1, 0, 'addattack', 'e03', '強襲'),
(11, 'a05', '必殺', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '必殺', '必殺', 'a01', '俠客', 'm3006', 'n1003', 1, 1, 'tokill', 'e03', '必殺'),
(12, 'a06', '虛弱', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '虛弱', '虛弱', 'a01', '俠客', 'm3006', 'n004', 5, 0, 'weaken', 'e03', '虛弱'),
(13, 'a07', '施毒', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '施毒', '施毒', 'a01', '俠客', 'm3006', 'n4002', 3, 0, 'poison', 'e03', '施毒'),
(14, 'a08', '閃避', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '閃避', '閃避', 'a01', '俠客', 'm3006', 'n6001', 1, 1, 'dodge', 'e03', '閃避'),
(15, 'a09', '連擊', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '連擊', '連擊', 'a01', '俠客', 'm3006', 'n1002', 5, 0, 'multiply', 'e03', '連擊'),
(16, 'a10', '武將', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '武將', '武將', 'a01', '俠客', 'm3006', 'n2003', 3, 0, 'fellowgain', 'e03', '武將'),
(17, 'a11', '定身', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '定身', '定身', 'a01', '俠客', 'm3006', 'n6003', 1, 0, 'tofreeze', 'e03', '定身'),
(18, 'a12', '反彈', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '反彈', '反彈', 'a01', '俠客', 'm3006', 'n3001', 5, 0, 'tobunceback', 'e03', '反彈'),
(19, 'a13', '減傷', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '減傷', '減傷', 'a01', '俠客', 'm3006', 'n3003', 3, 0, 'deductDamage', 'e03', '減傷'),
(20, 'a14', '回血', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '回血', '回血', 'a01', '俠客', 'm3006', 'n2001', 1, 0, 'getHP', 'e03', '回血'),
(21, 'a15', '自爆', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '自爆', '自爆', 'a01', '俠客', 'm3006', 'n4001', 1, 0, 'toNuc', 'e03', '自爆'),
(22, 'a16', '混亂', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '混亂', '混亂', 'a01', '俠客', 'm3006', 'n2002', 1, 0, 'toConfuse', 'e03', '混亂'),
(23, 'a17', '吸血', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '吸血', '吸血', 'a01', '俠客', 'm3006', 'n5001', 1, 0, 'toGetHP', 'e03', '吸血'),
(24, 'a18', '反間', 1, 'a01', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '反間', '反間', 'a01', '俠客', 'm3006', 'n6002', 1, 0, 'toSuic', 'e03', '反間');
