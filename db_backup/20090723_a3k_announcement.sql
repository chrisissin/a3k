-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jul 23, 2009 at 09:33 AM
-- Server version: 5.0.67
-- PHP Version: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `a3k`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `announcement`
-- 

DROP TABLE IF EXISTS `announcement`;
CREATE TABLE IF NOT EXISTS `announcement` (
  `id` int(11) NOT NULL auto_increment,
  `utime` int(11) NOT NULL COMMENT 'announcement unix time',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `content` varchar(255) NOT NULL COMMENT 'announcement',
  PRIMARY KEY  (`id`),
  KEY `utime` (`utime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- 
-- Dumping data for table `announcement`
-- 

INSERT INTO `announcement` (`id`, `utime`, `timestamp`, `content`) VALUES 
(1, 1248339608, '2009-07-23 17:00:08', 'try try see'),
(2, 1248340747, '2009-07-23 17:19:07', 'try again'),
(3, 1248340791, '2009-07-23 17:19:41', 'try again'),
(4, 1248341374, '2009-07-23 17:29:34', '亂鬥三國24小時M群線上攻略聊天室,請在MSN上新增 group131950@msnzone.cn '),
(5, 1248341414, '2009-07-23 17:30:04', '亂鬥三國24小時M群線上攻略聊天室,請在MSN上新增 group131950@msnzone.cn ');
