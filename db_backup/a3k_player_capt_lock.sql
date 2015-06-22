-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jul 07, 2009 at 11:32 AM
-- Server version: 5.0.67
-- PHP Version: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `a3k`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_player`
-- 

DROP TABLE IF EXISTS `a3k_player`;
CREATE TABLE IF NOT EXISTS `a3k_player` (
  `p_id` int(10) unsigned NOT NULL auto_increment,
  `p_capt_attempts` int(3) NOT NULL default '0' COMMENT '認證嘗試數',
  `p_locktime` datetime default NULL COMMENT '鎖帳號時間',
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

INSERT INTO `a3k_player` (`p_id`, `p_capt_attempts`, `p_locktime`, `p_name`, `p_at`, `p_df`, `p_str`, `p_vit`, `p_smart`, `p_agl`, `p_hp`, `p_hpmax`, `role_id`, `p_money`, `p_lv`, `p_exp`, `p_nextexp`, `p_win`, `p_lost`, `p_sex`, `p_img`, `p_act_time`, `p_createdate`, `p_map`, `p_bank`, `f_1001ya`, `p_mn`, `p_mnmax`, `pf_id`, `p_rankname`, `p_bone`, `p_fight_time`, `p_guild`, `p_team`, `p_blacklist`, `p_packsize_1`, `p_packsize_2`, `p_packsize_3`, `p_packsize_4`, `p_learn`, `p_r_money`, `promo_code`) VALUES 
(1, 0, NULL, 'test1強襲', 20, 20, 16, 16, 16, 16, 78, 89, 'a04', 280, 7, 53, 400, 65, 5, 1, 'p0050', NULL, NULL, 'a01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 55, 60, 14, '墨門弟子', 31, NULL, 0, 0, '', 25, 25, 25, 25, 0, 80, '21'),
(2, 0, NULL, 'test2必殺', 20, 17, 10, 12, 10, 10, 0, 50, 'b01', 106, 1, 45, 100, 2, 2, 1, 'p0050', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 99, 99, 2, '墨門弟子', 18, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL),
(3, 0, NULL, 'test3虛弱', 20, 40, 16, 13, 14, 15, 62, 65, 'a01', 157, 3, 153, 200, 20, 0, 1, 'p0050', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 44, 44, 27, '墨門弟子', 14, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, '21'),
(4, 0, NULL, 'test4施毒', 20, 22, 10, 10, 10, 10, 49, 50, 'a07', 106, 1, 52, 100, 2, 0, 1, 'p0050', NULL, NULL, 'a01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 99, 99, 4, '墨門弟子', 11, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL),
(5, 0, NULL, 'test5閃避', 20, 20, 10, 10, 10, 10, 55, 55, 'a08', 124, 2, 81, 150, 8, 2, 1, 'p0050', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 33, 33, 37, '墨門弟子', 15, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL),
(6, 0, NULL, 'test6連擊', 20, 20, 10, 10, 10, 10, 41, 55, 'a09', 115, 2, 2, 150, 5, 4, 1, 'p0060', NULL, NULL, 'a02', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 19, 33, 6, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL),
(7, 0, NULL, 'test7武將', 20, 30, 10, 10, 10, 10, 55, 55, 'a10', 24, 8, 100, 150, 9, 2, 1, 'p0010', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 33, 33, 7, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL),
(8, 0, NULL, 'test8定身', 20, 20, 10, 10, 10, 10, 50, 50, 'a11', 106, 8, 45, 100, 2, 8, 1, 'p0020', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 99, 99, 8, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL),
(9, 0, NULL, 'test9反彈', 20, 20, 10, 10, 10, 10, 54, 55, 'a12', 124, 2, 67, 150, 8, 1, 1, 'p0030', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 18, 33, 5, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL),
(10, 0, NULL, 'test10減傷', 20, 20, 10, 10, 10, 10, 47, 50, 'a13', 103, 1, 19, 100, 1, 0, 1, 'p0050', NULL, NULL, 'a01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 30, 99, 17, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL),
(11, 0, NULL, 'test11回血', 20, 20, 10, 10, 10, 10, 50, 50, 'a14', 100, 1, 0, 100, 0, 0, 1, 'p0050', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 30, 99, 22, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL),
(12, 0, NULL, 'test12自爆', 20, 20, 10, 10, 10, 10, 50, 50, 'a15', 100, 1, 0, 100, 0, 0, 1, 'p0050', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 30, 99, 27, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL),
(13, 0, NULL, 'test13混亂', 20, 30, 10, 10, 10, 10, 60, 60, 'a16', 145, 3, 91, 200, 16, 0, 1, 'p0050', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 36, 36, 32, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL),
(14, 0, NULL, 'test14吸血', 20, 20, 10, 10, 10, 10, 50, 50, 'a17', 100, 1, 0, 100, 0, 0, 1, 'p0050', NULL, NULL, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 30, 99, 37, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL),
(15, 0, NULL, 'test15反間', 20, 20, 10, 10, 10, 10, 55, 55, 'a18', 115, 2, 2, 150, 5, 5, 1, 'p0050', NULL, NULL, 'a02', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 33, 33, 15, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, NULL),
(16, 0, NULL, '21312', 20, 20, 10, 10, 10, 10, 50, 50, 'b01', 100, 1, 0, 100, 0, 0, 1, 'p0010', '2009-04-13 15:21:59', '2009-04-13 15:03:42', 'c04', 0, 'YTFjMDZjY2QtZjQwNi00OTAwLThmNTMtZTU0NmNjYmMxMTVl', 30, 30, NULL, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, '12312'),
(17, 0, NULL, 'sadpy', 23, 19, 14, 11, 12, 14, 0, 62, 'a01', 500, 3, 150, 200, 0, 1, 0, 'p0060', '2009-04-14 17:02:59', '2009-04-14 12:34:01', 'z03', 0, 'OWZmNTkxOWQtYThmYi00M2RjLTk0N2UtZDg0YmUwOTkxOWJk', 30, 40, NULL, '墨門弟子', 12, NULL, 0, 0, '', 25, 25, 25, 25, 0, 450, '21'),
(18, 0, NULL, '南瓜', 20, 20, 10, 10, 10, 10, 50, 50, 'b01', 100, 1, 0, 100, 0, 0, 1, 'p0010', '2009-04-23 16:23:45', '2009-04-23 16:23:41', 'z01', 0, ' ', 30, 30, NULL, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, ''),
(19, 0, NULL, '角', 20, 20, 10, 10, 10, 10, 50, 50, 'c01', 100, 1, 0, 100, 0, 0, 1, 'p0020', '2009-04-23 16:26:34', '2009-04-23 16:26:31', 'z01', 0, ' ', 30, 30, NULL, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, ''),
(20, 0, NULL, 'sadpyy', 20, 20, 10, 10, 10, 10, 50, 50, 'a01', 100, 1, 0, 100, 0, 0, 1, 'p0030', '2009-04-23 16:30:44', '2009-04-23 16:30:37', 'z01', 0, 'YjAxNjM3YTctMGRhMi00NWZmLTg2MDktMjM2NjRkM2I5M2E0', 30, 30, NULL, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, ''),
(21, 6, NULL, '21323', 35, 28, 18, 14, 15, 16, 45, 73, 'a01', 140, 4, 64, 250, 35, 8, 0, 'p0060', '2009-07-07 16:38:22', '2009-05-21 09:47:57', 'a01', 31, 'MzIzMTE2MjEtN2Q4NS00MTZiLTkzZmYtOWZjNjZhZWQ4M2Iw', 37, 49, NULL, '墨門弟子', 15, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, ''),
(22, 0, NULL, '2312312', 20, 20, 10, 10, 10, 10, 50, 50, 'a01', 100, 1, 0, 100, 0, 0, 1, 'p0030', '2009-06-24 18:27:13', '2009-06-24 18:27:11', 'z01', 0, 'YjQyMTliMTYtMDNjOC00NDVjLWFhMTctYzMzYTJhYjU4ZTJk', 30, 30, NULL, '墨門弟子', 10, NULL, 0, 0, '', 25, 25, 25, 25, 0, 0, '21');
