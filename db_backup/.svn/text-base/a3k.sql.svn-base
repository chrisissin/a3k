-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Feb 19, 2009 at 07:10 AM
-- Server version: 5.0.67
-- PHP Version: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `a3k`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_fellow`
-- 

CREATE TABLE `a3k_fellow` (
  `p_id` int(10) unsigned NOT NULL auto_increment,
  `p_at` int(10) unsigned NOT NULL default '0' COMMENT '攻擊力',
  `p_df` int(10) unsigned NOT NULL default '0' COMMENT '防禦力',
  `p_agl` int(10) unsigned NOT NULL default '0' COMMENT '速度',
  `p_name` varchar(48) NOT NULL default '--' COMMENT '五將名',
  `p_hp` int(10) unsigned NOT NULL default '0' COMMENT '體力',
  `p_lv` int(10) unsigned NOT NULL default '0' COMMENT '等級',
  `p_img` varchar(25) default NULL COMMENT '圖檔名',
  `p_hpmax` int(10) unsigned NOT NULL default '0' COMMENT '體力最大',
  `p_mn` int(10) unsigned NOT NULL default '0' COMMENT '精神力',
  `p_mnmax` int(10) unsigned NOT NULL default '0' COMMENT '精神力最大',
  `p_exp` int(10) unsigned NOT NULL default '0' COMMENT '目前經驗值',
  PRIMARY KEY  USING BTREE (`p_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='玩家的武將' AUTO_INCREMENT=287 ;

-- 
-- Dumping data for table `a3k_fellow`
-- 

INSERT INTO `a3k_fellow` VALUES (1, 20, 20, 10, '獵戶小鐵', 250, 2, 'h0010', 250, 0, 0, 1067);
INSERT INTO `a3k_fellow` VALUES (2, 20, 20, 10, '獵戶小鐵', 240, 2, 'h0020', 250, 0, 0, 1557);
INSERT INTO `a3k_fellow` VALUES (3, 20, 20, 10, '獵戶小鐵', 223, 2, 'h0030', 250, 0, 0, 472);
INSERT INTO `a3k_fellow` VALUES (5, 20, 20, 10, '獵戶小鐵', 250, 2, 'h0040', 250, 0, 0, 251);
INSERT INTO `a3k_fellow` VALUES (4, 20, 20, 10, '胡車兒', 250, 2, 'h0050', 250, 0, 0, 0);
INSERT INTO `a3k_fellow` VALUES (6, 20, 20, 10, '胡車兒', 237, 2, 'h0060', 250, 0, 0, 157);
INSERT INTO `a3k_fellow` VALUES (7, 20, 20, 10, '胡車兒', 250, 2, 'h0070', 250, 0, 0, 0);
INSERT INTO `a3k_fellow` VALUES (8, 20, 20, 10, '胡車兒', 230, 2, 'h0080', 250, 0, 0, 76);

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_items`
-- 

CREATE TABLE `a3k_items` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `item_id` varchar(45) NOT NULL,
  `item_name` varchar(45) NOT NULL default '--' COMMENT '名稱',
  `item_type1` int(10) unsigned NOT NULL default '0' COMMENT '物品類別1',
  `item_type2` int(10) unsigned NOT NULL default '0' COMMENT '物品類別2',
  `item_img` varchar(45) default NULL COMMENT '圖像名稱',
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
  `item_storeid` varchar(45) default NULL COMMENT '商店',
  `item_tradable` tinyint(1) NOT NULL default '0' COMMENT '榜定',
  `item_desc` varchar(500) default NULL COMMENT '物品說明',
  `item_price` int(10) unsigned default '0' COMMENT '物品售價',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

-- 
-- Dumping data for table `a3k_items`
-- 

INSERT INTO `a3k_items` VALUES (1, '1', '帽子1', 1, 1, 'a001', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 'NULL', 0, 'lnjlhlhjiljlj;', 1);
INSERT INTO `a3k_items` VALUES (2, '2', '帽子2', 1, 1, 'a001', 2, 2, 2, 2, 0, 0, 0, 2, 0, 0, 'NULL', 0, 'NULL', 2);
INSERT INTO `a3k_items` VALUES (3, '3', '帽子3', 1, 1, 'a001', 0, 0, 0, 0, 3, 3, 3, 0, 3, 0, 'NULL', 0, 'NULL', 3);
INSERT INTO `a3k_items` VALUES (4, '4', '衣服1', 1, 2, 'a001', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 'NULL', 0, 'lnjlhlhjiljlj;', 1);
INSERT INTO `a3k_items` VALUES (5, '5', '衣服1', 1, 2, 'a001', 2, 2, 2, 2, 0, 0, 0, 2, 0, 0, 'NULL', 0, 'NULL', 2);
INSERT INTO `a3k_items` VALUES (6, '6', '衣服1', 1, 2, 'a001', 0, 0, 0, 0, 3, 3, 3, 0, 3, 0, 'NULL', 0, 'NULL', 3);
INSERT INTO `a3k_items` VALUES (7, '7', '披風1', 1, 3, 'a001', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 'NULL', 0, 'lnjlhlhjiljlj;', 1);
INSERT INTO `a3k_items` VALUES (8, '8', '披風2', 1, 3, 'a001', 2, 2, 2, 2, 0, 0, 0, 2, 0, 0, 'NULL', 0, 'NULL', 2);
INSERT INTO `a3k_items` VALUES (9, '9', '披風3', 1, 3, 'a001', 0, 0, 0, 0, 3, 3, 3, 0, 3, 0, 'NULL', 0, 'NULL', 3);
INSERT INTO `a3k_items` VALUES (10, '10', '鞋子1', 1, 4, 'a001', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 'NULL', 0, 'lnjlhlhjiljlj;', 1);
INSERT INTO `a3k_items` VALUES (11, '11', '鞋子2', 1, 4, 'a001', 2, 2, 2, 2, 0, 0, 0, 2, 0, 0, 'NULL', 0, 'NULL', 2);
INSERT INTO `a3k_items` VALUES (12, '12', '鞋子3', 1, 4, 'a001', 0, 0, 0, 0, 3, 3, 3, 0, 3, 0, 'NULL', 0, 'NULL', 3);
INSERT INTO `a3k_items` VALUES (13, '13', '飾品1', 1, 5, 'a001', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 'NULL', 0, 'lnjlhlhjiljlj;', 1);
INSERT INTO `a3k_items` VALUES (14, '14', '飾品2', 1, 5, 'a001', 2, 2, 2, 2, 0, 0, 0, 2, 0, 0, 'NULL', 0, 'NULL', 2);
INSERT INTO `a3k_items` VALUES (15, '15', '飾品3', 1, 5, 'a001', 0, 0, 0, 0, 3, 3, 3, 0, 3, 0, 'NULL', 0, 'NULL', 3);
INSERT INTO `a3k_items` VALUES (16, '16', '武器1', 1, 6, 'a001', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 'NULL', 0, 'lnjlhlhjiljlj;', 1);
INSERT INTO `a3k_items` VALUES (17, '17', '武器2', 1, 6, 'a001', 2, 2, 2, 2, 0, 0, 0, 2, 0, 0, 'NULL', 0, 'NULL', 2);
INSERT INTO `a3k_items` VALUES (18, '18', '武器3', 1, 6, 'a001', 0, 0, 0, 0, 3, 3, 3, 0, 3, 0, 'NULL', 0, 'NULL', 3);
INSERT INTO `a3k_items` VALUES (19, '19', '補血', 2, 1, 'a001', 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 'NULL', 0, 'lnjlhlhjiljlj;', 1);
INSERT INTO `a3k_items` VALUES (20, '20', '補mana', 2, 2, 'a001', 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 'NULL', 0, 'lnjlhlhjiljlj;', 1);
INSERT INTO `a3k_items` VALUES (21, '21', '雙補', 2, 3, 'a001', 0, 0, 0, 0, 0, 0, 0, 15, 15, 0, 'NULL', 0, 'lnjlhlhjiljlj;', 1);
INSERT INTO `a3k_items` VALUES (22, '22', '賣錢', 3, 1, 'a001', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NULL', 0, 'lnjlhlhjiljlj;', 5);

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_lvlchart`
-- 

CREATE TABLE `a3k_lvlchart` (
  `lvlchart_id` int(10) unsigned NOT NULL auto_increment,
  `level` int(10) unsigned default '0' COMMENT '等級',
  `nextexp` int(10) unsigned default '0' COMMENT '所需經驗值',
  `lvl_rankname` varchar(45) NOT NULL COMMENT '等級稱為',
  PRIMARY KEY  (`lvlchart_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='升級所需經驗 + 稱號; InnoDB free: 11264 kB' AUTO_INCREMENT=101 ;

-- 
-- Dumping data for table `a3k_lvlchart`
-- 

INSERT INTO `a3k_lvlchart` VALUES (1, 1, 100, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (2, 2, 125, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (3, 3, 150, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (4, 4, 175, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (5, 5, 200, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (6, 6, 225, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (7, 7, 250, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (8, 8, 275, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (9, 9, 300, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (10, 10, 275, '墨門弟子');
INSERT INTO `a3k_lvlchart` VALUES (11, 11, 300, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (12, 12, 325, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (13, 13, 350, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (14, 14, 375, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (15, 15, 400, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (16, 16, 425, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (17, 17, 450, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (18, 18, 475, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (19, 19, 500, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (20, 20, 475, '墨者');
INSERT INTO `a3k_lvlchart` VALUES (21, 21, 500, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (22, 22, 525, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (23, 23, 550, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (24, 24, 575, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (25, 25, 600, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (26, 26, 625, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (27, 27, 650, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (28, 28, 675, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (29, 29, 700, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (30, 30, 675, '伍長');
INSERT INTO `a3k_lvlchart` VALUES (31, 31, 700, '什長');
INSERT INTO `a3k_lvlchart` VALUES (32, 32, 750, '什長');
INSERT INTO `a3k_lvlchart` VALUES (33, 33, 800, '什長');
INSERT INTO `a3k_lvlchart` VALUES (34, 34, 850, '什長');
INSERT INTO `a3k_lvlchart` VALUES (35, 35, 900, '什長');
INSERT INTO `a3k_lvlchart` VALUES (36, 36, 950, '什長');
INSERT INTO `a3k_lvlchart` VALUES (37, 37, 1000, '什長');
INSERT INTO `a3k_lvlchart` VALUES (38, 38, 1050, '什長');
INSERT INTO `a3k_lvlchart` VALUES (39, 39, 1100, '什長');
INSERT INTO `a3k_lvlchart` VALUES (40, 40, 1050, '什長');
INSERT INTO `a3k_lvlchart` VALUES (41, 41, 1100, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (42, 42, 1150, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (43, 43, 1200, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (44, 44, 1250, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (45, 45, 1300, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (46, 46, 1350, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (47, 47, 1400, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (48, 48, 1450, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (49, 49, 1500, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (50, 50, 1550, '都伯');
INSERT INTO `a3k_lvlchart` VALUES (51, 51, 1550, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (52, 52, 1550, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (53, 53, 1550, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (54, 54, 1550, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (55, 55, 1550, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (56, 56, 1550, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (57, 57, 1550, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (58, 58, 1550, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (59, 59, 1550, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (60, 60, 1550, '司馬');
INSERT INTO `a3k_lvlchart` VALUES (61, 61, 1550, '尉');
INSERT INTO `a3k_lvlchart` VALUES (62, 62, 1550, '尉');
INSERT INTO `a3k_lvlchart` VALUES (63, 63, 1550, '尉');
INSERT INTO `a3k_lvlchart` VALUES (64, 64, 1550, '尉');
INSERT INTO `a3k_lvlchart` VALUES (65, 65, 1550, '尉');
INSERT INTO `a3k_lvlchart` VALUES (66, 66, 1550, '尉');
INSERT INTO `a3k_lvlchart` VALUES (67, 67, 1550, '尉');
INSERT INTO `a3k_lvlchart` VALUES (68, 68, 1550, '尉');
INSERT INTO `a3k_lvlchart` VALUES (69, 69, 1550, '尉');
INSERT INTO `a3k_lvlchart` VALUES (70, 70, 1550, '尉');
INSERT INTO `a3k_lvlchart` VALUES (71, 71, 1550, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (72, 72, 1550, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (73, 73, 1550, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (74, 74, 1550, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (75, 75, 1550, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (76, 76, 1550, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (77, 77, 1550, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (78, 78, 1550, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (79, 79, 1550, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (80, 80, 1550, '都尉');
INSERT INTO `a3k_lvlchart` VALUES (81, 81, 1550, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (82, 82, 1550, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (83, 83, 1550, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (84, 84, 1550, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (85, 85, 1550, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (86, 86, 1550, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (87, 87, 1550, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (88, 88, 1550, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (89, 89, 1550, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (90, 90, 1550, '中郎將');
INSERT INTO `a3k_lvlchart` VALUES (91, 91, 1550, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (92, 92, 1550, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (93, 93, 1550, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (94, 94, 1550, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (95, 95, 1550, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (96, 96, 1550, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (97, 97, 1550, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (98, 98, 1550, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (99, 99, 1550, '裨將軍');
INSERT INTO `a3k_lvlchart` VALUES (100, 100, 1550, '裨將軍');

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_map`
-- 

CREATE TABLE `a3k_map` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `map_state_name` varchar(45) default NULL,
  `map_city_name` varchar(45) default NULL,
  `map_player_lv` int(10) unsigned default NULL,
  `map_img` varchar(45) default NULL COMMENT '戰鬥背景圖檔名(多個) (rand)',
  `map_html` varchar(45) default NULL COMMENT 'reserve for mission like, when move jump to other page',
  `map_id` varchar(45) NOT NULL,
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
INSERT INTO `a3k_map` VALUES (11, '司州', '洛陽(城鎮)', 30, 'c3', 'city141.html', 'z03', 0);
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
  `p_name` varchar(48) NOT NULL default '--' COMMENT '怪名',
  `p_hp` int(10) unsigned NOT NULL default '0' COMMENT '體力',
  `p_lv` int(10) unsigned NOT NULL default '0' COMMENT '等級',
  `d_id` varchar(45) default '0' COMMENT '掉落物ID',
  `p_topr` int(10) unsigned default '0' COMMENT '調物機率',
  `p_map` varchar(45) NOT NULL COMMENT '出現地圖',
  `p_img` varchar(25) default NULL COMMENT '圖檔名',
  `pf_ids` varchar(100) default NULL COMMENT '帶的同伴(seperate by `  )',
  `p_1001_id` varchar(10) NOT NULL default '0' COMMENT '1001ya 企劃用',
  PRIMARY KEY  (`p_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=295 ;

-- 
-- Dumping data for table `a3k_monster`
-- 

INSERT INTO `a3k_monster` VALUES (1, 10, 10, 10, '野熊', 30, 3, '1`2`3`4`5', 60, 'a01', 'n0541', 'a00002`a00003`a00004', 'a00001');
INSERT INTO `a3k_monster` VALUES (5, 12, 12, 10, '山賊嘍嘍', 50, 5, '16`20`21`22', 10, 'a01', 'n0330', 'a00001', 'a00005');
INSERT INTO `a3k_monster` VALUES (7, 15, 15, 13, '山賊雜兵', 70, 8, '1`2', 60, 'a02', 'n0330', 'a00007', 'a00007');
INSERT INTO `a3k_monster` VALUES (9, 15, 15, 13, '山賊精兵', 80, 10, '1`2', 60, 'a02', 'n0330', 'a00009', 'a00009');
INSERT INTO `a3k_monster` VALUES (16, 20, 20, 15, '羌兵小頭目', 100, 15, '1`2', 60, 'a03', 'n0313', 'a00016', 'a00016');
INSERT INTO `a3k_monster` VALUES (15, 18, 18, 15, '羌兵小隊長', 100, 15, '1`2', 60, 'a03', 'n0313', 'a00015', 'a00015');
INSERT INTO `a3k_monster` VALUES (36, 35, 35, 25, '董家惡奴', 180, 33, '1`2', 60, 'b03', 'n0280', 'a00035`a00036', 'a00036');
INSERT INTO `a3k_monster` VALUES (32, 25, 25, 15, '黑風參謀', 160, 30, '1`2', 60, 'b02', 'n0124', 'a00032', 'a00032');
INSERT INTO `a3k_monster` VALUES (2, 10, 10, 10, '毒蛇', 30, 3, '6`7`8`9`10', 60, 'a01', 'n0550', 'a00003', 'a00002');
INSERT INTO `a3k_monster` VALUES (3, 10, 10, 10, '吃人野熊', 30, 3, '11`12`13`14`15', 60, 'a01', 'n0542', 'a00004', 'a00003');
INSERT INTO `a3k_monster` VALUES (4, 12, 12, 10, '致命毒蛇', 50, 5, '15`17`18`19', 60, 'a01', 'n0555', 'a00005', 'a00004');
INSERT INTO `a3k_monster` VALUES (6, 15, 15, 13, '山賊雜兵', 70, 8, '1`2', 60, 'a02', 'n0330', 'a00006`a0007`a00008`a00009', 'a00006');
INSERT INTO `a3k_monster` VALUES (8, 15, 15, 13, '烈焰毒蛇', 80, 10, '1`2', 60, 'a02', 'n0552', 'a00008', 'a00008');
INSERT INTO `a3k_monster` VALUES (10, 15, 15, 13, '山賊頭目', 80, 10, '1`2', 60, 'a02', 'n0332', 'a00010', 'a00010');
INSERT INTO `a3k_monster` VALUES (11, 18, 18, 15, '惡狼', 90, 13, '0', 0, 'a03', 'n0561', 'a00011', 'a00011');
INSERT INTO `a3k_monster` VALUES (12, 18, 18, 15, '金城雜兵', 90, 13, '0', 0, 'a03', 'n0312', 'a00012', 'a00012');
INSERT INTO `a3k_monster` VALUES (17, 20, 20, 15, '羌兵大盜', 110, 18, '0', 0, 'a04', 'n0335', 'a00017', 'a00017');
INSERT INTO `a3k_monster` VALUES (18, 20, 20, 15, '塞上惡虎', 110, 18, '0', 0, 'a04', 'n0535', 'a00018', 'a00018');
INSERT INTO `a3k_monster` VALUES (19, 20, 20, 15, '羌兵統領', 110, 18, '0', 0, 'a04', 'n0313', 'a00019', 'a00019');
INSERT INTO `a3k_monster` VALUES (20, 20, 20, 15, '嗜血惡虎', 120, 20, '0', 0, 'a04', 'n0532', 'a00020', 'a00020');
INSERT INTO `a3k_monster` VALUES (21, 20, 20, 15, '羌族軍師', 120, 20, '0', 0, 'a04', 'n0155', 'a00021', 'a00021');
INSERT INTO `a3k_monster` VALUES (22, 20, 20, 15, '羌族單于', 120, 20, '0', 0, 'a04', 'n0305', 'a00022', 'a00022');
INSERT INTO `a3k_monster` VALUES (23, 23, 23, 15, '黑風土匪', 130, 23, '0', 0, 'b01', 'n0331', 'a00023', 'a00023');
INSERT INTO `a3k_monster` VALUES (24, 23, 23, 15, '黑風斥候', 130, 23, '0', 0, 'b01', 'n0331', 'a00024', 'a00024');
INSERT INTO `a3k_monster` VALUES (25, 23, 23, 15, '黑風搶匪', 130, 23, '0', 0, 'b01', 'n0331', 'a00025', 'a00025');
INSERT INTO `a3k_monster` VALUES (26, 23, 23, 15, '黑風尖兵', 140, 25, '0', 0, 'b01', 'n0333', 'a00026', 'a00026');
INSERT INTO `a3k_monster` VALUES (27, 23, 23, 15, '黑風精兵', 140, 25, '0', 0, 'b01', 'n0333', 'a00027', 'a00027');
INSERT INTO `a3k_monster` VALUES (28, 25, 25, 15, '黑風二當家', 140, 25, '0', 0, 'b01', 'n0382', 'a00028', 'a00028');
INSERT INTO `a3k_monster` VALUES (29, 25, 25, 15, '黑風大盜', 150, 28, '0', 0, 'b02', 'n0330', 'a00029', 'a00029');
INSERT INTO `a3k_monster` VALUES (33, 25, 25, 15, '黑風二當家', 160, 30, '0', 0, 'b02', 'n0382', 'a00033', 'a00033');
INSERT INTO `a3k_monster` VALUES (34, 25, 25, 15, '黑風大當家', 160, 30, '0', 0, 'b02', 'n0324', 'a00034', 'a00034');
INSERT INTO `a3k_monster` VALUES (35, 35, 35, 25, '董家惡僕', 180, 33, '0', 0, 'b03', 'n0280', 'a00035`a00036', 'a00035');
INSERT INTO `a3k_monster` VALUES (13, 18, 18, 15, '荒漠惡狼', 90, 13, '0', 0, 'a03', 'n0560', 'a00013', 'a00013');
INSERT INTO `a3k_monster` VALUES (14, 18, 18, 15, '黑風參謀', 100, 15, '0', 0, 'a03', 'n0312', 'a00014', 'a00014');
INSERT INTO `a3k_monster` VALUES (30, 25, 25, 15, '黑風衛隊', 150, 28, '0', 0, 'b02', 'n0330', 'a00030', 'a00030');
INSERT INTO `a3k_monster` VALUES (31, 25, 25, 15, '黑風力士', 150, 28, '0', 0, 'b02', 'n0340', 'a00031', 'a00031');
INSERT INTO `a3k_monster` VALUES (37, 35, 35, 25, '董家惡管事', 180, 33, '0', 0, 'b03', 'n0284', 'a00035`a00036', 'a00037');
INSERT INTO `a3k_monster` VALUES (38, 40, 40, 30, '董家武師', 200, 35, '0', 0, 'b03', 'n0364', 'a00035`a00036`a00037', 'a00038');
INSERT INTO `a3k_monster` VALUES (39, 40, 40, 30, '董家武師頭子', 200, 35, '0', 0, 'b03', 'n0362', 'a00037`a00038', 'a00039');
INSERT INTO `a3k_monster` VALUES (40, 45, 45, 35, '董璜', 200, 35, '0', 0, 'b03', 'n0395', 'a00038`a00039', 'a00040');
INSERT INTO `a3k_monster` VALUES (41, 45, 45, 35, '董府凶僕', 250, 37, '0', 0, 'b04', 'n0280', 'a00041`a00042', 'a00041');
INSERT INTO `a3k_monster` VALUES (42, 45, 45, 35, '董府謢院', 250, 37, '0', 0, 'b04', 'n0280', 'a00041`a00042', 'a00042');
INSERT INTO `a3k_monster` VALUES (43, 50, 50, 40, '董府護院總管', 270, 38, '0', 0, 'b04', 'n0281', 'a00041`a00042', 'a00043');
INSERT INTO `a3k_monster` VALUES (44, 50, 50, 40, '董府親兵', 270, 38, '0', 0, 'b04', 'n0575', 'a00043`a00045', 'a00044');
INSERT INTO `a3k_monster` VALUES (45, 50, 50, 40, '董府衛兵', 270, 38, '0', 0, 'b04', 'n0575', 'a00044`a00045', 'a00045');
INSERT INTO `a3k_monster` VALUES (46, 55, 55, 45, '董府兵長', 300, 40, '0', 0, 'b04', 'n0572', 'a00044`a00045', 'a00046');
INSERT INTO `a3k_monster` VALUES (47, 55, 55, 45, '董璜', 330, 40, '0', 0, 'b04', 'n0395', 'a00044`a00045', 'a00047');
INSERT INTO `a3k_monster` VALUES (48, 60, 60, 50, '牛輔', 350, 40, '0', 0, 'b04', 'n0485', 'a00046`a00047', 'a00048');
INSERT INTO `a3k_monster` VALUES (49, 60, 60, 50, '河東軍士兵', 400, 42, '0', 0, 'c01', 'n0445', 'a00049`a00050', 'a00049');
INSERT INTO `a3k_monster` VALUES (50, 60, 60, 50, '河東軍精兵', 400, 42, '0', 0, 'c01', 'n0445', 'a00049`a00050', 'a00050');
INSERT INTO `a3k_monster` VALUES (51, 60, 60, 50, '河東軍兵長', 400, 42, '0', 0, 'c01', 'n0442', 'a00049`a00050', 'a00051');
INSERT INTO `a3k_monster` VALUES (52, 65, 65, 52, '西涼鐵衛', 460, 44, '0', 0, 'c01', 'n0470', 'a00052`a00053', 'a00052');
INSERT INTO `a3k_monster` VALUES (53, 66, 66, 52, '西涼鐵衛兵長', 500, 44, '0', 0, 'c01', 'n0472', 'a00052`a00053', 'a00053');
INSERT INTO `a3k_monster` VALUES (54, 67, 67, 52, '李傕', 530, 45, '0', 0, 'c01', 'n0464', 'a00052`a00053', 'a00054');
INSERT INTO `a3k_monster` VALUES (55, 68, 68, 52, '郭汜', 540, 45, '0', 0, 'c01', 'n0464', 'a00052`a00054', 'a00055');
INSERT INTO `a3k_monster` VALUES (56, 69, 69, 52, '牛輔', 550, 45, '0', 0, 'c01', 'n0485', 'a00052`a00055', 'a00056');
INSERT INTO `a3k_monster` VALUES (57, 70, 70, 53, '李儒', 560, 45, '0', 0, 'c01', 'n0121', 'a00052`a00056', 'a00057');
INSERT INTO `a3k_monster` VALUES (58, 71, 71, 54, '華雄', 580, 45, '0', 0, 'c01', 'h0190', 'a00052`a00057', 'a00058');
INSERT INTO `a3k_monster` VALUES (59, 75, 75, 55, '董卓', 600, 45, '0', 0, 'c01', 'h0200', 'a00057`a00058', 'a00059');
INSERT INTO `a3k_monster` VALUES (60, 75, 75, 56, '黑風殘兵', 630, 46, '0', 0, 'c02', 'n0411', 'a00060`a00061', 'a00060');
INSERT INTO `a3k_monster` VALUES (61, 76, 76, 56, '黑風殘兵長', 630, 46, '0', 0, 'c02', 'n0411', 'a00060`a00061', 'a00061');
INSERT INTO `a3k_monster` VALUES (62, 77, 77, 56, '神秘道士', 660, 47, '0', 0, 'c02', 'n0215', 'a00062`a00063', 'a00062');
INSERT INTO `a3k_monster` VALUES (63, 78, 78, 56, '神密道長', 660, 47, '0', 0, 'c02', 'n0165', 'a00062`a00063', 'a00063');
INSERT INTO `a3k_monster` VALUES (64, 79, 79, 56, '流寇軍士兵', 690, 48, '0', 0, 'c02', 'n0405', 'a00064`a00065', 'a00064');
INSERT INTO `a3k_monster` VALUES (65, 80, 80, 56, '流寇軍精兵', 690, 48, '0', 0, 'c02', 'n0405', 'a00064`a00065', 'a00065');
INSERT INTO `a3k_monster` VALUES (66, 81, 81, 56, '流寇軍兵長', 690, 48, '0', 0, 'c02', 'n0402', 'a00064`a00065', 'a00066');
INSERT INTO `a3k_monster` VALUES (67, 82, 82, 56, '波才', 720, 50, '0', 0, 'c02', 'n0423', 'a00066`a00068', 'a00067');
INSERT INTO `a3k_monster` VALUES (68, 85, 85, 56, '趙弘', 750, 50, '0', 0, 'c02', 'n0424', 'a00066`a00067', 'a00068');
INSERT INTO `a3k_monster` VALUES (69, 85, 85, 57, '食人虎', 750, 51, '0', 0, 'c03', 'n0535', 'a00069`a00070', 'a00069');
INSERT INTO `a3k_monster` VALUES (70, 86, 86, 57, '食人餓虎', 750, 51, '0', 0, 'c03', 'n0532', 'a00069`a00070', 'a00070');
INSERT INTO `a3k_monster` VALUES (71, 87, 87, 57, '虎嘯惡漢', 770, 52, '0', 0, 'c03', 'n0344', 'a00071`a00072', 'a00071');
INSERT INTO `a3k_monster` VALUES (72, 88, 88, 57, '虎嘯惡盜', 770, 52, '0', 0, 'c03', 'n0344', 'a00071`a00072', 'a00072');
INSERT INTO `a3k_monster` VALUES (73, 89, 89, 57, '神秘道士', 790, 53, '0', 0, 'c03', 'n0215', 'a00073`a00074', 'a00073');
INSERT INTO `a3k_monster` VALUES (74, 90, 90, 57, '神秘道長', 790, 53, '0', 0, 'c03', 'n0165', 'a00073`a00074', 'a00074');
INSERT INTO `a3k_monster` VALUES (75, 91, 91, 57, '虎嘯殺手', 800, 54, '0', 0, 'c03', 'n0583', 'a00075`a00076', 'a00075');
INSERT INTO `a3k_monster` VALUES (76, 92, 92, 57, '虎嘯刺客', 820, 55, '0', 0, 'c03', 'n0583', 'a00075`a00076', 'a00076');
INSERT INTO `a3k_monster` VALUES (77, 95, 95, 57, '虎嘯幫主', 850, 55, '0', 0, 'c03', 'n0322', 'a00075`a00076', 'a00077');
INSERT INTO `a3k_monster` VALUES (78, 95, 95, 58, '銀線毒蛇', 875, 56, '0', 0, 'c04', 'n0550', 'a00078`a00079', 'a00078');
INSERT INTO `a3k_monster` VALUES (79, 96, 96, 58, '青花毒蛇', 875, 56, '0', 0, 'c04', 'n0553', 'a00078`a00079', 'a00079');
INSERT INTO `a3k_monster` VALUES (80, 97, 97, 58, '金線毒蛇', 900, 57, '0', 0, 'c04', 'n0555', 'a00078`a00079', 'a00080');
INSERT INTO `a3k_monster` VALUES (81, 98, 98, 58, '神秘道士', 900, 57, '0', 0, 'c04', 'n0215', 'a00080`a00081', 'a00081');
INSERT INTO `a3k_monster` VALUES (82, 99, 99, 58, '神密道長', 900, 57, '0', 0, 'c04', 'n0165', 'a00080`a00081', 'a00082');
INSERT INTO `a3k_monster` VALUES (83, 100, 100, 58, '黃巾訓練兵', 930, 58, '0', 0, 'c04', 'n0235', 'a00083`a00084', 'a00083');
INSERT INTO `a3k_monster` VALUES (84, 101, 101, 58, '黃巾訓練兵長', 930, 58, '0', 0, 'c04', 'n0235', 'a00083`a00084', 'a00084');
INSERT INTO `a3k_monster` VALUES (85, 102, 102, 58, '波才', 960, 59, '0', 0, 'c04', 'n0423', 'a00084`a00085', 'a00085');
INSERT INTO `a3k_monster` VALUES (86, 103, 103, 58, '趙弘', 975, 60, '0', 0, 'c04', 'n0424', 'a00084`a00085', 'a00086');
INSERT INTO `a3k_monster` VALUES (87, 105, 105, 58, '管亥', 1000, 60, '0', 0, 'c04', 'n0195', 'a00085`a00086', 'a00087');

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_player`
-- 

CREATE TABLE `a3k_player` (
  `p_id` int(11) unsigned NOT NULL auto_increment,
  `p_name` varchar(64) NOT NULL COMMENT '玩家名稱(帳號)',
  `p_email` varchar(100) NOT NULL COMMENT 'Email',
  `p_at` smallint(5) unsigned NOT NULL default '0' COMMENT '物理攻擊力',
  `p_df` smallint(5) unsigned NOT NULL default '0' COMMENT '物理防禦力',
  `p_ipadd` varchar(20) NOT NULL COMMENT 'User IP',
  `p_str` smallint(5) unsigned NOT NULL default '0' COMMENT '力量',
  `p_vit` smallint(5) unsigned NOT NULL default '0' COMMENT '體魄',
  `p_smart` smallint(5) unsigned NOT NULL default '0' COMMENT '智力',
  `p_agl` smallint(5) unsigned NOT NULL default '0' COMMENT '敏捷',
  `p_hp` int(10) unsigned NOT NULL default '0' COMMENT 'HP(體力)現在值',
  `p_hpmax` int(10) unsigned NOT NULL default '0' COMMENT 'HP(體力)最大值',
  `role_id` varchar(45) NOT NULL COMMENT '職業ID',
  `p_money` mediumint(8) unsigned NOT NULL default '0' COMMENT '金錢現在值(最大值暫定為100萬)',
  `p_lv` int(10) unsigned NOT NULL default '0' COMMENT '等級',
  `p_exp` int(10) unsigned NOT NULL default '0' COMMENT '目前經驗值',
  `p_nextexp` int(10) unsigned NOT NULL default '0' COMMENT '升級所需經驗',
  `p_win` int(10) unsigned NOT NULL default '0' COMMENT '勝場數',
  `p_lost` int(10) unsigned NOT NULL default '0' COMMENT '敗場數',
  `p_sex` tinyint(1) unsigned NOT NULL default '0' COMMENT '玩家性別',
  `p_password` varchar(10) NOT NULL default '',
  `p_img` varchar(45) NOT NULL default '0' COMMENT '頭像ID',
  `p_act_time` int(10) unsigned NOT NULL default '0' COMMENT '最後動作時間',
  `p_createdate` int(10) unsigned NOT NULL default '0' COMMENT '帳號建立時間',
  `p_online_time` int(10) NOT NULL default '0' COMMENT '在線時間',
  `p_map` varchar(45) NOT NULL COMMENT '玩家在哪',
  `p_bank` mediumint(8) unsigned NOT NULL default '0' COMMENT '銀行(最大值暫定為100萬)',
  `f_1001ya` varchar(100) default NULL COMMENT '1001ya key',
  `p_mn` int(10) unsigned NOT NULL default '0' COMMENT 'Mana(精神力)最大值',
  `p_mnmax` int(10) unsigned NOT NULL default '0' COMMENT 'Mana(精神力)最大值',
  `pf_id` int(10) unsigned default NULL COMMENT '帶的武將',
  `p_rankname` varchar(45) default NULL COMMENT '官職(稱號)',
  `p_bone` int(10) unsigned NOT NULL default '0' COMMENT '根骨',
  `p_fight_time` int(10) unsigned NOT NULL COMMENT '最後戰鬥時間',
  `p_guild` int(10) unsigned NOT NULL default '0' COMMENT '工會',
  `p_team` int(10) unsigned NOT NULL default '0' COMMENT '組隊',
  `p_blacklist` text NOT NULL COMMENT '黑名單',
  `p_packsize_1` int(10) NOT NULL default '25' COMMENT '背包大小 for type 1;1',
  `p_packsize_2` int(11) NOT NULL default '25',
  `p_packsize_3` int(11) NOT NULL default '25',
  `p_packsize_4` int(11) NOT NULL default '25',
  PRIMARY KEY  (`p_id`),
  KEY `p_name` (`p_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=10 ;

-- 
-- Dumping data for table `a3k_player`
-- 

INSERT INTO `a3k_player` VALUES (1, 'chris', 'help@1001ya.com.tw', 30, 26, '', 16, 22, 18, 18, 90, 103, 'a01', 311, 8, 247, 275, 108, 4, 1, '111111', 'p0010', 1228972008, 1224826537, 1230006606, 'a01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 67, 67, 1, '墨門弟子', 17, 0, 0, 0, '', 25, 25, 25, 25);
INSERT INTO `a3k_player` VALUES (2, 'roo', 'help@1001ya.com.tw', 45, 39, '', 28, 23, 21, 25, 97, 110, 'a01', 295, 9, 227, 300, 54, 16, 1, '111111', 'p0020', 1228972008, 1224826537, 1230006606, 'a01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 76, 76, 2, '墨門弟子', 20, 0, 0, 0, '', 25, 25, 25, 25);
INSERT INTO `a3k_player` VALUES (3, 'george', 'help@1001ya.com.tw', 20, 17, '', 11, 10, 16, 15, 65, 65, 'b01', 166, 4, 124, 175, 26, 1, 1, '111111', 'p0030', 1228972008, 1224826537, 1230006606, 'a01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 51, 51, 3, '墨門弟子', 15, 0, 0, 0, '', 25, 25, 25, 25);
INSERT INTO `a3k_player` VALUES (4, 'jack', 'help@1001ya.com.tw', 20, 20, '', 10, 10, 10, 10, 50, 50, 'b01', 100, 1, 0, 100, 0, 0, 1, '111111', 'p0040', 1228972008, 1224826537, 1230006606, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 30, 30, 4, '墨門弟子', 10, 0, 0, 0, '', 25, 25, 25, 25);
INSERT INTO `a3k_player` VALUES (5, 'alan', 'help@1001ya.com.tw', 26, 22, '', 17, 19, 17, 18, 74, 76, 'c01', 133, 3, 27, 150, 11, 0, 1, '111111', 'p0050', 1228972008, 1224826537, 1230006606, 'a01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 50, 50, 5, '墨門弟子', 15, 0, 0, 0, '', 25, 25, 25, 25);
INSERT INTO `a3k_player` VALUES (6, 'eric', 'help@1001ya.com.tw', 19, 15, '', 11, 12, 11, 12, 38, 58, 'c01', 124, 2, 67, 125, 8, 0, 1, '111111', 'p0060', 1228972008, 1224826537, 1230006606, 'a01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 35, 35, 6, '墨門弟子', 11, 0, 0, 0, '', 25, 25, 25, 25);
INSERT INTO `a3k_player` VALUES (7, 'yao', 'help@1001ya.com.tw', 20, 20, '', 10, 10, 10, 10, 50, 50, 'a01', 100, 1, 0, 100, 0, 0, 1, '111111', 'p0010', 1228972008, 1224826537, 1230006606, 'z01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 30, 30, 7, '墨門弟子', 10, 0, 0, 0, '', 25, 25, 25, 25);
INSERT INTO `a3k_player` VALUES (8, 'vincent', 'help@1001ya.com.tw', 28, 28, '', 18, 10, 10, 10, 17, 58, 'a01', 112, 1, 76, 100, 4, 0, 1, '111111', 'p0020', 1228972008, 1224826537, 1230006606, 'a01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 30, 30, 8, '墨門弟子', 18, 0, 0, 0, '', 25, 25, 25, 25);
INSERT INTO `a3k_player` VALUES (9, 'alan2', 'help@1001ya.com.tw', 22, 22, '', 12, 13, 13, 13, 50, 52, 'a01', 103, 1, 26, 100, 1, 0, 1, '111111', 'p0030', 1228972008, 1224826537, 1230006606, 'a01', 0, 'NTZkOWQ1NmUtYWY3NC00MDliLTkyOTAtMWE1ZjYxNWViMDQy', 30, 33, 5, '墨門弟子', 12, 0, 0, 0, '', 25, 25, 25, 25);

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_player_item`
-- 

CREATE TABLE `a3k_player_item` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `p_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `item_eq` tinyint(1) default '0',
  `item_stacknum` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=114 ;

-- 
-- Dumping data for table `a3k_player_item`
-- 

INSERT INTO `a3k_player_item` VALUES (1, 1, 1, 0, 0);
INSERT INTO `a3k_player_item` VALUES (2, 1, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (3, 1, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (4, 1, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (5, 1, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (6, 1, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (7, 1, 3, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (9, 1, 2, 1, NULL);
INSERT INTO `a3k_player_item` VALUES (11, 1, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (12, 1, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (13, 1, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (15, 1, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (16, 1, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (17, 1, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (18, 1, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (19, 1, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (20, 2, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (21, 2, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (22, 2, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (23, 2, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (24, 2, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (25, 2, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (26, 2, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (27, 2, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (28, 2, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (29, 2, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (30, 2, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (31, 2, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (32, 2, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (33, 2, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (34, 2, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (35, 2, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (36, 2, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (37, 2, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (38, 2, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (39, 2, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (40, 2, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (41, 2, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (42, 6, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (43, 6, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (44, 6, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (45, 6, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (46, 6, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (47, 6, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (48, 6, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (49, 6, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (50, 6, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (51, 6, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (52, 6, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (53, 3, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (54, 3, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (55, 3, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (56, 3, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (57, 3, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (58, 3, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (59, 3, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (60, 3, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (61, 3, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (62, 3, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (63, 3, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (64, 3, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (65, 3, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (66, 3, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (67, 3, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (68, 3, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (69, 3, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (70, 3, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (71, 3, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (72, 3, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (73, 3, 2, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (74, 2, 4, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (75, 2, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (76, 2, 4, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (77, 8, 11, 1, NULL);
INSERT INTO `a3k_player_item` VALUES (78, 8, 12, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (79, 8, 14, 1, NULL);
INSERT INTO `a3k_player_item` VALUES (80, 8, 1, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (81, 8, 2, 1, NULL);
INSERT INTO `a3k_player_item` VALUES (82, 8, 3, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (83, 8, 5, 1, NULL);
INSERT INTO `a3k_player_item` VALUES (84, 8, 11, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (85, 8, 13, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (86, 8, 14, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (87, 8, 12, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (88, 8, 13, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (90, 9, 15, 1, NULL);
INSERT INTO `a3k_player_item` VALUES (91, 9, 17, 1, NULL);
INSERT INTO `a3k_player_item` VALUES (92, 9, 18, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (93, 5, 11, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (94, 5, 12, 1, NULL);
INSERT INTO `a3k_player_item` VALUES (95, 5, 13, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (96, 5, 14, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (97, 5, 15, 1, NULL);
INSERT INTO `a3k_player_item` VALUES (98, 5, 13, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (99, 5, 15, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (100, 5, 15, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (101, 5, 17, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (102, 5, 18, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (103, 5, 17, 1, NULL);
INSERT INTO `a3k_player_item` VALUES (104, 1, 3, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (105, 1, 4, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (106, 1, 5, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (107, 1, 16, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (108, 1, 13, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (109, 1, 14, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (110, 1, 6, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (111, 1, 7, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (112, 1, 9, 0, NULL);
INSERT INTO `a3k_player_item` VALUES (113, 1, 19, 0, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_quest`
-- 

CREATE TABLE `a3k_quest` (
  `q_id` varchar(255) NOT NULL default '',
  `q_title` varchar(255) default NULL,
  `q_requester` varchar(255) default NULL,
  `q_img` varchar(255) default NULL,
  `q_map_name` varchar(255) default NULL,
  `q_map_id` varchar(255) default NULL,
  `q_show_lv` varchar(255) default NULL,
  `q_description` varchar(255) default NULL,
  `q_dest_map` varchar(255) default NULL,
  `q_expireTime` int(10) default NULL,
  PRIMARY KEY  (`q_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `a3k_quest`
-- 

INSERT INTO `a3k_quest` VALUES ('q00001', '熊膽孝親', '墨雲師父', '', '墨家邨', 'c1', '3', '王孝廉的母親病了,徒兒你去飛熊山麓幫他打一些熊膽來給母親燉湯補身吧', '飛熊山麓', 1234108417);
INSERT INTO `a3k_quest` VALUES ('q00002', '斬蛇除害', '墨雲師父', '', '墨家邨', 'c1', '4', '飛熊山麓最近毒蛇肆虐,徒兒你去幫大夥兒驅蛇除害', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00003', '修行之路', '墨雲師父', '', '墨家邨', 'c1', '1', '修行之路就是每天要試煉,現在起每天到飛熊山麓修行,修行完回來找我', '飛熊山麓', 1235448000);
INSERT INTO `a3k_quest` VALUES ('q00004', '守望相助', '涼州刺史委託信', '', '墨家邨', 'c1', '5', '飛熊山麓最近吃人野熊肆虐,已經傷害數名路人,能除害者有賞', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00005', '介紹信', '涼州刺史', '', '墨家邨', 'c1', '5', 'XXX(玩家姓名),感謝您的義舉,我的同僚雍州刺史有事相託,我推薦您去,順便在飛熊山麓打個土產幫我帶過去給他', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00006', '維持治安1', '雍州刺史', '', '雍州府', 'c2', '5', '感謝壯士前來,飛熊山麓最近致命毒蛇猖獗,請助我除害', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00007', '維持治安2', '雍州刺史', '', '雍州府', 'c2', '1', '飛熊山麓最近吃人野熊又出來傷人了,請助我除害', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00008', '維持治安3', '雍州刺史', '', '雍州府', 'c2', '6', '這是每小時大放送任務~快去打怪~', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00009', '職業修行(校尉)', '雍州刺史', '', '雍州府', 'c2', '7', '這是校尉任務', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00010', '職業修行(劍客)', '雍州刺史', '', '雍州府', 'c2', '7', '這是劍客任務', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00011', '職業修行(參謀)', '雍州刺史', '', '雍州府', 'c2', '7', '這是參謀任務', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00012', '緊急招回', '墨雲師父', '', '雍州府', 'c2', '8', '師父有令,殺完山賊嘍嘍回來領紅包', '飛熊山麓', NULL);
INSERT INTO `a3k_quest` VALUES ('q00013', '令牌任務', '墨雲師父', '', '墨家邨', 'c1', '1', '撿到神祕令牌….究竟能做啥?', '飛熊山麓', NULL);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `a3k_quest_status`
-- 

INSERT INTO `a3k_quest_status` VALUES ('2', 'q00001', -1, '', 0);
INSERT INTO `a3k_quest_status` VALUES ('2', 'q00023', -1, '', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_quest_time`
-- 

CREATE TABLE `a3k_quest_time` (
  `q_id` varchar(10) default NULL,
  `q_week` tinyint(3) unsigned default NULL,
  `q_hour` mediumint(8) unsigned default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `a3k_quest_time`
-- 

INSERT INTO `a3k_quest_time` VALUES ('q00003', 127, 16777214);

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
  PRIMARY KEY  USING BTREE (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='職業表; InnoDB free: 11264 kB' AUTO_INCREMENT=10 ;

-- 
-- Dumping data for table `a3k_role`
-- 

INSERT INTO `a3k_role` VALUES (1, 'a01', '俠客', 50, '0', 1, 1, 1, 1, 1, 1, 1, 3, 1, 2, 1, 3, 1, 2, 1, 2, '俠客的技能', '俠客俠客俠客俠客俠客', 'a01', NULL, 'f0001', 'icon_2');
INSERT INTO `a3k_role` VALUES (2, 'b01', '秀才', 50, '0', 1, 1, 1, 1, 1, 1, 0, 1, 0, 2, 1, 2, 1, 3, 0, 2, '秀才的技能', '秀才秀才秀才秀才秀才秀才秀才秀才秀才秀才', 'b01', NULL, 'icon_2', 'f0001');
INSERT INTO `a3k_role` VALUES (3, 'c01', '校衛', 50, '0', 1, 1, 1, 1, 1, 1, 1, 3, 1, 2, 0, 2, 0, 1, 1, 3, '校尉的技能', '校尉校尉校尉校尉校尉校尉校尉', 'c01', NULL, 'f0001', 'icon_2');
INSERT INTO `a3k_role` VALUES (4, 'a02', '劍俠', 100, 'a01', 10, 15, 1, 1, 1, 1, 2, 3, 1, 2, 1, 3, 1, 2, 1, 2, '劍俠的技能', '劍俠劍俠劍俠劍俠劍俠劍俠', 'a01', '俠客', 'icon_2', 'f0001');
INSERT INTO `a3k_role` VALUES (5, 'a03', '道士', 100, 'a01', 10, 15, 1, 1, 1, 1, 1, 2, 1, 3, 0, 2, 1, 2, 1, 3, '道士的技能', '道士道士道士道士道士', 'a01', '俠客', 'f0001', 'icon_2');
INSERT INTO `a3k_role` VALUES (6, 'b02', '參謀', 100, 'b01', 10, 1, 1, 1, 15, 1, 0, 2, 1, 2, 1, 2, 1, 2, 1, 2, '參謀的技能', '參謀參謀參謀參謀參謀', 'b01', '秀才', 'icon_2', 'f0001');
INSERT INTO `a3k_role` VALUES (7, 'b03', '辯士', 100, 'b01', 10, 1, 1, 1, 15, 1, 0, 1, 1, 2, 0, 2, 1, 3, 0, 2, '辯士的技能', '辯士辯士辯士辯士辯士', 'b01', '秀才', 'f0001', 'icon_2');
INSERT INTO `a3k_role` VALUES (8, 'c02', '先鋒營', 100, 'c01', 10, 1, 1, 1, 1, 15, 2, 3, 1, 2, 1, 2, 1, 2, 1, 2, '先鋒營的技能', '先鋒營先鋒營先鋒營先鋒營', 'c01', '校衛', 'icon_2', 'f0001');
INSERT INTO `a3k_role` VALUES (9, 'c03', '鐵甲營', 100, 'c01', 10, 1, 1, 1, 1, 15, 1, 3, 1, 3, 1, 2, 1, 2, 1, 3, '鐵甲營的技能', '鐵甲營鐵甲營鐵甲營鐵甲營鐵甲營鐵甲營鐵甲營鐵甲營鐵甲營', 'c01', '校衛', 'f0001', 'icon_2');

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_skill`
-- 

CREATE TABLE `a3k_skill` (
  `skill_id` int(10) unsigned NOT NULL auto_increment,
  `role_id` varchar(45) NOT NULL default '0' COMMENT '職業id',
  `user_id` int(10) unsigned NOT NULL default '0' COMMENT '玩家id',
  `skill_point` int(10) unsigned NOT NULL default '0' COMMENT '技能/職業熟練度',
  PRIMARY KEY  (`skill_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='玩家技能' AUTO_INCREMENT=10 ;

-- 
-- Dumping data for table `a3k_skill`
-- 

INSERT INTO `a3k_skill` VALUES (1, 'a01', 1, 50);
INSERT INTO `a3k_skill` VALUES (2, 'a01', 2, 50);
INSERT INTO `a3k_skill` VALUES (3, 'b01', 3, 26);
INSERT INTO `a3k_skill` VALUES (4, 'b01', 4, 0);
INSERT INTO `a3k_skill` VALUES (5, 'c01', 5, 50);
INSERT INTO `a3k_skill` VALUES (6, 'c01', 6, 13);
INSERT INTO `a3k_skill` VALUES (7, 'a01', 7, 0);
INSERT INTO `a3k_skill` VALUES (8, 'a01', 8, 4);
INSERT INTO `a3k_skill` VALUES (9, 'a01', 9, 4);
