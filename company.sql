-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2024 at 05:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dno` int(11) NOT NULL,
  `dname` varchar(20) DEFAULT NULL,
  `mgrssn` int(11) DEFAULT NULL,
  `mgrstartdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dno`, `dname`, `mgrssn`, `mgrstartdate`) VALUES
(501, 'Accounts', 101, '0000-00-00'),
(502, 'Lateral', 102, '0000-00-00'),
(503, 'Scholarship', 103, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `dlocation`
--

CREATE TABLE `dlocation` (
  `dno` int(11) NOT NULL,
  `dloc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dlocation`
--

INSERT INTO `dlocation` (`dno`, `dloc`) VALUES
(501, 'Accounts'),
(501, 'Mysore'),
(502, 'Lateral'),
(503, 'Scholarship');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ssn` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `address` varchar(30) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `superssn` int(11) DEFAULT NULL,
  `dno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ssn`, `fname`, `lname`, `address`, `gender`, `salary`, `superssn`, `dno`) VALUES
(101, 'Jhon', 'Scott', 'Mysore', 'M', 5000, 102, 501),
(102, 'Kiran', 'Raj', 'Mandya', 'M', 8000, 103, 502),
(103, 'Suresh', 'Kumar', 'Hassan', 'M', 6000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `pno` int(11) NOT NULL,
  `pname` varchar(20) DEFAULT NULL,
  `plocation` varchar(20) DEFAULT NULL,
  `dno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`pno`, `pname`, `plocation`, `dno`) VALUES
(1001, 'IOT', 'Mysore', 501),
(1002, 'BS', 'Mandya', 502),
(1003, 'CSE', 'Hassan', 503);

-- --------------------------------------------------------

--
-- Table structure for table `works_on`
--

CREATE TABLE `works_on` (
  `ssn` int(11) NOT NULL,
  `pno` int(11) NOT NULL,
  `hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `works_on`
--

INSERT INTO `works_on` (`ssn`, `pno`, `hours`) VALUES
(101, 1001, 40),
(102, 1002, 50),
(103, 1003, 80);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dno`),
  ADD KEY `mgrssn` (`mgrssn`);

--
-- Indexes for table `dlocation`
--
ALTER TABLE `dlocation`
  ADD PRIMARY KEY (`dno`,`dloc`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ssn`),
  ADD KEY `superssn` (`superssn`),
  ADD KEY `dno` (`dno`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`pno`),
  ADD KEY `dno` (`dno`);

--
-- Indexes for table `works_on`
--
ALTER TABLE `works_on`
  ADD PRIMARY KEY (`ssn`,`pno`),
  ADD KEY `pno` (`pno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`mgrssn`) REFERENCES `employee` (`ssn`);

--
-- Constraints for table `dlocation`
--
ALTER TABLE `dlocation`
  ADD CONSTRAINT `dlocation_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`superssn`) REFERENCES `employee` (`ssn`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`);

--
-- Constraints for table `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `employee` (`ssn`),
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`pno`) REFERENCES `project` (`pno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
