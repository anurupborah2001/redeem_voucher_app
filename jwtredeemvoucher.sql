-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2017 at 12:09 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jwtredeemvoucher`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE `authorities` (
  `username` varchar(256) NOT NULL,
  `authority` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) NOT NULL,
  `group_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group_name`) VALUES
(1, 'Admins');

-- --------------------------------------------------------

--
-- Table structure for table `group_authorities`
--

CREATE TABLE `group_authorities` (
  `group_id` bigint(20) NOT NULL,
  `authority` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_authorities`
--

INSERT INTO `group_authorities` (`group_id`, `authority`) VALUES
(1, 'ROLE_USER'),
(1, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `id` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `group_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_members`
--

INSERT INTO `group_members` (`id`, `username`, `group_id`) VALUES
(1, 'nuser', 1),
(2, 'auser', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(25);

-- --------------------------------------------------------

--
-- Table structure for table `jwt_deal`
--

CREATE TABLE `jwt_deal` (
  `jwt_deal_id` int(11) NOT NULL,
  `jwt_deal_code` varchar(50) NOT NULL,
  `jwt_deal_shop_id` bigint(20) NOT NULL,
  `jwt_deal_short_desc` varchar(500) DEFAULT NULL,
  `jwt_deal_long_desc` text,
  `jwt_deal_shop_location` varchar(50) DEFAULT NULL,
  `jwt_deal_quota` int(11) NOT NULL DEFAULT '0',
  `jwt_deal_long_logo` varchar(100) DEFAULT NULL,
  `jwt_deal_inserted_at` timestamp NULL DEFAULT NULL,
  `jwt_deal_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jwt_deal_is_active` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jwt_deal`
--

INSERT INTO `jwt_deal` (`jwt_deal_id`, `jwt_deal_code`, `jwt_deal_shop_id`, `jwt_deal_short_desc`, `jwt_deal_long_desc`, `jwt_deal_shop_location`, `jwt_deal_quota`, `jwt_deal_long_logo`, `jwt_deal_inserted_at`, `jwt_deal_updated_at`, `jwt_deal_is_active`) VALUES
(1, 'GWE8-JRTA-UVZ5-TCR6', 1, '$2 off for Tall-sized latte (hot or iced)', '$2 off for Tall-sized latte (hot or iced) full desc lorem ipsum', 'T1\n', 10, 'Starbucks.png', '2017-08-23 16:00:00', '2017-08-19 15:45:05', 1),
(2, '6AFQ-MJ57-BAYX-U5EU', 2, ' 20% off total bill\n', '20% off total bill full description lorem ipsum\n', 'T2|T3|T4\n', 10, 'Wolfgang_Puck.png\n', '2017-08-23 16:00:00', '2017-08-19 15:45:05', 1),
(3, 'A0RW-FWTK-2L5H-7D5U', 3, '10% off with $120 purchase on wines & spirits', '10% off with $120 purchase on wines & spirits full description lorem ipsum', 'T1|t2', 10, 'DFS.png\r\n', '2017-08-23 16:00:00', '2017-08-19 15:45:05', 1),
(4, 'RHX6-1Y7L-9XF0-8KFY', 4, '$10 off with $100 purchase', '$10 off with $100 purchase full description lorem ipsum', 'T1|T3', 10, 'Shilla_DF.png', '2017-08-23 16:00:00', '2017-08-19 15:45:05', 1),
(5, '68ET-Y391-R1JO-2PGX', 5, 'Free coffee with purchase of any sandwich', 'Free coffee with purchase of any sandwich full description lorem ipsum', 'T1|T2', 15, 'PretaManger.png\r\n', '2017-08-23 16:00:00', '2017-08-19 15:45:05', 1),
(6, 'LNE7-5CX7-5FWH-JC9V', 6, 'Free coffee with purchase of any cake', 'Free coffee with purchase of any cake full description lorem ipsum', 'T1|T2', 10, 'Hudsons.png', '2017-08-23 16:00:00', '2017-08-19 15:45:05', 1),
(7, '1MAS-SGJ3-VU8D-EBSK', 7, '10% off with regular-priced treats', '10% off with regular-priced treats full description lorem ipsum', 'T1', 10, 'So_Choco.png', NULL, '2017-08-19 15:45:05', 1),
(8, '6R7P-CCEC-7YOR-QAY5', 8, '15% off with regular-priced treats', '15% off with regular-priced treats full description lorem ipsum', 'T1|T2', 100, 'The_Chocolatier.png', '2017-08-23 16:00:00', '2017-08-19 15:45:05', 1),
(9, '875O-8NSO-42UA-LTJ7', 9, '10% off with regular-priced treats', '10% off with regular-priced treats full description lorem ipsum', 'T1|T2|T3', 100, 'Asia_Favourites.png', '2017-08-23 16:00:00', '2017-08-19 15:45:05', 1),
(10, 'RDID-93MA-EV5A-J7BC', 10, '10% off with regular-priced items', '10% off with regular-priced items full description lorem ipsum', 'T1|T2|T3', 100, 'Discover_Singapore.png', '2017-08-23 16:00:00', '2017-08-19 15:45:05', 1),
(11, 'QZNC-IPD9-ZN6D-W8TU', 11, '15% off total bill', '15% off total bill full description lorem ipsum', 'T1|T2|T3', 100, 'Tgm.png', '2017-08-24 16:00:00', '2017-08-19 15:45:05', 1),
(12, 'Z1CR-L84W-2DDU-2U9R', 12, '10% off total bill', '10% off total bill full description lorem ipsum', 'T1|T2', 100, 'Kaveri.png', '2017-08-23 16:00:00', '2017-08-19 15:45:05', 1),
(13, 'V0ZX-299E-WJZ7-K2PW', 13, '15% off total bill', '15% off total bill full description lorem ipsum', 'T1|T2|T4', 100, 'Spa_Express.png', '2017-08-23 16:00:00', '2017-08-19 15:45:05', 1),
(14, 'JS6J-0BD1-1K33-F04I', 14, '15% off all lounge services', '15% off all lounge services full description lorem ipsum', 'T1|T2|T4', 15, 'PPL_Lounge.png', '2017-08-23 16:00:00', '2017-08-19 15:45:05', 1),
(15, 'Y2CX-ZI7D-KOHM-3YW5', 15, '15% off 5-hour lounge use', '15% off 5-hour lounge use full description lorem ipsum', 'T1', 15, 'TransitAmbassador.png', '2017-08-23 16:00:00', '2017-08-19 15:45:05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jwt_role`
--

CREATE TABLE `jwt_role` (
  `role_id` int(11) NOT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jwt_role`
--

INSERT INTO `jwt_role` (`role_id`, `role`) VALUES
(1, 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `jwt_shop_list`
--

CREATE TABLE `jwt_shop_list` (
  `shop_id` bigint(20) NOT NULL,
  `shop_name` varchar(150) DEFAULT NULL,
  `shop_status` tinyint(4) NOT NULL DEFAULT '0',
  `shop_inserted_at` timestamp NULL DEFAULT NULL,
  `shop_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jwt_shop_list`
--

INSERT INTO `jwt_shop_list` (`shop_id`, `shop_name`, `shop_status`, `shop_inserted_at`, `shop_updated_at`) VALUES
(1, 'Starbucks', 1, '2017-08-01 16:00:00', '2017-08-18 07:22:32'),
(2, 'Wolfgang', 1, '2017-08-09 16:00:00', '2017-08-18 07:22:32'),
(3, 'DFS', 1, '2017-08-09 16:00:00', '2017-08-18 07:22:32'),
(4, 'Shilla_DF', 1, '2017-08-23 16:00:00', '2017-08-18 07:22:32'),
(5, 'Preta Manger', 1, '2017-08-23 16:00:00', '2017-08-18 07:22:32'),
(6, 'Hudsons', 1, '2017-08-23 16:00:00', '2017-08-18 07:22:32'),
(7, 'So Choco', 1, '2017-08-23 16:00:00', '2017-08-18 07:22:32'),
(8, 'The Chocolatier', 1, '2017-08-23 16:00:00', '2017-08-18 07:22:32'),
(9, 'Asia Favourites', 1, '2017-08-22 16:00:00', '2017-08-18 07:22:32'),
(10, 'Discover Singapore', 1, '2017-08-23 16:00:00', '2017-08-18 07:22:32'),
(11, 'Tgm', 1, '2017-08-23 16:00:00', '2017-08-18 07:23:58'),
(12, 'Kaveri', 1, '2017-08-23 16:00:00', '2017-08-18 07:23:58'),
(13, 'Spa Express', 1, '2017-08-23 16:00:00', '2017-08-18 07:23:58'),
(14, 'PPL Lounge', 1, '2017-08-23 16:00:00', '2017-08-18 07:23:58'),
(15, 'Transit Ambassador', 1, '2017-08-23 16:00:00', '2017-08-18 07:23:58');

-- --------------------------------------------------------

--
-- Table structure for table `jwt_user_deal`
--

CREATE TABLE `jwt_user_deal` (
  `id` bigint(20) NOT NULL,
  `deal_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jwt_user_deal`
--

INSERT INTO `jwt_user_deal` (`id`, `deal_id`, `user_id`) VALUES
(1, 12, 13),
(2, 6, 13),
(3, 10, 13),
(4, 13, 13),
(5, 5, 13),
(6, 7, 13),
(7, 2, 13),
(8, 14, 13),
(9, 3, 13),
(10, 1, 13),
(11, 8, 13),
(12, 9, 13),
(13, 15, 13),
(15, 11, 13),
(16, 4, 13);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `enabled`, `user_id`, `email`, `last_name`, `first_name`) VALUES
('auser', '$2a$10$gTVgR5aroJA1r0O2KQkAd.TXyOmj8s0TvNsrYj.PLoTD8fkcAc9Oe', 1, 1, 'auser@gmail.com', '', ''),
('longda', '$2a$10$8tyl/f8dfjVcq1nPrKBbB.u/hfbdCeI/.GW2PMLYbddXEUOWUdAxe', 1, 13, 'anurupborah2001@gmail.com', 'Borah', 'Anurup'),
('asheshmain', '$2a$10$h9FgVY/FrE2YSS63UAirZ.wqTMzoUziI4hchgwxeBbMSHOjF.Cyw.', 1, 14, 'asheshmain@gmail.com', 'Poghat', 'Ashesh'),
('babumoni', '$2a$10$RcB0xYRLvJpJmJDSsjofuuIEy2EXvBcvG0JG2ex99zR/9gyIebiIC', 1, 15, 'babumoni@gmail.com', 'Moni', 'Babu'),
('mainapoj', '$2a$10$S7r6f0Hq5WQZZHhzOf7T7.NnTZ1uu.PaIuX20Ou3nHiOu0MsRF0v.', 1, 24, 'Mainapoj@gmail.com', 'pooja', 'maina');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(13, 1),
(14, 1),
(15, 1),
(24, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authorities`
--
ALTER TABLE `authorities`
  ADD UNIQUE KEY `ix_auth_username` (`username`,`authority`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_authorities`
--
ALTER TABLE `group_authorities`
  ADD KEY `fk_group_authorities_group` (`group_id`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_group_members_group` (`group_id`);

--
-- Indexes for table `jwt_deal`
--
ALTER TABLE `jwt_deal`
  ADD PRIMARY KEY (`jwt_deal_id`);

--
-- Indexes for table `jwt_role`
--
ALTER TABLE `jwt_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `jwt_shop_list`
--
ALTER TABLE `jwt_shop_list`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `jwt_user_deal`
--
ALTER TABLE `jwt_user_deal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrv37e3ehtk7rors9faksfceyy` (`deal_id`),
  ADD KEY `FKommij1u4w6py2e3mitoagfln7` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jwt_deal`
--
ALTER TABLE `jwt_deal`
  MODIFY `jwt_deal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `jwt_role`
--
ALTER TABLE `jwt_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jwt_shop_list`
--
ALTER TABLE `jwt_shop_list`
  MODIFY `shop_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `jwt_user_deal`
--
ALTER TABLE `jwt_user_deal`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `group_authorities`
--
ALTER TABLE `group_authorities`
  ADD CONSTRAINT `fk_group_authorities_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);

--
-- Constraints for table `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `fk_group_members_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);

--
-- Constraints for table `jwt_user_deal`
--
ALTER TABLE `jwt_user_deal`
  ADD CONSTRAINT `FKommij1u4w6py2e3mitoagfln7` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `FKrv37e3ehtk7rors9faksfceyy` FOREIGN KEY (`deal_id`) REFERENCES `jwt_deal` (`jwt_deal_id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  ADD CONSTRAINT `FKj345gk1bovqvfame88rcx7yyx` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
