-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 09:41 AM
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
-- Database: `storage_db`
--

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

--
-- Dumping data for table `pettycash`
--

INSERT INTO `pettycash` (`Id`, `DateOfExpenditure`, `DetailsOfExpenditure`, `Amount`, `Balance`) VALUES
(1, '2024-01-17', 'Acquisition of security lights', 100000, 500000);

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
(1, 500, 1400, 3999, '2021-09-07 10:25:52'),
(2, 500, 1400, 3999, '2021-09-07 10:34:43');

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
(1, 1, 1, 2, '2022-01-01', '2022-04-01', 1, 1400, '2021-09-07 14:20:40', '2024-01-04 12:21:05');

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
(1, 'Katusabe Derrick', 'Male', '1997-06-23', '09123456789', '', 'Sample Address 101 St. 0623', 'License ID', '', 'GBN-1014150723', '', '2021-09-07 11:55:46', '2024-01-04 14:55:51'),
(2, 'Omony David', 'Male', '1997-10-14', '094563213321', '', 'Sample Address only', 'Sample ID', '', '0897654123', '', '2021-09-07 13:08:29', '2024-01-04 14:55:19'),
(8, 'Daniel Ngobi', 'Male', 'Software Engineer', '0779226226', 'Married', 'Busabala', 'National ID', 'Individual', '1818281828', 'uploads/tenancy_agreements/1705407360_Screenshot 2024-01-16 095835.png', '2024-01-16 15:16:59', NULL);

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
(1, 'A-001', '&lt;p&gt;Sample Storage Unit&lt;br&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;50x50&lt;/li&gt;&lt;li&gt;sample&lt;/li&gt;&lt;li&gt;test&lt;/li&gt;&lt;li&gt;lorem&lt;/li&gt;&lt;/ul&gt;', 1, '2021-09-07 09:24:40'),
(2, 'A-002', '&lt;p&gt;Sample unit 2&lt;/p&gt;', 0, '2021-09-07 09:27:06'),
(4, 'A-003', '&lt;p&gt;Sample&lt;/p&gt;', 0, '2021-09-07 10:34:54');

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
(3, 'Daniel', 'Ngobi', 'dngobi', 'c06db68e819be6ec3d26c6038d8e8d1f', 'uploads/1630999200_avatar5.png', NULL, 2, '2021-09-07 15:20:40', '2024-01-04 12:23:29');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `ComplaintId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pettycash`
--
ALTER TABLE `pettycash`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rent_list`
--
ALTER TABLE `rent_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `unit_list`
--
ALTER TABLE `unit_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
