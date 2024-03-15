-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2024 at 10:59 AM
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
-- Database: `college`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `4mh21cs002`
-- (See below for the actual view)
--
CREATE TABLE `4mh21cs002` (
`subcode` char(7)
,`test1` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `usn` char(10) NOT NULL,
  `ssid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`usn`, `ssid`) VALUES
('4MH21CS001', 101),
('4MH21CS023', 102),
('4MH21CS035', 103);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `subcode` char(7) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `sem` int(11) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`subcode`, `title`, `sem`, `credits`) VALUES
('18CS51', 'ATC', 5, 5),
('18CS52', 'CNS', 5, 3),
('18CS53', 'DBMS', 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `iamarks`
--

CREATE TABLE `iamarks` (
  `usn` char(10) NOT NULL,
  `subcode` char(7) NOT NULL,
  `ssid` int(11) NOT NULL,
  `test1` int(11) NOT NULL,
  `test2` int(11) NOT NULL,
  `test3` int(11) NOT NULL,
  `finalia` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `iamarks`
--

INSERT INTO `iamarks` (`usn`, `subcode`, `ssid`, `test1`, `test2`, `test3`, `finalia`) VALUES
('4MH21CS001', '18CS53', 101, 21, 5, 17, 19),
('4MH21CS023', '18CS52', 102, 23, 5, 15, 19),
('4MH21CS035', '18CS51', 103, 25, 5, 16, 20.5);

-- --------------------------------------------------------

--
-- Table structure for table `semsec`
--

CREATE TABLE `semsec` (
  `ssid` int(11) NOT NULL,
  `sem` int(11) NOT NULL,
  `sec` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semsec`
--

INSERT INTO `semsec` (`ssid`, `sem`, `sec`) VALUES
(101, 5, 'A'),
(102, 5, 'B'),
(103, 5, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `usn` char(10) NOT NULL,
  `sname` varchar(25) NOT NULL,
  `address` varchar(30) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `gender` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`usn`, `sname`, `address`, `phone`, `gender`) VALUES
('4MH21CS001', 'Anu', 'Mysore', '97673', 'G'),
('4MH21CS023', 'Hemanth', 'Mysore', '934673', 'M'),
('4MH21CS035', 'Harish', 'Mysore', '9325673', 'M');

-- --------------------------------------------------------

--
-- Structure for view `4mh21cs002`
--
DROP TABLE IF EXISTS `4mh21cs002`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `4mh21cs002`  AS SELECT `iamarks`.`subcode` AS `subcode`, `iamarks`.`test1` AS `test1` FROM `iamarks` WHERE `iamarks`.`usn` = '4MH21CS002' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`usn`),
  ADD KEY `ssid` (`ssid`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`subcode`);

--
-- Indexes for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD PRIMARY KEY (`usn`,`subcode`,`ssid`),
  ADD KEY `subcode` (`subcode`),
  ADD KEY `ssid` (`ssid`);

--
-- Indexes for table `semsec`
--
ALTER TABLE `semsec`
  ADD PRIMARY KEY (`ssid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`usn`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`),
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`ssid`) REFERENCES `semsec` (`ssid`);

--
-- Constraints for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD CONSTRAINT `iamarks_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`),
  ADD CONSTRAINT `iamarks_ibfk_2` FOREIGN KEY (`subcode`) REFERENCES `course` (`subcode`),
  ADD CONSTRAINT `iamarks_ibfk_3` FOREIGN KEY (`ssid`) REFERENCES `semsec` (`ssid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
