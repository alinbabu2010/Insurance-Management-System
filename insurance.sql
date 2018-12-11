-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2017 at 02:31 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insurance`
--
CREATE DATABASE IF NOT EXISTS `insurance` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `insurance`;

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent` (
  `agentkey` varchar(50) NOT NULL,
  `aname` varchar(50) NOT NULL,
  `address` longtext NOT NULL,
  `phone` bigint(11) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `claimant`
--

DROP TABLE IF EXISTS `claimant`;
CREATE TABLE `claimant` (
  `policykey` varchar(50) NOT NULL,
  `phkey` varchar(50) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `address` longtext NOT NULL,
  `dob` date NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `phone` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `agentkey` varchar(50) NOT NULL,
  `policykey` varchar(50) NOT NULL,
  `phkey` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insuredby`
--

DROP TABLE IF EXISTS `insuredby`;
CREATE TABLE `insuredby` (
  `policykey` varchar(50) NOT NULL,
  `phkey` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insuredtype`
--

DROP TABLE IF EXISTS `insuredtype`;
CREATE TABLE `insuredtype` (
  `policykey` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `premium` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
CREATE TABLE `policy` (
  `policykey` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `timeperiod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `policyholder`
--

DROP TABLE IF EXISTS `policyholder`;
CREATE TABLE `policyholder` (
  `phkey` varchar(50) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `address` longtext NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `phone` bigint(11) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `agentkey` varchar(50) NOT NULL,
  `policykey` varchar(50) NOT NULL,
  `commission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`agentkey`);

--
-- Indexes for table `claimant`
--
ALTER TABLE `claimant`
  ADD PRIMARY KEY (`policykey`,`phkey`),
  ADD KEY `phkey` (`phkey`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`agentkey`,`policykey`,`phkey`);

--
-- Indexes for table `insuredby`
--
ALTER TABLE `insuredby`
  ADD PRIMARY KEY (`policykey`,`phkey`),
  ADD KEY `phkey` (`phkey`);

--
-- Indexes for table `insuredtype`
--
ALTER TABLE `insuredtype`
  ADD PRIMARY KEY (`policykey`);

--
-- Indexes for table `policy`
--
ALTER TABLE `policy`
  ADD PRIMARY KEY (`policykey`);

--
-- Indexes for table `policyholder`
--
ALTER TABLE `policyholder`
  ADD PRIMARY KEY (`phkey`) USING BTREE;

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`agentkey`,`policykey`) USING BTREE,
  ADD KEY `policykey` (`policykey`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `claimant`
--
ALTER TABLE `claimant`
  ADD CONSTRAINT `claimant_ibfk_1` FOREIGN KEY (`phkey`) REFERENCES `policyholder` (`phkey`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `claimant_ibfk_2` FOREIGN KEY (`policykey`) REFERENCES `policy` (`policykey`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `insuredby`
--
ALTER TABLE `insuredby`
  ADD CONSTRAINT `insuredby_ibfk_3` FOREIGN KEY (`policykey`) REFERENCES `policy` (`policykey`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `insuredby_ibfk_4` FOREIGN KEY (`phkey`) REFERENCES `policyholder` (`phkey`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`policykey`) REFERENCES `policy` (`policykey`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`agentkey`) REFERENCES `agent` (`agentkey`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
