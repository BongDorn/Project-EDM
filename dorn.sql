-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2024 at 07:58 AM
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
-- Database: `sacco`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `id` int(30) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `contact_no` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `tax_id` varchar(50) NOT NULL,
  `date_created` int(11) NOT NULL,
  `gender` varchar(11) NOT NULL,
  `date_of_birth` date NOT NULL,
  `marital_status` varchar(20) NOT NULL,
  `id_type` varchar(50) NOT NULL,
  `id_number` varchar(50) NOT NULL,
  `distict` varchar(50) NOT NULL,
  `province` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `commune` varchar(50) NOT NULL,
  `village` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `occu` varchar(100) NOT NULL,
  `revenue` decimal(10,2) NOT NULL,
  `photo` blob NOT NULL,
  `map` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`id`, `firstname`, `middlename`, `lastname`, `contact_no`, `address`, `email`, `tax_id`, `date_created`, `gender`, `date_of_birth`, `marital_status`, `id_type`, `id_number`, `distict`, `province`, `district`, `commune`, `village`, `phone`, `occu`, `revenue`, `photo`, `map`) VALUES
(1, 'Ajay', 'Dinanath', 'Devgan', '9090909090', 'Flat Nofrtu', 'ajaydevgan@gmail.com', 'UIOJK23423', 0, '0', '0000-00-00', '0', '0', '', '', '', '', '', '', '', '', 0.00, '', ''),
(3, 'sea', 'UDorn', 'udorn', '235', 'st.5\r\nst,4', 'seaudorn11@gmail.com', '1', 0, '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', 0.00, '', ''),
(4, 'sea', 'UDorn', 'A', '', 'st.5', 'seaudorn11@gmail.com', '', 0, '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', 0.00, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `co-borrowers`
--

CREATE TABLE `co_borrowers` (
  `id` int(30) NOT NULL,
  `name_khmer` varchar(100) NOT NULL,
  `name_english` varchar(100) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `id_type` varchar(100) NOT NULL,
  `id_number` int(20) NOT NULL,
  `contact_no` varchar(30) NOT NULL,
  `map` decimal(10,0) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tax_id` varchar(50) NOT NULL,
  `date_created` int(11) NOT NULL,
  `marital_status` varchar(50) DEFAULT NULL,
  `phone` int(20) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `photo` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_list`
--

CREATE TABLE `loan_list` (
  `id` int(30) NOT NULL,
  `ref_no` varchar(50) NOT NULL,
  `loan_type_id` int(30) NOT NULL,
  `borrower_id` int(30) NOT NULL,
  `purpose` text NOT NULL,
  `amount` double NOT NULL,
  `plan_id` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0= request, 1= confrimed,2=released,3=complteted,4=denied\r\n',
  `date_released` datetime NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_list`
--

INSERT INTO `loan_list` (`id`, `ref_no`, `loan_type_id`, `borrower_id`, `purpose`, `amount`, `plan_id`, `status`, `date_released`, `date_created`) VALUES
(1, '80810623', 3, 1, 'Personal Loan as per request.', 120000, 1, 2, '2022-05-27 10:36:00', '2022-05-27 14:06:01'),
(2, '42409268', 4, 2, 'FOR WEDDING PROGRAM', 5500000, 5, 2, '2022-05-27 11:42:00', '2022-05-27 15:12:20'),
(3, '92131288', 1, 1, '', 123, 5, 0, '0000-00-00 00:00:00', '2024-03-28 10:42:13'),
(4, '75152898', 1, 4, '', 1000000, 5, 0, '0000-00-00 00:00:00', '2024-04-26 16:18:11'),
(5, '73022171', 1, 4, '', 1000000, 5, 0, '0000-00-00 00:00:00', '2024-04-26 16:18:11');

-- --------------------------------------------------------

--
-- Table structure for table `loan_plan`
--

CREATE TABLE `loan_plan` (
  `id` int(30) NOT NULL,
  `months` int(11) NOT NULL,
  `interest_percentage` float NOT NULL,
  `penalty_rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_plan`
--

INSERT INTO `loan_plan` (`id`, `months`, `interest_percentage`, `penalty_rate`) VALUES
(1, 36, 8, 3),
(2, 24, 5, 2),
(3, 27, 6, 2),
(4, 5, 12, 100),
(5, 72, 12, 100);

-- --------------------------------------------------------

--
-- Table structure for table `loan_schedules`
--

CREATE TABLE `loan_schedules` (
  `id` int(30) NOT NULL,
  `loan_id` int(30) NOT NULL,
  `date_due` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_schedules`
--

INSERT INTO `loan_schedules` (`id`, `loan_id`, `date_due`) VALUES
(1, 1, '2022-06-27'),
(2, 1, '2022-07-27'),
(3, 1, '2022-08-27'),
(4, 1, '2022-09-27'),
(5, 1, '2022-10-27'),
(6, 1, '2022-11-27'),
(7, 1, '2022-12-27'),
(8, 1, '2023-01-27'),
(9, 1, '2023-02-27'),
(10, 1, '2023-03-27'),
(11, 1, '2023-04-27'),
(12, 1, '2023-05-27'),
(13, 1, '2023-06-27'),
(14, 1, '2023-07-27'),
(15, 1, '2023-08-27'),
(16, 1, '2023-09-27'),
(17, 1, '2023-10-27'),
(18, 1, '2023-11-27'),
(19, 1, '2023-12-27'),
(20, 1, '2024-01-27'),
(21, 1, '2024-02-27'),
(22, 1, '2024-03-27'),
(23, 1, '2024-04-27'),
(24, 1, '2024-05-27'),
(25, 1, '2024-06-27'),
(26, 1, '2024-07-27'),
(27, 1, '2024-08-27'),
(28, 1, '2024-09-27'),
(29, 1, '2024-10-27'),
(30, 1, '2024-11-27'),
(31, 1, '2024-12-27'),
(32, 1, '2025-01-27'),
(33, 1, '2025-02-27'),
(34, 1, '2025-03-27'),
(35, 1, '2025-04-27'),
(36, 1, '2025-05-27'),
(37, 2, '2022-06-27'),
(38, 2, '2022-07-27'),
(39, 2, '2022-08-27'),
(40, 2, '2022-09-27'),
(41, 2, '2022-10-27'),
(42, 2, '2022-11-27'),
(43, 2, '2022-12-27'),
(44, 2, '2023-01-27'),
(45, 2, '2023-02-27'),
(46, 2, '2023-03-27'),
(47, 2, '2023-04-27'),
(48, 2, '2023-05-27'),
(49, 2, '2023-06-27'),
(50, 2, '2023-07-27'),
(51, 2, '2023-08-27'),
(52, 2, '2023-09-27'),
(53, 2, '2023-10-27'),
(54, 2, '2023-11-27'),
(55, 2, '2023-12-27'),
(56, 2, '2024-01-27'),
(57, 2, '2024-02-27'),
(58, 2, '2024-03-27'),
(59, 2, '2024-04-27'),
(60, 2, '2024-05-27'),
(61, 2, '2024-06-27'),
(62, 2, '2024-07-27'),
(63, 2, '2024-08-27'),
(64, 2, '2024-09-27'),
(65, 2, '2024-10-27'),
(66, 2, '2024-11-27'),
(67, 2, '2024-12-27'),
(68, 2, '2025-01-27'),
(69, 2, '2025-02-27'),
(70, 2, '2025-03-27'),
(71, 2, '2025-04-27'),
(72, 2, '2025-05-27'),
(73, 2, '2025-06-27'),
(74, 2, '2025-07-27'),
(75, 2, '2025-08-27'),
(76, 2, '2025-09-27'),
(77, 2, '2025-10-27'),
(78, 2, '2025-11-27'),
(79, 2, '2025-12-27'),
(80, 2, '2026-01-27'),
(81, 2, '2026-02-27'),
(82, 2, '2026-03-27'),
(83, 2, '2026-04-27'),
(84, 2, '2026-05-27'),
(85, 2, '2026-06-27'),
(86, 2, '2026-07-27'),
(87, 2, '2026-08-27'),
(88, 2, '2026-09-27'),
(89, 2, '2026-10-27'),
(90, 2, '2026-11-27'),
(91, 2, '2026-12-27'),
(92, 2, '2027-01-27'),
(93, 2, '2027-02-27'),
(94, 2, '2027-03-27'),
(95, 2, '2027-04-27'),
(96, 2, '2027-05-27'),
(97, 2, '2027-06-27'),
(98, 2, '2027-07-27'),
(99, 2, '2027-08-27'),
(100, 2, '2027-09-27'),
(101, 2, '2027-10-27'),
(102, 2, '2027-11-27'),
(103, 2, '2027-12-27'),
(104, 2, '2028-01-27'),
(105, 2, '2028-02-27'),
(106, 2, '2028-03-27'),
(107, 2, '2028-04-27'),
(108, 2, '2028-05-27');

-- --------------------------------------------------------

--
-- Table structure for table `loan_types`
--

CREATE TABLE `loan_types` (
  `id` int(30) NOT NULL,
  `type_name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_types`
--

INSERT INTO `loan_types` (`id`, `type_name`, `description`) VALUES
(1, 'Small Business', 'Small Business Loans'),
(2, 'Mortgages', 'Mortgages'),
(3, 'Personal Loans', 'Personal Loans'),
(4, 'Gold Loan', 'Loan by taking gold as Mortgage');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(30) NOT NULL,
  `loan_id` int(30) NOT NULL,
  `payee` text NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `penalty_amount` float NOT NULL DEFAULT 0,
  `overdue` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=no , 1 = yes',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `loan_id`, `payee`, `amount`, `penalty_amount`, `overdue`, `date_created`) VALUES
(2, 1, 'Ajay', 3600, 0, 0, '2022-05-27 14:06:21'),
(3, 1, 'ajay', 3600, 0, 0, '2022-05-27 14:06:28'),
(4, 1, '', 0, 0, 0, '2022-05-27 14:06:28'),
(5, 1, '', 0, 0, 0, '2022-05-27 14:06:28'),
(6, 1, '', 0, 0, 0, '2022-05-27 14:06:29'),
(7, 1, '', 0, 0, 0, '2022-05-27 14:06:29'),
(8, 1, '', 0, 0, 0, '2022-05-27 14:06:29'),
(9, 1, '', 0, 0, 0, '2022-05-27 14:06:29'),
(10, 2, '', 0, 0, 0, '2022-05-27 15:12:31'),
(11, 2, '', 0, 0, 0, '2022-05-27 15:12:41'),
(12, 2, '', 0, 0, 0, '2022-05-27 15:12:51'),
(13, 2, '', 0, 0, 0, '2022-05-27 15:12:52'),
(14, 2, '', 0, 0, 0, '2022-05-27 15:12:59'),
(15, 1, '', 0, 0, 0, '2024-03-28 10:50:24'),
(17, 1, '', 0, 0, 0, '2024-03-28 10:50:25'),
(18, 1, '', 0, 0, 0, '2024-03-28 10:50:25'),
(19, 1, '', 0, 0, 0, '2024-03-28 10:50:26'),
(20, 1, '', 0, 0, 0, '2024-03-28 10:50:26'),
(21, 1, '', 0, 0, 0, '2024-04-26 15:46:13'),
(22, 1, '', 0, 0, 0, '2024-04-26 15:46:14'),
(23, 1, '', 0, 0, 0, '2024-04-26 15:50:02'),
(24, 2, '', 0, 0, 0, '2024-04-26 15:50:06'),
(25, 1, '', 0, 0, 0, '2024-04-26 15:51:51'),
(26, 1, '', 0, 0, 0, '2024-04-26 15:51:51'),
(27, 1, '', 0, 0, 0, '2024-04-26 15:55:49'),
(28, 1, '', 0, 0, 0, '2024-04-26 15:55:49'),
(29, 1, '', 0, 0, 0, '2024-04-26 15:55:49'),
(30, 1, '', 0, 0, 0, '2024-04-26 15:56:00'),
(31, 1, 'Devgan, Ajay Dinanath', 1400, 0, 0, '2024-04-26 15:58:48'),
(32, 1, 'Devgan, Ajay Dinanath', 3600, 0, 0, '2024-04-26 16:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `doctor_id`, `name`, `address`, `contact`, `username`, `password`, `type`) VALUES
(1, 0, 'Administrator', 'khmer', '', 'dorn', '123', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_list`
--
ALTER TABLE `loan_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_plan`
--
ALTER TABLE `loan_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_types`
--
ALTER TABLE `loan_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
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
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `loan_list`
--
ALTER TABLE `loan_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `loan_plan`
--
ALTER TABLE `loan_plan`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `loan_types`
--
ALTER TABLE `loan_types`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
