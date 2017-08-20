-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2017 at 07:55 PM
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
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `APPOINTMENT_ID` bigint(20) NOT NULL,
  `APPOINTMENT_DT` date DEFAULT NULL,
  `MAKE` varchar(255) DEFAULT NULL,
  `MODEL` varchar(255) DEFAULT NULL,
  `YEAR` smallint(6) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `USER_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `auto_user`
--

CREATE TABLE `auto_user` (
  `autoUserId` bigint(20) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) NOT NULL,
  `group_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_authorities`
--

CREATE TABLE `group_authorities` (
  `group_id` bigint(20) NOT NULL,
  `authority` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `id` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `group_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jwt_deal`
--

CREATE TABLE `jwt_deal` (
  `jwt_deal_id` bigint(20) NOT NULL,
  `jwt_deal_code` varchar(50) NOT NULL,
  `jwt_deal_shop_id` bigint(20) NOT NULL,
  `jwt_deal_short_desc` varchar(500) DEFAULT NULL,
  `jwt_deal_long_desc` text,
  `jwt_deal_inserted_at` timestamp NULL DEFAULT NULL,
  `jwt_deal_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jwt_deal_assign`
--

CREATE TABLE `jwt_deal_assign` (
  `jwt_deal_assign_id` bigint(20) NOT NULL,
  `jwt_deal_assign_user_id` bigint(20) NOT NULL,
  `jwt_deal_assign_deal_id` bigint(20) NOT NULL,
  `jwt_deal_assign_deal_is_used` tinyint(4) NOT NULL DEFAULT '0',
  `jwt_deal_assign_deal_inserted_at` timestamp NULL DEFAULT NULL,
  `jwt_deal_assign_deal_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `jwt_user`
--

CREATE TABLE `jwt_user` (
  `user_id` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jwt_user_role`
--

CREATE TABLE `jwt_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `APPOINTMENT_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`APPOINTMENT_ID`),
  ADD KEY `FKldto5noeqrgdb5i4hovvyhou9` (`USER_ID`);

--
-- Indexes for table `authorities`
--
ALTER TABLE `authorities`
  ADD UNIQUE KEY `ix_auth_username` (`username`,`authority`);

--
-- Indexes for table `auto_user`
--
ALTER TABLE `auto_user`
  ADD PRIMARY KEY (`autoUserId`);

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
-- Indexes for table `jwt_deal_assign`
--
ALTER TABLE `jwt_deal_assign`
  ADD PRIMARY KEY (`jwt_deal_assign_id`);

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
-- Indexes for table `jwt_user`
--
ALTER TABLE `jwt_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `jwt_user_role`
--
ALTER TABLE `jwt_user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD KEY `FK51jhbdyw6cfs66d7amss3g3nt` (`APPOINTMENT_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKpluedfk9gqlvg8p27os1tqfde` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `APPOINTMENT_ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auto_user`
--
ALTER TABLE `auto_user`
  MODIFY `autoUserId` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jwt_deal`
--
ALTER TABLE `jwt_deal`
  MODIFY `jwt_deal_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jwt_deal_assign`
--
ALTER TABLE `jwt_deal_assign`
  MODIFY `jwt_deal_assign_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jwt_role`
--
ALTER TABLE `jwt_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jwt_shop_list`
--
ALTER TABLE `jwt_shop_list`
  MODIFY `shop_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jwt_user`
--
ALTER TABLE `jwt_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `FKldto5noeqrgdb5i4hovvyhou9` FOREIGN KEY (`USER_ID`) REFERENCES `auto_user` (`autoUserId`);

--
-- Constraints for table `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

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
-- Constraints for table `jwt_user_role`
--
ALTER TABLE `jwt_user_role`
  ADD CONSTRAINT `role_fk_id` FOREIGN KEY (`role_id`) REFERENCES `jwt_role` (`role_id`),
  ADD CONSTRAINT `user_fk_id` FOREIGN KEY (`user_id`) REFERENCES `jwt_user` (`user_id`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `FK51jhbdyw6cfs66d7amss3g3nt` FOREIGN KEY (`APPOINTMENT_ID`) REFERENCES `appointment` (`APPOINTMENT_ID`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FKda3v4h72ai8jegxy3v21gtdjb` FOREIGN KEY (`user_id`) REFERENCES `jwt_user` (`user_id`),
  ADD CONSTRAINT `FKpluedfk9gqlvg8p27os1tqfde` FOREIGN KEY (`role_id`) REFERENCES `jwt_role` (`role_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
