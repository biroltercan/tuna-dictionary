-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2017 at 03:30 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tunadictionary`
--
CREATE DATABASE IF NOT EXISTS `tunadictionary` DEFAULT CHARACTER SET utf8 COLLATE utf8_turkish_ci;
USE `tunadictionary`;

-- --------------------------------------------------------

--
-- Table structure for table `entry`
--

CREATE TABLE IF NOT EXISTS `entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(3000) COLLATE utf8_turkish_ci NOT NULL,
  `topicid` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=43 ;

--
-- Dumping data for table `entry`
--

INSERT INTO `entry` (`id`, `content`, `topicid`, `created_at`, `updated_at`, `userid`) VALUES
(2, 'qwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqew', 8, '2017-01-21 20:36:37', '2017-01-21 23:36:37', 1),
(3, 'asd', 8, '2017-01-21 20:36:39', NULL, 1),
(4, 'asdasd', 8, '2017-01-21 20:36:38', NULL, 2),
(5, 'asdasdsad', 1, '2017-01-21 20:36:39', NULL, 2),
(6, 'asdasdsad', 1, '2017-01-22 20:36:39', NULL, 2),
(7, 'adasdasgfasgg', 9, '2017-01-20 07:16:19', NULL, 1),
(8, 'asdasd', 8, '2017-01-22 20:36:45', NULL, 2),
(9, 'deneme', 10, '2017-01-22 13:45:04', NULL, 1),
(10, 'deneme', 11, '2017-01-22 13:45:09', NULL, 1),
(11, 'deneme', 12, '2017-01-22 13:45:12', NULL, 1),
(12, 'deneme', 13, '2017-01-22 13:45:15', NULL, 1),
(13, 'deneme', 14, '2017-01-22 13:45:18', NULL, 1),
(14, 'qwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqew', 8, '2017-01-21 20:36:37', '2017-01-21 23:36:37', 1),
(15, 'qwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqew', 8, '2017-01-21 20:36:37', '2017-01-21 23:36:37', 1),
(16, 'qwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqew', 8, '2017-01-21 20:36:37', '2017-01-21 23:36:37', 1),
(17, 'qwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqew', 8, '2017-01-21 20:36:37', '2017-01-21 23:36:37', 1),
(18, 'qwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqew', 8, '2017-01-21 20:36:37', '2017-01-21 23:36:37', 1),
(19, 'qwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqew', 8, '2017-01-21 20:36:37', '2017-01-21 23:36:37', 1),
(20, 'qwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqew', 8, '2017-01-21 20:36:37', '2017-01-21 23:36:37', 1),
(21, 'qwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqew', 8, '2017-01-21 20:36:37', '2017-01-21 23:36:37', 1),
(22, 'qwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqewqwqew', 8, '2017-01-21 20:36:37', '2017-01-21 23:36:37', 1),
(23, 'adasd', 12, '2017-01-23 15:17:17', NULL, 1),
(24, 'denenemeeeeaa', 12, '2017-01-23 15:23:57', '2017-01-23 16:34:07', 1),
(25, 'nfjkasnfjka', 8, '2017-01-23 15:24:21', NULL, 1),
(26, 'kmflasmfa', 8, '2017-01-23 15:24:25', NULL, 1),
(27, 'lkmsfdlkasmd', 8, '2017-01-23 15:24:29', NULL, 1),
(28, 'mlksmgksd', 8, '2017-01-23 15:24:33', NULL, 1),
(29, 'porktet', 8, '2017-01-23 15:24:36', NULL, 1),
(30, 'asofoıasjfa', 8, '2017-01-23 15:24:40', NULL, 1),
(31, 'ıojgıojewr', 8, '2017-01-23 15:24:45', NULL, 1),
(32, 'kldsnfklsd', 8, '2017-01-23 15:24:49', NULL, 1),
(33, 'deneme', 8, '2017-01-23 15:53:23', NULL, 1),
(34, 'asdasd', 8, '2017-01-23 15:58:23', NULL, 1),
(35, 'dasda', 8, '2017-01-23 16:00:27', NULL, 1),
(36, 'asdasd\nadasbda', 12, '2017-01-23 16:35:45', NULL, 1),
(37, 'lorem ipsum', 15, '2017-01-23 20:09:13', NULL, 1),
(38, 'sndgsf', 16, '2017-01-23 20:10:02', NULL, 1),
(39, 'nams mnfabf', 17, '2017-01-23 20:11:30', NULL, 1),
(40, 'bnamfbnmsbdasd', 18, '2017-01-23 20:11:50', NULL, 1),
(41, 'njakndjkasnda', 19, '2017-01-23 20:12:34', NULL, 1),
(42, 'adasasd', 20, '2017-01-23 21:46:59', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fav`
--

CREATE TABLE IF NOT EXISTS `fav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `entryid` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `fav`
--

INSERT INTO `fav` (`id`, `userid`, `entryid`, `created_at`) VALUES
(3, 2, 2, '2017-01-21 22:39:21'),
(4, 2, 3, '2017-01-21 22:39:21'),
(6, 1, 3, '2017-01-21 22:39:21'),
(7, 3, 3, '2017-01-21 22:39:21'),
(14, 1, 14, '2017-01-23 13:52:58'),
(20, 1, 2, '2017-01-23 14:06:09'),
(21, 1, 23, '2017-01-23 19:01:24');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE IF NOT EXISTS `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(30) CHARACTER SET latin1 NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id`, `token`, `userid`) VALUES
(6, '14d0d679faa7ee8b06115d35227566', 1),
(7, '9ddcaa2bb3237e6b9085338e21ae93', 1),
(8, 'd70b506a5309b0c83fa192946d0444', 1),
(9, 'd8b330ec5870ac47b412681a063571', 3),
(10, 'dddf752520273e641f017ebbb1fd73', 1),
(11, 'fdbb23bee411b3bdd19d83c2eb88bf', 1),
(12, '36233ff11a024f036ce054b4555aef', 1),
(13, 'b226f5c629ea00eeb5a01947dda4e7', 1);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE IF NOT EXISTS `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`id`, `name`) VALUES
(1, 'deneme'),
(8, 'denemea'),
(9, 'LAST'),
(10, 'tuna'),
(11, 'tuna2'),
(12, 'tuna3'),
(13, 'tunaa'),
(14, 'tunaas'),
(15, 'asdq'),
(16, 'qwe'),
(17, 'knklm'),
(18, 'bhjb'),
(19, 'nafjkasnd'),
(20, 'zczxc');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `roleid` int(11) NOT NULL,
  `mail` varchar(75) COLLATE utf8_turkish_ci NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `roleid`, `mail`, `created_at`) VALUES
(1, 'tuna', '12345', 1, 'tuna.akgul@gmail.com', '2017-01-21'),
(2, 'hakan', '12345', 1, 'asd@asd.com', '2017-01-21'),
(3, 'ahmet', '12345', 1, 'ahmet@ahmet', '2017-01-23');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
