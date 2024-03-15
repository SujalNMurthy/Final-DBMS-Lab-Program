-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2024 at 07:08 PM
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
-- Database: `movie`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `act_id` int(11) NOT NULL,
  `act_name` varchar(25) NOT NULL,
  `act_gender` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`act_id`, `act_name`, `act_gender`) VALUES
(510, 'Yash', 'M'),
(511, 'Puneeth', 'M'),
(512, 'Shivanna', 'M'),
(513, 'Sudeep', 'M'),
(514, 'Vijay', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `dir_id` int(11) NOT NULL,
  `dir_name` varchar(25) NOT NULL,
  `dir_phone` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`dir_id`, `dir_name`, `dir_phone`) VALUES
(101, 'Neel', '9000021'),
(102, 'Santhosh', '93450021'),
(103, 'Tarun', '93674321'),
(104, 'Varun', '931244321'),
(105, 'Rajamouli', '931454321');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `mov_id` int(11) NOT NULL,
  `mov_title` varchar(50) NOT NULL,
  `mov_year` year(4) NOT NULL,
  `mov_lang` varchar(15) NOT NULL,
  `dir_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`mov_id`, `mov_title`, `mov_year`, `mov_lang`, `dir_id`) VALUES
(1008, 'KGF', '2018', 'Kannada', 101),
(1009, 'Rajakumara', '2019', 'Kannadaa', 102),
(1010, 'Ghost', '2023', 'Hindi', 103),
(1011, 'Villain', '2021', 'Tamil', 104),
(1012, 'Dboss', '2017', 'Telugu', 105);

-- --------------------------------------------------------

--
-- Table structure for table `movie_cast`
--

CREATE TABLE `movie_cast` (
  `act_id` int(11) NOT NULL,
  `mov_id` int(11) NOT NULL,
  `role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie_cast`
--

INSERT INTO `movie_cast` (`act_id`, `mov_id`, `role`) VALUES
(510, 1008, 'Hero'),
(511, 1009, 'Hero'),
(512, 1010, 'Hero'),
(513, 1011, 'Hero'),
(514, 1012, 'Hero');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `mov_id` int(11) DEFAULT NULL,
  `rev_star` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`mov_id`, `rev_star`) VALUES
(1008, 5),
(1009, 5),
(1010, 4),
(1011, 5),
(1012, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`act_id`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`dir_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`mov_id`),
  ADD KEY `dir_id` (`dir_id`);

--
-- Indexes for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD PRIMARY KEY (`act_id`,`mov_id`),
  ADD KEY `mov_id` (`mov_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD KEY `mov_id` (`mov_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`dir_id`) REFERENCES `director` (`dir_id`);

--
-- Constraints for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`act_id`) REFERENCES `actor` (`act_id`),
  ADD CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`mov_id`) REFERENCES `movies` (`mov_id`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`mov_id`) REFERENCES `movies` (`mov_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
