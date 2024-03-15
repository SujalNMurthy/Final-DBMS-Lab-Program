-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 11:12 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `title` varchar(40) DEFAULT NULL,
  `publisher_name` varchar(20) DEFAULT NULL,
  `pub_year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `title`, `publisher_name`, `pub_year`) VALUES
(101, 'Database System', 'Pearson', '2021'),
(102, 'Operating System', 'Yashu', '2021'),
(103, 'Maths', 'Teju', '2022'),
(104, 'Maths1', 'Varun', '2022');

-- --------------------------------------------------------

--
-- Stand-in structure for view `books_avail`
-- (See below for the actual view)
--
CREATE TABLE `books_avail` (
`book_id` int(11)
,`title` varchar(40)
,`no_of_copies` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `book_authors`
--

CREATE TABLE `book_authors` (
  `book_id` int(11) NOT NULL,
  `author_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_authors`
--

INSERT INTO `book_authors` (`book_id`, `author_name`) VALUES
(101, 'Donland'),
(102, 'Padma'),
(103, 'Seema'),
(104, 'Nataraj');

-- --------------------------------------------------------

--
-- Table structure for table `book_copies`
--

CREATE TABLE `book_copies` (
  `book_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `no_of_copies` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_copies`
--

INSERT INTO `book_copies` (`book_id`, `program_id`, `no_of_copies`) VALUES
(101, 4001, 15),
(102, 4002, 25),
(103, 4003, 22),
(104, 4004, 28);

-- --------------------------------------------------------

--
-- Table structure for table `book_lending`
--

CREATE TABLE `book_lending` (
  `book_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `card_no` int(11) NOT NULL,
  `date_out` date DEFAULT NULL,
  `due_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_lending`
--

INSERT INTO `book_lending` (`book_id`, `program_id`, `card_no`, `date_out`, `due_date`) VALUES
(101, 4001, 901, '2021-11-15', '2021-11-30'),
(102, 4002, 902, '2021-11-15', '2021-11-30'),
(103, 4003, 903, '2022-07-15', '2022-07-30'),
(104, 4004, 904, '2022-07-15', '2022-07-30');

-- --------------------------------------------------------

--
-- Table structure for table `library_program`
--

CREATE TABLE `library_program` (
  `program_id` int(11) NOT NULL,
  `program_name` varchar(20) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library_program`
--

INSERT INTO `library_program` (`program_id`, `program_name`, `address`) VALUES
(4001, 'Computers', 'Mysore'),
(4002, 'Computers1', 'Mandya'),
(4003, 'Maths', 'Hassan'),
(4004, 'Physics', 'Ooty'),
(4005, 'Maths', 'Mysore');

-- --------------------------------------------------------

--
-- Stand-in structure for view `p1`
-- (See below for the actual view)
--
CREATE TABLE `p1` (
`book_id` int(11)
,`title` varchar(40)
,`publisher_name` varchar(20)
,`pub_year` year(4)
);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `name` varchar(20) NOT NULL,
  `address` varchar(40) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`name`, `address`, `phone`) VALUES
('Pearson', 'Mysore', 87654),
('Tarun', 'Mysore', 67567),
('Teju', 'Hassan', 23478),
('Varun', 'Ooty', 76737),
('Yashu', 'Mandya', 56364);

-- --------------------------------------------------------

--
-- Structure for view `books_avail`
--
DROP TABLE IF EXISTS `books_avail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `books_avail`  AS SELECT `b`.`book_id` AS `book_id`, `b`.`title` AS `title`, `c`.`no_of_copies` AS `no_of_copies` FROM (`book` `b` join `book_copies` `c`) WHERE `b`.`book_id` = `c`.`book_id` ;

-- --------------------------------------------------------

--
-- Structure for view `p1`
--
DROP TABLE IF EXISTS `p1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `p1`  AS SELECT `book`.`book_id` AS `book_id`, `book`.`title` AS `title`, `book`.`publisher_name` AS `publisher_name`, `book`.`pub_year` AS `pub_year` FROM `book` WHERE `book`.`pub_year` between '1995' and '2000' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `publisher_name` (`publisher_name`);

--
-- Indexes for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `book_copies`
--
ALTER TABLE `book_copies`
  ADD PRIMARY KEY (`book_id`,`program_id`),
  ADD KEY `program_id` (`program_id`);

--
-- Indexes for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD PRIMARY KEY (`book_id`,`program_id`,`card_no`),
  ADD KEY `program_id` (`program_id`);

--
-- Indexes for table `library_program`
--
ALTER TABLE `library_program`
  ADD PRIMARY KEY (`program_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publisher_name`) REFERENCES `publisher` (`name`);

--
-- Constraints for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE;

--
-- Constraints for table `book_copies`
--
ALTER TABLE `book_copies`
  ADD CONSTRAINT `book_copies_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_copies_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `library_program` (`program_id`) ON DELETE CASCADE;

--
-- Constraints for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD CONSTRAINT `book_lending_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_lending_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `library_program` (`program_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
