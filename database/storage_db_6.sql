-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2024 at 06:08 AM
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
-- Database: `storage_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `agencies`
--

CREATE TABLE `agencies` (
  `Id` int(11) NOT NULL,
  `AgencyName` varchar(1000) NOT NULL,
  `Address` text NOT NULL,
  `Location` varchar(1000) NOT NULL,
  `Contact` varchar(100) NOT NULL,
  `Agreement` text NOT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'ACTIVE',
  `DateCreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agencies`
--

INSERT INTO `agencies` (`Id`, `AgencyName`, `Address`, `Location`, `Contact`, `Agreement`, `Status`, `DateCreated`) VALUES
(1, 'Makindye Property Consultants', 'Makindye military barracks', 'Makindye Division', '0779226226', 'uploads/tenancy_agreements/1705578180_Screenshot 2024-01-16 095835.png', 'Active', '2024-01-18 12:35:23'),
(4, 'Test Agency', 'Lumumba avenue', 'Kampala', '0779226226', 'uploads/tenancy_agreements/1706013780_01222024101620_log.xlsx', 'Active', '2024-01-23 15:43:06'),
(5, 'Eclipse Properties Limited', 'Kampala', 'Lumumba Avenue', '0705895816', 'uploads/tenancy_agreements/1706513880_ACTION POINTS FOR THE STAFF MEETING HELD ON THE 22ND JANUARY 2024.docx', 'Terminated', '2024-01-29 10:37:48');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `ComplaintId` int(11) NOT NULL,
  `Unit_id` int(11) NOT NULL,
  `Priority` varchar(10) NOT NULL,
  `Subject` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL DEFAULT 'UNRESOLVED',
  `compdet` text NOT NULL,
  `ComplaintDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ResolutionTime` datetime NOT NULL,
  `Resolution` text NOT NULL,
  `ResolvedBy` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`ComplaintId`, `Unit_id`, `Priority`, `Subject`, `Status`, `compdet`, `ComplaintDate`, `ResolutionTime`, `Resolution`, `ResolvedBy`) VALUES
(2, 1, 'High', 'FAULTY ELEVATOR', 'Resolved', 'Faulty Elevator', '2024-01-12 10:32:02', '0000-00-00 00:00:00', 'its resolved', '');

-- --------------------------------------------------------

--
-- Table structure for table `pettycash`
--

CREATE TABLE `pettycash` (
  `Id` int(11) NOT NULL,
  `DateOfExpenditure` date NOT NULL,
  `DetailsOfExpenditure` text NOT NULL,
  `Amount` bigint(20) NOT NULL,
  `Balance` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price_list`
--

CREATE TABLE `price_list` (
  `unit_id` int(30) NOT NULL,
  `monthly` float NOT NULL,
  `quarterly` float NOT NULL,
  `annually` float NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `price_list`
--

INSERT INTO `price_list` (`unit_id`, `monthly`, `quarterly`, `annually`, `date_updated`) VALUES
(6, 450000, 1800000, 5400000, '2024-01-25 10:15:35'),
(7, 450000, 1800000, 5400000, '2024-01-25 10:25:07'),
(8, 450000, 1800000, 5400000, '2024-01-25 10:27:05'),
(9, 450000, 1800000, 5400000, '2024-01-25 10:33:55'),
(10, 450000, 1800000, 5400000, '2024-01-25 10:34:07'),
(11, 450000, 1800000, 5400000, '2024-01-25 10:34:20'),
(12, 450000, 1800000, 5400000, '2024-01-25 10:34:41'),
(13, 450000, 1800000, 5400000, '2024-01-25 10:34:54'),
(14, 450000, 1800000, 5400000, '2024-01-25 10:35:06'),
(15, 450000, 1800000, 5400000, '2024-01-25 10:35:22'),
(16, 300000, 1200000, 3600000, '2024-01-25 11:08:39'),
(17, 250000, 1000000, 3000000, '2024-01-25 11:11:31'),
(18, 150000, 600000, 1800000, '2024-01-25 11:12:22'),
(19, 150000, 600000, 1800000, '2024-01-25 11:13:14'),
(20, 250000, 1000000, 3000000, '2024-01-25 11:17:07'),
(21, 350000, 1400000, 4200000, '2024-01-25 11:18:11'),
(22, 250000, 1000000, 3000000, '2024-01-25 11:20:21'),
(23, 250000, 1000000, 3000000, '2024-01-25 14:19:58'),
(24, 80000, 320000, 960000, '2024-01-25 14:20:58'),
(25, 130000, 520000, 1560000, '2024-01-25 14:21:52'),
(26, 150000, 600000, 1800000, '2024-01-25 14:22:35'),
(27, 150000, 600000, 1800000, '2024-01-25 14:23:10'),
(28, 130000, 520000, 1560000, '2024-01-25 14:24:00'),
(29, 230000, 920000, 2760000, '2024-01-25 14:40:08'),
(30, 100000, 400000, 1200000, '2024-01-25 14:40:41'),
(32, 150000, 600000, 1800000, '2024-01-25 14:41:34'),
(31, 150000, 600000, 1800000, '2024-01-25 14:43:28'),
(35, 700000, 2800000, 8400000, '2024-01-25 15:05:48'),
(36, 150000, 600000, 1800000, '2024-01-25 15:06:39'),
(37, 200000, 800000, 2400000, '2024-01-25 15:07:15'),
(38, 600000, 2400000, 7200000, '2024-01-25 15:08:22'),
(39, 200000, 800000, 2400000, '2024-01-25 15:09:03'),
(40, 200000, 800000, 2400000, '2024-01-25 15:09:34'),
(41, 200000, 800000, 2400000, '2024-01-25 15:09:58'),
(42, 200000, 800000, 2400000, '2024-01-25 15:10:40'),
(43, 150000, 600000, 1800000, '2024-01-25 15:12:12'),
(44, 700000, 2800000, 8400000, '2024-01-25 15:13:32'),
(33, 900000, 3600000, 10800000, '2024-01-25 15:14:43'),
(34, 700000, 2800000, 8400000, '2024-01-25 15:15:19'),
(45, 1100000, 4400000, 13200000, '2024-01-25 15:17:21'),
(49, 100000, 400000, 1200000, '2024-01-25 15:28:33');

-- --------------------------------------------------------

--
-- Table structure for table `rent_list`
--

CREATE TABLE `rent_list` (
  `id` int(30) NOT NULL,
  `unit_id` int(30) NOT NULL,
  `tenant_id` int(30) NOT NULL,
  `rent_type` tinyint(1) DEFAULT NULL COMMENT '1 = Monthly, 2 = Quarterly, 3 = Annually',
  `date_rented` date NOT NULL DEFAULT current_timestamp(),
  `date_end` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `billing_amount` float NOT NULL,
  `date_created` datetime DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rent_list`
--

INSERT INTO `rent_list` (`id`, `unit_id`, `tenant_id`, `rent_type`, `date_rented`, `date_end`, `status`, `billing_amount`, `date_created`, `date_updated`) VALUES
(1, 1, 1, 2, '2022-10-01', '2022-10-01', 1, 1400, '2021-09-07 14:20:40', '2024-01-23 15:58:36'),
(3, 2, 10, 1, '2024-03-23', '2024-03-23', 1, 500, '2024-01-23 15:54:51', '2024-01-23 15:58:02'),
(4, 6, 11, 1, '2023-12-22', '2024-01-22', 1, 450000, '2024-01-25 10:18:15', '2024-01-25 10:45:01'),
(5, 7, 12, 1, '2024-01-01', '2024-02-01', 1, 450000, '2024-01-25 10:25:41', NULL),
(6, 8, 13, 1, '2024-01-01', '2024-02-01', 1, 450000, '2024-01-25 10:28:45', NULL),
(7, 9, 14, 1, '2024-01-01', '2024-02-01', 1, 450000, '2024-01-25 10:44:13', NULL),
(8, 10, 15, 2, '2023-10-01', '2024-01-01', 1, 1800000, '2024-01-25 10:46:14', '2024-01-25 10:47:01'),
(9, 11, 16, 1, '2023-11-12', '2023-12-12', 1, 450000, '2024-01-25 10:48:17', NULL),
(10, 12, 17, 1, '2024-06-01', '2024-07-01', 1, 450000, '2024-01-25 10:53:36', '2024-01-25 10:54:48'),
(11, 13, 18, 1, '2024-01-01', '2024-02-01', 1, 450000, '2024-01-25 10:55:49', NULL),
(12, 14, 19, 1, '2024-01-01', '2024-02-01', 1, 450000, '2024-01-25 10:57:06', NULL),
(13, 15, 20, 1, '2023-12-03', '2024-01-03', 1, 450000, '2024-01-25 10:58:36', NULL),
(14, 16, 21, 1, '2024-03-01', '2024-04-01', 1, 300000, '2024-01-25 11:29:56', '2024-01-25 11:30:26'),
(15, 17, 22, 1, '2024-01-01', '2024-02-01', 1, 250000, '2024-01-25 11:31:45', NULL),
(16, 18, 23, 1, '2023-11-25', '2023-12-25', 1, 150000, '2024-01-25 11:33:16', NULL),
(17, 19, 24, 1, '2023-12-01', '2024-01-01', 1, 150000, '2024-01-25 11:34:17', NULL),
(18, 20, 25, 1, '2024-01-01', '2024-02-01', 1, 250000, '2024-01-25 11:35:01', NULL),
(19, 21, 26, 1, '2023-12-19', '2024-01-19', 1, 350000, '2024-01-25 11:35:44', NULL),
(20, 22, 27, 1, '2023-11-01', '2023-12-01', 1, 250000, '2024-01-25 11:38:01', NULL),
(21, 23, 28, 1, '2024-02-01', '2024-03-01', 1, 250000, '2024-01-25 14:31:28', NULL),
(22, 24, 29, 1, '2024-01-01', '2024-02-01', 1, 80000, '2024-01-25 14:32:09', NULL),
(23, 25, 30, 1, '2024-03-01', '2024-04-01', 1, 130000, '2024-01-25 14:33:39', NULL),
(24, 27, 31, 1, '2023-11-01', '2023-12-01', 1, 150000, '2024-01-25 14:34:43', NULL),
(25, 28, 32, 1, '2023-11-01', '2023-12-01', 1, 130000, '2024-01-25 14:35:14', NULL),
(26, 30, 33, 1, '2023-12-01', '2024-01-01', 1, 100000, '2024-01-25 14:47:59', NULL),
(27, 31, 34, 1, '2023-12-01', '2024-01-01', 1, 150000, '2024-01-25 14:48:34', NULL),
(28, 32, 35, 1, '2023-12-01', '2024-01-01', 1, 150000, '2024-01-25 14:49:12', NULL),
(29, 35, 38, 1, '2024-01-01', '2024-02-01', 1, 700000, '2024-01-25 15:37:25', NULL),
(30, 36, 40, 1, '2024-01-01', '2024-02-01', 1, 150000, '2024-01-25 15:39:57', NULL),
(31, 37, 39, 1, '2023-12-01', '2024-01-01', 1, 200000, '2024-01-25 15:40:35', NULL),
(32, 38, 43, 1, '2024-01-01', '2024-02-01', 1, 600000, '2024-01-25 15:42:33', NULL),
(33, 39, 44, 1, '2024-05-01', '2024-06-01', 1, 200000, '2024-01-25 15:44:25', NULL),
(34, 40, 45, 1, '2024-02-01', '2024-03-01', 1, 200000, '2024-01-25 15:45:49', NULL),
(35, 41, 46, 1, '2023-12-01', '2024-01-01', 1, 200000, '2024-01-25 15:46:29', NULL),
(36, 42, 47, 1, '2023-10-01', '2023-11-01', 1, 200000, '2024-01-25 15:47:11', NULL),
(37, 43, 48, 1, '2024-01-01', '2024-02-01', 1, 150000, '2024-01-25 15:47:44', NULL),
(38, 44, 42, 3, '2023-12-31', '2024-12-31', 1, 8400000, '2024-01-25 15:48:43', NULL),
(39, 49, 41, 1, '2023-12-01', '2024-01-01', 1, 100000, '2024-01-25 15:49:33', NULL),
(40, 33, 36, 3, '2023-06-01', '2024-06-01', 1, 10800000, '2024-01-25 15:51:14', NULL),
(41, 34, 0, 1, '2024-05-01', '2024-06-01', 1, 700000, '2024-01-25 15:52:42', NULL),
(42, 34, 37, 1, '2024-05-15', '2024-06-15', 1, 700000, '2024-01-25 15:55:51', NULL),
(43, 45, 49, 1, '2023-11-01', '2023-12-01', 1, 1100000, '2024-01-25 15:56:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', ' Rental Management System'),
(6, 'short_name', 'RMS'),
(11, 'logo', 'uploads/1630976340_storage_logo.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1630976580_storage.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` int(30) NOT NULL,
  `fullname` text NOT NULL,
  `gender` varchar(50) NOT NULL,
  `Occupation` text NOT NULL,
  `contact` varchar(30) NOT NULL,
  `marritalstatus` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `id_type` varchar(100) NOT NULL,
  `tenancy_type` varchar(50) NOT NULL,
  `id_no` varchar(100) NOT NULL,
  `tenancy_agreement` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_added` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `fullname`, `gender`, `Occupation`, `contact`, `marritalstatus`, `address`, `id_type`, `tenancy_type`, `id_no`, `tenancy_agreement`, `date_created`, `date_added`) VALUES
(11, 'Tumusime Gilbert', 'Male', 'Civil Engineer', '0772640136', 'Passport', '', '', 'Individual', '1', '', '2024-01-25 10:17:23', '2024-01-25 10:24:13'),
(12, 'TUKWASIBWE MELAB ODONGO', 'Male', 'Business Lady', '0776595181', 'Passport', '', 'Passport', 'Individual', '2', '', '2024-01-25 10:22:22', '2024-01-25 10:23:56'),
(13, 'NAJIMEDDIN QOBAAH', 'Male', 'Business Man', '0703333313', '', '', 'Passport', 'Individual', '3', '', '2024-01-25 10:28:06', '2024-01-25 10:28:16'),
(14, 'GILBERT SEBADUKA', 'Male', 'Business Man', '0771412375', 'Married', '', '', 'Individual', '4', '', '2024-01-25 10:36:21', NULL),
(15, 'AYESIIGA MARCIE', 'Male', 'Lecturer', '0774607100', '', '', 'Passport', 'Individual', '5', '', '2024-01-25 10:37:12', '2024-01-25 10:37:19'),
(16, 'MAKANDA HENRY', 'Male', 'Intelligence Personel', '0755837631', 'Married', '', '', 'Individual', '6', '', '2024-01-25 10:38:47', NULL),
(17, 'CLARE NATUKWASA', 'Male', 'Business Lady', '0755463825', '', '', 'Passport', 'Individual', '7', '', '2024-01-25 10:39:44', '2024-01-25 10:39:54'),
(18, 'NATUKUNDA BRENDAH', 'Male', 'Business Lady', '0708449765', 'Married', '', '', 'Individual', '8', '', '2024-01-25 10:40:36', NULL),
(19, 'KATUSIIME OLIVA', 'Male', 'Business Lady', '0703457296', '', '', '', 'Individual', '9', '', '2024-01-25 10:41:53', NULL),
(20, 'MUHAMAD MWEJIGYE', 'Male', 'Business Man', '0782340234', '', '', 'Passport', 'Individual', '10', '', '2024-01-25 10:42:49', '2024-01-25 10:42:58'),
(21, 'MUNGU IKO EVELYDE', 'Male', 'Business Man', '0780410820', '', '', 'Passport', 'Individual', '11', '', '2024-01-25 11:21:58', '2024-01-25 11:22:20'),
(22, 'ELIZABETH MBABAZI', 'Male', 'Business Lady', '0754737324', '', '', 'Passport', 'Individual', '12', '', '2024-01-25 11:23:20', '2024-01-25 14:25:02'),
(23, 'KALANGO ABDALLAH', 'Male', 'Business Man', '0786812691', '', '', 'Passport', 'Individual', '13', '', '2024-01-25 11:24:01', '2024-01-25 14:25:08'),
(24, 'EDDIE KAIMA', 'Male', 'Business Man', '0705779010', '', '', 'Passport', 'Individual', '14', '', '2024-01-25 11:24:40', '2024-01-25 14:24:55'),
(25, 'KANYESIGYE DEUS', 'Male', 'Doctor', '0787025040', '', '', 'Passport', 'Individual', '15', '', '2024-01-25 11:25:40', '2024-01-25 14:25:16'),
(26, 'OSBERT AMANYA', 'Male', 'Business Man', '0786789473', '', '', 'Passport', 'Individual', '16', '', '2024-01-25 11:26:12', '2024-01-25 14:25:32'),
(27, 'NYESIGA ENOCK', 'Male', 'Banker', '0703104759', '', '', 'Passport', 'Individual', '17', '', '2024-01-25 11:26:56', '2024-01-25 14:25:24'),
(28, 'PENINAH TUMWEBAZE', 'Male', 'Business Lady', '0702179472', '', '', 'Passport', 'Individual', '18', '', '2024-01-25 14:26:57', '2024-01-25 15:21:54'),
(29, 'NYAMWIJJA FRANCIS', 'Male', 'Business Lady', '0744208323', '', '', 'Passport', 'Individual', '19', '', '2024-01-25 14:27:49', '2024-01-25 15:21:41'),
(30, 'NUWAJUNA JULIUS', 'Male', 'Business Man', '0754467218', '', '', 'Passport', 'Individual', '20', '', '2024-01-25 14:28:47', '2024-01-25 15:21:33'),
(31, 'MUTARIYIJA YVONNE', 'Male', 'Business Lady', '0742783317', '', '', 'Passport', 'Individual', '21', '', '2024-01-25 14:29:30', '2024-01-25 15:21:09'),
(32, 'SHARON MBABAZI', 'Male', 'Business Lady', '0775358897', '', '', 'Passport', 'Individual', '22', '', '2024-01-25 14:30:06', '2024-01-25 15:22:03'),
(33, 'OLIVIA KATUSHABE', 'Male', 'Business Lady', '0755695084', '', '', 'Passport', 'Individual', '23', '', '2024-01-25 14:45:10', '2024-01-25 15:21:47'),
(34, 'NATAMBA PENELOPE', 'Male', 'Business Lady', '0776745442', '', '', 'Passport', 'Individual', '24', '', '2024-01-25 14:46:10', '2024-01-25 15:21:26'),
(35, 'NALUBEGA ROSE', 'Male', 'Business Lady', '0754003984', '', '', 'Passport', 'Individual', '25', '', '2024-01-25 14:47:03', '2024-01-25 15:21:17'),
(36, 'INTEGRATED COMMUNITY INTITATIVE(KODI)', 'Male', '', '0752801674', 'Passport', '', '', 'Company', '26', '', '2024-01-25 15:20:57', NULL),
(37, 'HILLARY MUTABAZI', 'Male', 'Engineer', '0772572709', 'Married', '', '', 'Individual', '', '', '2024-01-25 15:22:58', NULL),
(38, 'KAHANGUZI ELIGOUS.', 'Male', 'Engineer', '0772303379', 'Married', '', '', 'Individual', '27', '', '2024-01-25 15:23:57', NULL),
(39, 'NATUMANYA PATIENCE', 'Female', 'Nurse', '0708343394', 'Passport', '', '', 'Individual', '28', '', '2024-01-25 15:24:49', NULL),
(40, 'RUWAGGA DANIEL', 'Male', 'Engineer', '0772563487', 'Passport', '', '', 'Individual', '29', '', '2024-01-25 15:25:28', NULL),
(41, 'NAKATE PENINAH', 'Male', 'Business Lady', '0777159572', '', '', 'Passport', 'Individual', '30', '', '2024-01-25 15:27:00', '2024-01-25 15:36:05'),
(42, 'ASIIMWE SUSAN', 'Male', 'Stay Home Mother', '0777910359', '', '', 'Passport', 'Individual', '31', '', '2024-01-25 15:29:27', '2024-01-25 15:35:29'),
(43, 'KASEREA SINDANI MOISE', 'Male', 'Medical Student (Masters)', '0783905023', '', '', 'Passport', 'Individual', '32', '', '2024-01-25 15:30:20', '2024-01-25 15:35:51'),
(44, 'WONIALA BONIFACE', 'Male', 'Student', '0753100866', '', '', 'Passport', 'Individual', '33', '', '2024-01-25 15:31:15', '2024-01-25 15:36:12'),
(45, 'MBETH JOHN', 'Male', 'Student', '+23278647738', '', '', 'Passport', 'Individual', '34', '', '2024-01-25 15:32:00', '2024-01-25 15:35:58'),
(46, 'TUSHABE LONALD', 'Male', 'Media Personality', '0705909760', 'Married', '', '', 'Individual', '35', '', '2024-01-25 15:32:54', NULL),
(47, 'KAMWINE SAFURA', 'Male', 'Nurse', '0784008147', '', '', 'Passport', 'Individual', '36', '', '2024-01-25 15:33:24', '2024-01-25 15:35:44'),
(48, 'AINEMBABAZI DIANA', 'Male', 'Nurse', '0785706672', '', '', 'Passport', 'Individual', '37', '', '2024-01-25 15:33:57', '2024-01-25 15:35:21'),
(49, 'IMAM YAHYA', 'Male', 'Doctor', '0701771005', '', '', 'Passport', 'Individual', '38', '', '2024-01-25 15:35:10', '2024-01-25 15:35:36');

-- --------------------------------------------------------

--
-- Table structure for table `unit_list`
--

CREATE TABLE `unit_list` (
  `id` int(30) NOT NULL,
  `unit_number` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Available, 1 = Unavailable, 3 = Under Maintenance',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit_list`
--

INSERT INTO `unit_list` (`id`, `unit_number`, `description`, `status`, `date_created`) VALUES
(6, 'Kakooba Estate-1', '&lt;p&gt;2 bedroomed house&lt;/p&gt;&lt;p&gt;self-contained with a kitchen inside&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-01-25 10:13:40'),
(7, 'Kakooba Estate-2', '&lt;p&gt;2 bedroomed house&lt;/p&gt;&lt;p&gt;self contained with kitchen inside&lt;/p&gt;', 1, '2024-01-25 10:19:43'),
(8, 'Kakooba Estate-3', '&lt;p&gt;2 bedroomed house&lt;/p&gt;&lt;p&gt;self contained&amp;nbsp;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;with kitchen inside&lt;/span&gt;&lt;/p&gt;', 1, '2024-01-25 10:26:39'),
(9, 'Kakooba Estate-4', '&lt;p&gt;2 bedroomed house&lt;/p&gt;&lt;p&gt;self contained with kitchen inside&lt;/p&gt;', 1, '2024-01-25 10:29:51'),
(10, 'Kakooba Estate-5', '&lt;p&gt;2 bedroomed house&lt;/p&gt;&lt;p&gt;with the kitchen inside&lt;/p&gt;', 1, '2024-01-25 10:30:16'),
(11, 'Kakooba Estate-6', '&lt;p&gt;2 bedroomed house&lt;/p&gt;&lt;p&gt;self contained with a kitchen inside&lt;/p&gt;', 1, '2024-01-25 10:30:57'),
(12, 'Kakooba Estate-7', '&lt;p&gt;2 bedroomed house&lt;/p&gt;&lt;p&gt;self contained with a kitchen inside&lt;/p&gt;', 1, '2024-01-25 10:31:27'),
(13, 'Kakooba Estate-8', '&lt;p&gt;2 bedroomed house&lt;/p&gt;&lt;p&gt;self contained with a kitchen inside&lt;/p&gt;', 1, '2024-01-25 10:31:52'),
(14, 'Kakooba Estate-9', '&lt;p&gt;2 bedroomed house&lt;/p&gt;&lt;p&gt;self contained with a kitchen inside&lt;/p&gt;', 1, '2024-01-25 10:32:19'),
(15, 'Kakooba Estate-10', '&lt;p&gt;2 bedroomed house&lt;/p&gt;&lt;p&gt;self contained with a kitchen inside&lt;/p&gt;', 1, '2024-01-25 10:33:01'),
(16, 'Katete Estate-1', '&lt;p&gt;double room&amp;nbsp;&lt;/p&gt;&lt;p&gt;self contained with a kitchen outside&lt;/p&gt;', 1, '2024-01-25 11:00:21'),
(17, 'Katete Estate-2', '&lt;p&gt;double room&lt;/p&gt;&lt;p&gt;self contained with a kitchen outside&lt;/p&gt;', 1, '2024-01-25 11:00:55'),
(18, 'Katete Estate-3', '&lt;p&gt;single room&lt;/p&gt;&lt;p&gt;self contained&lt;/p&gt;', 1, '2024-01-25 11:01:27'),
(19, 'Katete Estate-4', '&lt;p&gt;single room&lt;/p&gt;&lt;p&gt;self contained&lt;/p&gt;', 1, '2024-01-25 11:02:19'),
(20, 'Katete Estate-5', '&lt;p&gt;double room self contained&amp;nbsp;&lt;/p&gt;&lt;p&gt;with kitchen outside&lt;/p&gt;', 1, '2024-01-25 11:04:56'),
(21, 'Katete Estate-6', '&lt;p&gt;2 bedroom&lt;/p&gt;&lt;p&gt;self contained&amp;nbsp;&lt;/p&gt;&lt;p&gt;with a kitchen outside&lt;/p&gt;', 1, '2024-01-25 11:05:52'),
(22, 'Katete Estate-7', '&lt;p&gt;double room&lt;/p&gt;&lt;p&gt;self contained&lt;/p&gt;&lt;p&gt;with a kitchen outside&lt;/p&gt;', 1, '2024-01-25 11:06:34'),
(23, 'VICTOR BWANA ESTATE-1', '&lt;p&gt;2 bedrooms&lt;/p&gt;&lt;p&gt;self contained&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-01-25 14:15:55'),
(24, 'VICTOR BWANA ESTATE-2', '&lt;p&gt;single room&lt;/p&gt;', 1, '2024-01-25 14:17:04'),
(25, 'VICTOR BWANA ESTATE-3', '&lt;p&gt;double room&lt;/p&gt;', 1, '2024-01-25 14:17:59'),
(26, 'VICTOR BWANA ESTATE-4', '&lt;p&gt;double room&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 0, '2024-01-25 14:18:27'),
(27, 'VICTOR BWANA ESTATE-5', '&lt;p&gt;double room&lt;/p&gt;', 1, '2024-01-25 14:18:44'),
(28, 'VICTOR BWANA ESTATE-6', '&lt;p&gt;double room&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-01-25 14:19:13'),
(29, 'VICTOR BWANA B-1', '&lt;p&gt;Double room&lt;/p&gt;&lt;p&gt;self contained&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 0, '2024-01-25 14:36:54'),
(30, 'VICTOR BWANA B-2', '&lt;p&gt;double room&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-01-25 14:37:58'),
(31, 'VICTOR BWANA B-3', '&lt;p&gt;double room&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-01-25 14:38:42'),
(32, 'VICTOR BWANA B-4', '&lt;p&gt;double room&lt;/p&gt;', 1, '2024-01-25 14:39:05'),
(33, 'KAKYEKA ESTATE NIRA-1', '&lt;p&gt;3 bedrooms&lt;/p&gt;&lt;p&gt;self contained&lt;/p&gt;&lt;p&gt;with quarters&lt;/p&gt;', 1, '2024-01-25 14:52:10'),
(34, 'KAKYEKA ESTATE NIRA-2', '&lt;p&gt;3 bedrooms&lt;/p&gt;&lt;p&gt;with quarters&lt;/p&gt;', 1, '2024-01-25 14:52:41'),
(35, 'KAKYEKA ESTATE FATHER BASH-1', '&lt;p&gt;3 bedrooms&lt;/p&gt;&lt;p&gt;self contained&lt;/p&gt;&lt;p&gt;with quarters&lt;/p&gt;', 1, '2024-01-25 14:52:58'),
(36, 'KAKYEKA ESTATE FATHER BASH-2', '&lt;p&gt;single self contained&lt;/p&gt;', 1, '2024-01-25 14:57:17'),
(37, 'KAKYEKA ESTATE FATHER BASH-3', '&lt;p&gt;double self contained&lt;/p&gt;', 1, '2024-01-25 14:57:36'),
(38, 'KAKYEKA ESTATE HOUSING-1', '&lt;p&gt;3 bedroom self contained&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1, '2024-01-25 14:58:42'),
(39, 'KAKYEKA ESTATE HOUSING-2', '&lt;p&gt;double self contained&lt;/p&gt;', 1, '2024-01-25 14:59:05'),
(40, 'KAKYEKA ESTATE HOUSING-3', '&lt;p&gt;double self contained&lt;/p&gt;', 1, '2024-01-25 14:59:18'),
(41, 'KAKYEKA ESTATE HOUSING-4', '&lt;p&gt;double self contained&lt;/p&gt;', 1, '2024-01-25 14:59:33'),
(42, 'KAKYEKA ESTATE HOUSING-5', '&lt;p&gt;double self contained&lt;/p&gt;', 1, '2024-01-25 14:59:45'),
(43, 'KAKYEKA ESTATE HOUSING-6', '&lt;p&gt;double self contained&lt;/p&gt;', 1, '2024-01-25 14:59:59'),
(44, 'KAKYEKA ESTATE KEMBO HOUSE', '&lt;p&gt;4 bedrooms&lt;/p&gt;&lt;p&gt;self contained&lt;/p&gt;', 1, '2024-01-25 15:01:28'),
(45, 'KAKYEKA ESTATE TOFA HOUSE', '&lt;p&gt;4 bedrooms&lt;/p&gt;&lt;p&gt;self contained&lt;/p&gt;', 1, '2024-01-25 15:03:29'),
(49, 'KAKYEKA ESTATE KEMBO HOUSE-KIOSK', '&lt;p&gt;KIOSK&lt;/p&gt;', 1, '2024-01-25 15:28:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(3, 'Daniel', 'Ngobi', 'dngobi', 'c06db68e819be6ec3d26c6038d8e8d1f', 'uploads/1630999200_avatar5.png', NULL, 2, '2021-09-07 15:20:40', '2024-01-04 12:23:29'),
(4, 'Kemigsha', 'Moreen', 'kmoreen', '2ae0da4f19c50237af9d5cc751887118', NULL, NULL, 2, '2024-01-23 15:33:49', '2024-01-25 15:59:50'),
(5, 'Akidi', 'Rosemary', 'arosemary', 'c06db68e819be6ec3d26c6038d8e8d1f', NULL, NULL, 2, '2024-01-23 15:34:56', NULL),
(6, 'William', 'Muhairwe', 'wmuhairwe', 'c06db68e819be6ec3d26c6038d8e8d1f', NULL, NULL, 1, '2024-01-23 15:36:07', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agencies`
--
ALTER TABLE `agencies`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`ComplaintId`);

--
-- Indexes for table `pettycash`
--
ALTER TABLE `pettycash`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `price_list`
--
ALTER TABLE `price_list`
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `rent_list`
--
ALTER TABLE `rent_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit_list`
--
ALTER TABLE `unit_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agencies`
--
ALTER TABLE `agencies`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `ComplaintId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pettycash`
--
ALTER TABLE `pettycash`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rent_list`
--
ALTER TABLE `rent_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `unit_list`
--
ALTER TABLE `unit_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `price_list`
--
ALTER TABLE `price_list`
  ADD CONSTRAINT `price_list_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
