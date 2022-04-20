-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2022 at 10:37 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `firedetection`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `l_id` int(11) NOT NULL,
  `u_id` varchar(50) NOT NULL,
  `u_pwd` varchar(100) NOT NULL,
  `role` char(10) NOT NULL,
  `status` char(3) NOT NULL,
  `o_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`l_id`, `u_id`, `u_pwd`, `role`, `status`, `o_id`) VALUES
(4, 'firedetect1234@gmail.com', 'admin', 'admin', 'A', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orginfo`
--

CREATE TABLE `tbl_orginfo` (
  `i_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  `o_email` varchar(255) NOT NULL,
  `relation` varchar(50) NOT NULL,
  `contact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_orginfo`
--

INSERT INTO `tbl_orginfo` (`i_id`, `o_id`, `o_email`, `relation`, `contact`) VALUES
(16, 2, 'yashspatel98@gmail.com', 'Security Associate', 1111111111),
(19, 2, 'akashpatel8787@gmail.com', 'Security Associate', 1234567890),
(20, 2, 'marcos.bittencourt@dcmail.ca', 'Professor', 1234567890),
(21, 2, 'marcosalexandrebj@gmail.com', 'Professor', 1111111111);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orgmst`
--

CREATE TABLE `tbl_orgmst` (
  `o_id` int(11) NOT NULL,
  `o_name` varchar(100) NOT NULL,
  `o_address` varchar(200) NOT NULL,
  `o_pincode` varchar(11) NOT NULL,
  `o_contact` int(11) NOT NULL,
  `status` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_orgmst`
--

INSERT INTO `tbl_orgmst` (`o_id`, `o_name`, `o_address`, `o_pincode`, `o_contact`, `status`) VALUES
(1, 'School', 'Northen Dancer', 'L1L0J8', 2147483647, 'A'),
(2, 'FireDetection', 'Symingtom Avenue', 'L1L 0J8', 2147483647, 'A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`l_id`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `tbl_orginfo`
--
ALTER TABLE `tbl_orginfo`
  ADD PRIMARY KEY (`i_id`);

--
-- Indexes for table `tbl_orgmst`
--
ALTER TABLE `tbl_orgmst`
  ADD PRIMARY KEY (`o_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_orginfo`
--
ALTER TABLE `tbl_orginfo`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_orgmst`
--
ALTER TABLE `tbl_orgmst`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD CONSTRAINT `o_id` FOREIGN KEY (`o_id`) REFERENCES `tbl_orgmst` (`o_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
