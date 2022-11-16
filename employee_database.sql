-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2022 at 02:00 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee database`
--
CREATE DATABASE IF NOT EXISTS `employee database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `employee database`;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `dept_id` varchar(10) NOT NULL,
  `dept_name` varchar(40) NOT NULL,
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dept_id`, `dept_name`) VALUES
('AD10', 'Administration'),
('EX90', 'Executive'),
('FI100', 'Finance'),
('HR40', 'Human Resources'),
('IT60', 'IT'),
('MA20', 'Marketing'),
('PR70', 'Public Relations'),
('PU', 'Purchasing'),
('SS80', 'Sales'),
('SHP50', 'Shipping');

-- --------------------------------------------------------

--
-- Table structure for table `dept_emp`
--

DROP TABLE IF EXISTS `dept_emp`;
CREATE TABLE IF NOT EXISTS `dept_emp` (
  `emp_id` varchar(12) NOT NULL,
  `dept_id` varchar(10) NOT NULL,
  `datefrom` date NOT NULL,
  `dateto` date NOT NULL,
  PRIMARY KEY (`emp_id`,`dept_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dept_emp`
--

INSERT INTO `dept_emp` (`emp_id`, `dept_id`, `datefrom`, `dateto`) VALUES
('RF107', 'HR40', '2002-11-05', '0000-00-00'),
('SA106', 'IT60', '2015-11-11', '0000-00-00'),
('SC101', 'SS80', '2020-08-11', '0000-00-00'),
('SC104', 'FI100', '2019-11-20', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `dept_supervisor`
--

DROP TABLE IF EXISTS `dept_supervisor`;
CREATE TABLE IF NOT EXISTS `dept_supervisor` (
  `emp_id` varchar(12) NOT NULL,
  `dept_id` varchar(10) NOT NULL,
  `datefrom` date NOT NULL,
  `dateto` date NOT NULL,
  PRIMARY KEY (`emp_id`,`dept_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dept_supervisor`
--

INSERT INTO `dept_supervisor` (`emp_id`, `dept_id`, `datefrom`, `dateto`) VALUES
('SA106', 'HR40', '2020-11-11', '0000-00-00'),
('SB102', 'PR70', '2018-11-01', '0000-00-00'),
('SC100', 'MA20', '2020-09-15', '0000-00-00'),
('SC104', 'SHP50', '2018-08-07', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `emp_id` varchar(12) NOT NULL,
  `DOB` date NOT NULL,
  `f_name` varchar(16) NOT NULL,
  `l_name` varchar(16) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `dateOfhire` date NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `DOB`, `f_name`, `l_name`, `gender`, `dateOfhire`) VALUES
('RF107', '1981-11-02', 'Diana', 'Lorentz', 'F', '2010-06-25'),
('RV105', '1985-11-06', 'David', 'Austin', 'M', '2012-11-07'),
('SA106', '1990-09-04', 'Valli', 'Pataballa', 'F', '2015-08-12'),
('SB102', '1993-09-14', 'Lex', 'De Haan', 'M', '2019-08-13'),
('SC100', '1994-07-12', 'Steven', 'King', 'M', '2017-08-15'),
('SC101', '1994-05-26', 'Neena', 'Kochhar', 'M', '2017-08-09'),
('SC104', '1994-11-08', 'Bruce', 'Ernst', 'M', '2020-09-08'),
('SC108', '1994-11-03', 'Nancy', 'Greenberg', 'F', '2017-08-08'),
('SE103', '1997-08-13', 'Alexander', 'Hunold', 'M', '2017-09-20');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE IF NOT EXISTS `position` (
  `emp_id` varchar(12) NOT NULL,
  `position` varchar(50) NOT NULL,
  `datefrom` date NOT NULL,
  `dateto` date DEFAULT NULL,
  PRIMARY KEY (`emp_id`,`datefrom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`emp_id`, `position`, `datefrom`, `dateto`) VALUES
('RF107', 'Employee', '2010-06-25', NULL),
('SB102', 'Employee', '2019-08-13', NULL),
('SC100', 'Employee', '2017-08-15', NULL),
('SC104', 'Employee', '2022-08-09', NULL),
('SC108', 'Manager', '2022-08-08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wages`
--

DROP TABLE IF EXISTS `wages`;
CREATE TABLE IF NOT EXISTS `wages` (
  `emp_id` varchar(12) NOT NULL,
  `wage` float NOT NULL,
  `datefrom` date NOT NULL,
  `dateto` date NOT NULL,
  PRIMARY KEY (`emp_id`,`datefrom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wages`
--

INSERT INTO `wages` (`emp_id`, `wage`, `datefrom`, `dateto`) VALUES
('RF107', 60000, '2010-06-25', '0000-00-00'),
('SB102', 43000, '2019-08-13', '0000-00-00'),
('SC100', 50000, '2017-08-15', '0000-00-00'),
('SC108', 45000, '2017-08-08', '0000-00-00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dept_emp`
--
ALTER TABLE `dept_emp`
  ADD CONSTRAINT `dept_emp_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dept_emp_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON DELETE CASCADE;

--
-- Constraints for table `dept_supervisor`
--
ALTER TABLE `dept_supervisor`
  ADD CONSTRAINT `dept_supervisor_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dept_supervisor_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON DELETE CASCADE;

--
-- Constraints for table `position`
--
ALTER TABLE `position`
  ADD CONSTRAINT `position_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE CASCADE;

--
-- Constraints for table `wages`
--
ALTER TABLE `wages`
  ADD CONSTRAINT `wages_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
