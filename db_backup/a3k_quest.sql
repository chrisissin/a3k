/*
MySQL Data Transfer
Source Host: localhost
Source Database: a3k
Target Host: localhost
Target Database: a3k
Date: 2009/2/9 �U�� 01:26:08
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for a3k_quest
-- ----------------------------
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

-- ----------------------------
-- Table structure for a3k_quest_status
-- ----------------------------
CREATE TABLE `a3k_quest_status` (
  `p_id` varchar(10) NOT NULL default '',
  `q_id` varchar(10) NOT NULL default '',
  `q_status` tinyint(3) default NULL,
  `q_data` text,
  `q_end_time` int(10) default NULL,
  PRIMARY KEY  (`p_id`,`q_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for a3k_quest_time
-- ----------------------------
CREATE TABLE `a3k_quest_time` (
  `q_id` varchar(10) default NULL,
  `q_week` tinyint(3) unsigned default NULL,
  `q_hour` mediumint(8) unsigned default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `a3k_quest` VALUES ('q00001', '熊膽孝親', '墨雲師父', '', '墨家邨', 'c1', '3', '王孝廉的母親病了,徒兒你去飛熊山麓幫他打一些熊膽來給母親燉湯補身吧', '飛熊山麓', '1234108417');
INSERT INTO `a3k_quest` VALUES ('q00002', '斬蛇除害', '墨雲師父', '', '墨家邨', 'c1', '4', '飛熊山麓最近毒蛇肆虐,徒兒你去幫大夥兒驅蛇除害', '飛熊山麓', null);
INSERT INTO `a3k_quest` VALUES ('q00003', '修行之路', '墨雲師父', '', '墨家邨', 'c1', '1', '修行之路就是每天要試煉,現在起每天到飛熊山麓修行,修行完回來找我', '飛熊山麓', '1235448000');
INSERT INTO `a3k_quest` VALUES ('q00004', '守望相助', '涼州刺史委託信', '', '墨家邨', 'c1', '5', '飛熊山麓最近吃人野熊肆虐,已經傷害數名路人,能除害者有賞', '飛熊山麓', null);
INSERT INTO `a3k_quest` VALUES ('q00005', '介紹信', '涼州刺史', '', '墨家邨', 'c1', '5', 'XXX(玩家姓名),感謝您的義舉,我的同僚雍州刺史有事相託,我推薦您去,順便在飛熊山麓打個土產幫我帶過去給他', '飛熊山麓', null);
INSERT INTO `a3k_quest` VALUES ('q00006', '維持治安1', '雍州刺史', '', '雍州府', 'c2', '5', '感謝壯士前來,飛熊山麓最近致命毒蛇猖獗,請助我除害', '飛熊山麓', null);
INSERT INTO `a3k_quest` VALUES ('q00007', '維持治安2', '雍州刺史', '', '雍州府', 'c2', '1', '飛熊山麓最近吃人野熊又出來傷人了,請助我除害', '飛熊山麓', null);
INSERT INTO `a3k_quest` VALUES ('q00008', '維持治安3', '雍州刺史', '', '雍州府', 'c2', '6', '這是每小時大放送任務~快去打怪~', '飛熊山麓', null);
INSERT INTO `a3k_quest` VALUES ('q00009', '職業修行(校尉)', '雍州刺史', '', '雍州府', 'c2', '7', '這是校尉任務', '飛熊山麓', null);
INSERT INTO `a3k_quest` VALUES ('q00010', '職業修行(劍客)', '雍州刺史', '', '雍州府', 'c2', '7', '這是劍客任務', '飛熊山麓', null);
INSERT INTO `a3k_quest` VALUES ('q00011', '職業修行(參謀)', '雍州刺史', '', '雍州府', 'c2', '7', '這是參謀任務', '飛熊山麓', null);
INSERT INTO `a3k_quest` VALUES ('q00012', '緊急招回', '墨雲師父', '', '雍州府', 'c2', '8', '師父有令,殺完山賊嘍嘍回來領紅包', '飛熊山麓', null);
INSERT INTO `a3k_quest` VALUES ('q00013', '令牌任務', '墨雲師父', '', '墨家邨', 'c1', '1', '撿到神祕令牌….究竟能做啥?', '飛熊山麓', null);
INSERT INTO `a3k_quest_status` VALUES ('2', 'q00001', '-1', '', '0');
INSERT INTO `a3k_quest_status` VALUES ('2', 'q00023', '-1', '', '0');
INSERT INTO `a3k_quest_time` VALUES ('q00003', '127', '16777214');
