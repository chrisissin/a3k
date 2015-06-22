-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Aug 26, 2009 at 02:34 AM
-- Server version: 5.0.67
-- PHP Version: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `a3k`
-- 

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

-- 
-- Dumping data for table `a3k_monster`
-- 

INSERT INTO `a3k_monster` (`p_id`, `p_at`, `p_df`, `p_agl`, `p_name`, `p_hp`, `p_lv`, `d_id`, `p_topr`, `p_map`, `p_img`, `pf_ids`, `p_1001_id`) VALUES 
(37, 73, 48, 16, '金城小兵', 470, 16, 'h0003`h0004`h0005`i0036', 5, 'a04', 'n0415', 'a01004`a04008`a04009`a04010', 'a04009'),
(36, 75, 45, 18, '野山毒蛇', 470, 16, 'h0003`h0004`h0005`i0036', 5, 'a04', 'n0553', 'a01003`a04008`a04009`a04010', 'a04008'),
(35, 125, 93, 42, '羌族之王', 700, 22, 'h0003`h0004`h0005', 5, 'a04', 'n0300', 'a04007`a04008`a04009`a04010', 'a04007'),
(34, 119, 88, 38, '金城精兵校尉', 700, 21, 'h0003`h0004`h0005`i0036', 5, 'a04', 'n0462', 'a04006`a04008`a04009`a04010', 'a04006'),
(33, 113, 85, 35, '金城精兵', 670, 20, 'h0003`h0004`h0005`i0036', 5, 'a04', 'n0460', 'a04005`a04008`a04009`a04010', 'a04005'),
(32, 110, 79, 32, '羌族護糧軍', 640, 19, 'h0003`h0004`h0005`i0036', 5, 'a04', 'n0314', 'a04004`a04008`a04009`a04010', 'a04004'),
(31, 105, 75, 30, '羌族先鋒', 620, 18, 'h0003`h0004`h0005`i0036', 5, 'a04', 'n0313', 'a04003`a04008`a04009`a04010', 'a04003'),
(30, 103, 71, 28, '羌族參謀', 600, 17, 'i0004', 35, 'a04', 'n0390', 'a04002`a04008`a04009`a04010', 'a04002'),
(29, 100, 69, 25, '金城雜兵', 600, 17, 'h0003`h0004`h0005', 5, 'a04', 'n0312', 'a04001`a04008`a04009`a04010', 'a04001'),
(28, 70, 39, 5, '張濟衛兵', 250, 13, 'h0003`h0004`h0005`i0036', 5, 'a03', 'n0412', 'a03007`a03008`a03009`a03010`a03011', 'a03011'),
(27, 65, 39, 5, '涼州守軍', 245, 12, 'h0003`h0004`h0005`i0036', 5, 'a03', 'n0412', 'a03007`a03008`a03009`a03010`a03011', 'a03010'),
(26, 63, 37, 5, '涼州守衛', 240, 12, 'h0003`h0004`h0005`i0036', 5, 'a03', 'n0412', 'a03007`a03008`a03009`a03010`a03011', 'a03009'),
(25, 62, 35, 5, '涼州官兵', 230, 11, 'h0003`h0004`h0005`i0036', 5, 'a03', 'n0411', 'a03007`a03008`a03009`a03010`a03011', 'a03008'),
(24, 60, 33, 5, '涼州小兵', 220, 11, 'h0003`h0004`h0005`i0036', 5, 'a03', 'n0411', 'a03007`a03008`a03009`a03010`a03011', 'a03007'),
(23, 90, 58, 35, '樊稠', 380, 16, 'h0003`h0004`h0005`i0036', 5, 'a03', 'n0150', 'a03004`a03005`a03007`a03009`a03010`a03011', 'a03006'),
(22, 87, 55, 30, '張濟', 375, 15, 'h0003`h0004`h0005`i0036', 5, 'a03', 'n0080', 'a03004`a03007`a03008`a03009`a03010`a03011', 'a03005'),
(21, 85, 53, 28, '涼州精兵校尉', 350, 15, 'h0003`h0004`h0005', 5, 'a03', 'n0050', 'a03004`a03007`a03008`a03009`a03010`a03011', 'a03004'),
(20, 81, 49, 26, '涼州校尉', 350, 14, 'h0003`h0004`h0005', 5, 'a03', 'n0012', 'a03003`a03007`a03008`a03009`a03010`a03011', 'a03003'),
(19, 78, 46, 24, '涼州士兵', 340, 13, 'h0003`h0004`h0005', 5, 'a03', 'n0010', 'a03002`a03007`a03008`a03009`a03010`a03011', 'a03002'),
(18, 75, 43, 23, '董卓姪兒', 320, 13, 'i0003', 35, 'a03', 'n0380', 'a03001`a03007`a03008`a03009`a03010`a03011', 'a03001'),
(17, 40, 30, 15, '山賊小隊長', 180, 7, 'h0003`h0004`h0005`i0032', 5, 'a02', 'n0320', 'a02004`a02005`a02006`a02007`a02008', 'a02008'),
(16, 40, 28, 13, '董家私兵', 180, 7, 'h0003`h0004`h0005`i0032', 5, 'a02', 'n0281', 'a02004`a02005`a02006`a02007`a02008', 'a02007'),
(15, 38, 27, 11, '董家雜兵', 165, 6, 'h0003`h0004`h0005`i0032', 5, 'a02', 'n0281', 'a02004`a02005`a02006`a02007`a02008', 'a02006'),
(14, 35, 27, 10, '董家傭人', 155, 6, 'h0003`h0004`h0005`i0032', 5, 'a02', 'n0280', 'a02004`a02005`a02006`a02007`a02008', 'a02005'),
(13, 33, 25, 10, '董家護衛', 150, 6, 'h0003`h0004`h0005`i0032', 5, 'a02', 'n0270', 'a02004`a02005`a02006`a02007`a02008', 'a02004'),
(12, 62, 42, 25, '山賊頭目', 230, 10, 'i0002', 35, 'a02', 'n0270', 'a02003`a02004`a02005`a02006`a02007`a02008', 'a02003'),
(11, 60, 38, 22, '山賊精兵', 210, 9, 'h0003`h0004`h0005`i0032`i0036', 5, 'a02', 'n0295', 'a02002`a02004`a02005`a02006`a02007`a02008', 'a02002'),
(10, 58, 35, 20, '山賊雜兵', 200, 8, 'i0001', 35, 'a02', 'n0330', 'a02001`a02004`a02005`a02006`a02007`a02008', 'a02001'),
(9, 25, 25, 5, '山賊小兵', 75, 3, 'h0003`h0004`h0005`i0032', 5, 'a01', 'n0333', 'a01003`a01004`a01005`a01006`a01007`a01008', 'a01008'),
(1, 8, 8, 5, '小盜賊', 20, 1, 'h0003`h0004`h0005', 5, 'x01', 'n0333', 'x01001', 'x01001'),
(2, 52, 30, 6, '野熊', 100, 4, 'h0003`h0004`h0005', 5, 'a01', 'n0541', 'a01001`a01003`a01004`a01005`a01006`a01007`a01008', 'a01001'),
(3, 55, 33, 8, '吃人野熊', 120, 5, 'h0003`h0004`h0005', 5, 'a01', 'n0542', 'a01002`a01001`a01003`a01004`a01005`a01006`a01007`a01008', 'a01002'),
(4, 28, 22, 5, '噬血猛虎', 80, 1, 'h0003`h0004`h0005', 5, 'a01', 'n0532', 'a01003`a01004`a01005`a01006`a01007`a01008', 'a01003'),
(5, 27, 23, 5, '致命毒蛇', 90, 1, 'h0003`h0004`h0005', 5, 'a01', 'n0550', 'a01003`a01004`a01005`a01006`a01007`a01008', 'a01004'),
(6, 25, 23, 5, '飢餓山狼', 100, 2, 'h0003`h0004`h0005', 5, 'a01', 'n0562', 'a01003`a01004`a01005`a01006`a01007`a01008', 'a01005'),
(7, 26, 24, 5, '凶狠野狼', 90, 2, 'h0003`h0004`h0005', 5, 'a01', 'n0561', 'a01003`a01004`a01005`a01006`a01007`a01008', 'a01006'),
(8, 25, 22, 5, '山賊糧兵', 85, 3, 'h0003`h0004`h0005', 5, 'a01', 'n0334', 'a01003`a01004`a01005`a01006`a01007`a01008', 'a01007'),
(89, 173, 135, 54, '洛陽雜兵', 860, 42, 'h0003`h0004`h0005', 5, 'c01', 'n0414', 'c01006`c01007`c01008`c01009`c01010', 'c01008'),
(88, 171, 132, 53, '洛陽小兵', 860, 41, 'h0003`h0004`h0005', 5, 'c01', 'n0414', 'c01006`c01007`c01008`c01009`c01010', 'c01007'),
(87, 168, 127, 52, '富商傭人', 860, 41, 'h0003`h0004`h0005', 5, 'c01', 'n0280', 'c01006`c01007`c01008`c01009`c01010', 'c01006'),
(86, 223, 195, 76, '吳禾重', 1000, 47, 'i0020', 35, 'c01', 'n0392', 'c01004`c01006`c01007`c01008`c01009`c01010', 'c01005'),
(85, 213, 185, 72, '黃巾旅人', 960, 45, 'h0003`h0004`h0005', 5, 'c01', 'n0235', 'c01004`c01006`c01007`c01008`c01009`c01010', 'c01004'),
(84, 203, 178, 70, '黃巾道人', 940, 44, 'h0003`h0004`h0005', 5, 'c01', 'n0215', 'c01003`c01006`c01007`c01008`c01009`c01010', 'c01003'),
(83, 196, 173, 68, '富商護衛', 920, 43, 'i0019', 35, 'c01', 'n0170', 'c01002`c01006`c01007`c01008`c01009`c01010', 'c01002'),
(82, 188, 167, 65, '洛陽守軍', 900, 43, 'i0017`i0018', 35, 'c01', 'n0050', 'c01001`c01006`c01007`c01008`c01009`c01010', 'c01001'),
(81, 173, 124, 49, '胡悠傭人', 820, 37, 'h0003`h0004`h0005`i0049', 5, 'b03', 'n0281', 'b03005`b03006`b03007`b03008`b03009', 'b03009'),
(80, 160, 121, 48, '胡悠私兵', 810, 37, 'h0003`h0004`h0005`i0049', 5, 'b03', 'n0414', 'b03005`b03006`b03007`b03008`b03009', 'b03008'),
(79, 156, 119, 47, '胡悠小兵', 800, 36, 'h0003`h0004`h0005`i0049', 5, 'b03', 'n0414', 'b03005`b03006`b03007`b03008`b03009', 'b03007'),
(78, 152, 117, 46, '安定黑店店長', 790, 36, 'h0003`h0004`h0005', 5, 'b03', 'n0281', 'b03005`b03006`b03007`b03008`b03009', 'b03006'),
(77, 148, 115, 45, '安定黑店店員', 780, 36, 'h0003`h0004`h0005', 5, 'b03', 'n0280', 'b03005`b03006`b03007`b03008`b03009', 'b03005'),
(76, 198, 170, 69, '胡悠', 860, 41, 'h0003`h0004`h0005`i0060`i0059', 5, 'b03', 'n0240', 'b03003`b03005`b03006`b03007`b03008`b03009', 'b03004'),
(75, 183, 165, 67, '胡悠護衛', 828, 40, 'h0003`h0004`h0005', 5, 'b03', 'n0220', 'b03003`b03005`b03006`b03007`b03008`b03009', 'b03003'),
(74, 180, 150, 62, '安定黑店老闆', 814, 39, 'i0015`i0016', 35, 'b03', 'n0284', 'b03002`b03005`b03006`b03007`b03008`b03009', 'b03002'),
(73, 173, 135, 60, '黃巾密探', 800, 38, 'h0003`h0004`h0005`i0044`i0049', 5, 'b03', 'n0371', 'b03001`b03005`b03006`b03007`b03008`b03009', 'b03001'),
(72, 140, 108, 42, '馬扁子私兵', 760, 32, 'h0003`h0004`h0005`i0044`i0049', 5, 'b02', 'n0280', 'b02006`b02007`b02008`b02009`b02010', 'b02010'),
(71, 130, 105, 41, '洞主保鑣', 750, 32, 'h0003`h0004`h0005`i0044`i0049', 5, 'b02', 'n0315', 'b02006`b02007`b02008`b02009`b02010', 'b02009'),
(70, 133, 103, 40, '黑風小隊長', 740, 31, 'h0003`h0004`h0005`i0044`i0049', 5, 'b02', 'n0320', 'b02006`b02007`b02008`b02009`b02010', 'b02008'),
(69, 130, 101, 39, '黑風守衛', 730, 31, 'h0003`h0004`h0005`i0044`i0049', 5, 'b02', 'n0314', 'b02006`b02007`b02008`b02009`b02010', 'b02007'),
(68, 128, 100, 38, '黑風小兵', 720, 31, 'h0003`h0004`h0005`i0044`i0049', 5, 'b02', 'n0314', 'b02006`b02007`b02008`b02009`b02010', 'b02006'),
(67, 183, 145, 65, '馬扁子', 800, 36, 'h0003`h0004`h0005`i0059`i0062', 5, 'b02', 'n0210', 'b02004`b02006`b02007`b02008`b02009`b02010', 'b02005'),
(66, 169, 143, 61, '馬扁子護衛', 772, 35, 'h0003`h0004`h0005`i0062', 5, 'b02', 'n0200', 'b02004`b02006`b02007`b02008`b02009`b02010', 'b02004'),
(65, 168, 135, 59, '黑風洞主', 758, 34, 'h0003`h0004`h0005`i0048', 5, 'b02', 'n0381', 'b02002`b02006`b02007`b02008`b02009`b02010', 'b02003'),
(90, 176, 138, 55, '洛陽守衛', 880, 42, 'h0003`h0004`h0005', 5, 'c01', 'n0050', 'c01006`c01007`c01008`c01009`c01010', 'c01009'),
(64, 163, 129, 58, '黑風副洞主', 744, 33, 'i0014', 35, 'b02', 'n0270', 'b02002`b02006`b02007`b02008`b02009`b02010', 'b02002'),
(63, 158, 125, 56, '黑風悍匪', 730, 32, 'i0013', 35, 'b02', 'n0401', 'b02001`b02006`b02007`b02008`b02009`b02010', 'b02001'),
(62, 120, 91, 33, '當地小痞子', 670, 27, 'h0003`h0004`h0005`i0044', 5, 'b01', 'n0284', 'b01007`b01008`b01009`b01010', 'b01010'),
(61, 116, 83, 32, '隴西流氓', 660, 27, 'h0003`h0004`h0005`i0044', 5, 'b01', 'n0284', 'b01007`b01008`b01009`b01010', 'b01009'),
(60, 112, 88, 31, '隴西惡賊', 650, 26, 'h0003`h0004`h0005`i0044', 5, 'b01', 'n0292', 'b01007`b01008`b01009`b01010', 'b01008'),
(59, 108, 90, 30, '隴西山賊', 640, 26, 'h0003`h0004`h0005`i0044', 5, 'b01', 'n0292', 'b01007`b01008`b01009`b01010', 'b01007'),
(58, 165, 128, 55, '可疑的悍匪首腦', 700, 31, 'h0003`h0004`h0005`i0044`i0048', 5, 'b01', 'n0283', 'b01006`b01007`b01008`b01009`b01010', 'b01006'),
(57, 155, 121, 50, '可疑的隴西悍匪', 700, 30, 'h0003`h0004`h0005`i0044', 5, 'b01', 'n0281', 'b01005`b01007`b01008`b01009`b01010', 'b01005'),
(56, 147, 118, 51, '隴西響馬', 694, 30, 'h0003`h0004`h0005`i0044', 5, 'b01', 'n0344', 'b01004`b01007`b01008`b01009`b01010', 'b01004'),
(55, 140, 110, 48, '隴西悍匪', 680, 29, 'i0012', 35, 'b01', 'n0281', 'b01003`b01007`b01008`b01009`b01010', 'b01003'),
(54, 138, 103, 46, '隴西竊賊', 666, 28, 'i0011', 35, 'b01', 'n0292', 'b01002`b01007`b01008`b01009`b01010', 'b01002'),
(53, 133, 100, 44, '野外毒蛇', 652, 27, 'i0010', 35, 'b01', 'n0552', 'b01001`b01007`b01008`b01009`b01010', 'b01001'),
(52, 95, 68, 27, '羌族惡漢', 610, 24, 'h0003`h0004`h0005`i0036', 5, 'a05', 'n0292', 'a05008`a05009`a05010`a05011`a05012', 'a05014'),
(51, 95, 67, 27, '殺人毒蛇', 610, 23, 'h0003`h0004`h0005`i0036', 5, 'a05', 'n0553', 'a05008`a05009`a05010`a05011`a05012', 'a05013'),
(50, 95, 68, 26, '羌族惡虎', 632, 22, 'h0003`h0004`h0005`i0036', 5, 'a05', 'n0531', 'a05008`a05009`a05010`a05011`a05012', 'a05012'),
(49, 91, 67, 27, '羌族餓虎', 610, 21, 'h0003`h0004`h0005', 5, 'a05', 'n0531', 'a05008`a05009`a05010`a05011`a05012', 'a05011'),
(48, 93, 69, 25, '羌族糧兵', 626, 22, 'h0003`h0004`h0005', 5, 'a05', 'n0415', 'a05008`a05009`a05010`a05011`a05012', 'a05010'),
(47, 87, 65, 26, '羌族雜兵', 560, 21, 'h0003`h0004`h0005', 5, 'a05', 'n0415', 'a05008`a05009`a05010`a05011`a05012', 'a05009'),
(46, 85, 63, 24, '羌族士兵', 600, 21, 'h0003`h0004`h0005', 5, 'a05', 'n0415', 'a05008`a05009`a05010`a05011`a05012', 'a05008'),
(45, 145, 108, 45, '羌族之王', 720, 27, 'i0009', 35, 'a05', 'n0300', 'a05006`a05008`a05009`a05010`a05011`a05012', 'a05007'),
(44, 130, 103, 44, '羌族大將', 650, 25, 'h0003`h0004`h0005`i0042`i0043', 5, 'a05', 'n0420', 'a05006`a05008`a05009`a05010`a05011`a05012', 'a05006'),
(43, 125, 88, 42, '羌族軍師', 624, 25, 'h0003`h0004`h0005`i0042`i0043', 5, 'a05', 'n0392', 'a05005`a05008`a05009`a05010`a05011`a05012', 'a05005'),
(42, 120, 93, 41, '羌兵統領', 666, 24, 'i0007`i0008', 35, 'a05', 'n0385', 'a05004`a05008`a05009`a05010`a05011`a05012', 'a05004'),
(40, 123, 88, 38, '塞上惡虎', 700, 23, 'h0003`h0004`h0005`i0036', 5, 'a05', 'n0535', 'a05002`a05008`a05009`a05010`a05011`a05012', 'a05002'),
(41, 115, 103, 42, '嗜血惡虎', 640, 23, 'h0003`h0004`h0005`i0036', 5, 'a05', 'n0532', 'a05003`a05008`a05009`a05010`a05011`a05012', 'a05003'),
(39, 120, 88, 30, '羌族信差', 700, 22, 'i0005`i0006', 35, 'a05', 'n0411', 'a05001`a05008`a05009`a05010`a05011`a05012', 'a05001'),
(38, 76, 51, 20, '羌族小兵', 520, 17, 'h0003`h0004`h0005`i0036', 5, 'a04', 'n0415', 'a01005`a04008`a04009`a04010', 'a04010'),
(91, 178, 141, 56, '吳禾重保鑣', 880, 43, 'h0003`h0004`h0005', 5, 'c01', 'n0281', 'c01006`c01007`c01008`c01009`c01010', 'c01010'),
(92, 218, 190, 72, '皇城禁軍守衛', 1000, 47, 'i0021', 35, 'c02', 'n0392', 'c02001`c02013`c02014`c02015`c02016', 'c02001'),
(93, 221, 193, 75, '皇城禁軍守衛', 1020, 48, 'i0022', 35, 'c02', 'n0392', 'c02002`c02013`c02014`c02015`c02016', 'c02002'),
(94, 224, 192, 78, '夏惲', 1040, 49, 'h0003`h0004`h0005', 5, 'c02', 'n0260', 'c02004`c02013`c02014`c02015`c02016', 'c02003'),
(95, 225, 195, 78, '郭勝', 1040, 49, 'h0003`h0004`h0005', 5, 'c02', 'n0261', 'c02005`c02013`c02014`c02015`c02016', 'c02004'),
(96, 225, 196, 78, '張讓', 1040, 49, 'h0003`h0004`h0005', 5, 'c02', 'n0262', 'c02006`c02013`c02014`c02015`c02016', 'c02005'),
(97, 227, 197, 80, '封諝', 1040, 49, 'h0003`h0004`h0005', 5, 'c02', 'n0263', 'c02007`c02013`c02014`c02015`c02016', 'c02006'),
(98, 227, 198, 80, '段珪', 1060, 50, 'h0003`h0004`h0005', 5, 'c02', 'n0264', 'c02008`c02013`c02014`c02015`c02016', 'c02007'),
(99, 229, 199, 80, '曹節', 1060, 50, 'h0003`h0004`h0005', 5, 'c02', 'n0265', 'c02009`c02013`c02014`c02015`c02016', 'c02008'),
(100, 229, 200, 82, '侯覽', 1060, 50, 'h0003`h0004`h0005', 5, 'c02', 'n0262', 'c02010`c02013`c02014`c02015`c02016', 'c02009'),
(101, 232, 202, 82, '程曠', 1060, 50, 'h0003`h0004`h0005', 5, 'c02', 'n0263', 'c02011`c02013`c02014`c02015`c02016', 'c02010'),
(102, 232, 204, 84, '趙忠', 1060, 51, 'h0003`h0004`h0005', 5, 'c02', 'n0264', 'c02012`c02013`c02014`c02015`c02016', 'c02011'),
(103, 233, 205, 85, '蹇碩', 1060, 52, 'h0003`h0004`h0005', 5, 'c02', 'n0265', 'c02003`c02013`c02014`c02015`c02016', 'c02012'),
(104, 183, 145, 58, '黃巾路人', 900, 46, 'h0003`h0004`h0005', 5, 'c02', 'n0233', 'c02013`c02014`c02015`c02016', 'c02013'),
(105, 185, 148, 58, '黃巾農人', 900, 46, 'h0003`h0004`h0005', 5, 'c02', 'n0233', 'c02013`c02014`c02015`c02016', 'c02014'),
(106, 188, 151, 59, '皇城雜兵', 900, 46, 'h0003`h0004`h0005', 5, 'c02', 'n0413', 'c02013`c02014`c02015`c02016', 'c02015'),
(107, 190, 154, 60, '皇城小兵', 920, 47, 'h0003`h0004`h0005', 5, 'c02', 'n0413', 'c02013`c02014`c02015`c02016', 'c02016'),
(108, 235, 205, 97, '反叛的禁衛軍', 1080, 53, 'h0003`h0004`h0005', 5, 'c03', 'n0393', 'c03001`c03006`c03007`c03008`c03009`c03010', 'c03001'),
(109, 237, 208, 98, '太平妖道', 1100, 54, 'h0003`h0004`h0005', 5, 'c03', 'n0212', 'c03002`c03006`c03007`c03008`c03009`c03010', 'c03002'),
(110, 241, 211, 100, '黃巾力士', 1120, 55, 'h0003`h0004`h0005', 5, 'c03', 'n0201', 'c03003`c03006`c03007`c03008`c03009`c03010', 'c03003'),
(111, 245, 214, 101, '人公黃巾力士', 1140, 56, 'h0003`h0004`h0005', 5, 'c03', 'n0200', 'c03004`c03006`c03007`c03008`c03009`c03010', 'c03004'),
(112, 253, 219, 103, '張梁', 1200, 57, 'h0003`h0004`h0005', 5, 'c03', 'n0165', 'c03004`c03006`c03007`c03008`c03009`c03010', 'c03005'),
(113, 213, 165, 65, '黃巾妖賊', 1000, 51, 'h0003`h0004`h0005', 5, 'c03', 'n0212', 'c03006`c03007`c03008`c03009`c03010', 'c03006'),
(114, 216, 169, 66, '黃巾壞人', 1000, 51, 'h0003`h0004`h0005', 5, 'c03', 'n0220', 'c03006`c03007`c03008`c03009`c03010', 'c03007'),
(115, 220, 173, 67, '黃巾小兵', 1000, 51, 'h0003`h0004`h0005', 5, 'c03', 'n0223', 'c03006`c03007`c03008`c03009`c03010', 'c03008'),
(116, 223, 177, 67, '張梁私兵', 1300, 52, 'h0003`h0004`h0005', 5, 'c03', 'n0281', 'c03006`c03007`c03008`c03009`c03010', 'c03009'),
(117, 226, 181, 68, '黃巾小隊長', 1030, 52, 'h0003`h0004`h0005', 5, 'c03', 'n0221', 'c03006`c03007`c03008`c03009`c03010', 'c03010'),
(118, 245, 220, 104, '黃巾妖道', 1200, 58, 'i0023`i0024`i0025', 35, 'd01', 'n0213', 'd01001`d01009`d01010`d01011`d01012`d01013', 'd01001'),
(119, 248, 224, 106, '黃巾力士', 1220, 58, 'h0003`h0004`h0005', 5, 'd01', 'n0202', 'd01002`d01009`d01010`d01011`d01012`d01013', 'd01002'),
(120, 252, 228, 107, '高升', 1240, 59, 'h0003`h0004`h0005', 5, 'd01', 'n0403', 'd01002`d01009`d01010`d01011`d01012`d01013', 'd01003'),
(121, 256, 231, 109, '黃巾守營士兵', 1240, 59, 'h0003`h0004`h0005', 5, 'd01', 'n0222', 'd01004`d01009`d01010`d01011`d01012`d01013', 'd01004'),
(122, 260, 234, 111, '黃巾守營校尉', 1260, 60, 'h0003`h0004`h0005', 5, 'd01', 'n0234', 'd01005`d01009`d01010`d01011`d01012`d01013', 'd01005'),
(123, 264, 238, 112, '地公親衛隊', 1280, 61, 'h0003`h0004`h0005', 5, 'd01', 'n0443', 'd01006`d01009`d01010`d01011`d01012`d01013', 'd01006'),
(124, 270, 241, 114, '地公妖術師', 1300, 62, 'h0003`h0004`h0005', 5, 'd01', 'n0214', 'd01007`d01009`d01010`d01011`d01012`d01013', 'd01007'),
(125, 290, 248, 115, '張寶', 1332, 63, 'h0003`h0004`h0005', 5, 'd01', 'n0062', 'd01007`d01009`d01010`d01011`d01012`d01013', 'd01008'),
(126, 235, 198, 75, '張寶私兵', 1100, 56, 'h0003`h0004`h0005', 5, 'd01', 'n0281', 'd01009`d01010`d01011`d01012`d01013', 'd01009'),
(127, 238, 202, 75, '張寶保鑣', 1100, 56, 'h0003`h0004`h0005', 5, 'd01', 'n0281', 'd01009`d01010`d01011`d01012`d01013', 'd01010'),
(128, 239, 206, 76, '黃巾力士小隊長', 1100, 56, 'h0003`h0004`h0005', 5, 'd01', 'n0232', 'd01009`d01010`d01011`d01012`d01013', 'd01011'),
(129, 242, 208, 76, '妖道小隊長', 1120, 57, 'h0003`h0004`h0005', 5, 'd01', 'n0213', 'd01009`d01010`d01011`d01012`d01013', 'd01012'),
(130, 311, 290, 112, '鉅鹿殺人魔', 1390, 72, 'h0003`h0004`h0005', 5, 'f02', 'n0330', 'f02009`f02010`f02011', 'f02011'),
(131, 307, 274, 117, '黃巾戰將', 1120, 64, 'h0003`h0004`h0005', 5, 'e01', 'n0175', 'e01001`e01007`e01008`e01009', 'e01001'),
(132, 310, 278, 118, '黃巾援軍', 1360, 65, 'h0003`h0004`h0005', 5, 'e01', 'n0224', 'e01002`e01007`e01008`e01009', 'e01002'),
(133, 313, 282, 120, '黃巾力士', 1360, 65, 'h0003`h0004`h0005', 5, 'e01', 'n0200', 'e01003`e01007`e01008`e01009', 'e01003'),
(134, 316, 286, 121, '鄧茂', 1380, 66, 'h0003`h0004`h0005', 5, 'e01', 'n0195', 'e01003`e01007`e01008`e01009', 'e01004'),
(135, 319, 290, 123, '人公妖術師', 1380, 66, 'h0003`h0004`h0005', 5, 'e01', 'n0213', 'e01005`e01007`e01008`e01009', 'e01005'),
(136, 322, 294, 125, '張梁', 1400, 67, 'h0003`h0004`h0005', 5, 'e01', 'n0165', 'e01005`e01007`e01008`e01009', 'e01006'),
(137, 625, 298, 126, '可疑的行人', 1420, 68, 'i0027', 35, 'f01', 'n0285', 'f01001`f01006`f01007`f01008', 'f01001'),
(138, 628, 298, 128, '天公道人', 1430, 69, 'i0028', 35, 'f01', 'n0212', 'f01002`f01006`f01007`f01008', 'f01002'),
(139, 310, 298, 129, '黃巾死士', 1440, 70, 'h0003`h0004`h0005', 5, 'f01', 'n0385', 'f01003`f01006`f01007`f01008', 'f01003'),
(140, 333, 301, 131, '黃巾力士', 1440, 71, 'h0003`h0004`h0005', 5, 'f01', 'n0205', 'f01004`f01006`f01007`f01008', 'f01004'),
(141, 336, 304, 132, '天公將軍分身', 1500, 72, 'h0003`h0004`h0005', 5, 'f01', 'h0170', 'f01005`f01006`f01007`f01008', 'f01005'),
(142, 339, 307, 134, '黃巾力士', 1500, 72, 'h0003`h0004`h0005', 5, 'f02', 'n0203', 'f02001`f02009`f02010`f02011', 'f02001'),
(143, 342, 310, 135, '黃巾突圍軍', 1520, 73, 'h0003`h0004`h0005', 5, 'f02', 'n0441', 'f02002`f02009`f02010`f02011', 'f02002'),
(144, 345, 313, 137, '黃巾道士', 1520, 73, 'h0003`h0004`h0005', 5, 'f02', 'n0215', 'f02003`f02009`f02010`f02011', 'f02003'),
(145, 348, 316, 139, '黃巾守衛軍', 1540, 74, 'h0003`h0004`h0005', 5, 'f02', 'n0235', 'f02004`f02009`f02010`f02011', 'f02004'),
(146, 350, 318, 140, '黃巾校尉', 1560, 75, 'h0003`h0004`h0005', 5, 'f02', 'n0191', 'f02005`f02009`f02010`f02011', 'f02005'),
(147, 352, 320, 142, '天公將軍化身', 1580, 76, 'h0003`h0004`h0005', 5, 'f02', 'h0170', 'f02006`f02009`f02010`f02011', 'f02006'),
(148, 354, 322, 143, '張角', 1600, 77, 'h0003`h0004`h0005', 5, 'f02', 'h0170', 'f02006`f02009`f02010`f02011', 'f02007'),
(149, 356, 324, 145, '黃巾力士', 1500, 75, 'h0003`h0004`h0005', 5, 'f02', 'h0170', 'f02008`f02009`f02010`f02011', 'f02008'),
(150, 243, 221, 85, '妖道手下', 610, 61, 'h0003`h0004`h0005', 5, 'e01', 'n0280', 'e01007`e01008`e01009', 'e01008'),
(151, 246, 225, 86, '東郡地痞', 620, 62, 'h0003`h0004`h0005', 5, 'e01', 'n0212', 'e01007`e01008`e01009', 'e01009'),
(152, 315, 290, 126, '可疑的行人', 710, 68, 'i0027', 35, 'f01', 'n0285', 'f01001`f01006`f01007`f01008', 'f01001'),
(153, 318, 290, 128, '天公道人', 715, 69, 'i0028', 35, 'f01', 'n0212', 'f01002`f01006`f01007`f01008', 'f01002'),
(154, 320, 290, 129, '黃巾死士', 720, 70, 'h0003`h0004`h0005', 5, 'f01', 'n0385', 'f01003`f01006`f01007`f01008', 'f01003'),
(155, 323, 293, 131, '黃巾力士', 720, 71, 'h0003`h0004`h0005', 5, 'f01', 'n0205', 'f01004`f01006`f01007`f01008', 'f01004'),
(156, 326, 296, 132, '天公將軍分身', 750, 72, 'h0003`h0004`h0005', 5, 'f01', 'h0170', 'f01005`f01006`f01007`f01008', 'f01005'),
(157, 265, 245, 95, '廣宗流氓', 660, 66, 'h0003`h0004`h0005', 5, 'f01', 'n0281', 'f01006`f01007`f01008', 'f01006'),
(158, 268, 248, 97, '黃巾小卒仔', 660, 66, 'h0003`h0004`h0005', 5, 'f01', 'n0225', 'f01006`f01007`f01008', 'f01007'),
(159, 272, 252, 99, '黃巾小腳色', 610, 67, 'h0003`h0004`h0005', 5, 'f01', 'n0224', 'f01006`f01007`f01008', 'f01008'),
(160, 329, 299, 134, '黃巾力士', 750, 72, 'h0003`h0004`h0005', 5, 'f02', 'n0203', 'f02001`f02009`f02010`f02011', 'f02001'),
(161, 332, 302, 135, '黃巾突圍軍', 760, 73, 'h0003`h0004`h0005', 5, 'f02', 'n0441', 'f02002`f02009`f02010`f02011', 'f02002'),
(162, 335, 305, 137, '黃巾道士', 760, 73, 'h0003`h0004`h0005', 5, 'f02', 'n0215', 'f02003`f02009`f02010`f02011', 'f02003'),
(163, 338, 308, 139, '黃巾守衛軍', 770, 74, 'h0003`h0004`h0005', 5, 'f02', 'n0235', 'f02004`f02009`f02010`f02011', 'f02004'),
(164, 340, 310, 140, '黃巾校尉', 780, 75, 'h0003`h0004`h0005', 5, 'f02', 'n0191', 'f02005`f02009`f02010`f02011', 'f02005'),
(165, 342, 312, 142, '天公將軍化身', 790, 76, 'h0003`h0004`h0005', 5, 'f02', 'h0170', 'f02006`f02009`f02010`f02011', 'f02006'),
(166, 344, 314, 143, '張角', 800, 77, 'h0003`h0004`h0005', 5, 'f02', 'h0170', 'f02006`f02009`f02010`f02011', 'f02007'),
(167, 346, 316, 145, '黃巾力士', 750, 75, 'h0003`h0004`h0005', 5, 'f02', 'h0170', 'f02008`f02009`f02010`f02011', 'f02008'),
(168, 295, 275, 110, '鉅鹿地痞', 680, 71, 'h0003`h0004`h0005', 5, 'f02', 'n0282', 'f02009`f02010`f02011', 'f02009'),
(169, 299, 278, 111, '鉅鹿小盜賊', 680, 71, 'h0003`h0004`h0005', 5, 'f02', 'n0333', 'f02009`f02010`f02011', 'f02010'),
(170, 301, 282, 112, '鉅鹿殺人魔', 695, 72, 'h0003`h0004`h0005', 5, 'f02', 'n0330', 'f02009`f02010`f02011', 'f02011');
