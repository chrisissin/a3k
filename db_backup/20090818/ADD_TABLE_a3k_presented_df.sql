-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Aug 18, 2009 at 11:27 AM
-- Server version: 5.0.67
-- PHP Version: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `a3k`
-- 

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

-- 
-- Dumping data for table `a3k_presented_df`
-- 

INSERT INTO `a3k_presented_df` VALUES (1, 'FUNLAND', 'h0002', 1, NULL, 0);
INSERT INTO `a3k_presented_df` VALUES (2, 'gamebase', 'c0009', 1, NULL, 0);
INSERT INTO `a3k_presented_df` VALUES (3, 'gamebase', 'h0002', 1, NULL, 0);
