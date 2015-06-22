-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Aug 20, 2009 at 02:10 AM
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

DROP TABLE IF EXISTS `a3k_brohood`;
CREATE TABLE IF NOT EXISTS `a3k_brohood` (
  `pkid` int(11) NOT NULL auto_increment COMMENT 'pk',
  `p_id` int(10) NOT NULL default '0' COMMENT 'me',
  `b_p_id` int(10) NOT NULL default '0' COMMENT 'my friend',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT 'timestamp',
  PRIMARY KEY  (`pkid`,`p_id`,`b_p_id`),
  UNIQUE KEY `p_id` (`p_id`,`b_p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='a3k brother hood' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_fellow`
-- 

DROP TABLE IF EXISTS `a3k_fellow`;
CREATE TABLE IF NOT EXISTS `a3k_fellow` (
  `p_owner` varchar(10) NOT NULL default '0' COMMENT '五將主人',
  `p_id` int(10) unsigned NOT NULL auto_increment,
  `p_at` int(10) unsigned NOT NULL default '0' COMMENT '攻擊力',
  `p_df` int(10) unsigned NOT NULL default '0' COMMENT '防禦力',
  `p_agl` int(10) unsigned default '0' COMMENT '速度',
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
  PRIMARY KEY  USING BTREE (`p_id`),
  KEY `p_owner` (`p_owner`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='玩家的武將' AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_fellowshop`
-- 

DROP TABLE IF EXISTS `a3k_fellowshop`;
CREATE TABLE IF NOT EXISTS `a3k_fellowshop` (
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
  `f_tradedata` text COMMENT '武將合成資料JSON',
  `fl_cash` int(10) NOT NULL default '0',
  PRIMARY KEY  (`fl_id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_group`
-- 

DROP TABLE IF EXISTS `a3k_group`;
CREATE TABLE IF NOT EXISTS `a3k_group` (
  `g_id` int(10) NOT NULL auto_increment,
  `g_name` varchar(10) default NULL,
  `g_leader` varchar(10) default NULL,
  `g_count` tinyint(3) default NULL,
  `g_text` text,
  PRIMARY KEY  (`g_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_group_invitation`
-- 

DROP TABLE IF EXISTS `a3k_group_invitation`;
CREATE TABLE IF NOT EXISTS `a3k_group_invitation` (
  `g_id` varchar(10) NOT NULL default '',
  `p_id` varchar(10) NOT NULL default '',
  PRIMARY KEY  (`g_id`,`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_group_message`
-- 

DROP TABLE IF EXISTS `a3k_group_message`;
CREATE TABLE IF NOT EXISTS `a3k_group_message` (
  `m_id` int(10) NOT NULL auto_increment,
  `g_id` varchar(10) default NULL,
  `g_message` text,
  `g_writetime` int(10) default '0',
  PRIMARY KEY  (`m_id`),
  KEY `g_id` (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_items`
-- 

DROP TABLE IF EXISTS `a3k_items`;
CREATE TABLE IF NOT EXISTS `a3k_items` (
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
  `item_ef_exp` int(10) default '0' COMMENT '代表增加多少經驗值',
  `item_stackable` tinyint(1) default '0' COMMENT '可否堆疊',
  `item_storeid` varchar(10) default NULL COMMENT '商店',
  `item_tradable` tinyint(1) NOT NULL default '0' COMMENT '榜定',
  `item_desc` varchar(200) default NULL COMMENT '物品說明',
  `item_price` int(10) unsigned default '0' COMMENT '物品售價',
  `item_r_price` int(10) unsigned NOT NULL default '0' COMMENT '商城幣(0=不是商城物)',
  `item_mixable` text,
  `p_packsize_1` int(11) default '0' COMMENT '背包增加type1',
  `p_packsize_2` int(11) default '0' COMMENT '背包增加type2',
  `p_packsize_3` int(11) default '0' COMMENT '背包增加type3',
  `p_packsize_4` int(11) default '0' COMMENT '背包增加type4',
  `p_money` int(10) default '0' COMMENT '遊戲幣',
  PRIMARY KEY  (`id`),
  KEY `item_id` (`item_id`),
  KEY `item_storeid` (`item_storeid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=175 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_lvlchart`
-- 

DROP TABLE IF EXISTS `a3k_lvlchart`;
CREATE TABLE IF NOT EXISTS `a3k_lvlchart` (
  `lvlchart_id` int(10) unsigned NOT NULL auto_increment,
  `level` int(10) unsigned default '0' COMMENT '等級',
  `nextexp` int(10) unsigned default '0' COMMENT '所需經驗值',
  `lvl_rankname` varchar(10) NOT NULL COMMENT '等級稱為',
  PRIMARY KEY  (`lvlchart_id`),
  KEY `level` (`level`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='升級所需經驗 + 稱號; InnoDB free: 11264 kB' AUTO_INCREMENT=151 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_map`
-- 

DROP TABLE IF EXISTS `a3k_map`;
CREATE TABLE IF NOT EXISTS `a3k_map` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `map_state_name` varchar(20) default NULL,
  `map_city_name` varchar(20) default NULL,
  `map_player_lv` int(10) unsigned default NULL,
  `map_img` varchar(10) default NULL COMMENT '戰鬥背景圖檔名(多個) (rand)',
  `map_html` varchar(30) default NULL COMMENT 'reserve for mission like, when move jump to other page',
  `map_id` varchar(10) NOT NULL,
  `map_control` tinyint(1) NOT NULL default '0' COMMENT '地圖控制 0=> 戰鬥 1=> 城內',
  PRIMARY KEY  (`id`),
  KEY `map_id` (`map_id`),
  KEY `map_state_name` (`map_state_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='地圖表' AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_monster`
-- 

DROP TABLE IF EXISTS `a3k_monster`;
CREATE TABLE IF NOT EXISTS `a3k_monster` (
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
  PRIMARY KEY  (`p_id`),
  KEY `p_map` (`p_map`),
  KEY `p_1001_id` (`p_1001_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=262 ;

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
  `p_itemef_at` int(10) default '0',
  `p_itemef_df` int(10) default '0',
  `p_itemef_hpmax` int(10) default '0',
  `p_itemef_mnmax` int(10) default '0',
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
  KEY `p_map` (`p_map`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_player_item`
-- 

DROP TABLE IF EXISTS `a3k_player_item`;
CREATE TABLE IF NOT EXISTS `a3k_player_item` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `p_id` int(10) unsigned NOT NULL,
  `item_id` varchar(10) NOT NULL,
  `item_eq` tinyint(1) default '0',
  `item_stacknum` smallint(5) unsigned default '1',
  PRIMARY KEY  (`id`),
  KEY `p_id` (`p_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=159 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_player_store`
-- 

DROP TABLE IF EXISTS `a3k_player_store`;
CREATE TABLE IF NOT EXISTS `a3k_player_store` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `p_id` int(10) unsigned NOT NULL,
  `item_id` varchar(50) NOT NULL,
  `usetime` datetime default NULL COMMENT '領取時間',
  PRIMARY KEY  (`id`),
  KEY `p_id` (`p_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_presented_df`
-- 

DROP TABLE IF EXISTS `a3k_presented_df`;
CREATE TABLE IF NOT EXISTS `a3k_presented_df` (
  `id` int(11) NOT NULL auto_increment,
  `ps_source` varchar(50) NOT NULL,
  `ps_did` varchar(20) NOT NULL COMMENT 'money or item',
  `ps_dlv` int(10) NOT NULL COMMENT 'lvl to give',
  `expireddate` datetime default NULL COMMENT 'expired is not null',
  `class` int(1) default '0' COMMENT '1 is money ; 0 is item',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_quest`
-- 

DROP TABLE IF EXISTS `a3k_quest`;
CREATE TABLE IF NOT EXISTS `a3k_quest` (
  `q_id` varchar(10) NOT NULL,
  `q_title` varchar(50) default NULL,
  `q_requester` varchar(20) default NULL,
  `q_img` varchar(10) default NULL,
  `q_map_name` varchar(20) default NULL,
  `q_map_id` varchar(10) default NULL,
  `q_show_lv` int(10) default NULL,
  `q_description` text,
  `q_dest_map` varchar(50) default NULL,
  `q_expireTime` int(10) default NULL,
  `q_type` tinyint(3) NOT NULL default '1',
  `q_instant` tinyint(3) NOT NULL default '1',
  PRIMARY KEY  (`q_id`),
  KEY `q_map_id` (`q_map_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_quest_award`
-- 

DROP TABLE IF EXISTS `a3k_quest_award`;
CREATE TABLE IF NOT EXISTS `a3k_quest_award` (
  `q_id` varchar(10) character set utf8 NOT NULL default '',
  `award_exp` int(10) default '0',
  `award_money` int(10) default '0',
  `award_item` text collate utf8_unicode_ci,
  `award_point` int(10) default '0',
  `award_fellow` varchar(40) collate utf8_unicode_ci default NULL,
  `award_description` varchar(100) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`q_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_quest_limit`
-- 

DROP TABLE IF EXISTS `a3k_quest_limit`;
CREATE TABLE IF NOT EXISTS `a3k_quest_limit` (
  `q_id` varchar(10) character set utf8 NOT NULL default '',
  `limit_lv` int(10) default NULL,
  `limit_job` varchar(10) collate utf8_unicode_ci default NULL,
  `limit_item` text collate utf8_unicode_ci,
  `limit_quest` varchar(50) collate utf8_unicode_ci default NULL,
  `limit_description` varchar(100) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`q_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_quest_need`
-- 

DROP TABLE IF EXISTS `a3k_quest_need`;
CREATE TABLE IF NOT EXISTS `a3k_quest_need` (
  `q_id` varchar(10) character set utf8 NOT NULL default '',
  `need_monster` varchar(60) collate utf8_unicode_ci default NULL,
  `need_fight` varchar(40) collate utf8_unicode_ci default NULL,
  `need_item` text collate utf8_unicode_ci,
  `need_description` varchar(100) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`q_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_quest_status`
-- 

DROP TABLE IF EXISTS `a3k_quest_status`;
CREATE TABLE IF NOT EXISTS `a3k_quest_status` (
  `p_id` varchar(10) NOT NULL default '',
  `q_id` varchar(10) NOT NULL default '',
  `q_status` tinyint(3) default NULL,
  `q_data` text,
  `q_end_time` int(10) default NULL,
  PRIMARY KEY  (`p_id`,`q_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_quest_time`
-- 

DROP TABLE IF EXISTS `a3k_quest_time`;
CREATE TABLE IF NOT EXISTS `a3k_quest_time` (
  `q_id` varchar(10) default NULL,
  `q_week` tinyint(3) unsigned default NULL,
  `q_hour` mediumint(8) unsigned default NULL,
  KEY `q_id` (`q_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_referral_award`
-- 

DROP TABLE IF EXISTS `a3k_referral_award`;
CREATE TABLE IF NOT EXISTS `a3k_referral_award` (
  `id` int(11) NOT NULL auto_increment,
  `next_ref` int(3) NOT NULL,
  `award_itemid` varchar(10) NOT NULL,
  `award_item_no` int(2) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

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

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_shortcut`
-- 

DROP TABLE IF EXISTS `a3k_shortcut`;
CREATE TABLE IF NOT EXISTS `a3k_shortcut` (
  `sc_id` int(10) unsigned NOT NULL auto_increment COMMENT 'id',
  `p_id` varchar(45) NOT NULL COMMENT '玩家id',
  `sc_pos` varchar(45) NOT NULL default '0' COMMENT '快捷位子',
  `sc_type` varchar(45) NOT NULL default '0' COMMENT '快捷內容種類(1:skill / 2:item)',
  `sc_status` tinyint(1) NOT NULL default '0' COMMENT '快捷''狀態(1:clicked/0:not)',
  `sc_type_id` varchar(45) NOT NULL COMMENT '快捷內容id',
  `sc_img` varchar(45) NOT NULL default ' ' COMMENT '快捷圖',
  `sc_usename` varchar(45) NOT NULL default ' ' COMMENT '快捷內容名子',
  PRIMARY KEY  (`sc_id`),
  KEY `p_id` (`p_id`),
  KEY `sc_pos` (`sc_pos`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='玩家快捷' AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `a3k_skill`
-- 

DROP TABLE IF EXISTS `a3k_skill`;
CREATE TABLE IF NOT EXISTS `a3k_skill` (
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
  PRIMARY KEY  (`skill_id`),
  KEY `user_id` (`user_id`),
  KEY `skill_active` (`skill_active`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='玩家技能' AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `announcement`
-- 

DROP TABLE IF EXISTS `announcement`;
CREATE TABLE IF NOT EXISTS `announcement` (
  `id` int(11) NOT NULL auto_increment,
  `utime` int(11) NOT NULL COMMENT 'announcement unix time',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `content` varchar(1024) NOT NULL COMMENT 'announcement',
  PRIMARY KEY  (`id`),
  KEY `utime` (`utime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `chat`
-- 

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `content` varchar(2000) default NULL,
  `msg` varchar(1000) default NULL,
  `channel` tinyint(3) default '0',
  `cfrom` varchar(45) default NULL,
  `cto` varchar(45) default NULL,
  `guid` varchar(45) default NULL,
  `comment` tinyint(3) default NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MEMORY  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `chatbk`
-- 

DROP TABLE IF EXISTS `chatbk`;
CREATE TABLE IF NOT EXISTS `chatbk` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `content` varchar(2000) default NULL,
  `msg` varchar(1000) default NULL,
  `channel` tinyint(3) default '0',
  `cfrom` varchar(45) default NULL,
  `cto` varchar(45) default NULL,
  `guid` varchar(45) default NULL,
  `comment` tinyint(3) default NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `chatindex`
-- 

DROP TABLE IF EXISTS `chatindex`;
CREATE TABLE IF NOT EXISTS `chatindex` (
  `cindextime` int(10) NOT NULL default '0',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`cindextime`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mail`
-- 

DROP TABLE IF EXISTS `mail`;
CREATE TABLE IF NOT EXISTS `mail` (
  `id` int(11) NOT NULL auto_increment,
  `guid` varchar(45) default NULL,
  `sender` varchar(10) default NULL,
  `recv` varchar(10) default NULL,
  `createdate` datetime default NULL,
  `readdate` datetime default NULL COMMENT '讀取時間',
  `expireddate` datetime default NULL,
  `title` varchar(500) default NULL,
  `content` text,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mail' AUTO_INCREMENT=1 ;
