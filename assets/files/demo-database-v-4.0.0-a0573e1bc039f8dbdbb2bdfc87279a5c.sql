-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 09, 2025 at 08:25 AM
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
-- Database: `eDemandDemoDataV4_0_0`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(50) NOT NULL,
  `type` varchar(32) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `alternate_mobile` varchar(20) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `city_id` int(20) NOT NULL DEFAULT 0,
  `city` varchar(252) NOT NULL,
  `landmark` varchar(128) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `lattitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_contact_query`
--

CREATE TABLE `admin_contact_query` (
  `id` int(11) NOT NULL,
  `email` mediumtext DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `message` longtext NOT NULL,
  `subject` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `partner_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `is_saved_for_later` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_collection`
--

CREATE TABLE `cash_collection` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` mediumtext NOT NULL,
  `commison` int(11) NOT NULL,
  `status` mediumtext NOT NULL,
  `partner_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(50) NOT NULL DEFAULT 0,
  `name` varchar(1024) NOT NULL,
  `image` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin_commission` double NOT NULL COMMENT 'global admin commission for all partners',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 - deactive | 1 - active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `dark_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `light_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `image`, `slug`, `admin_commission`, `status`, `created_at`, `updated_at`, `dark_color`, `light_color`) VALUES
(213, 0, 'Home Services', '1739277585_1c2b3fe0c7c9067af624.svg', 'home-services', 0, 1, '2022-11-02 07:12:28', '2025-02-13 11:33:29', '#2a2c3e', '#ffffff'),
(215, 213, 'Room Cleaning', 'room cleaning-min.jpg', 'room-cleaning', 0, 1, '2022-11-02 07:14:09', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(216, 213, 'Window Cleaning', 'window cleaning-min.jpg', 'window-cleaning', 0, 1, '2022-11-02 07:17:13', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(217, 213, 'Washroom Cleaning', 'washroom cleaning-min.jpg', 'washroom-cleaning', 0, 1, '2022-11-02 07:19:40', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(218, 213, 'Kitchen Cleaning', 'kitchen cleaning-min.jpg', 'kitchen-cleaning', 0, 1, '2022-11-02 07:30:06', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(220, 213, 'Carpet Cleaning', 'carpet cleaning-min.jpg', 'carpet-cleaning', 0, 1, '2022-11-02 08:22:47', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(221, 0, 'Ac Services', '1739277657_7586bb9b7b02d17fbb38.svg', 'ac-services', 0, 1, '2022-11-02 08:42:23', '2025-02-11 18:10:57', '#2a2c3e', '#ffffff'),
(222, 0, 'Laundry Services', '1739277630_1454a30cac175041d015.svg', 'laundry-services', 0, 1, '2022-11-02 09:37:57', '2025-02-11 18:10:30', '#2a2c3e', '#ffffff'),
(223, 221, 'Making to much noise', 'stressed-young-man-has-problem-with-air-conditioner-home.jpg', 'making-to-much-noise', 6, 1, '2022-11-02 09:42:11', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(224, 221, 'Compressor  switching off', 'closeup-hand-use-manifold-gauge-checking-refrigerant-air-conditioner.jpg', 'compressor--switching-off', 5, 1, '2022-11-02 09:43:02', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(225, 221, 'Water Leak inside', 'hands-technician-using-screwdriver-when-installing-air-conditioner-bedroom-customer.jpg', 'water-leak-inside', 6, 1, '2022-11-02 09:43:48', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(226, 221, 'Not Cooling Properly', 'worker-repairing-ceiling-air-conditioning-unit.jpg', 'not-cooling-properly', 6, 1, '2022-11-02 09:44:56', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(227, 221, 'AC System Freezing', 'air-conditioner-technician-checks-operation-industrial-air-conditioners.jpg', 'ac-system-freezing', 5, 1, '2022-11-02 09:47:48', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(228, 259, 'Oil Filter Changed', 'dipstick-checking-oil-level-car-engine-engine-oil-consumption-rates.jpg', 'oil-filter-changed', 0, 1, '2022-11-02 09:56:19', '0000-00-00 00:00:00', '#2a2c3e', '#ffffff'),
(229, 259, 'Antifreeze  added', 'person-pouring-antifreeze-car-wintertime.jpg', 'antifreeze--added', 0, 1, '2022-11-02 09:58:07', '0000-00-00 00:00:00', '#2a2c3e', '#ffffff'),
(230, 259, 'Battery  Replacement', 'auto-mechanic-carries-replacement-car-battery-car-electrical-maintenance.jpg', 'battery--replacement', 0, 1, '2022-11-02 10:02:36', '0000-00-00 00:00:00', '#2a2c3e', '#ffffff'),
(232, 259, 'New Tires', '1742884629_93f30993baa76e8a9ffb.jpg', 'new-tires', 0, 1, '2022-11-02 10:03:53', '2025-03-25 12:07:09', '#2a2c3e', '#ffffff'),
(234, 259, 'Brake repair', 'muscular-car-service-worker-repairing-vehicle.jpg', 'brake-repair', 0, 1, '2022-11-02 10:11:50', '0000-00-00 00:00:00', '#2a2c3e', '#ffffff'),
(235, 222, 'Washing', 'cleansing-min.jpg', 'washing', 0, 1, '2022-11-02 10:14:57', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(236, 222, 'Dry Cleaning', 'dry cleaning-min.jpg', 'dry-cleaning', 0, 1, '2022-11-02 10:17:28', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(237, 222, 'Leather Cleaning', 'leather cleaning-min.jpg', 'leather-cleaning', 0, 1, '2022-11-02 10:19:55', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(238, 222, 'Carpet & Floor Mat Cleaning', 'carpet cleaning-min (1).jpg', 'carpet-&-floor-mat-cleaning', 0, 1, '2022-11-02 10:23:35', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(239, 222, 'Blanket Cleaning', 'blanket cleaning-min.jpg', 'blanket-cleaning', 0, 1, '2022-11-02 10:27:02', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(240, 0, 'Plumbing Services', '1739277857_575f9a7fc5dfe0b63357.svg', 'plumbing-services', 0, 1, '2022-11-02 10:28:38', '2025-02-11 18:14:17', '#2a2c3e', '#ffffff'),
(241, 240, 'Water Leaks', 'water leaks-min.jpg', 'water-leaks', 0, 1, '2022-11-02 10:29:44', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(242, 240, 'Bathroom Installations', 'bathroom_-min.jpg', 'bathroom-installations', 0, 1, '2022-11-02 10:30:49', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(243, 240, 'Wall Pump Repair', 'wall pump-min.jpg', 'wall-pump-repair', 0, 1, '2022-11-02 10:33:25', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(244, 240, 'Water Heater Repair', 'water heater-min.jpg', 'water-heater-repair', 0, 1, '2022-11-03 05:41:03', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(245, 240, 'Shower Installation', '1667454147.jpg', 'shower-installation', 6, 1, '2022-11-03 05:42:27', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(246, 0, 'Pest Control Services', '1739277830_55eb2980983ed765830a.svg', 'pest-control-services', 0, 1, '2022-11-03 06:01:12', '2025-02-11 18:13:50', '#2a2c3e', '#ffffff'),
(247, 246, 'Mosquitoes', 'mosquitoes-min.png', 'mosquitoes', 0, 1, '2022-11-03 06:06:11', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(248, 246, 'Rats', 'rats-min (1).jpg', 'rats', 0, 1, '2022-11-03 06:07:50', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(249, 246, 'Cockroaches', 'cockroach-min.jpg', 'cockroaches', 0, 1, '2022-11-03 06:10:58', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(250, 246, 'Bed bug', 'bedbug-min.jpg', 'bed-bug', 0, 1, '2022-11-03 06:12:28', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(251, 246, 'Ant', 'ant-min.jpg', 'ant', 0, 1, '2022-11-03 06:16:54', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(252, 0, 'Electronic Services', '1739277804_5de79299ac54a3b65814.svg', 'electronic-services', 0, 1, '2022-11-05 04:49:46', '2025-02-11 18:13:24', '#2a2c3e', '#ffffff'),
(253, 252, 'Outdoor lighting', '1667623853.jpg', 'outdoor-lighting', 10, 1, '2022-11-05 04:50:53', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(254, 252, 'Fan installation', '1667623890.jpg', 'fan-installation', 10, 1, '2022-11-05 04:51:30', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(255, 252, 'Socket Switch Installation', '1667623928.jpg', 'socket-switch-installation', 10, 1, '2022-11-05 04:52:08', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(256, 252, 'Security  System', '1667623948.jpg', 'security--system', 10, 1, '2022-11-05 04:52:28', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(257, 252, 'Light Fixture', '1667623972.jpg', 'light-fixture', 10, 1, '2022-11-05 04:52:52', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(258, 252, 'Ground Wiring', '1667624041.jpg', 'ground-wiring', 10, 1, '2022-11-05 04:54:01', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(259, 0, 'Mechanic Services', '1739277769_f7a925e689a04081eb59.svg', 'mechanic-services', 0, 1, '2022-11-08 04:22:25', '2025-02-11 18:12:49', '#2a2c3e', '#ffffff'),
(265, 0, 'Salon Services', '1739277745_0a109dc0054a4f7374a6.svg', 'salon-services', 0, 1, '2022-11-08 06:38:47', '2025-02-11 18:12:25', '#2a2c3e', '#ffffff'),
(267, 265, 'Hair cut', '1667890022.jpg', 'hair-cut', 10, 1, '2022-11-08 06:47:02', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(268, 265, 'Hair color', '1667890048.jpg', 'hair-color', 10, 1, '2022-11-08 06:47:28', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(269, 265, 'Shave/Trim', '1667890081.jpg', 'shave/trim', 10, 1, '2022-11-08 06:48:01', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(270, 0, 'Carpenter Services', '1739277705_997bdd15a799f62f8da7.svg', 'carpenter-services', 0, 1, '2022-11-08 07:55:14', '2025-02-11 18:11:45', '#2a2c3e', '#ffffff'),
(271, 270, 'Kitchen Cabinets', '1667894196.jpg', 'kitchen-cabinets', 20, 1, '2022-11-08 07:56:36', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(272, 270, 'Wardrobe Cupboard', '1742884485_2d4002ba0490bdf5fa5b.jpg', 'wardrobe-cupboard', 0, 1, '2022-11-08 07:57:16', '2025-05-07 14:54:23', '#2a2c3e', '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `booking_id` text DEFAULT NULL,
  `message` longtext NOT NULL,
  `file` longtext DEFAULT NULL,
  `file_type` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `e_id` int(11) NOT NULL,
  `sender_type` int(11) NOT NULL COMMENT '0 : Admin\r\n1: Provider\r\n2: customer',
  `receiver_type` int(11) NOT NULL COMMENT '0 : Admin\r\n1: Provider\r\n2: customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `latitude` varchar(120) DEFAULT NULL,
  `longitude` varchar(120) DEFAULT NULL,
  `delivery_charge_method` varchar(30) DEFAULT NULL,
  `fixed_charge` int(11) NOT NULL DEFAULT 0,
  `per_km_charge` int(11) NOT NULL DEFAULT 0,
  `range_wise_charges` text DEFAULT NULL,
  `time_to_travel` int(11) NOT NULL DEFAULT 0,
  `geolocation_type` varchar(30) DEFAULT NULL COMMENT 'not used in current',
  `radius` varchar(512) DEFAULT '0' COMMENT 'not used in current',
  `boundary_points` text DEFAULT NULL COMMENT 'not used in current',
  `max_deliverable_distance` int(10) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `latitude`, `longitude`, `delivery_charge_method`, `fixed_charge`, `per_km_charge`, `range_wise_charges`, `time_to_travel`, `geolocation_type`, `radius`, `boundary_points`, `max_deliverable_distance`, `created_at`, `updated_at`) VALUES
(7, 'Mundra', '22.8395642', '69.72407489999999', 'fixed_charge', 78, 0, NULL, 10, NULL, '0', NULL, 10, '2022-06-25 05:18:00', '2022-08-24 13:51:13'),
(10, 'Bharuch', '21.7051358', '72.9958748', 'per_km_charge', 0, 10, NULL, 0, NULL, '0', NULL, 0, '2022-07-01 10:16:00', '2022-09-21 04:09:57'),
(11, 'Mundra', '22.839715', '69.704199', 'fixed_charge', 0, 0, NULL, 20, NULL, '0', NULL, 20, '2022-07-01 10:16:33', '2022-07-14 12:33:53'),
(14, 'Gandhidham', '23.075297', '70.133673', 'fixed_charge', 0, 0, NULL, 20, NULL, '0', NULL, 20, '2022-07-01 10:17:53', '2022-07-14 12:33:18'),
(15, 'Bhachau', '23.2930388', '70.339045', 'fixed_charge', 0, 0, NULL, 20, NULL, '0', NULL, 30, '2022-07-14 06:28:00', '2022-07-14 12:32:57'),
(16, 'Anjar', '23.1166716', '70.0281023', 'fixed_charge', 10, 0, NULL, 20, NULL, '0', NULL, 10, '2022-07-14 06:55:11', '2022-07-14 11:48:10'),
(17, 'Mandvi', '22.833334', '69.3554783', 'fixed_charge', 0, 0, NULL, 20, NULL, '0', NULL, 50, '2022-07-14 07:16:00', '2022-07-14 12:38:21'),
(18, 'Bhuj', '23.242697188102483', '69.6639650758625', 'per_km_charge', 0, 10, NULL, 10, NULL, '0', NULL, 10, '2022-09-21 04:08:26', '2022-09-21 04:08:26');

-- --------------------------------------------------------

--
-- Table structure for table `country_codes`
--

CREATE TABLE `country_codes` (
  `name` text NOT NULL,
  `code` text NOT NULL,
  `created_at` date DEFAULT NULL,
  `id` int(11) NOT NULL,
  `is_default` int(11) NOT NULL DEFAULT 0,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country_codes`
--

INSERT INTO `country_codes` (`name`, `code`, `created_at`, `id`, `is_default`, `updated_at`) VALUES
('India', '+91', NULL, 1, 1, '2025-04-17');

-- --------------------------------------------------------

--
-- Table structure for table `custom_job_provider`
--

CREATE TABLE `custom_job_provider` (
  `id` int(11) NOT NULL,
  `custom_job_request_id` text NOT NULL,
  `partner_id` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_job_requests`
--

CREATE TABLE `custom_job_requests` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `service_title` text NOT NULL,
  `service_short_description` text NOT NULL,
  `min_price` text NOT NULL,
  `max_price` text NOT NULL,
  `requested_start_date` date NOT NULL,
  `requested_start_time` time NOT NULL,
  `requested_end_date` date NOT NULL,
  `requested_end_time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `user_id` text DEFAULT NULL,
  `subject` text NOT NULL,
  `type` text NOT NULL,
  `parameters` text NOT NULL,
  `bcc` text DEFAULT NULL,
  `cc` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `subject` text NOT NULL,
  `to` text NOT NULL,
  `template` longtext NOT NULL,
  `bcc` text DEFAULT NULL,
  `cc` text DEFAULT NULL,
  `parameters` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `type`, `subject`, `to`, `template`, `bcc`, `cc`, `parameters`) VALUES
(53, 'provider_approved', 'Approval of Registration Request', '', '&lt;p&gt;Dear [[provider_name]],&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;We&#039;re thrilled to inform you that your request has been approved! This is a significant milestone, and we can&#039;t wait to witness the impact your solutions will have on our operations.&lt;/p&gt;\\r\\n&lt;p&gt;Here are the details you need:&lt;br /&gt;&lt;br /&gt;Provider ID: [[provider_id]]&lt;br /&gt;Company Name: [[provider_name]]&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;\\r\\n&lt;p&gt;As we move forward, please feel free to reach out with any questions or additional information you may require. We&#039;re here to ensure a smooth and successful collaboration.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Thank you once again for your outstanding work and dedication. We&#039;re looking forward to a fruitful partnership!&lt;/p&gt;\\r\\n&lt;p&gt;Warm regards,&lt;/p&gt;\\r\\n&lt;p&gt;[[company_logo]]&lt;/p&gt;\\r\\n&lt;p&gt;[[company_contact_info]]&lt;/p&gt;', '', '', '[\\\"provider_name\\\",\\\"provider_id\\\",\\\"provider_name\\\",\\\"company_logo\\\",\\\"company_contact_info\\\"]'),
(54, 'provider_disapproved', 'Rejection of Registration Request', '', '&lt;p&gt;Dear [[provider_name]] ,&lt;/p&gt;\\r\\n&lt;p&gt;I regret to inform you that your registration request has been declined. After careful review and consideration, we have determined that your offerings do not align with our current needs or standards.&lt;/p&gt;\\r\\n&lt;p&gt;While we appreciate your interest in partnering with us, we believe it&#039;s in both of our best interests to explore other opportunities that better fit our requirements at this time.&lt;/p&gt;\\r\\n&lt;p&gt;Please know that this decision was not made lightly, and we genuinely value the effort you put into your application. We encourage you to continue pursuing opportunities that align more closely with your expertise and offerings.&lt;/p&gt;\\r\\n&lt;p&gt;Thank you for your understanding. Should you have any questions or require further clarification, please don&#039;t hesitate to reach out.&lt;/p&gt;\\r\\n&lt;p&gt;I wish you all the best in your future endeavors.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Warm regards,&lt;/p&gt;\\r\\n&lt;p&gt;[[company_name]]&lt;/p&gt;\\r\\n&lt;p&gt;[[company_contact_info]]&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;', '', '', '[\\\"provider_name\\\",\\\"company_name\\\",\\\"company_contact_info\\\"]'),
(55, 'withdraw_request_approved', 'Withdrawal Request Approved', '', '&lt;p&gt;Dear [[Provider Name]],&lt;/p&gt;\\r\\n&lt;p&gt;We are pleased to inform you that your withdrawal request has been approved. If you have any questions or concerns regarding this transaction, please do not hesitate to contact us. Thank you for choosing our services. We look forward to providing you with excellent service in the future.&lt;/p&gt;\\r\\n&lt;p&gt;Your Request is for: [[Amount]] [[Currency]].&lt;/p&gt;\\r\\n&lt;p&gt;Best Regards, [[Company Name]]&lt;/p&gt;', '', '', '[\\\"Provider Name\\\",\\\"Amount\\\",\\\"Currency\\\",\\\"Company Name\\\"]'),
(56, 'withdraw_request_disapproved', 'Withdrawal Request Disapproved', '', '&lt;p&gt;Dear [[Provider Name]],&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\\\\\r\\\\\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;We regret to inform you that your withdrawal request has been disapproved. If you have any questions or concerns regarding this decision, please do not hesitate to contact us. Thank you for choosing our services. We look forward to providing you with excellent service in the future.&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\\\\\r\\\\\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;Your Request is for: [[Amount]] [[Currency]].&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\\\\\r\\\\\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;Best Regards, [[Company Name]]&lt;/p&gt;', '', '', '[\\\"Provider Name\\\",\\\"Amount\\\",\\\"Currency\\\",\\\"Company Name\\\"]'),
(57, 'payment_settlement', 'Payment Settlement', '', '&lt;p&gt;Dear [[provider_name]],&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;div&gt;I am writing to confirm that we have credited the agreed upon amount of [[currency]][[amount]] to your account, as per our agreement. This payment settles the outstanding balance for the services provided by your company.&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;\\r\\n&lt;div&gt;We understand the importance of timely payments for maintaining a healthy business relationship, and we strive to meet our payment obligations promptly. Please check your account and confirm that the payment has been received. If you have any questions or concerns, please do not hesitate to contact us.&lt;/div&gt;\\r\\n&lt;/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;[[company_contact_info]]&lt;/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;\\r\\n&lt;div&gt;Thank you for your prompt attention to this matter. We look forward to continuing our mutually beneficial partnership.&lt;/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;Best Regards ,&amp;nbsp;&lt;/div&gt;\\r\\n&lt;div&gt;[[company_name]].&amp;nbsp;&lt;/div&gt;\\r\\n&lt;/div&gt;', '', '', '[\\\"provider_name\\\",\\\"currency\\\",\\\"amount\\\",\\\"company_contact_info\\\",\\\"company_name\\\"]'),
(58, 'service_disapproved', 'Rejection of Service Request', '', '&lt;p&gt;Dear [[Provider Name]],&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;We regret to inform you that your request for service approval has been disapproved. After thorough evaluation and consideration, our team has determined that your request does not meet the necessary criteria for approval.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;We understand that this decision may be disappointing for you, but please know that we carefully reviewed your request and made the best decision based on our policies and guidelines.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;If you have any questions or concerns regarding the decision, please do not hesitate to reach out to us. We would be happy to discuss any specific concerns that you may have.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Contact us:&lt;/p&gt;\\r\\n&lt;p&gt;[[Company Contact Info]]&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Best Regards,&lt;/p&gt;\\r\\n&lt;p&gt;[[Company Name]]&lt;/p&gt;', '', '', '[\\\"Provider Name\\\",\\\"Company Contact Info\\\",\\\"Company Name\\\"]'),
(59, 'service_approved', 'Approval of Service Request', '', '&lt;p&gt;Dear [[Provider Name]],&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;I am pleased to inform you that your request for service approval has been approved. After careful review and consideration, our team has determined that your request meets all the necessary criteria and is eligible for approval.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Once again, congratulations on your approval status! We look forward to working with you and supporting your goals.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;If you have any questions or concerns, please do not hesitate to contact us.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Contact Us:&lt;/p&gt;\\r\\n&lt;p&gt;[[Company Contact Info]]&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Best Regards,&lt;/p&gt;\\r\\n&lt;p&gt;[[Company Name]]&lt;/p&gt;', '', '', '[\\\"Provider Name\\\",\\\"Company Contact Info\\\",\\\"Company Name\\\"]'),
(60, 'user_account_active', 'Account activation confirmation', '', '&lt;p&gt;Dear [[user_name]],&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;div&gt;We are pleased to inform you that your account has been successfully activated. You can now log in to your account and start using our services.&lt;/div&gt;\r\n&lt;div&gt;\r\n&lt;div&gt;If you have any questions or need any assistance feel free to contact us.&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;\r\n&lt;div&gt;Thank you again for choosing our services. We look forward to doing business with you again.&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;Best Regards ,&amp;nbsp;&lt;/div&gt;\r\n&lt;div&gt;[[company_name]].&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;', '', '', '[\"user_name\",\"company_name\"]'),
(61, 'user_account_deactive', 'Account Deactivation Confirmation', '', '&lt;div&gt;Dear [[user_name]]&lt;/div&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\\\\\r\\\\\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\\\\\r\\\\\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;div&gt;We are sorry to inform you that your account has been deactivated.&lt;/div&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\\\\\r\\\\\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;div&gt;[[user_id]][[user_name]][[company_name]][[site_url]][[company_contact_info]][[company_logo]][[company_contact_info]][[company_logo]]&lt;/div&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\\\\\r\\\\\\\\n&lt;/p&gt;\\r\\n&lt;p&gt;\\\\r\\\\n&lt;/p&gt;\\r\\n&lt;div&gt;\\\\\\\\r\\\\\\\\n\\\\r\\\\n\\r\\n&lt;div&gt;If you have any questions or need any assistance feel free to contact us.&lt;/div&gt;\\r\\n\\\\r\\\\n\\\\\\\\r\\\\\\\\n\\\\r\\\\n\\r\\n&lt;div&gt;\\\\\\\\r\\\\\\\\n\\\\r\\\\n\\r\\n&lt;div&gt;Thank you again for choosing our services. We look forward to doing business with you again.&lt;/div&gt;\\r\\n\\\\r\\\\n\\\\\\\\r\\\\\\\\n\\\\r\\\\n\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n\\\\r\\\\n\\\\\\\\r\\\\\\\\n\\\\r\\\\n\\r\\n&lt;div&gt;Best Regards&amp;nbsp;&lt;/div&gt;\\r\\n\\\\r\\\\n\\\\\\\\r\\\\\\\\n\\\\r\\\\n\\r\\n&lt;div&gt;&amp;nbsp;&lt;/div&gt;\\r\\n\\\\r\\\\n\\\\\\\\r\\\\\\\\n\\\\r\\\\n\\r\\n&lt;div&gt;[[company_name]]&lt;/div&gt;\\r\\n\\\\r\\\\n\\\\\\\\r\\\\\\\\n&lt;/div&gt;\\r\\n\\\\r\\\\n\\\\\\\\r\\\\\\\\n&lt;/div&gt;', '', '', '[\\\"user_name\\\",\\\"user_id\\\",\\\"user_name\\\",\\\"company_name\\\",\\\"site_url\\\",\\\"company_contact_info\\\",\\\"company_logo\\\",\\\"company_contact_info\\\",\\\"company_logo\\\",\\\"company_name\\\"]'),
(62, 'booking_status_updated', 'Booking Status Updated', '', '&lt;p&gt;Subject: Booking Confirmation&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;Dear [[user_name]],&lt;/p&gt;\n&lt;p&gt;Thank you for choosing [Service Name]. We are pleased to confirm your booking status has been changed.&lt;/p&gt;\n&lt;p&gt;Booking Details:&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;Service Name: [[booking_service_names]]&lt;/li&gt;\n&lt;li&gt;Booking Date: [[booking_date]]&lt;/li&gt;\n&lt;li&gt;Time:[[booking_time]]&lt;/li&gt;\n&lt;li&gt;Address:[[booking_address]]&lt;/li&gt;\n&lt;/ul&gt;\n&lt;p&gt;We look forward to serving you. If you have any questions or need to make changes to your booking, please don&#039;t hesitate to contact us at [Contact Information].&lt;/p&gt;\n&lt;p&gt;Best regards,&lt;/p&gt;\n&lt;p&gt;[[company_name]]&lt;/p&gt;\n&lt;p&gt;[[company_contact_info]]&lt;/p&gt;', '', '', '[\"user_name\",\"booking_service_names\",\"booking_date\",\"booking_time\",\"booking_address\",\"company_name\",\"company_contact_info\"]'),
(63, 'new_booking_confirmation_to_customer', 'Booking Confirmation', '', '&lt;p&gt;Dear [[user_name]],&lt;/p&gt;\n&lt;p&gt;Thank you for choosing [[provider_name]]. We are pleased to confirm your booking.&lt;/p&gt;\n&lt;p&gt;Booking Details:&lt;/p&gt;\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;Booking Date:[[booking_date]]&lt;/li&gt;\n&lt;li&gt;Time:[[booking_time]]&lt;/li&gt;\n&lt;li&gt;Address:[[booking_address]]&lt;/li&gt;\n&lt;li&gt;Services include:[[booking_service_names]]&lt;/li&gt;\n&lt;/ul&gt;\n&lt;p&gt;We look forward to serving you. If you have any questions or need to make changes to your booking, please don&#039;t hesitate to contact us at [Contact Information].&lt;/p&gt;\n&lt;p&gt;Best regards,&lt;/p&gt;\n&lt;p&gt;[[company_name]]&lt;/p&gt;\n&lt;p&gt;[[company_contact_info]]&lt;/p&gt;', '', '', '[\"user_name\",\"provider_name\",\"booking_date\",\"booking_time\",\"booking_address\",\"company_name\",\"company_contact_info\"]'),
(64, 'new_booking_received_for_provider', 'New Booking Received', '', '&lt;p&gt;Dear [[provider_name]] ,&lt;/p&gt;\n&lt;p&gt;We are delighted to inform you that a new booking has been received through our platform.&lt;/p&gt;\n&lt;p&gt;Booking Details:&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;Service:[[booking_service_names]]&lt;/li&gt;\n&lt;li&gt;Booking Date: [[booking_date]]&lt;/li&gt;\n&lt;li&gt;Time: [[booking_time]]&lt;/li&gt;\n&lt;li&gt;Customer:[[user_name]]&lt;/li&gt;\n&lt;/ul&gt;\n&lt;p&gt;Please ensure that you are prepared for the appointment and ready to provide exceptional service to our valued customer.&lt;/p&gt;\n&lt;p&gt;If you have any questions or require further information regarding this booking, feel free to reach out to us.&lt;/p&gt;\n&lt;p&gt;Thank you for being a part of our service and for your commitment to excellence.&lt;/p&gt;\n&lt;p&gt;Best regards,&lt;/p&gt;\n&lt;p&gt;[[company_name]]&lt;/p&gt;\n&lt;p&gt;[[company_contact_info]]&lt;/p&gt;', '', '', '[\"provider_name\",\"booking_service_names\",\"booking_date\",\"booking_time\",\"user_name\",\"company_name\",\"company_contact_info\"]'),
(65, 'provider_update_information', 'Provider Update Information', '', '&lt;p&gt;Dear [[company_name]]&lt;/p&gt;\\r\\n&lt;p&gt;I hope this message finds you well.&lt;/p&gt;\\r\\n&lt;p&gt;I wanted to inform you that [Provider Name] has recently updated their details. Please find the updated information below:&lt;/p&gt;\\r\\n&lt;p&gt;Provider ID: [[provider_id]]&lt;/p&gt;\\r\\n&lt;p&gt;[[provider_name]] has taken the initiative to ensure that their information is accurate and up-to-date in our records. If there are any further steps required from our end regarding this update, please let us know.&lt;/p&gt;\\r\\n&lt;p&gt;Thank you for your attention to this matter.&lt;/p&gt;\\r\\n&lt;p&gt;Best regards,&lt;/p&gt;\\r\\n&lt;p&gt;[[company_name]]&lt;/p&gt;\\r\\n&lt;p&gt;[[company_contact_info]]&lt;/p&gt;', '', '', '[\\\"company_name\\\",\\\"provider_id\\\",\\\"provider_name\\\",\\\"company_name\\\",\\\"company_contact_info\\\"]'),
(66, 'new_provider_registerd', 'New Provider Registered', '', '&lt;p&gt;Subject: New Provider Registered&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Dear [[company_name]],&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;I hope this email finds you well.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;I&#039;m pleased to inform you that a new provider has registered with us. Here are the details of the new registration:&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Provider Name:[[provider_name]]&lt;/p&gt;\\r\\n&lt;p&gt;Provider ID:[[provider_id]]&lt;/p&gt;\\r\\n&lt;p&gt;We welcome [[provider_name]] to our platform and look forward to exploring potential collaborations with them. Kindly review the provided information and proceed with the necessary steps to onboard them into our system.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;If you require any further details or assistance regarding this registration, please don&#039;t hesitate to reach out to me.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Thank you for your attention to this matter.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Best regards,&lt;/p&gt;\\r\\n&lt;p&gt;[[company_name]]&lt;/p&gt;\\r\\n&lt;p&gt;[[company_contact_info]]&lt;/p&gt;', '', '', '[\\\"company_name\\\",\\\"provider_name\\\",\\\"provider_id\\\",\\\"provider_name\\\",\\\"company_name\\\",\\\"company_contact_info\\\"]'),
(67, 'withdraw_request_received', 'Withdrawal Request Received', '', '&lt;p&gt;Subject: Withdrawal Request Received&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Dear [[company_name]],&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;I hope this email finds you well.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;I wanted to bring to your attention that we have received a withdrawal request from one of our providers. Here are the details of the request:&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Provider Name: [[provider_name]]&lt;/p&gt;\\r\\n&lt;p&gt;Provider ID:[[provider_id]]&lt;/p&gt;\\r\\n&lt;p&gt;Amount:[[amount]]&lt;/p&gt;\\r\\n&lt;p&gt;Currency:[[currency]]&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Please review this withdrawal request at your earliest convenience and proceed with the necessary steps to process it accordingly. If you need any additional information or assistance, please don&#039;t hesitate to reach out to me.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;Thank you for your attention to this matter.&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\\r\\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;', '', '', '[\\\"company_name\\\",\\\"provider_name\\\",\\\"provider_id\\\",\\\"amount\\\",\\\"currency\\\"]'),
(68, 'new_rating_given_by_customer', ' New Rating Received from a Customer', 'null', '<p><strong>Subject:</strong> New Rating Received from a Customer !</p>\r\n<p><strong>Dear [[provider_name]],</strong></p>\r\n<p>We wanted to let you know that a customer has recently submitted a rating for your service.</p>\r\n<p>To view the details and feedback, please log in to your provider dashboard at your convenience.</p>\r\n<p>Thank you for your continued commitment to providing excellent service!</p>\r\n<p>Best regards,<br />[[company_name]]</p>\r\n<p>[[company_contact_info]]</p>', '', '', '[\"provider_name\",\"company_name\",\"company_contact_info\"]'),
(69, 'rating_request_to_customer', 'We Value Your Feedback – Please Share Your Rating!', 'null', ' <p><strong>Subject:</strong> We Value Your Feedback – Please Share Your Rating!!</p>\r\n<p><strong>Dear [[user_name]],</strong></p>\r\n<p>We hope you enjoyed your recent experience with us!</p>\r\n<p>Your feedback is incredibly important and helps us to continue improving our services. We would greatly appreciate it if you could take a moment to rate your experience by clicking the link below:</p>\r\n<p> </p>\r\n<p>Thank you for your time and for choosing [[provider_name]]. If you have any additional comments or suggestions, please feel free to reply to this email.</p>\r\n<p>Best regards,<br />[[company_name]]<br /><br /></p>', '', '', '[\"user_name\",\"provider_name\",\"company_name\"]');

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` int(60) NOT NULL,
  `customer_id` int(250) DEFAULT NULL,
  `title` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0: Open 1:Close',
  `userType` int(11) NOT NULL COMMENT '0 : Admin\r\n1: Provider\r\n2: customer\r\n',
  `date` date NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `provider_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` mediumtext DEFAULT NULL,
  `answer` mediumtext DEFAULT NULL,
  `status` char(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `status`, `created_at`, `updated_at`) VALUES
(9, 'What is eDemand?', 'eDemand is a multi-vendor on-demand home and doorstep services marketplace platform that comes with a Flutter app and an admin panel.', '1', '2023-03-10 06:50:46', '2023-03-10 06:50:46'),
(10, 'What are the features of eDemand?', 'Some of the features of eDemand include multi-vendor support, multiple categories for services, real-time order tracking, in-app messaging, and payment integration.', '1', '2023-03-10 06:52:06', '2023-03-10 06:52:06'),
(11, 'What is the technology used to build eDemand?', 'eDemand is built using the Flutter framework, which is an open-source mobile application development framework created by Google.', '1', '2023-03-10 06:53:06', '2023-03-10 06:53:06'),
(13, 'Is eDemand easy to use for customers and service providers?', 'Yes, eDemand is designed to be user-friendly for both customers and service providers. The app and admin panel provide clear and intuitive interfaces for managing orders and services.', '1', '2023-03-10 06:54:00', '2023-03-10 06:54:00'),
(14, 'What types of services can be offered on eDemand?', 'eDemand supports a wide range of services, including home cleaning, beauty and wellness, appliance repair, handyman services, and much more.', '1', '2023-03-10 06:54:22', '2023-03-10 06:54:22'),
(15, 'How does eDemand handle payments?', 'eDemand integrates with popular payment gateways such as PayPal and Stripe to handle payments securely and efficiently.', '1', '2023-03-10 06:54:39', '2023-03-10 06:54:39'),
(16, 'Is eDemand scalable for larger marketplaces?', 'Yes, eDemand is built to be scalable and can handle larger marketplaces with multiple vendors and services.', '1', '2023-03-10 06:54:53', '2023-03-10 06:54:53'),
(17, 'What types of services can I book on eDemand?', 'eDemand supports a wide range of services, including home cleaning, beauty and wellness, appliance repair, handyman services, and much more.', '1', '2023-03-10 06:56:35', '2023-03-10 06:56:35'),
(18, 'Can I cancel or reschedule an order on eDemand?', 'Yes, you can cancel or reschedule an order on eDemand as long as you do it within the cancellation/rescheduling policy provided by the service provider.', '1', '2023-03-10 06:57:01', '2023-03-10 06:57:01'),
(19, 'How do I rate and provide feedback on a service provider on eDemand?', 'After your service is completed, you can rate and provide feedback on the service provider through the app. Your feedback can help improve the quality of services provided on the platform.', '1', '2023-03-10 06:57:24', '2023-03-10 06:57:24'),
(20, 'Can I request a specific service provider on eDemand?', 'Yes, you can request a specific service provider on eDemand, but the availability of the service provider will depend on their schedule.', '1', '2023-03-10 06:57:59', '2023-03-10 06:57:59'),
(21, 'Can I book services in advance on eDemand?', 'Yes, you can book services in advance on eDemand by selecting the date and time that works best for you.', '1', '2023-03-10 06:58:22', '2023-03-10 06:58:22'),
(22, 'Can I get a refund for a service on eDemand?', 'Refunds are subject to the cancellation policy of the service provider. You can contact the service provider or customer support to initiate a refund.', '1', '2023-03-10 06:58:40', '2023-03-10 06:58:40');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL COMMENT 'partners | services',
  `type_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'Customers'),
(3, 'partners', 'Service Providing Partners'),
(4, 'superadmin', 'Super Admin');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `is_rtl` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_default` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `code`, `is_rtl`, `created_at`, `is_default`) VALUES
(1, 'English', 'en', 0, '2021-12-25 10:37:11', '1');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2021-12-02-124048', 'App\\Database\\Migrations\\AddProducts', 'default', 'App', 1646388947, 1),
(2, '2021-12-03-040835', 'App\\Database\\Migrations\\Test', 'default', 'App', 1646388947, 1),
(3, '2022-03-25-114504', 'App\\Database\\Migrations\\bank_transfers', 'default', 'App', 1669955348, 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `message` varchar(512) NOT NULL,
  `type` varchar(12) NOT NULL,
  `type_id` varchar(512) NOT NULL DEFAULT '0',
  `image` varchar(128) DEFAULT NULL,
  `order_id` int(50) DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `is_readed` tinyint(1) NOT NULL,
  `notification_type` varchar(50) DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `target` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL DEFAULT 0,
  `city` varchar(252) NOT NULL,
  `total` double NOT NULL,
  `visiting_charges` double NOT NULL DEFAULT 0,
  `promo_code` varchar(64) NOT NULL,
  `promo_discount` double NOT NULL,
  `final_total` double NOT NULL,
  `payment_method` varchar(64) NOT NULL,
  `admin_earnings` double NOT NULL,
  `partner_earnings` double NOT NULL,
  `is_commission_settled` tinyint(1) NOT NULL COMMENT '0: Not settled\r\n1: Settled\r\n',
  `address_id` int(11) NOT NULL,
  `address` varchar(2048) NOT NULL,
  `date_of_service` date NOT NULL,
  `starting_time` time NOT NULL,
  `ending_time` time NOT NULL,
  `duration` varchar(64) NOT NULL COMMENT 'in minutes',
  `status` varchar(64) NOT NULL COMMENT '0. awaiting\r\n1. confirmed\r\n2. rescheduled\r\n3. cancelled\r\n4. completed',
  `remarks` varchar(2048) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `payment_status` int(11) NOT NULL,
  `otp` int(11) DEFAULT NULL,
  `work_started_proof` text DEFAULT NULL,
  `work_completed_proof` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order_latitude` text DEFAULT NULL,
  `order_longitude` text DEFAULT NULL,
  `promocode_id` int(11) DEFAULT NULL,
  `isRefunded` varchar(255) DEFAULT '0',
  `additional_charges` text DEFAULT NULL,
  `payment_status_of_additional_charge` text DEFAULT NULL,
  `total_additional_charge` text DEFAULT NULL,
  `custom_job_request_id` text DEFAULT NULL,
  `payment_method_of_additional_charge` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_services`
--

CREATE TABLE `order_services` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_title` text NOT NULL,
  `tax_percentage` double NOT NULL,
  `tax_amount` double NOT NULL,
  `price` double NOT NULL,
  `discount_price` double NOT NULL,
  `quantity` double NOT NULL,
  `sub_total` double NOT NULL COMMENT 'price X quantity',
  `status` varchar(64) NOT NULL COMMENT '0. awaiting \r\n1. confirmed \r\n2. rescheduled \r\n3. cancelled \r\n4. completed	',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `custom_job_request_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partner_bids`
--

CREATE TABLE `partner_bids` (
  `id` int(11) NOT NULL,
  `partner_id` text NOT NULL,
  `counter_price` text NOT NULL,
  `note` text NOT NULL,
  `duration` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `custom_job_request_id` text NOT NULL,
  `status` text NOT NULL,
  `tax_id` text DEFAULT NULL,
  `tax_amount` text DEFAULT NULL,
  `tax_percentage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partner_details`
--

CREATE TABLE `partner_details` (
  `id` int(11) UNSIGNED NOT NULL,
  `partner_id` int(11) NOT NULL COMMENT 'user_id',
  `company_name` varchar(1024) DEFAULT NULL,
  `about` varchar(4096) NOT NULL,
  `national_id` varchar(1024) DEFAULT NULL,
  `address` varchar(1024) DEFAULT NULL,
  `banner` longtext NOT NULL,
  `address_id` varchar(1024) DEFAULT NULL,
  `passport` varchar(1024) DEFAULT NULL,
  `tax_name` varchar(100) DEFAULT NULL,
  `tax_number` varchar(64) DEFAULT NULL,
  `bank_name` varchar(256) DEFAULT NULL,
  `account_number` varchar(128) NOT NULL,
  `account_name` varchar(512) DEFAULT NULL,
  `bank_code` varchar(256) DEFAULT NULL,
  `swift_code` varchar(256) DEFAULT NULL,
  `advance_booking_days` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - individual | 1 - organization ',
  `number_of_members` int(11) NOT NULL,
  `admin_commission` text NOT NULL COMMENT '[ {"category_id" : "commission"},{...} ]',
  `visiting_charges` int(20) NOT NULL,
  `is_approved` tinyint(1) NOT NULL COMMENT '0. Not approved\r\n1. Approved\r\n7. Trashed',
  `service_range` double DEFAULT NULL,
  `ratings` double NOT NULL DEFAULT 0,
  `number_of_ratings` double NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `other_images` text NOT NULL,
  `long_description` longtext NOT NULL,
  `at_store` int(11) DEFAULT NULL,
  `at_doorstep` int(11) DEFAULT NULL,
  `need_approval_for_the_service` text DEFAULT NULL,
  `chat` varchar(255) NOT NULL DEFAULT '0',
  `pre_chat` varchar(255) NOT NULL DEFAULT '1',
  `custom_job_categories` text DEFAULT NULL,
  `is_accepting_custom_jobs` varchar(255) NOT NULL DEFAULT '1',
  `slug` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partner_details`
--

INSERT INTO `partner_details` (`id`, `partner_id`, `company_name`, `about`, `national_id`, `address`, `banner`, `address_id`, `passport`, `tax_name`, `tax_number`, `bank_name`, `account_number`, `account_name`, `bank_code`, `swift_code`, `advance_booking_days`, `type`, `number_of_members`, `admin_commission`, `visiting_charges`, `is_approved`, `service_range`, `ratings`, `number_of_ratings`, `created_at`, `updated_at`, `other_images`, `long_description`, `at_store`, `at_doorstep`, `need_approval_for_the_service`, `chat`, `pre_chat`, `custom_job_categories`, `is_accepting_custom_jobs`, `slug`) VALUES
(5, 50, 'Electric         ', 'Faulty switches? Shocks and sparks? Circuit overload? Whatever the problem, find the best electrician in Dubai, United Arab Emirates to fix it on the Urban Company app. We understand our customers’ concern about quality and security. Our team ensures that all our electricians are verified, well-experienced, and skilled to handle any electrical job.  Find our professional electrician services in Dubai, United Arab Emirates at affordable cost and thank us later for making your life this easier. You don’t need to worry about bookings because we have made this procedure short and simple. We are just one click away, so you can book for expert electricians in Dubai, United Arab Emirates in one go and have them at your doorstep on the same day.', 'public/backend/assets/national_id/1742965073_53632c1b6d9890b3baa8.jpg', 'Hill View, Hill garden road', 'public/backend/assets/banner/1743418562_4e6ca37dbfa559db7c93.png', 'public/backend/assets/address_id/public/backend/assets/address_id/public/backend/assets/address_id/public/backend/assets/address_id/public/backend/assets/address_id/public/backend/assets/address_id/public/backend/assets/address_id/272779-aadhar-card.avif', 'public/backend/assets/passport/1742965074_548393688f402ecc86fa.jpg', 'HDFC12456', 'G85940T', 'HDFC', '343434', '2147483647', 'HDFC12456', 'zxc', 60, 1, 50, '0', 60, 1, 25, 4.5245901639344, 61, '2022-06-15 23:30:14', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1715745925_1f8a8192e8da04fb6e03.avif\",\"public\\/uploads\\/partner\\/1715745925_ce928a1e05cd061dba3f.avif\",\"public\\/uploads\\/partner\\/1715745925_916962931f9b23fe9a15.jpg\",\"public\\/uploads\\/partner\\/1715745925_338ff2b1d8bc38e1d98a.avif\",\"public\\/uploads\\/partner\\/1715745925_450e34a1f0b2d5cefb9b.jpg\",\"public\\/uploads\\/partner\\/1715745925_4f6721975f3ec89cc7da.jpg\"]', '<p>&nbsp;</p>\r\n<h1 style=\"color: #333; font-size: 32px;\">Your Trusted Electronic Service Provider</h1>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">We Fix, You Relax!</h2>\r\n<p style=\"color: #666; font-size: 18px; margin-top: 20px;\">At our electronic service provider, we take care of all your electronic repair needs with expertise and dedication. Our team of skilled technicians is committed to providing reliable and efficient solutions, so you can sit back, relax, and enjoy your devices without any worries.</p>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Our Services</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Smartphone Repair: From screen replacements to battery replacements, we fix all types of smartphone issues.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Laptop and Computer Repair: Our expert technicians handle laptop and computer repairs, ensuring optimal performance.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> TV and Home Theater Repair: We specialize in repairing TVs, home theaters, and audio systems to enhance your entertainment experience.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Gaming Console Repair: Get back in the game with our reliable gaming console repair services.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Electronic Device Upgrades: We offer upgrade services to help you keep up with the latest technology trends.</li>\r\n</ul>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Why Choose Us?</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Expert Technicians: Our highly skilled technicians possess the knowledge and expertise to handle all types of electronic repairs.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quick Turnaround Time: We strive to provide efficient and prompt service, ensuring minimal downtime for your devices.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quality Parts: We use only high-quality parts and components for repairs, ensuring long-lasting results.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Transparent Pricing: Our pricing is fair and transparent, with no hidden costs or surprises.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Excellent Customer Service: We are committed to providing exceptional customer service, ensuring your satisfaction throughout the repair process.</li>\r\n</ul>\r\n</div>', 1, 1, '0', '1', '1', '[\"272\",\"271\",\"270\",\"269\",\"268\",\"267\",\"265\",\"259\",\"258\",\"257\",\"256\",\"255\",\"254\",\"253\",\"252\",\"251\",\"250\",\"249\",\"248\",\"247\",\"246\",\"245\",\"244\",\"243\",\"242\",\"241\",\"240\",\"239\",\"238\",\"237\",\"236\",\"235\",\"234\",\"232\",\"230\",\"229\",\"228\",\"227\",\"226\",\"225\",\"224\",\"223\",\"222\",\"221\",\"220\",\"218\",\"217\",\"216\",\"215\",\"213\"]', '1', 'electric-1-1-1'),
(6, 138, 'alite', '', '1656325147.', NULL, '', NULL, NULL, 'fgfdg', 'fgfd', 'fgfg', '0', NULL, 'fgfg', 'fgfg', 60, 1, 2, '10', 0, 0, NULL, 0, 0, '2022-06-27 04:49:07', '2022-06-27 15:49:07', '', '', 1, 1, '0', '1', '1', NULL, '1', 'alite'),
(7, 139, 'net', '', '1656325579.jpg', NULL, '', NULL, NULL, 'fgfdg', 'fgfd', 'fgfg', '0', NULL, 'fgfg', 'fgfg', 60, 1, 5, '10', 0, 0, NULL, 0, 0, '2022-06-27 04:56:19', '2022-06-27 15:56:19', '', '', 1, 1, '0', '1', '1', NULL, '1', 'net'),
(8, 140, NULL, '', '1656327732.jpg', NULL, '', NULL, NULL, 'fgfdg', 'fgfd', 'fgfg', '0', NULL, 'fgfg', 'fgfg', 60, 1, 5, '10', 0, 0, NULL, 0, 0, '2022-06-27 05:32:12', '2022-06-27 16:32:12', '', '', 1, 1, '0', '1', '1', NULL, '1', NULL),
(9, 141, NULL, '', '1656328834.jpg', NULL, '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 5, '10', 0, 0, NULL, 0, 0, '2022-06-27 05:50:34', '2022-06-27 16:50:34', '', '', 1, 1, '0', '1', '1', NULL, '1', NULL),
(10, 142, 'Alite services', '', '1656329008.jpg', 'this is testing', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 5, '10', 0, 0, NULL, 0, 0, '2022-06-27 05:53:28', '2022-06-27 16:53:28', '', '', 1, 1, '0', '1', '1', NULL, '1', 'alite-services'),
(11, 143, 'p k beauty parlour', '', '1656329407.jpg', '234,jaynagar', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 2, '10', 0, 0, NULL, 0, 0, '2022-06-27 06:00:07', '2022-06-27 17:00:07', '', '', 1, 1, '0', '1', '1', NULL, '1', 'p-k-beauty-parlour'),
(12, 144, 'Alite services', '', 'dairimillk.png.png', 'this is testing', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 10, '10', 0, 0, NULL, 0, 0, '2022-06-27 06:54:43', '2022-06-27 17:54:43', '', '', 1, 1, '0', '1', '1', NULL, '1', 'alite-services'),
(13, 146, 'lghgkhjk', '', 'anti_hair_fall_spa_kit_2.jpg.jpg', 'this is testing', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 52, '10', 0, 0, NULL, 0, 0, '2022-06-27 06:57:16', '2022-06-27 17:57:16', '', '', 1, 1, '0', '1', '1', NULL, '1', 'lghgkhjk'),
(15, 149, 'lghgkhjk', '', 'anti_hair_fall_spa_kit_2.jpg.jpg', 'this is testing', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 52, '10', 100, 0, NULL, 0, 0, '2022-06-27 07:03:17', '2022-06-27 18:03:17', '', '', 1, 1, '0', '1', '1', NULL, '1', 'lghgkhjk'),
(16, 150, 'nesh services', '', 'download (3).jpg.jpg', 'this is testing', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 0, 5, '10', 100, 0, NULL, 0, 0, '2022-06-27 07:33:27', '2022-06-27 18:33:27', '', '', 1, 1, '0', '1', '1', NULL, '1', 'nesh-services'),
(17, 151, 'Alite services', '', 'anti_hair_fall_spa_kit_2.jpg.jpg', '234,jaynagar', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 5, '10', 100, 0, NULL, 0, 0, '2022-06-28 04:40:13', '2022-06-28 15:40:13', '', '', 1, 1, '0', '1', '1', NULL, '1', 'alite-services'),
(18, 152, 'Alite services', '', 'anti_hair_fall_spa_kit_1.jpg.jpg', 'this is testing', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 0, 0, '10', 100, 0, NULL, 0, 0, '2022-06-28 04:42:49', '2022-06-28 15:42:49', '', '', 1, 1, '0', '1', '1', NULL, '1', 'alite-services'),
(19, 153, 'pp k beauty parlour', '', 'download (2).jpg.jpg', '234,jaynagar', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 5, '10', 100, 0, NULL, 0, 0, '2022-06-29 00:01:55', '2022-06-29 11:01:55', '', '', 1, 1, '0', '1', '1', NULL, '1', 'pp-k-beauty-parlour'),
(20, 154, 'l k beauty parlour', '', 'anti_hair_fall_spa_kit_1.jpg.jpg', '234,jaynagar', '', NULL, NULL, 'thgjh153', 'hj564k6', 'bank of baroda', '54', NULL, '52142', '544fhg', 60, 1, 5, '10', 215, 0, NULL, 0, 0, '2022-06-29 00:35:54', '2022-06-29 11:35:54', '', '', 1, 1, '0', '1', '1', NULL, '1', 'l-k-beauty-parlour'),
(24, 160, 'apple hair cut vale', '', '5.jpg.jpg', NULL, '', NULL, NULL, 'dfe', 'sds', 'sdwr', '0', NULL, 'asd', 'sas f', 60, 0, 0, '10', 100, 0, NULL, 0, 0, '2022-07-12 05:42:52', '2022-07-12 16:42:52', '', '', 1, 1, '0', '1', '1', NULL, '1', 'apple-hair-cut-vale'),
(26, 166, 'Infinite Technologies', '', '6.jpg.jpg', NULL, '', NULL, NULL, '123', '456', '789', '789', NULL, '456', '147', 60, 1, 15, '10', 1000, 0, NULL, 0, 0, '2022-07-19 01:48:55', '2022-07-19 12:48:55', '', '', 1, 1, '0', '1', '1', NULL, '1', 'infinite-technologies'),
(30, 187, 'test', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, 60, 0, 0, '10', 0, 0, NULL, 0, 0, '2022-11-01 07:16:54', '0000-00-00 00:00:00', '', '', 1, 1, '0', '1', '1', NULL, '1', 'test'),
(32, 194, 'test partner', '', 'sandwich.png.png', NULL, '', NULL, NULL, 'gst', 'gst12345', 'axis', '2147483647', NULL, '1525', '56156', 60, 0, 0, '10', 100, 0, NULL, 0, 0, '2022-11-04 05:41:23', '0000-00-00 00:00:00', '', '', 1, 1, '0', '1', '1', NULL, '1', 'test-partner'),
(42, 204, 'Electric', 'Whatever the problem, find the best electrician in World, We understand our customers’ concern about quality and security. Our team ensures that all our electricians are verified, well-experienced, and skilled to handle any electrical job.\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\nFind our professional electrician services in eDemand App, You don’t need to worry about bookings because we have made this procedure short and simple. We are just one click away, so you can book for expert electricians in India, eDemand in one go and have them at your doorstep on the same day', 'download.jpg.jpg', 'Electric Point', 'public/backend/assets/banner/1668492390_65a23c3d746c54bddf35_1.jpg', NULL, NULL, '370001', '12ABCDE3456FGZH', 'BOB', '2147483647', 'test', '370001', '00', 60, 0, 0, '10', 10, 0, NULL, 0, 0, '2022-11-04 07:05:08', '0000-00-00 00:00:00', '', '<p>&nbsp;</p>\r\n<h1 style=\"color: #333; font-size: 32px;\">Your Trusted Electronic Service Provider</h1>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">We Fix, You Relax!</h2>\r\n<p style=\"color: #666; font-size: 18px; margin-top: 20px;\">At our electronic service provider, we take care of all your electronic repair needs with expertise and dedication. Our team of skilled technicians is committed to providing reliable and efficient solutions, so you can sit back, relax, and enjoy your devices without any worries.</p>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Our Services</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Smartphone Repair: From screen replacements to battery replacements, we fix all types of smartphone issues.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Laptop and Computer Repair: Our expert technicians handle laptop and computer repairs, ensuring optimal performance.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> TV and Home Theater Repair: We specialize in repairing TVs, home theaters, and audio systems to enhance your entertainment experience.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Gaming Console Repair: Get back in the game with our reliable gaming console repair services.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Electronic Device Upgrades: We offer upgrade services to help you keep up with the latest technology trends.</li>\r\n</ul>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Why Choose Us?</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Expert Technicians: Our highly skilled technicians possess the knowledge and expertise to handle all types of electronic repairs.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quick Turnaround Time: We strive to provide efficient and prompt service, ensuring minimal downtime for your devices.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quality Parts: We use only high-quality parts and components for repairs, ensuring long-lasting results.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Transparent Pricing: Our pricing is fair and transparent, with no hidden costs or surprises.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Excellent Customer Service: We are committed to providing exceptional customer service, ensuring your satisfaction throughout the repair process.</li>\r\n</ul>\r\n</div>', 1, 1, '0', '1', '1', NULL, '1', 'electric'),
(98, 260, 'StormBrand   ', 'Whatever the problem, find the best electrician in World, We understand our customers’ concern about quality and security. Our team ensures that all our electricians are verified, well-experienced, and skilled to handle any electrical job.\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\nFind our professional electrician services in eDemand App, You don’t need to worry about bookings because we have made this procedure short and simple. We are just one click away, so you can book for expert electricians in India, eDemand in one go and have them at your doorstep on the same day', 'public/backend/assets/national_id/2 WRT-Logo-new 1024 x 1024.jpg', 'Saket District Centre, Sector 6, Pushp Vihar, New Delhi', 'public/backend/assets/banner/1743499323_6b6c62ad1c4f63dd2213.png', 'public/backend/assets/address_id/2 WRT-Logo-new 1024 x 1024.jpg', 'public/backend/assets/passport/2 WRT-Logo-new 1024 x 1024.jpg', '4526', '15236658768', 'bob', '2147483647', 'test', '4526', '4563', 60, 1, 10, '0', 200, 1, NULL, 4.5555555555556, 9, '2022-11-07 01:59:11', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1743506195_b348e64df6379f312472.jpg\",\"public\\/uploads\\/partner\\/1743506195_7c8fc85704f8c26356e1.jpg\",\"public\\/uploads\\/partner\\/1743506195_c6ec8ef3765f04f9b4a1.jpg\",\"public\\/uploads\\/partner\\/1743506195_44b8fa6d5b4cea0cb648.jpg\"]', '<p>&nbsp;</p>\r\n<h1 style=\"color: #333; font-size: 32px;\">Your Trusted Electronic Service Provider</h1>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">We Fix, You Relax!</h2>\r\n<p style=\"color: #666; font-size: 18px; margin-top: 20px;\">At our electronic service provider, we take care of all your electronic repair needs with expertise and dedication. Our team of skilled technicians is committed to providing reliable and efficient solutions, so you can sit back, relax, and enjoy your devices without any worries.</p>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Our Services</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Smartphone Repair: From screen replacements to battery replacements, we fix all types of smartphone issues.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Laptop and Computer Repair: Our expert technicians handle laptop and computer repairs, ensuring optimal performance.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> TV and Home Theater Repair: We specialize in repairing TVs, home theaters, and audio systems to enhance your entertainment experience.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Gaming Console Repair: Get back in the game with our reliable gaming console repair services.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Electronic Device Upgrades: We offer upgrade services to help you keep up with the latest technology trends.</li>\r\n</ul>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Why Choose Us?</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Expert Technicians: Our highly skilled technicians possess the knowledge and expertise to handle all types of electronic repairs.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quick Turnaround Time: We strive to provide efficient and prompt service, ensuring minimal downtime for your devices.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quality Parts: We use only high-quality parts and components for repairs, ensuring long-lasting results.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Transparent Pricing: Our pricing is fair and transparent, with no hidden costs or surprises.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Excellent Customer Service: We are committed to providing exceptional customer service, ensuring your satisfaction throughout the repair process.</li>\r\n</ul>\r\n</div>', 1, 1, '0', '1', '1', '[252,253,270]', '1', 'stormbrand-1'),
(100, 263, 'PlumbService Pvt Ltd      ', 'Welcome to our Expert Plumbing Services! With a dedicated team of skilled plumbers, we provide reliable solutions for all your plumbing needs, ensuring peace of mind and optimal functionality.', 'public/backend/assets/national_id/credit-card.png.png', 'Time Square Empire', 'public/backend/assets/banner/1743420603_7ebdd08d0d7abafb0578.png', '', 'public/backend/assets/passport/1743420416_4ce5ef08ab1221f94be8.png', '452652', '15236658722', 'bob', '2147483647', 'test', '452652', '526389', 60, 0, 0, '0', 50, 1, NULL, 5, 5, '2022-11-07 05:01:39', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1743502838_3d6f75b28fe23ff8a9b6.jpg\",\"public\\/uploads\\/partner\\/1743502838_2f8f755a814db06d20b2.jpg\",\"public\\/uploads\\/partner\\/1743502838_1010bc96d2daaf6ff6c8.jpg\",\"public\\/uploads\\/partner\\/1743502838_14a0029df1ea549d22a3.jpg\"]', '<p>test</p>', 1, 1, '0', '1', '1', '[240]', '1', 'plumbservice-pvt-ltd-1-1-1-1-1-1'),
(107, 270, 'Piston Car Service             ', 'We provide a 12 month/10,000 KM warranty with every car service. Whether you choose to buy genuine or aftermarket parts from us, both come with a hassle-free warranty policy. The labor is also covered under the warranty.', 'public/backend/assets/national_id/1743424630_ed3f200b27e42706c1af.png', 'Katira Complex, 8/a, Sanskar Nagar, Bhuj, Gujarat 370001', 'public/backend/assets/banner/1743425008_e0ddaefc6ddef8077f53.png', 'public/backend/assets/address_id/1743424630_9f82a3bd6ecef2028b47.png', 'public/backend/assets/passport/1743424630_b2f0e16eebb207059909.png', '7356771', 'Z645-5081-7851', 'Bank', '2147483647', 'amarik', '7356771', '100007', 60, 0, 0, '0', 20, 1, NULL, 5, 6, '2022-11-07 22:47:16', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1743502488_87b7b5e70e7e0bd8f70d.jpg\",\"public\\/uploads\\/partner\\/1743502488_36e1b41ee6a1df783e39.jpg\",\"public\\/uploads\\/partner\\/1743502488_de823f083d06178632f5.jpg\",\"public\\/uploads\\/partner\\/1743502488_af735562ae82fbc8235a.jpg\"]', '', 1, 1, '0', '1', '1', '[228,230,232,259]', '1', 'piston-car-service-1-1-1-1-1-1-1-1-1'),
(108, 271, 'World Clean Pvt Ltd', '', 'passport.jpg.jpg', NULL, 'public/uploads/users/partners/banner_images/004 World Clean Pvt Ltd-min.jpg', NULL, NULL, 'GST', 'Y114-7129-6149', 'Bank of India.', '2147483647', NULL, '9256086', '100008', 60, 1, 20, '10', 20, 0, NULL, 0, 0, '2022-11-07 23:53:59', '0000-00-00 00:00:00', '', '', 1, 1, '0', '1', '1', NULL, '1', 'world-clean-pvt-ltd'),
(110, 273, 'QUB Saloon      ', 'Welcome to our Barber Shop! We provide high-quality grooming services delivered by skilled barbers for all your hair and grooming needs.', 'public/backend/assets/national_id/public/backend/assets/national_id/1742898685_b0becaf12d7b4e32a90f.jpg', 'Time Square Empire', 'public/backend/assets/banner/1742898702_c52c5dec78805de28e8c.jpg', 'public/backend/assets/address_id/public/backend/assets/address_id/1742898685_7d450d37b4c64e213013.jpg', 'public/backend/assets/passport/public/backend/assets/passport/1742898685_057ed2763dcced19d2c3.jpg', '257366290', 'Z096-3784-4340', 'Bank', '2147483647', 'test', '257366290', '100009', 60, 0, 0, '0', 30, 1, NULL, 5, 14, '2022-11-08 01:06:44', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1688729464_4a6a5c5b831f64629697.jpg\",\"public\\/uploads\\/partner\\/1688729464_c6d6bacd9b90f646e008.jpg\",\"public\\/uploads\\/partner\\/1688729464_cf3b01c63d7c63065093.jpg\",\"public\\/uploads\\/partner\\/1688729464_fb0a7440fc83b46df859.jpg\"]', '<h1>Welcome to our Barber Shop</h1>\r\n<h2>About Us</h2>\r\n<p>At our barber shop, we are dedicated to providing high-quality grooming services to our valued customers. With years of experience in the industry, our skilled barbers are committed to delivering exceptional haircuts, styling, and grooming treatments.</p>\r\n<h2>Services Offered</h2>\r\n<ul>\r\n<li>Haircuts: Our expert barbers are trained in various haircut styles, catering to your preferences and ensuring a tailored look that suits your individuality.</li>\r\n<li>Beard Trimming: We offer precise beard trims, shaping, and grooming, helping you maintain a well-groomed and stylish beard.</li>\r\n<li>Shaving: Experience a traditional straight razor shave for a smooth and refreshing finish, accompanied by soothing hot towels and high-quality grooming products.</li>\r\n<li>Hairstyling: From classic to modern styles, our barbers are skilled in creating versatile and trendy looks, ensuring you leave our shop feeling confident.</li>\r\n<li>Facial Treatments: Pamper yourself with our rejuvenating facial treatments designed to cleanse, nourish, and revitalize your skin.</li>\r\n</ul>\r\n<h2>Why Choose Us</h2>\r\n<p>When you choose our barber shop, you can expect:</p>\r\n<ul>\r\n<li>Experienced and Skilled Barbers: Our team of barbers is experienced, highly trained, and passionate about delivering the best grooming services.</li>\r\n<li>Attention to Detail: We pay meticulous attention to detail, ensuring precision and accuracy in every service we provide.</li>\r\n<li>Relaxing Atmosphere: Enjoy a welcoming and comfortable environment where you can sit back, relax, and unwind during your grooming session.</li>\r\n<li>Quality Products: We use only the finest grooming products, ensuring that you receive exceptional results and care for your hair and skin.</li>\r\n<li>Excellent Customer Service: Our friendly and professional staff is dedicated to providing excellent customer service, making your experience with us memorable.</li>\r\n</ul>\r\n<p>&nbsp;</p>', 1, 1, '0', '1', '1', '[265,267,268]', '1', 'qub-saloon'),
(117, 283, 'Woodwork Carpentry                ', '', 'public/backend/assets/national_id/1742972777_2e385f89c9900370d902.jpg', 'Time Square Empire', 'public/backend/assets/banner/1743409652_ec5845981471ad621e7e.png', 'public/backend/assets/address_id/1742972777_51e66dbb2febb5feeea9.jpg', 'public/backend/assets/passport/1742972777_dd23408ff9db2e23f29a.jpg', '9484163', 'F104-5916-2416', 'Canara', '2147483647', 'Woodwork', '9484163', '100010', 60, 1, 10, '0', 20, 1, NULL, 5, 6, '2022-11-08 05:31:16', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1743503407_e6d016cfaed5816d33ed.jpg\",\"public\\/uploads\\/partner\\/1743503407_a2b3ad9e2490a64695a8.jpg\",\"public\\/uploads\\/partner\\/1743503407_704093e5183ef9a940dd.jpg\",\"public\\/uploads\\/partner\\/1743503407_52a520fceba58bce3a11.jpg\",\"public\\/uploads\\/partner\\/1743503407_8e971397b459e750877f.jpg\"]', '', 1, 1, '0', '1', '1', '[270]', '1', 'woodwork-carpentry-1-1-1-1-1-1-1-1-1'),
(118, 293, 'World Clean Pvt. Ltd.       ', 'Welcome to our Cleaning Service! We offer top-notch cleaning solutions delivered by our professional team, ensuring a spotless and sanitized environment for your utmost satisfaction.', 'public/backend/assets/national_id/public/backend/assets/national_id/public/backend/assets/national_id/04 World Clean Pvt Ltd.jpg.jpg', 'Dubai Hills Estate, Dubai, United Arab Emirates', 'public/backend/assets/banner/1739449302_89a5494ad04597f57943.png', 'public/backend/assets/address_id/public/backend/assets/address_id/public/backend/assets/address_id/', 'public/backend/assets/passport/public/backend/assets/passport/public/backend/assets/passport/', '9256086', 'Y114-7129-6149', 'Bank', '2147483647', 'World', '9256086', '100008', 60, 0, 0, '0', 25, 1, NULL, 5, 8, '2022-11-08 23:41:30', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1707736648_7f09a5114b807357bc92.jpg\",\"public\\/uploads\\/partner\\/1707736648_e22320db4bc60631e32b.jpg\",\"public\\/uploads\\/partner\\/1707736648_501a361309c8b7a085f9.jpg\",\"public\\/uploads\\/partner\\/1707736648_1837b87c384dc7858a02.jpg\"]', '<header>\r\n<h1>Welcome to our Cleaning Service</h1>\r\n</header><main>\r\n<section>\r\n<h2>About Us</h2>\r\n<p>At our cleaning service, we are dedicated to providing exceptional cleaning solutions to our valued customers. With a team of highly trained professionals, we ensure thorough cleanliness and a fresh environment in every space we clean.</p>\r\n</section>\r\n<section>\r\n<h2>Our Services</h2>\r\n<ul>\r\n<li>Residential Cleaning: From apartments to houses, we offer comprehensive cleaning services to make your home sparkle and shine.</li>\r\n<li>Commercial Cleaning: We specialize in cleaning offices, retail spaces, and commercial establishments, ensuring a clean and hygienic workspace for your employees and customers.</li>\r\n<li>Deep Cleaning: Our deep cleaning services tackle those hard-to-reach areas, eliminating dirt, grime, and allergens for a thorough and healthy clean.</li>\r\n<li>Move-in/Move-out Cleaning: Whether you\'re moving in or out of a property, we provide detailed cleaning services to ensure a fresh start or leave the space in pristine condition.</li>\r\n<li>Specialized Cleaning: We offer specialized cleaning solutions for specific needs, such as carpet cleaning, window cleaning, and post-construction cleaning.</li>\r\n</ul>\r\n</section>\r\n<section>\r\n<h2>Why Choose Us</h2>\r\n<ul>\r\n<li>Experienced Professionals: Our cleaning team consists of experienced and trained professionals who deliver exceptional results.</li>\r\n<li>Quality Cleaning Products: We use high-quality, eco-friendly cleaning products that are safe for your space and the environment.</li>\r\n<li>Attention to Detail: We pay meticulous attention to detail, ensuring no corner is left untouched and providing a thorough cleaning experience.</li>\r\n<li>Flexible Scheduling: We offer flexible scheduling options to accommodate your specific cleaning needs and preferences.</li>\r\n<li>Customer Satisfaction: Your satisfaction is our top priority, and we strive to exceed your expectations with our excellent service.</li>\r\n</ul>\r\n</section>\r\n<section></section>\r\n</main>', 1, 1, '0', '1', '1', '[213,215,216,217,218,238,270]', '1', 'world-clean-pvt.-ltd.-------'),
(119, 297, 'Pestguard pvt ltd   ', 'PestGuard Services: Your trusted solution for effective pest control, providing extermination, termite control, rodent exclusion, bed bug treatment, and mosquito control. Enjoy a pest-free environment with our professional team.', 'public/backend/assets/national_id/07 Pestguard pvt ltd-min.jpg.jpg', 'Hill view near', 'public/backend/assets/banner/1743495510_aee9617ac296529b2c57.png', 'public/backend/assets/address_id/', 'public/backend/assets/passport/', '4737195', 'D509-0597-6171', 'Central', '2147483647', 'Pestguard', '4737195', '100011', 60, 0, 0, '0', 20, 1, NULL, 5, 2, '2022-11-09 00:23:22', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1688732428_fb0ab5cbd57d045eb84e.jpg\",\"public\\/uploads\\/partner\\/1688732428_871e9bf5d0e41f4939ef.jpg\",\"public\\/uploads\\/partner\\/1688732428_3c61692895016a57668e.jpg\",\"public\\/uploads\\/partner\\/1688732428_6cc2549134d5465d934d.jpg\"]', '<h1 style=\"color: #007bff; font-size: 20px;\">PestGuard Services</h1>\r\n<table style=\"width: 100%; margin-top: 40px; border-collapse: collapse;\">\r\n<tbody>\r\n<tr>\r\n<th style=\"color: #007bff; font-size: 14px; padding: 10px;\">Services</th>\r\n<th style=\"color: #007bff; font-size: 14px; padding: 10px;\">Benefits</th>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Pest Extermination</td>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Say goodbye to pests! Our experts will identify and eliminate a wide range of pests, including ants, cockroaches, spiders, and more. We use safe and effective pest control methods to ensure a pest-free environment.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Termite Control</td>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Protect your property from costly termite damage. Our specialized termite control treatments include inspection, prevention, and extermination methods to safeguard your structure. We use advanced techniques and environmentally friendly products to ensure long-lasting termite control solutions.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Rodent Exclusion</td>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Don\'t let rodents invade your space! Our comprehensive rodent exclusion measures will identify entry points, seal off access, and implement effective trapping and removal techniques. We provide long-term solutions to keep your property rodent-free.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Bed Bug Treatment</td>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Sleep soundly without bed bugs. Our professional bed bug treatments target bed bug infestations, eliminating these pests at all life stages. We employ a combination of heat treatment, chemical treatment, and thorough inspections to ensure complete eradication.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Mosquito Control</td>\r\n<td style=\"color: #333; font-size: 12px; padding: 10px;\">Enjoy your outdoor space without the nuisance of mosquitoes. Our mosquito control services focus on targeted treatments and preventive measures to reduce mosquito populations and minimize the risk of mosquito-borne diseases.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"color: #333; font-size: 12px; margin-top: 40px;\">Experience reliable pest control solutions with our professional PestGuard services. Our team of experts will exterminate pests, protect against termites, exclude rodents, eliminate bed bugs, and control mosquitoes. Say goodbye to pests and enjoy a pest-free environment with PestGuard!</p>\r\n<h2 style=\"color: #007bff; font-size: 20px; margin-top: 40px;\">Why Choose PestGuard?</h2>\r\n<ul style=\"color: #333; font-size: 12px; text-align: left; margin-left: 40px;\">\r\n<li>Experienced Professionals: Our team consists of highly trained and licensed technicians who have extensive knowledge in pest control and management.</li>\r\n<li>Customized Solutions: We understand that every pest situation is unique. Our experts provide tailored solutions to address your specific needs and effectively eliminate pests.</li>\r\n<li>Safe and Eco-Friendly: We prioritize the safety of your family, pets, and the environment. Our pest control methods are eco-friendly and adhere to strict safety standards.</li>\r\n<li>Guaranteed Results: We stand behind the quality of our services. If pests return within the specified warranty period, we will re-treat your property at no additional cost.</li>\r\n<li>Excellent Customer Service: We value our customers and strive to deliver exceptional service. Our friendly and knowledgeable staff is ready to assist you with any inquiries or concerns.</li>\r\n</ul>', 1, 1, '0', '1', '1', '[246,247,248,249,250,251]', '1', 'pestguard-pvt-ltd-1'),
(120, 298, 'Plumbhelp  Pvt Ltd    ', 'Welcome to our Expert Plumbing Services! With a dedicated team of skilled plumbers, we provide reliable solutions for all your plumbing needs, ensuring peace of mind and optimal functionality.', 'public/backend/assets/national_id/PLUMBING.jpg.jpg', 'Time Square Empire', 'public/backend/assets/banner/1743418986_a01615c86018888e3c24.png', 'public/backend/assets/address_id/', 'public/backend/assets/passport/', '852963', 'ED984-4972-810', 'bob', '2147483647', 'test', '852963', '321000', 60, 0, 0, '0', 20, 1, NULL, 5, 1, '2022-11-09 01:11:15', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1743505998_48e54ff1e6e854bc5e63.jpg\",\"public\\/uploads\\/partner\\/1743505998_555deebfbfc3b84db8c3.jpg\",\"public\\/uploads\\/partner\\/1743505998_412962feac328ce2bb92.jpg\",\"public\\/uploads\\/partner\\/1743505998_bb249e627a1a311c9903.jpg\"]', '<p>tes]</p>', 1, 1, '0', '1', '1', '[240,241,242]', '1', 'plumbhelp-pvt-ltd-1'),
(121, 301, 'TeamWork Gourp of Comapny   ', 'At TeamWork Gourp of Comapny, we provide reliable and efficient solutions for all your air conditioning needs. With our team of experienced technicians, we offer professional AC installation, repair, and maintenance services. Stay cool and comfortable year-round with our top-notch AC services.', 'public/backend/assets/national_id/handsome-guy-posing-gray-wall.jpg.jpg', 'Time Square Empire', 'public/backend/assets/banner/1743420408_6473c90f245139e5c73e.png', '', '', '2729248', 'D984-4972-8105', 'Bank', '2147483647', 'test', '2729248', '100015', 60, 0, 0, '0', 30, 1, NULL, 5, 2, '2022-11-09 04:27:25', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1743506539_233631b88d0ab17b1f53.jpg\",\"public\\/uploads\\/partner\\/1743506539_e9028c9b8c314e40e1b5.jpg\",\"public\\/uploads\\/partner\\/1743506539_99c9eadcb81baf970ab9.jpg\",\"public\\/uploads\\/partner\\/1743506539_66ab431db37a74569ea1.jpg\"]', '<h1 style=\"color: #333; font-size: 32px;\">AC Services</h1>\r\n<table style=\"width: 100%; margin-top: 40px; border-collapse: collapse;\">\r\n<tbody>\r\n<tr>\r\n<th style=\"color: #333; font-size: 24px; padding: 10px;\">Services</th>\r\n<th style=\"color: #333; font-size: 24px; padding: 10px;\">Benefits</th>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #666; font-size: 18px; padding: 10px;\">AC Installation</td>\r\n<td style=\"color: #666; font-size: 18px; padding: 10px;\">Experience the comfort of a perfectly installed AC system tailored to your needs.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #666; font-size: 18px; padding: 10px;\">AC Repair</td>\r\n<td style=\"color: #666; font-size: 18px; padding: 10px;\">Trust our skilled technicians to diagnose and fix any AC issues, restoring optimal cooling performance.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #666; font-size: 18px; padding: 10px;\">AC Maintenance</td>\r\n<td style=\"color: #666; font-size: 18px; padding: 10px;\">Keep your AC system running efficiently and extend its lifespan with our regular maintenance services.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"color: #666; font-size: 18px; padding: 10px;\">Emergency AC Service</td>\r\n<td style=\"color: #666; font-size: 18px; padding: 10px;\">We\'re available 24/7 to provide immediate assistance when you need it the most.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"color: #666; font-size: 18px; margin-top: 40px;\">Experience reliable cooling solutions with our professional AC services. Our team of experienced technicians ensures top-notch installation, repair, and maintenance, keeping you comfortable all year round. Don\'t sweat it, trust us for your AC needs!</p>', 1, 1, '0', '1', '1', '[221]', '1', 'teamwork-gourp-of-comapny-1-1-1'),
(123, 303, 'DlyingData Multi-Services   ', 'Your convenient solution for professional laundry care. We offer wash & fold, dry cleaning, and ironing services with quality and reliability. Experience exceptional results and hassle-free laundry with us.', 'public/backend/assets/national_id/young-woman-with-rubber-gloves-ready-clean (2).jpg.jpg', 'Time Square Empire', 'public/backend/assets/banner/1743425487_232497e7c78527048e55.png', '', '', '6046-18-5173', 'X654-7478-4144', 'Indian', '2147483647', 'test', '6046-18-5173', '100013', 60, 0, 0, '0', 20, 1, NULL, 5, 3, '2022-11-09 05:36:38', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1743506880_81150db2cd3e8622efe9.jpg\",\"public\\/uploads\\/partner\\/1743506880_1cecf95f920b7e4a1b76.jpg\",\"public\\/uploads\\/partner\\/1743506880_6e0b6625ffb54deaa200.jpg\",\"public\\/uploads\\/partner\\/1743506880_8c7b90c44c908f2e7306.jpg\"]', '<h2 style=\"color: #666; font-size: 24px; margin-top: 40px;\">Professional Laundry Solutions for Your Convenience</h2>\r\n<p style=\"color: #666; font-size: 18px; margin-top: 20px;\">At DlyingData Multi-Services, we offer professional laundry solutions to make your life easier. With our commitment to quality and customer satisfaction, we provide convenient and reliable laundry services for individuals and businesses alike.</p>\r\n<h2 style=\"color: #666; font-size: 24px; margin-top: 40px;\">Our Services</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px; text-align: left;\">\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Wash &amp; Fold Service: Leave your laundry worries behind as we take care of washing, drying, and folding your clothes with precision and care. Enjoy clean and neatly folded garments delivered right to your doorstep.</li>\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Dry Cleaning: Trust our expert dry cleaners to handle your delicate fabrics and garments that require specialized care. We use advanced techniques and quality solvents to ensure your clothes look and feel their best.</li>\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Ironing Service: Say goodbye to wrinkled clothes with our professional ironing service. Our skilled team will iron and press your garments to perfection, giving them a crisp and polished appearance.</li>\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Stain Removal: Let us handle those stubborn stains. Our experienced staff utilizes effective stain removal techniques to tackle even the toughest stains, ensuring your clothes are fresh and spotless.</li>\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Alterations &amp; Repairs: Need a quick fix or alteration? Our skilled tailors provide alteration and repair services, ensuring your clothes fit perfectly and are in excellent condition.</li>\r\n</ul>\r\n<h2 style=\"color: #666; font-size: 24px; margin-top: 40px;\">Why Choose Us?</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px; text-align: left;\">\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Quality Service: We take pride in delivering exceptional quality and attention to detail in every laundry service we provide. Your satisfaction is our top priority.</li>\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Convenience: Enjoy the convenience of our pickup and delivery service, saving you time and effort. We ensure prompt and reliable service right at your doorstep.</li>\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Skilled Team: Our team consists of experienced laundry professionals who handle your clothes with care and expertise, using the latest techniques and equipment.</li>\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Competitive Pricing: We offer competitive and transparent pricing, ensuring that you receive excellent value for the quality laundry services we provide.</li>\r\n<li style=\"color: #666; font-size: 18px;\"><span style=\"color: #00b894; font-size: 16px;\">✓</span> Eco-Friendly Practices: We are committed to environmental sustainability. Our laundry processes incorporate eco-friendly practices and detergents for a greener approach.</li>\r\n</ul>', 1, 1, '0', '1', '1', '[222,235,236]', '1', 'dlyingdata-multi-services-1-1-1'),
(137, 327, 'Big Brand Electronic Service        ', 'Whatever the problem, find the best electrician in World, We understand our customers’ concern about quality and security. Our team ensures that all our electricians are verified, well-experienced, and skilled to handle any electrical job.Find our professional electrician services in eDemand App, You don’t need to worry about bookings because we have made this procedure short and simple. We are just one click away, so you can book for expert electricians in India, eDemand in one go and have them at your doorstep on the same day', 'public/backend/assets/national_id//public/uploads/users/national_id/location.png.png', 'Big Brand  service, Haripar road Bhuj-Kutch-370001', 'public/backend/assets/banner/1743423414_1aadc8e01c41aa8baeea.png', '', 'public/backend/assets/passport//public/uploads/users/passport/1668492390.png', '9256086', '15236658768', 'bob', '2147483647', 'Asutosh', '9256086', '100008', 60, 0, 0, '0', 20, 1, NULL, 5, 1, '2022-11-15 00:36:30', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1743507056_def2acd807fc0c316fe2.jpg\",\"public\\/uploads\\/partner\\/1743507056_3dd1893cb0aaa10de090.jpg\",\"public\\/uploads\\/partner\\/1743507056_d4e2ec0dd22aad1295ae.jpg\"]', '<p>&nbsp;</p>\r\n<h1 style=\"color: #333; font-size: 32px;\">Your Trusted Electronic Service Provider</h1>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">We Fix, You Relax!</h2>\r\n<p style=\"color: #666; font-size: 18px; margin-top: 20px;\">At our electronic service provider, we take care of all your electronic repair needs with expertise and dedication. Our team of skilled technicians is committed to providing reliable and efficient solutions, so you can sit back, relax, and enjoy your devices without any worries.</p>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Our Services</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Smartphone Repair: From screen replacements to battery replacements, we fix all types of smartphone issues.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Laptop and Computer Repair: Our expert technicians handle laptop and computer repairs, ensuring optimal performance.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> TV and Home Theater Repair: We specialize in repairing TVs, home theaters, and audio systems to enhance your entertainment experience.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Gaming Console Repair: Get back in the game with our reliable gaming console repair services.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Electronic Device Upgrades: We offer upgrade services to help you keep up with the latest technology trends.</li>\r\n</ul>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Why Choose Us?</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Expert Technicians: Our highly skilled technicians possess the knowledge and expertise to handle all types of electronic repairs.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quick Turnaround Time: We strive to provide efficient and prompt service, ensuring minimal downtime for your devices.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quality Parts: We use only high-quality parts and components for repairs, ensuring long-lasting results.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Transparent Pricing: Our pricing is fair and transparent, with no hidden costs or surprises.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Excellent Customer Service: We are committed to providing exceptional customer service, ensuring your satisfaction throughout the repair process.</li>\r\n</ul>\r\n</div>', 1, 1, '0', '1', '1', '[252,253,254,255]', '1', 'big-brand-electronic-service-1'),
(139, 360, 'test', '', 'public/uploads/users/national_id/sport.png', NULL, '', NULL, 'public/uploads/users/passport/sport_2.png', 'gst', 'gdsyfsdf', '', '0', '', '', '', 60, 1, 2, '10', 50, 0, NULL, 0, 0, '2022-12-02 02:00:17', '0000-00-00 00:00:00', '', '', 1, 1, '0', '1', '1', NULL, '1', 'test'),
(143, 556, 'wrteam', 'xvbn hnznnsjjs', '', 'cvbns', 'public/backend/assets/banner/image_picker439744776022053418.jpg', '', '', 'zhhhs', '794997', 'hdfc', '6699884964949', 'zcnnjjns njs', 'hdfc001', 'bbbb', 60, 1, 5, '10', 10, 0, NULL, 0, 0, '2023-03-13 01:51:02', '0000-00-00 00:00:00', '', '', 1, 1, '0', '1', '1', NULL, '1', 'wrteam');

-- --------------------------------------------------------

--
-- Table structure for table `partner_subscriptions`
--

CREATE TABLE `partner_subscriptions` (
  `subscription_id` text NOT NULL,
  `status` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `is_payment` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `duration` text NOT NULL,
  `price` text NOT NULL,
  `discount_price` text NOT NULL,
  `publish` text DEFAULT NULL,
  `order_type` text NOT NULL,
  `max_order_limit` text DEFAULT NULL,
  `service_type` text NOT NULL,
  `max_service_limit` text DEFAULT NULL,
  `tax_type` text NOT NULL,
  `tax_id` text NOT NULL,
  `is_commision` text NOT NULL,
  `commission_threshold` text DEFAULT NULL,
  `commission_percentage` text DEFAULT NULL,
  `transaction_id` text DEFAULT NULL,
  `tax_percentage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partner_subscriptions`
--

INSERT INTO `partner_subscriptions` (`subscription_id`, `status`, `created_at`, `updated_at`, `is_payment`, `id`, `partner_id`, `purchase_date`, `expiry_date`, `name`, `description`, `duration`, `price`, `discount_price`, `publish`, `order_type`, `max_order_limit`, `service_type`, `max_service_limit`, `tax_type`, `tax_id`, `is_commision`, `commission_threshold`, `commission_percentage`, `transaction_id`, `tax_percentage`) VALUES
('11', 'active', '2025-05-09 11:48:37', '2025-05-09 11:48:37', 1, 1, 327, '2025-05-09', '2025-05-09', 'Essential', 'Try with the Essential plan and start your business', 'unlimited', '0', '500', '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '0', 0),
('11', 'active', '2025-05-09 11:48:55', '2025-05-09 11:48:55', 1, 2, 303, '2025-05-09', '2025-05-09', 'Essential', 'Try with the Essential plan and start your business', 'unlimited', '0', '500', '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '0', 0),
('11', 'active', '2025-05-09 11:49:11', '2025-05-09 11:49:11', 1, 3, 301, '2025-05-09', '2025-05-09', 'Essential', 'Try with the Essential plan and start your business', 'unlimited', '0', '500', '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '0', 0),
('11', 'active', '2025-05-09 11:49:23', '2025-05-09 11:49:23', 1, 4, 298, '2025-05-09', '2025-05-09', 'Essential', 'Try with the Essential plan and start your business', 'unlimited', '0', '500', '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '0', 0),
('11', 'active', '2025-05-09 11:49:36', '2025-05-09 11:49:36', 1, 5, 297, '2025-05-09', '2025-05-09', 'Essential', 'Try with the Essential plan and start your business', 'unlimited', '0', '500', '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '0', 0),
('11', 'active', '2025-05-09 11:49:47', '2025-05-09 11:49:47', 1, 6, 293, '2025-05-09', '2025-05-09', 'Essential', 'Try with the Essential plan and start your business', 'unlimited', '0', '500', '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '0', 0),
('11', 'active', '2025-05-09 11:49:56', '2025-05-09 11:49:56', 1, 7, 283, '2025-05-09', '2025-05-09', 'Essential', 'Try with the Essential plan and start your business', 'unlimited', '0', '500', '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '0', 0),
('11', 'active', '2025-05-09 11:50:09', '2025-05-09 11:50:09', 1, 8, 273, '2025-05-09', '2025-05-09', 'Essential', 'Try with the Essential plan and start your business', 'unlimited', '0', '500', '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '0', 0),
('11', 'active', '2025-05-09 11:50:24', '2025-05-09 11:50:24', 1, 9, 270, '2025-05-09', '2025-05-09', 'Essential', 'Try with the Essential plan and start your business', 'unlimited', '0', '500', '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '0', 0),
('11', 'active', '2025-05-09 11:50:35', '2025-05-09 11:50:35', 1, 10, 263, '2025-05-09', '2025-05-09', 'Essential', 'Try with the Essential plan and start your business', 'unlimited', '0', '500', '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '0', 0),
('11', 'active', '2025-05-09 11:50:50', '2025-05-09 11:50:50', 1, 11, 260, '2025-05-09', '2025-05-09', 'Essential', 'Try with the Essential plan and start your business', 'unlimited', '0', '500', '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '0', 0),
('11', 'active', '2025-05-09 11:50:59', '2025-05-09 11:50:59', 1, 12, 50, '2025-05-09', '2025-05-09', 'Essential', 'Try with the Essential plan and start your business', 'unlimited', '0', '500', '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `partner_timings`
--

CREATE TABLE `partner_timings` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `day` varchar(20) DEFAULT NULL,
  `opening_time` time NOT NULL,
  `closing_time` time NOT NULL,
  `is_open` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partner_timings`
--

INSERT INTO `partner_timings` (`id`, `partner_id`, `day`, `opening_time`, `closing_time`, `is_open`, `created_at`, `updated_at`) VALUES
(486, 615, 'monday', '00:00:00', '00:00:00', 0, '2023-04-04 08:43:59', '2023-04-04 08:43:59'),
(487, 615, 'tuesday', '00:00:00', '00:00:00', 0, '2023-04-04 08:43:59', '2023-04-04 08:43:59'),
(488, 615, 'wednesday', '00:00:00', '00:00:00', 0, '2023-04-04 08:43:59', '2023-04-04 08:43:59'),
(489, 615, 'thursday', '00:00:00', '00:00:00', 0, '2023-04-04 08:43:59', '2023-04-04 08:43:59'),
(490, 615, 'friday', '00:00:00', '00:00:00', 0, '2023-04-04 08:43:59', '2023-04-04 08:43:59'),
(491, 615, 'saturday', '00:00:00', '00:00:00', 0, '2023-04-04 08:43:59', '2023-04-04 08:43:59'),
(492, 615, 'sunday', '00:00:00', '00:00:00', 0, '2023-04-04 08:43:59', '2023-04-04 08:43:59'),
(493, 624, 'monday', '00:00:00', '00:00:00', 0, '2023-04-06 09:29:36', '2023-04-06 09:29:36'),
(494, 624, 'tuesday', '00:00:00', '00:00:00', 0, '2023-04-06 09:29:36', '2023-04-06 09:29:36'),
(495, 624, 'wednesday', '00:00:00', '00:00:00', 0, '2023-04-06 09:29:36', '2023-04-06 09:29:36'),
(496, 624, 'thursday', '00:00:00', '00:00:00', 0, '2023-04-06 09:29:36', '2023-04-06 09:29:36'),
(497, 624, 'friday', '00:00:00', '00:00:00', 0, '2023-04-06 09:29:36', '2023-04-06 09:29:36'),
(498, 624, 'saturday', '00:00:00', '00:00:00', 0, '2023-04-06 09:29:36', '2023-04-06 09:29:36'),
(499, 624, 'sunday', '00:00:00', '00:00:00', 0, '2023-04-06 09:29:36', '2023-04-06 09:29:36'),
(500, 628, 'monday', '07:00:00', '17:00:00', 1, '2023-04-06 22:08:16', '2023-04-06 22:08:16'),
(501, 628, 'tuesday', '07:00:00', '17:00:00', 1, '2023-04-06 22:08:16', '2023-04-06 22:08:16'),
(502, 628, 'wednesday', '07:00:00', '17:00:00', 1, '2023-04-06 22:08:16', '2023-04-06 22:08:16'),
(503, 628, 'thursday', '07:00:00', '17:00:00', 1, '2023-04-06 22:08:16', '2023-04-06 22:08:16'),
(504, 628, 'friday', '07:00:00', '17:00:00', 1, '2023-04-06 22:08:16', '2023-04-06 22:08:16'),
(505, 628, 'saturday', '07:00:00', '17:00:00', 1, '2023-04-06 22:08:16', '2023-04-06 22:08:16'),
(506, 628, 'sunday', '07:00:00', '17:00:00', 1, '2023-04-06 22:08:16', '2023-04-06 22:08:16'),
(514, 643, 'monday', '00:00:00', '00:00:00', 1, '2023-04-10 23:27:25', '2023-04-10 23:27:25'),
(515, 643, 'tuesday', '00:00:00', '00:00:00', 1, '2023-04-10 23:27:25', '2023-04-10 23:27:25'),
(516, 643, 'wednesday', '00:00:00', '00:00:00', 1, '2023-04-10 23:27:25', '2023-04-10 23:27:25'),
(517, 643, 'thursday', '00:00:00', '00:00:00', 1, '2023-04-10 23:27:25', '2023-04-10 23:27:25'),
(518, 643, 'friday', '00:00:00', '00:00:00', 1, '2023-04-10 23:27:25', '2023-04-10 23:27:25'),
(519, 643, 'saturday', '00:00:00', '00:00:00', 1, '2023-04-10 23:27:25', '2023-04-10 23:27:25'),
(520, 643, 'sunday', '00:00:00', '00:00:00', 1, '2023-04-10 23:27:25', '2023-04-10 23:27:25'),
(542, 649, 'monday', '00:00:00', '00:00:00', 1, '2023-04-13 09:11:52', '2023-04-13 09:11:52'),
(543, 649, 'tuesday', '00:00:00', '00:00:00', 1, '2023-04-13 09:11:52', '2023-04-13 09:11:52'),
(544, 649, 'wednesday', '00:00:00', '00:00:00', 1, '2023-04-13 09:11:52', '2023-04-13 09:11:52'),
(545, 649, 'thursday', '00:00:00', '00:00:00', 1, '2023-04-13 09:11:52', '2023-04-13 09:11:52'),
(546, 649, 'friday', '00:00:00', '00:00:00', 1, '2023-04-13 09:11:52', '2023-04-13 09:11:52'),
(547, 649, 'saturday', '00:00:00', '00:00:00', 1, '2023-04-13 09:11:52', '2023-04-13 09:11:52'),
(548, 649, 'sunday', '00:00:00', '00:00:00', 0, '2023-04-13 09:11:52', '2023-04-13 09:11:52'),
(549, 658, 'monday', '00:00:00', '00:00:00', 0, '2023-04-16 17:46:02', '2023-04-16 17:46:02'),
(550, 658, 'tuesday', '00:00:00', '00:00:00', 0, '2023-04-16 17:46:02', '2023-04-16 17:46:02'),
(551, 658, 'wednesday', '00:00:00', '00:00:00', 0, '2023-04-16 17:46:02', '2023-04-16 17:46:02'),
(552, 658, 'thursday', '00:00:00', '00:00:00', 0, '2023-04-16 17:46:02', '2023-04-16 17:46:02'),
(553, 658, 'friday', '00:00:00', '00:00:00', 0, '2023-04-16 17:46:02', '2023-04-16 17:46:02'),
(554, 658, 'saturday', '00:00:00', '00:00:00', 0, '2023-04-16 17:46:02', '2023-04-16 17:46:02'),
(555, 658, 'sunday', '00:00:00', '00:00:00', 0, '2023-04-16 17:46:02', '2023-04-16 17:46:02'),
(556, 665, 'monday', '00:00:00', '00:00:00', 1, '2023-04-20 04:56:01', '2023-04-20 04:56:01'),
(557, 665, 'tuesday', '00:00:00', '00:00:00', 1, '2023-04-20 04:56:01', '2023-04-20 04:56:01'),
(558, 665, 'wednesday', '00:00:00', '00:00:00', 1, '2023-04-20 04:56:01', '2023-04-20 04:56:01'),
(559, 665, 'thursday', '00:00:00', '00:00:00', 1, '2023-04-20 04:56:01', '2023-04-20 04:56:01'),
(560, 665, 'friday', '00:00:00', '00:00:00', 1, '2023-04-20 04:56:01', '2023-04-20 04:56:01'),
(561, 665, 'saturday', '00:00:00', '00:00:00', 1, '2023-04-20 04:56:01', '2023-04-20 04:56:01'),
(562, 665, 'sunday', '00:00:00', '00:00:00', 1, '2023-04-20 04:56:01', '2023-04-20 04:56:01'),
(563, 668, 'monday', '00:00:00', '00:00:00', 0, '2023-04-20 21:30:09', '2023-04-20 21:30:09'),
(564, 668, 'tuesday', '00:00:00', '00:00:00', 1, '2023-04-20 21:30:09', '2023-04-20 21:30:09'),
(565, 668, 'wednesday', '00:00:00', '00:00:00', 1, '2023-04-20 21:30:09', '2023-04-20 21:30:09'),
(566, 668, 'thursday', '00:00:00', '00:00:00', 1, '2023-04-20 21:30:09', '2023-04-20 21:30:09'),
(567, 668, 'friday', '00:00:00', '00:00:00', 1, '2023-04-20 21:30:09', '2023-04-20 21:30:09'),
(568, 668, 'saturday', '00:00:00', '00:00:00', 1, '2023-04-20 21:30:09', '2023-04-20 21:30:09'),
(569, 668, 'sunday', '00:00:00', '00:00:00', 0, '2023-04-20 21:30:09', '2023-04-20 21:30:09'),
(570, 675, 'monday', '00:00:00', '00:00:00', 0, '2023-04-24 11:42:18', '2023-04-24 11:42:18'),
(571, 675, 'tuesday', '00:00:00', '00:00:00', 0, '2023-04-24 11:42:18', '2023-04-24 11:42:18'),
(572, 675, 'wednesday', '00:00:00', '00:00:00', 0, '2023-04-24 11:42:18', '2023-04-24 11:42:18'),
(573, 675, 'thursday', '00:00:00', '00:00:00', 0, '2023-04-24 11:42:18', '2023-04-24 11:42:18'),
(574, 675, 'friday', '00:00:00', '00:00:00', 0, '2023-04-24 11:42:18', '2023-04-24 11:42:18'),
(575, 675, 'saturday', '00:00:00', '00:00:00', 0, '2023-04-24 11:42:18', '2023-04-24 11:42:18'),
(576, 675, 'sunday', '00:00:00', '00:00:00', 0, '2023-04-24 11:42:18', '2023-04-24 11:42:18'),
(577, 706, 'monday', '00:00:00', '00:00:00', 1, '2023-05-03 22:23:08', '2023-05-03 22:23:08'),
(578, 706, 'tuesday', '00:00:00', '00:00:00', 1, '2023-05-03 22:23:08', '2023-05-03 22:23:08'),
(579, 706, 'wednesday', '00:00:00', '00:00:00', 1, '2023-05-03 22:23:08', '2023-05-03 22:23:08'),
(580, 706, 'thursday', '00:00:00', '00:00:00', 1, '2023-05-03 22:23:08', '2023-05-03 22:23:08'),
(581, 706, 'friday', '00:00:00', '00:00:00', 0, '2023-05-03 22:23:08', '2023-05-03 22:23:08'),
(582, 706, 'saturday', '00:00:00', '00:00:00', 0, '2023-05-03 22:23:08', '2023-05-03 22:23:08'),
(583, 706, 'sunday', '00:00:00', '00:00:00', 0, '2023-05-03 22:23:08', '2023-05-03 22:23:08'),
(584, 709, 'monday', '00:00:00', '00:00:00', 0, '2023-05-04 14:26:41', '2023-05-04 14:26:41'),
(585, 709, 'tuesday', '00:00:00', '00:00:00', 0, '2023-05-04 14:26:41', '2023-05-04 14:26:41'),
(586, 709, 'wednesday', '00:00:00', '00:00:00', 0, '2023-05-04 14:26:41', '2023-05-04 14:26:41'),
(587, 709, 'thursday', '00:00:00', '00:00:00', 0, '2023-05-04 14:26:41', '2023-05-04 14:26:41'),
(588, 709, 'friday', '00:00:00', '00:00:00', 0, '2023-05-04 14:26:41', '2023-05-04 14:26:41'),
(589, 709, 'saturday', '00:00:00', '00:00:00', 0, '2023-05-04 14:26:41', '2023-05-04 14:26:41'),
(590, 709, 'sunday', '00:00:00', '00:00:00', 0, '2023-05-04 14:26:41', '2023-05-04 14:26:41'),
(591, 727, 'monday', '00:00:00', '00:00:00', 1, '2023-05-09 17:31:22', '2023-05-09 17:31:22'),
(592, 727, 'tuesday', '00:00:00', '00:00:00', 1, '2023-05-09 17:31:22', '2023-05-09 17:31:22'),
(593, 727, 'wednesday', '00:00:00', '00:00:00', 1, '2023-05-09 17:31:22', '2023-05-09 17:31:22'),
(594, 727, 'thursday', '00:00:00', '00:00:00', 1, '2023-05-09 17:31:22', '2023-05-09 17:31:22'),
(595, 727, 'friday', '00:00:00', '00:00:00', 1, '2023-05-09 17:31:22', '2023-05-09 17:31:22'),
(596, 727, 'saturday', '00:00:00', '00:00:00', 1, '2023-05-09 17:31:22', '2023-05-09 17:31:22'),
(597, 727, 'sunday', '00:00:00', '00:00:00', 1, '2023-05-09 17:31:22', '2023-05-09 17:31:22'),
(598, 733, 'monday', '00:00:00', '00:00:00', 0, '2023-05-10 21:33:17', '2023-05-10 21:33:17'),
(599, 733, 'tuesday', '00:00:00', '00:00:00', 0, '2023-05-10 21:33:17', '2023-05-10 21:33:17'),
(600, 733, 'wednesday', '00:00:00', '00:00:00', 0, '2023-05-10 21:33:17', '2023-05-10 21:33:17'),
(601, 733, 'thursday', '00:00:00', '00:00:00', 0, '2023-05-10 21:33:17', '2023-05-10 21:33:17'),
(602, 733, 'friday', '00:00:00', '00:00:00', 0, '2023-05-10 21:33:17', '2023-05-10 21:33:17'),
(603, 733, 'saturday', '00:00:00', '00:00:00', 0, '2023-05-10 21:33:17', '2023-05-10 21:33:17'),
(604, 733, 'sunday', '00:00:00', '00:00:00', 0, '2023-05-10 21:33:17', '2023-05-10 21:33:17'),
(605, 742, 'monday', '00:00:00', '00:00:00', 0, '2023-05-14 12:21:06', '2023-05-14 12:21:06'),
(606, 742, 'tuesday', '00:00:00', '00:00:00', 0, '2023-05-14 12:21:06', '2023-05-14 12:21:06'),
(607, 742, 'wednesday', '00:00:00', '00:00:00', 0, '2023-05-14 12:21:06', '2023-05-14 12:21:06'),
(608, 742, 'thursday', '00:00:00', '00:00:00', 0, '2023-05-14 12:21:06', '2023-05-14 12:21:06'),
(609, 742, 'friday', '00:00:00', '00:00:00', 0, '2023-05-14 12:21:06', '2023-05-14 12:21:06'),
(610, 742, 'saturday', '00:00:00', '00:00:00', 0, '2023-05-14 12:21:06', '2023-05-14 12:21:06'),
(611, 742, 'sunday', '00:00:00', '00:00:00', 0, '2023-05-14 12:21:06', '2023-05-14 12:21:06'),
(612, 753, 'monday', '00:00:00', '00:00:00', 0, '2023-05-19 16:00:32', '2023-05-19 16:00:32'),
(613, 753, 'tuesday', '00:00:00', '00:00:00', 0, '2023-05-19 16:00:32', '2023-05-19 16:00:32'),
(614, 753, 'wednesday', '00:00:00', '00:00:00', 0, '2023-05-19 16:00:32', '2023-05-19 16:00:32'),
(615, 753, 'thursday', '00:00:00', '00:00:00', 0, '2023-05-19 16:00:32', '2023-05-19 16:00:32'),
(616, 753, 'friday', '00:00:00', '00:00:00', 0, '2023-05-19 16:00:32', '2023-05-19 16:00:32'),
(617, 753, 'saturday', '00:00:00', '00:00:00', 0, '2023-05-19 16:00:32', '2023-05-19 16:00:32'),
(618, 753, 'sunday', '00:00:00', '00:00:00', 0, '2023-05-19 16:00:32', '2023-05-19 16:00:32'),
(619, 761, 'monday', '00:00:00', '00:00:00', 0, '2023-05-21 09:30:03', '2023-05-21 09:30:03'),
(620, 761, 'tuesday', '00:00:00', '00:00:00', 0, '2023-05-21 09:30:03', '2023-05-21 09:30:03'),
(621, 761, 'wednesday', '00:00:00', '00:00:00', 0, '2023-05-21 09:30:03', '2023-05-21 09:30:03'),
(622, 761, 'thursday', '00:00:00', '00:00:00', 0, '2023-05-21 09:30:03', '2023-05-21 09:30:03'),
(623, 761, 'friday', '00:00:00', '00:00:00', 0, '2023-05-21 09:30:03', '2023-05-21 09:30:03'),
(624, 761, 'saturday', '00:00:00', '00:00:00', 0, '2023-05-21 09:30:03', '2023-05-21 09:30:03'),
(625, 761, 'sunday', '00:00:00', '00:00:00', 0, '2023-05-21 09:30:03', '2023-05-21 09:30:03'),
(626, 763, 'monday', '00:00:00', '00:00:00', 0, '2023-05-21 19:24:32', '2023-05-21 19:24:32'),
(627, 763, 'tuesday', '00:00:00', '00:00:00', 0, '2023-05-21 19:24:32', '2023-05-21 19:24:32'),
(628, 763, 'wednesday', '00:00:00', '00:00:00', 0, '2023-05-21 19:24:32', '2023-05-21 19:24:32'),
(629, 763, 'thursday', '00:00:00', '00:00:00', 1, '2023-05-21 19:24:32', '2023-05-21 19:24:32'),
(630, 763, 'friday', '00:00:00', '00:00:00', 1, '2023-05-21 19:24:32', '2023-05-21 19:24:32'),
(631, 763, 'saturday', '00:00:00', '00:00:00', 1, '2023-05-21 19:24:32', '2023-05-21 19:24:32'),
(632, 763, 'sunday', '00:00:00', '00:00:00', 1, '2023-05-21 19:24:32', '2023-05-21 19:24:32'),
(633, 767, 'monday', '00:00:00', '00:00:00', 0, '2023-05-23 05:33:16', '2023-05-23 05:33:16'),
(634, 767, 'tuesday', '00:00:00', '00:00:00', 0, '2023-05-23 05:33:16', '2023-05-23 05:33:16'),
(635, 767, 'wednesday', '00:00:00', '00:00:00', 0, '2023-05-23 05:33:16', '2023-05-23 05:33:16'),
(636, 767, 'thursday', '00:00:00', '00:00:00', 0, '2023-05-23 05:33:16', '2023-05-23 05:33:16'),
(637, 767, 'friday', '00:00:00', '00:00:00', 0, '2023-05-23 05:33:16', '2023-05-23 05:33:16'),
(638, 767, 'saturday', '00:00:00', '00:00:00', 0, '2023-05-23 05:33:16', '2023-05-23 05:33:16'),
(639, 767, 'sunday', '00:00:00', '00:00:00', 0, '2023-05-23 05:33:16', '2023-05-23 05:33:16'),
(640, 772, 'monday', '00:00:00', '00:00:00', 1, '2023-05-24 10:55:35', '2023-05-24 10:55:35'),
(641, 772, 'tuesday', '00:00:00', '00:00:00', 1, '2023-05-24 10:55:35', '2023-05-24 10:55:35'),
(642, 772, 'wednesday', '00:00:00', '00:00:00', 1, '2023-05-24 10:55:35', '2023-05-24 10:55:35'),
(643, 772, 'thursday', '00:00:00', '00:00:00', 1, '2023-05-24 10:55:35', '2023-05-24 10:55:35'),
(644, 772, 'friday', '00:00:00', '00:00:00', 1, '2023-05-24 10:55:35', '2023-05-24 10:55:35'),
(645, 772, 'saturday', '09:00:00', '20:00:00', 1, '2023-05-24 10:55:35', '2023-05-24 10:55:35'),
(646, 772, 'sunday', '00:00:00', '00:00:00', 0, '2023-05-24 10:55:35', '2023-05-24 10:55:35'),
(647, 780, 'monday', '00:00:00', '00:00:00', 1, '2023-05-26 23:21:09', '2023-05-26 23:21:09'),
(648, 780, 'tuesday', '00:00:00', '00:00:00', 1, '2023-05-26 23:21:09', '2023-05-26 23:21:09'),
(649, 780, 'wednesday', '00:00:00', '00:00:00', 1, '2023-05-26 23:21:09', '2023-05-26 23:21:09'),
(650, 780, 'thursday', '00:00:00', '00:00:00', 1, '2023-05-26 23:21:09', '2023-05-26 23:21:09'),
(651, 780, 'friday', '00:00:00', '00:00:00', 1, '2023-05-26 23:21:09', '2023-05-26 23:21:09'),
(652, 780, 'saturday', '00:00:00', '00:00:00', 1, '2023-05-26 23:21:09', '2023-05-26 23:21:09'),
(653, 780, 'sunday', '00:00:00', '00:00:00', 1, '2023-05-26 23:21:09', '2023-05-26 23:21:09'),
(654, 798, 'monday', '00:00:00', '00:00:00', 1, '2023-06-02 10:39:59', '2023-06-02 10:39:59'),
(655, 798, 'tuesday', '00:00:00', '00:00:00', 1, '2023-06-02 10:39:59', '2023-06-02 10:39:59'),
(656, 798, 'wednesday', '00:00:00', '00:00:00', 1, '2023-06-02 10:39:59', '2023-06-02 10:39:59'),
(657, 798, 'thursday', '00:00:00', '00:00:00', 1, '2023-06-02 10:39:59', '2023-06-02 10:39:59'),
(658, 798, 'friday', '00:00:00', '00:00:00', 1, '2023-06-02 10:39:59', '2023-06-02 10:39:59'),
(659, 798, 'saturday', '00:00:00', '00:00:00', 1, '2023-06-02 10:39:59', '2023-06-02 10:39:59'),
(660, 798, 'sunday', '00:00:00', '00:00:00', 0, '2023-06-02 10:39:59', '2023-06-02 10:39:59'),
(661, 810, 'monday', '00:00:00', '00:00:00', 0, '2023-06-12 13:29:17', '2023-06-12 13:29:17'),
(662, 810, 'tuesday', '00:00:00', '00:00:00', 0, '2023-06-12 13:29:17', '2023-06-12 13:29:17'),
(663, 810, 'wednesday', '00:00:00', '00:00:00', 0, '2023-06-12 13:29:17', '2023-06-12 13:29:17'),
(664, 810, 'thursday', '00:00:00', '00:00:00', 0, '2023-06-12 13:29:17', '2023-06-12 13:29:17'),
(665, 810, 'friday', '00:00:00', '00:00:00', 0, '2023-06-12 13:29:17', '2023-06-12 13:29:17'),
(666, 810, 'saturday', '00:00:00', '00:00:00', 0, '2023-06-12 13:29:17', '2023-06-12 13:29:17'),
(667, 810, 'sunday', '00:00:00', '00:00:00', 0, '2023-06-12 13:29:18', '2023-06-12 13:29:18'),
(668, 811, 'monday', '00:00:00', '00:00:00', 0, '2023-06-12 13:31:02', '2023-06-12 13:31:02'),
(669, 811, 'tuesday', '00:00:00', '00:00:00', 0, '2023-06-12 13:31:02', '2023-06-12 13:31:02'),
(670, 811, 'wednesday', '00:00:00', '00:00:00', 0, '2023-06-12 13:31:02', '2023-06-12 13:31:02'),
(671, 811, 'thursday', '00:00:00', '00:00:00', 0, '2023-06-12 13:31:02', '2023-06-12 13:31:02'),
(672, 811, 'friday', '00:00:00', '00:00:00', 0, '2023-06-12 13:31:02', '2023-06-12 13:31:02'),
(673, 811, 'saturday', '00:00:00', '00:00:00', 0, '2023-06-12 13:31:02', '2023-06-12 13:31:02'),
(674, 811, 'sunday', '00:00:00', '00:00:00', 0, '2023-06-12 13:31:02', '2023-06-12 13:31:02'),
(675, 818, 'monday', '00:00:00', '00:00:00', 1, '2023-06-16 01:19:00', '2023-06-16 01:19:00'),
(676, 818, 'tuesday', '00:00:00', '00:00:00', 1, '2023-06-16 01:19:00', '2023-06-16 01:19:00'),
(677, 818, 'wednesday', '00:00:00', '00:00:00', 1, '2023-06-16 01:19:00', '2023-06-16 01:19:00'),
(678, 818, 'thursday', '00:00:00', '00:00:00', 1, '2023-06-16 01:19:00', '2023-06-16 01:19:00'),
(679, 818, 'friday', '00:00:00', '00:00:00', 1, '2023-06-16 01:19:00', '2023-06-16 01:19:00'),
(680, 818, 'saturday', '00:00:00', '00:00:00', 1, '2023-06-16 01:19:00', '2023-06-16 01:19:00'),
(681, 818, 'sunday', '00:00:00', '00:00:00', 1, '2023-06-16 01:19:00', '2023-06-16 01:19:00'),
(682, 829, 'monday', '00:00:00', '00:00:00', 0, '2023-06-20 10:20:22', '2023-06-20 10:20:22'),
(683, 829, 'tuesday', '00:00:00', '00:00:00', 1, '2023-06-20 10:20:22', '2023-06-20 10:20:22'),
(684, 829, 'wednesday', '00:00:00', '00:00:00', 1, '2023-06-20 10:20:22', '2023-06-20 10:20:22'),
(685, 829, 'thursday', '00:00:00', '00:00:00', 0, '2023-06-20 10:20:22', '2023-06-20 10:20:22'),
(686, 829, 'friday', '00:00:00', '00:00:00', 0, '2023-06-20 10:20:22', '2023-06-20 10:20:22'),
(687, 829, 'saturday', '10:00:00', '16:00:00', 1, '2023-06-20 10:20:22', '2023-06-20 10:20:22'),
(688, 829, 'sunday', '00:00:00', '00:00:00', 0, '2023-06-20 10:20:22', '2023-06-20 10:20:22'),
(689, 833, 'monday', '00:00:00', '00:00:00', 0, '2023-06-22 00:29:40', '2023-06-22 00:29:40'),
(690, 833, 'tuesday', '00:00:00', '00:00:00', 1, '2023-06-22 00:29:40', '2023-06-22 00:29:40'),
(691, 833, 'wednesday', '00:00:00', '00:00:00', 1, '2023-06-22 00:29:40', '2023-06-22 00:29:40'),
(692, 833, 'thursday', '00:00:00', '00:00:00', 1, '2023-06-22 00:29:40', '2023-06-22 00:29:40'),
(693, 833, 'friday', '00:00:00', '00:00:00', 1, '2023-06-22 00:29:40', '2023-06-22 00:29:40'),
(694, 833, 'saturday', '00:00:00', '00:00:00', 1, '2023-06-22 00:29:40', '2023-06-22 00:29:40'),
(695, 833, 'sunday', '00:00:00', '00:00:00', 0, '2023-06-22 00:29:40', '2023-06-22 00:29:40'),
(696, 840, 'monday', '00:00:00', '00:00:00', 1, '2023-06-24 23:38:18', '2023-06-24 23:38:18'),
(697, 840, 'tuesday', '00:00:00', '00:00:00', 0, '2023-06-24 23:38:18', '2023-06-24 23:38:18'),
(698, 840, 'wednesday', '00:00:00', '00:00:00', 0, '2023-06-24 23:38:18', '2023-06-24 23:38:18'),
(699, 840, 'thursday', '00:00:00', '00:00:00', 0, '2023-06-24 23:38:18', '2023-06-24 23:38:18'),
(700, 840, 'friday', '00:00:00', '00:00:00', 0, '2023-06-24 23:38:18', '2023-06-24 23:38:18'),
(701, 840, 'saturday', '00:00:00', '00:00:00', 0, '2023-06-24 23:38:18', '2023-06-24 23:38:18'),
(702, 840, 'sunday', '00:00:00', '00:00:00', 0, '2023-06-24 23:38:18', '2023-06-24 23:38:18'),
(710, 859, 'monday', '00:00:00', '00:00:00', 0, '2023-07-08 23:46:19', '2023-07-08 23:46:19'),
(711, 859, 'tuesday', '00:00:00', '00:00:00', 0, '2023-07-08 23:46:19', '2023-07-08 23:46:19'),
(712, 859, 'wednesday', '00:00:00', '00:00:00', 0, '2023-07-08 23:46:19', '2023-07-08 23:46:19'),
(713, 859, 'thursday', '00:00:00', '00:00:00', 0, '2023-07-08 23:46:19', '2023-07-08 23:46:19'),
(714, 859, 'friday', '00:00:00', '00:00:00', 0, '2023-07-08 23:46:19', '2023-07-08 23:46:19'),
(715, 859, 'saturday', '00:00:00', '00:00:00', 0, '2023-07-08 23:46:19', '2023-07-08 23:46:19'),
(716, 859, 'sunday', '00:00:00', '00:00:00', 0, '2023-07-08 23:46:19', '2023-07-08 23:46:19'),
(717, 871, 'monday', '00:00:00', '00:00:00', 0, '2023-07-17 21:24:20', '2023-07-17 21:24:20'),
(718, 871, 'tuesday', '00:00:00', '00:00:00', 0, '2023-07-17 21:24:20', '2023-07-17 21:24:20'),
(719, 871, 'wednesday', '00:00:00', '00:00:00', 0, '2023-07-17 21:24:20', '2023-07-17 21:24:20'),
(720, 871, 'thursday', '00:00:00', '00:00:00', 0, '2023-07-17 21:24:20', '2023-07-17 21:24:20'),
(721, 871, 'friday', '00:00:00', '00:00:00', 0, '2023-07-17 21:24:20', '2023-07-17 21:24:20'),
(722, 871, 'saturday', '00:00:00', '00:00:00', 0, '2023-07-17 21:24:20', '2023-07-17 21:24:20'),
(723, 871, 'sunday', '00:00:00', '00:00:00', 0, '2023-07-17 21:24:20', '2023-07-17 21:24:20'),
(724, 883, 'monday', '00:00:00', '00:00:00', 0, '2023-07-29 13:09:44', '2023-07-29 13:09:44'),
(725, 883, 'tuesday', '00:00:00', '00:00:00', 0, '2023-07-29 13:09:44', '2023-07-29 13:09:44'),
(726, 883, 'wednesday', '00:00:00', '00:00:00', 0, '2023-07-29 13:09:44', '2023-07-29 13:09:44'),
(727, 883, 'thursday', '00:00:00', '00:00:00', 0, '2023-07-29 13:09:44', '2023-07-29 13:09:44'),
(728, 883, 'friday', '00:00:00', '00:00:00', 0, '2023-07-29 13:09:44', '2023-07-29 13:09:44'),
(729, 883, 'saturday', '00:00:00', '00:00:00', 0, '2023-07-29 13:09:44', '2023-07-29 13:09:44'),
(730, 883, 'sunday', '00:00:00', '00:00:00', 0, '2023-07-29 13:09:44', '2023-07-29 13:09:44'),
(731, 886, 'monday', '00:00:00', '00:00:00', 0, '2023-08-02 17:06:28', '2023-08-02 17:06:28'),
(732, 886, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-02 17:06:28', '2023-08-02 17:06:28'),
(733, 886, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-02 17:06:28', '2023-08-02 17:06:28'),
(734, 886, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-02 17:06:28', '2023-08-02 17:06:28'),
(735, 886, 'friday', '00:00:00', '00:00:00', 0, '2023-08-02 17:06:28', '2023-08-02 17:06:28'),
(736, 886, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-02 17:06:28', '2023-08-02 17:06:28'),
(737, 886, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-02 17:06:28', '2023-08-02 17:06:28'),
(738, 888, 'monday', '00:00:00', '00:00:00', 0, '2023-08-03 23:42:42', '2023-08-03 23:42:42'),
(739, 888, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-03 23:42:43', '2023-08-03 23:42:43'),
(740, 888, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-03 23:42:43', '2023-08-03 23:42:43'),
(741, 888, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-03 23:42:43', '2023-08-03 23:42:43'),
(742, 888, 'friday', '00:00:00', '00:00:00', 0, '2023-08-03 23:42:43', '2023-08-03 23:42:43'),
(743, 888, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-03 23:42:43', '2023-08-03 23:42:43'),
(744, 888, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-03 23:42:43', '2023-08-03 23:42:43'),
(745, 907, 'monday', '00:00:00', '00:00:00', 0, '2023-08-10 07:41:21', '2023-08-10 07:41:21'),
(746, 907, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-10 07:41:21', '2023-08-10 07:41:21'),
(747, 907, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-10 07:41:21', '2023-08-10 07:41:21'),
(748, 907, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-10 07:41:21', '2023-08-10 07:41:21'),
(749, 907, 'friday', '00:00:00', '00:00:00', 0, '2023-08-10 07:41:21', '2023-08-10 07:41:21'),
(750, 907, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-10 07:41:21', '2023-08-10 07:41:21'),
(751, 907, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-10 07:41:21', '2023-08-10 07:41:21'),
(752, 910, 'monday', '00:00:00', '00:00:00', 0, '2023-08-11 20:53:15', '2023-08-11 20:53:15'),
(753, 910, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-11 20:53:15', '2023-08-11 20:53:15'),
(754, 910, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-11 20:53:15', '2023-08-11 20:53:15'),
(755, 910, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-11 20:53:15', '2023-08-11 20:53:15'),
(756, 910, 'friday', '00:00:00', '00:00:00', 0, '2023-08-11 20:53:15', '2023-08-11 20:53:15'),
(757, 910, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-11 20:53:15', '2023-08-11 20:53:15'),
(758, 910, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-11 20:53:15', '2023-08-11 20:53:15'),
(759, 918, 'monday', '00:00:00', '00:00:00', 0, '2023-08-14 10:37:27', '2023-08-14 10:37:27'),
(760, 918, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-14 10:37:27', '2023-08-14 10:37:27'),
(761, 918, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-14 10:37:27', '2023-08-14 10:37:27'),
(762, 918, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-14 10:37:27', '2023-08-14 10:37:27'),
(763, 918, 'friday', '00:00:00', '00:00:00', 0, '2023-08-14 10:37:27', '2023-08-14 10:37:27'),
(764, 918, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-14 10:37:27', '2023-08-14 10:37:27'),
(765, 918, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-14 10:37:27', '2023-08-14 10:37:27'),
(766, 922, 'monday', '00:00:00', '00:00:00', 0, '2023-08-15 15:53:29', '2023-08-15 15:53:29'),
(767, 922, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-15 15:53:29', '2023-08-15 15:53:29'),
(768, 922, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-15 15:53:29', '2023-08-15 15:53:29'),
(769, 922, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-15 15:53:29', '2023-08-15 15:53:29'),
(770, 922, 'friday', '00:00:00', '00:00:00', 0, '2023-08-15 15:53:29', '2023-08-15 15:53:29'),
(771, 922, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-15 15:53:29', '2023-08-15 15:53:29'),
(772, 922, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-15 15:53:29', '2023-08-15 15:53:29'),
(773, 923, 'monday', '00:00:00', '00:00:00', 0, '2023-08-16 10:24:18', '2023-08-16 10:24:18'),
(774, 923, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-16 10:24:18', '2023-08-16 10:24:18'),
(775, 923, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-16 10:24:18', '2023-08-16 10:24:18'),
(776, 923, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-16 10:24:18', '2023-08-16 10:24:18'),
(777, 923, 'friday', '00:00:00', '00:00:00', 0, '2023-08-16 10:24:18', '2023-08-16 10:24:18'),
(778, 923, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-16 10:24:18', '2023-08-16 10:24:18'),
(779, 923, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-16 10:24:18', '2023-08-16 10:24:18'),
(780, 930, 'monday', '00:00:00', '00:00:00', 0, '2023-08-18 16:23:43', '2023-08-18 16:23:43'),
(781, 930, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-18 16:23:43', '2023-08-18 16:23:43'),
(782, 930, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-18 16:23:43', '2023-08-18 16:23:43'),
(783, 930, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-18 16:23:43', '2023-08-18 16:23:43'),
(784, 930, 'friday', '00:00:00', '00:00:00', 0, '2023-08-18 16:23:43', '2023-08-18 16:23:43'),
(785, 930, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-18 16:23:43', '2023-08-18 16:23:43'),
(786, 930, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-18 16:23:43', '2023-08-18 16:23:43'),
(787, 934, 'monday', '00:00:00', '00:00:00', 0, '2023-08-19 13:33:49', '2023-08-19 13:33:49'),
(788, 934, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-19 13:33:49', '2023-08-19 13:33:49'),
(789, 934, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-19 13:33:49', '2023-08-19 13:33:49'),
(790, 934, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-19 13:33:49', '2023-08-19 13:33:49'),
(791, 934, 'friday', '00:00:00', '00:00:00', 0, '2023-08-19 13:33:49', '2023-08-19 13:33:49'),
(792, 934, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-19 13:33:49', '2023-08-19 13:33:49'),
(793, 934, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-19 13:33:49', '2023-08-19 13:33:49'),
(794, 935, 'monday', '00:00:00', '00:00:00', 0, '2023-08-20 09:47:17', '2023-08-20 09:47:17'),
(795, 935, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-20 09:47:17', '2023-08-20 09:47:17'),
(796, 935, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-20 09:47:17', '2023-08-20 09:47:17'),
(797, 935, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-20 09:47:17', '2023-08-20 09:47:17'),
(798, 935, 'friday', '00:00:00', '00:00:00', 0, '2023-08-20 09:47:17', '2023-08-20 09:47:17'),
(799, 935, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-20 09:47:17', '2023-08-20 09:47:17'),
(800, 935, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-20 09:47:17', '2023-08-20 09:47:17'),
(801, 940, 'monday', '00:00:00', '00:00:00', 1, '2023-08-24 11:37:40', '2023-08-24 11:37:40'),
(802, 940, 'tuesday', '00:00:00', '00:00:00', 1, '2023-08-24 11:37:40', '2023-08-24 11:37:40'),
(803, 940, 'wednesday', '00:00:00', '00:00:00', 1, '2023-08-24 11:37:40', '2023-08-24 11:37:40'),
(804, 940, 'thursday', '00:00:00', '00:00:00', 1, '2023-08-24 11:37:40', '2023-08-24 11:37:40'),
(805, 940, 'friday', '00:00:00', '00:00:00', 1, '2023-08-24 11:37:40', '2023-08-24 11:37:40'),
(806, 940, 'saturday', '00:00:00', '00:00:00', 1, '2023-08-24 11:37:40', '2023-08-24 11:37:40'),
(807, 940, 'sunday', '00:00:00', '00:00:00', 1, '2023-08-24 11:37:40', '2023-08-24 11:37:40'),
(808, 942, 'monday', '00:00:00', '00:00:00', 0, '2023-08-26 16:14:11', '2023-08-26 16:14:11'),
(809, 942, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-26 16:14:11', '2023-08-26 16:14:11'),
(810, 942, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-26 16:14:11', '2023-08-26 16:14:11'),
(811, 942, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-26 16:14:11', '2023-08-26 16:14:11'),
(812, 942, 'friday', '00:00:00', '00:00:00', 0, '2023-08-26 16:14:11', '2023-08-26 16:14:11'),
(813, 942, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-26 16:14:11', '2023-08-26 16:14:11'),
(814, 942, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-26 16:14:11', '2023-08-26 16:14:11'),
(815, 944, 'monday', '00:00:00', '00:00:00', 0, '2023-08-26 21:39:34', '2023-08-26 21:39:34'),
(816, 944, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-26 21:39:34', '2023-08-26 21:39:34'),
(817, 944, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-26 21:39:34', '2023-08-26 21:39:34'),
(818, 944, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-26 21:39:34', '2023-08-26 21:39:34'),
(819, 944, 'friday', '00:00:00', '00:00:00', 0, '2023-08-26 21:39:34', '2023-08-26 21:39:34'),
(820, 944, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-26 21:39:34', '2023-08-26 21:39:34'),
(821, 944, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-26 21:39:34', '2023-08-26 21:39:34'),
(822, 949, 'monday', '00:00:00', '00:00:00', 0, '2023-08-28 20:03:01', '2023-08-28 20:03:01'),
(823, 949, 'tuesday', '00:00:00', '00:00:00', 0, '2023-08-28 20:03:01', '2023-08-28 20:03:01'),
(824, 949, 'wednesday', '00:00:00', '00:00:00', 0, '2023-08-28 20:03:01', '2023-08-28 20:03:01'),
(825, 949, 'thursday', '00:00:00', '00:00:00', 0, '2023-08-28 20:03:01', '2023-08-28 20:03:01'),
(826, 949, 'friday', '00:00:00', '00:00:00', 0, '2023-08-28 20:03:01', '2023-08-28 20:03:01'),
(827, 949, 'saturday', '00:00:00', '00:00:00', 0, '2023-08-28 20:03:01', '2023-08-28 20:03:01'),
(828, 949, 'sunday', '00:00:00', '00:00:00', 0, '2023-08-28 20:03:01', '2023-08-28 20:03:01'),
(829, 954, 'monday', '00:00:00', '00:00:00', 0, '2023-09-02 04:19:35', '2023-09-02 04:19:35'),
(830, 954, 'tuesday', '00:00:00', '00:00:00', 0, '2023-09-02 04:19:35', '2023-09-02 04:19:35'),
(831, 954, 'wednesday', '00:00:00', '00:00:00', 0, '2023-09-02 04:19:35', '2023-09-02 04:19:35'),
(832, 954, 'thursday', '00:00:00', '00:00:00', 0, '2023-09-02 04:19:35', '2023-09-02 04:19:35'),
(833, 954, 'friday', '00:00:00', '00:00:00', 0, '2023-09-02 04:19:35', '2023-09-02 04:19:35'),
(834, 954, 'saturday', '00:00:00', '00:00:00', 0, '2023-09-02 04:19:35', '2023-09-02 04:19:35'),
(835, 954, 'sunday', '00:00:00', '00:00:00', 0, '2023-09-02 04:19:35', '2023-09-02 04:19:35'),
(836, 955, 'monday', '00:00:00', '00:00:00', 0, '2023-09-02 10:03:34', '2023-09-02 10:03:34'),
(837, 955, 'tuesday', '00:00:00', '00:00:00', 0, '2023-09-02 10:03:34', '2023-09-02 10:03:34'),
(838, 955, 'wednesday', '00:00:00', '00:00:00', 0, '2023-09-02 10:03:34', '2023-09-02 10:03:34'),
(839, 955, 'thursday', '00:00:00', '00:00:00', 0, '2023-09-02 10:03:34', '2023-09-02 10:03:34'),
(840, 955, 'friday', '00:00:00', '00:00:00', 0, '2023-09-02 10:03:34', '2023-09-02 10:03:34'),
(841, 955, 'saturday', '00:00:00', '00:00:00', 0, '2023-09-02 10:03:34', '2023-09-02 10:03:34'),
(842, 955, 'sunday', '00:00:00', '00:00:00', 0, '2023-09-02 10:03:34', '2023-09-02 10:03:34'),
(843, 961, 'monday', '00:00:00', '00:00:00', 0, '2023-09-08 08:29:35', '2023-09-08 08:29:35'),
(844, 961, 'tuesday', '00:00:00', '00:00:00', 0, '2023-09-08 08:29:35', '2023-09-08 08:29:35'),
(845, 961, 'wednesday', '00:00:00', '00:00:00', 0, '2023-09-08 08:29:35', '2023-09-08 08:29:35'),
(846, 961, 'thursday', '00:00:00', '00:00:00', 0, '2023-09-08 08:29:35', '2023-09-08 08:29:35'),
(847, 961, 'friday', '00:00:00', '00:00:00', 0, '2023-09-08 08:29:35', '2023-09-08 08:29:35'),
(848, 961, 'saturday', '00:00:00', '00:00:00', 0, '2023-09-08 08:29:35', '2023-09-08 08:29:35'),
(849, 961, 'sunday', '00:00:00', '00:00:00', 0, '2023-09-08 08:29:35', '2023-09-08 08:29:35'),
(850, 962, 'monday', '00:00:00', '00:00:00', 0, '2023-09-08 18:36:11', '2023-09-08 18:36:11'),
(851, 962, 'tuesday', '00:00:00', '00:00:00', 0, '2023-09-08 18:36:11', '2023-09-08 18:36:11'),
(852, 962, 'wednesday', '00:00:00', '00:00:00', 0, '2023-09-08 18:36:11', '2023-09-08 18:36:11'),
(853, 962, 'thursday', '00:00:00', '00:00:00', 0, '2023-09-08 18:36:11', '2023-09-08 18:36:11'),
(854, 962, 'friday', '00:00:00', '00:00:00', 0, '2023-09-08 18:36:11', '2023-09-08 18:36:11'),
(855, 962, 'saturday', '00:00:00', '00:00:00', 0, '2023-09-08 18:36:11', '2023-09-08 18:36:11'),
(856, 962, 'sunday', '00:00:00', '00:00:00', 0, '2023-09-08 18:36:11', '2023-09-08 18:36:11'),
(857, 963, 'monday', '00:00:00', '00:00:00', 0, '2023-09-11 06:19:08', '2023-09-11 06:19:08'),
(858, 963, 'tuesday', '00:00:00', '00:00:00', 0, '2023-09-11 06:19:08', '2023-09-11 06:19:08'),
(859, 963, 'wednesday', '00:00:00', '00:00:00', 0, '2023-09-11 06:19:08', '2023-09-11 06:19:08'),
(860, 963, 'thursday', '00:00:00', '00:00:00', 0, '2023-09-11 06:19:08', '2023-09-11 06:19:08'),
(861, 963, 'friday', '00:00:00', '00:00:00', 0, '2023-09-11 06:19:08', '2023-09-11 06:19:08'),
(862, 963, 'saturday', '00:00:00', '00:00:00', 0, '2023-09-11 06:19:08', '2023-09-11 06:19:08'),
(863, 963, 'sunday', '00:00:00', '00:00:00', 0, '2023-09-11 06:19:08', '2023-09-11 06:19:08'),
(864, 965, 'monday', '00:00:00', '00:00:00', 0, '2023-09-12 02:37:11', '2023-09-12 02:37:11'),
(865, 965, 'tuesday', '00:00:00', '00:00:00', 0, '2023-09-12 02:37:11', '2023-09-12 02:37:11'),
(866, 965, 'wednesday', '00:00:00', '00:00:00', 0, '2023-09-12 02:37:11', '2023-09-12 02:37:11'),
(867, 965, 'thursday', '00:00:00', '00:00:00', 0, '2023-09-12 02:37:11', '2023-09-12 02:37:11'),
(868, 965, 'friday', '00:00:00', '00:00:00', 0, '2023-09-12 02:37:11', '2023-09-12 02:37:11'),
(869, 965, 'saturday', '00:00:00', '00:00:00', 0, '2023-09-12 02:37:11', '2023-09-12 02:37:11'),
(870, 965, 'sunday', '00:00:00', '00:00:00', 0, '2023-09-12 02:37:11', '2023-09-12 02:37:11'),
(871, 968, 'monday', '00:00:00', '00:00:00', 0, '2023-09-14 01:29:16', '2023-09-14 01:29:16'),
(872, 968, 'tuesday', '00:00:00', '00:00:00', 0, '2023-09-14 01:29:16', '2023-09-14 01:29:16'),
(873, 968, 'wednesday', '00:00:00', '00:00:00', 0, '2023-09-14 01:29:16', '2023-09-14 01:29:16'),
(874, 968, 'thursday', '00:00:00', '00:00:00', 0, '2023-09-14 01:29:16', '2023-09-14 01:29:16'),
(875, 968, 'friday', '00:00:00', '00:00:00', 0, '2023-09-14 01:29:16', '2023-09-14 01:29:16'),
(876, 968, 'saturday', '00:00:00', '00:00:00', 0, '2023-09-14 01:29:16', '2023-09-14 01:29:16'),
(877, 968, 'sunday', '00:00:00', '00:00:00', 0, '2023-09-14 01:29:16', '2023-09-14 01:29:16'),
(878, 970, 'monday', '00:00:00', '00:00:00', 0, '2023-09-14 08:34:33', '2023-09-14 08:34:33'),
(879, 970, 'tuesday', '00:00:00', '00:00:00', 0, '2023-09-14 08:34:33', '2023-09-14 08:34:33'),
(880, 970, 'wednesday', '00:00:00', '00:00:00', 0, '2023-09-14 08:34:33', '2023-09-14 08:34:33'),
(881, 970, 'thursday', '00:00:00', '00:00:00', 0, '2023-09-14 08:34:33', '2023-09-14 08:34:33'),
(882, 970, 'friday', '00:00:00', '00:00:00', 0, '2023-09-14 08:34:33', '2023-09-14 08:34:33'),
(883, 970, 'saturday', '00:00:00', '00:00:00', 0, '2023-09-14 08:34:33', '2023-09-14 08:34:33'),
(884, 970, 'sunday', '00:00:00', '00:00:00', 0, '2023-09-14 08:34:33', '2023-09-14 08:34:33'),
(885, 972, 'monday', '00:00:00', '00:00:00', 0, '2023-09-15 15:05:05', '2023-09-15 15:05:05'),
(886, 972, 'tuesday', '00:00:00', '00:00:00', 0, '2023-09-15 15:05:05', '2023-09-15 15:05:05'),
(887, 972, 'wednesday', '00:00:00', '00:00:00', 0, '2023-09-15 15:05:05', '2023-09-15 15:05:05'),
(888, 972, 'thursday', '00:00:00', '00:00:00', 0, '2023-09-15 15:05:05', '2023-09-15 15:05:05'),
(889, 972, 'friday', '00:00:00', '00:00:00', 0, '2023-09-15 15:05:05', '2023-09-15 15:05:05'),
(890, 972, 'saturday', '00:00:00', '00:00:00', 0, '2023-09-15 15:05:05', '2023-09-15 15:05:05'),
(891, 972, 'sunday', '00:00:00', '00:00:00', 0, '2023-09-15 15:05:05', '2023-09-15 15:05:05'),
(892, 978, 'monday', '00:00:00', '00:00:00', 0, '2023-09-19 11:52:22', '2023-09-19 11:52:22'),
(893, 978, 'tuesday', '00:00:00', '00:00:00', 0, '2023-09-19 11:52:22', '2023-09-19 11:52:22'),
(894, 978, 'wednesday', '00:00:00', '00:00:00', 0, '2023-09-19 11:52:22', '2023-09-19 11:52:22'),
(895, 978, 'thursday', '00:00:00', '00:00:00', 0, '2023-09-19 11:52:22', '2023-09-19 11:52:22'),
(896, 978, 'friday', '00:00:00', '00:00:00', 0, '2023-09-19 11:52:22', '2023-09-19 11:52:22'),
(897, 978, 'saturday', '00:00:00', '00:00:00', 0, '2023-09-19 11:52:22', '2023-09-19 11:52:22'),
(898, 978, 'sunday', '00:00:00', '00:00:00', 0, '2023-09-19 11:52:22', '2023-09-19 11:52:22'),
(899, 982, 'monday', '00:00:00', '00:00:00', 0, '2023-09-22 16:24:57', '2023-09-22 16:24:57'),
(900, 982, 'tuesday', '00:00:00', '00:00:00', 0, '2023-09-22 16:24:57', '2023-09-22 16:24:57'),
(901, 982, 'wednesday', '00:00:00', '00:00:00', 0, '2023-09-22 16:24:57', '2023-09-22 16:24:57'),
(902, 982, 'thursday', '00:00:00', '00:00:00', 0, '2023-09-22 16:24:57', '2023-09-22 16:24:57'),
(903, 982, 'friday', '00:00:00', '00:00:00', 0, '2023-09-22 16:24:57', '2023-09-22 16:24:57'),
(904, 982, 'saturday', '00:00:00', '00:00:00', 0, '2023-09-22 16:24:57', '2023-09-22 16:24:57'),
(905, 982, 'sunday', '00:00:00', '00:00:00', 0, '2023-09-22 16:24:57', '2023-09-22 16:24:57'),
(906, 991, 'monday', '09:00:00', '10:00:00', 0, '2023-09-25 22:36:37', '2023-09-25 22:36:37'),
(907, 991, 'tuesday', '09:00:00', '10:00:00', 0, '2023-09-25 22:36:37', '2023-09-25 22:36:37'),
(908, 991, 'wednesday', '09:00:00', '10:00:00', 0, '2023-09-25 22:36:37', '2023-09-25 22:36:37'),
(909, 991, 'thursday', '09:00:00', '10:00:00', 0, '2023-09-25 22:36:37', '2023-09-25 22:36:37'),
(910, 991, 'friday', '09:00:00', '10:00:00', 0, '2023-09-25 22:36:37', '2023-09-25 22:36:37'),
(911, 991, 'saturday', '09:00:00', '10:00:00', 0, '2023-09-25 22:36:37', '2023-09-25 22:36:37'),
(912, 991, 'sunday', '09:00:00', '10:00:00', 0, '2023-09-25 22:36:37', '2023-09-25 22:36:37'),
(913, 992, 'monday', '09:00:00', '10:00:00', 0, '2023-09-25 23:14:49', '2023-09-25 23:14:49'),
(914, 992, 'tuesday', '09:00:00', '10:00:00', 0, '2023-09-25 23:14:49', '2023-09-25 23:14:49'),
(915, 992, 'wednesday', '09:00:00', '10:00:00', 0, '2023-09-25 23:14:49', '2023-09-25 23:14:49'),
(916, 992, 'thursday', '09:00:00', '10:00:00', 0, '2023-09-25 23:14:49', '2023-09-25 23:14:49'),
(917, 992, 'friday', '09:00:00', '10:00:00', 0, '2023-09-25 23:14:49', '2023-09-25 23:14:49'),
(918, 992, 'saturday', '09:00:00', '10:00:00', 0, '2023-09-25 23:14:49', '2023-09-25 23:14:49'),
(919, 992, 'sunday', '09:00:00', '10:00:00', 0, '2023-09-25 23:14:49', '2023-09-25 23:14:49'),
(920, 1000, 'monday', '09:00:00', '10:00:00', 0, '2023-09-27 08:54:19', '2023-09-27 08:54:19'),
(921, 1000, 'tuesday', '09:00:00', '10:00:00', 0, '2023-09-27 08:54:19', '2023-09-27 08:54:19'),
(922, 1000, 'wednesday', '09:00:00', '10:00:00', 0, '2023-09-27 08:54:19', '2023-09-27 08:54:19'),
(923, 1000, 'thursday', '09:00:00', '10:00:00', 0, '2023-09-27 08:54:19', '2023-09-27 08:54:19'),
(924, 1000, 'friday', '09:00:00', '10:00:00', 0, '2023-09-27 08:54:19', '2023-09-27 08:54:19'),
(925, 1000, 'saturday', '09:00:00', '10:00:00', 0, '2023-09-27 08:54:19', '2023-09-27 08:54:19'),
(926, 1000, 'sunday', '09:00:00', '10:00:00', 0, '2023-09-27 08:54:19', '2023-09-27 08:54:19'),
(927, 1006, 'monday', '09:00:00', '10:00:00', 0, '2023-09-27 15:44:40', '2023-09-27 15:44:40'),
(928, 1006, 'tuesday', '09:00:00', '10:00:00', 0, '2023-09-27 15:44:40', '2023-09-27 15:44:40'),
(929, 1006, 'wednesday', '09:00:00', '10:00:00', 0, '2023-09-27 15:44:40', '2023-09-27 15:44:40'),
(930, 1006, 'thursday', '09:00:00', '10:00:00', 0, '2023-09-27 15:44:40', '2023-09-27 15:44:40'),
(931, 1006, 'friday', '09:00:00', '10:00:00', 0, '2023-09-27 15:44:40', '2023-09-27 15:44:40'),
(932, 1006, 'saturday', '09:00:00', '10:00:00', 0, '2023-09-27 15:44:40', '2023-09-27 15:44:40'),
(933, 1006, 'sunday', '09:00:00', '10:00:00', 0, '2023-09-27 15:44:40', '2023-09-27 15:44:40'),
(934, 1008, 'monday', '09:00:00', '10:00:00', 0, '2023-09-30 01:56:57', '2023-09-30 01:56:57'),
(935, 1008, 'tuesday', '09:00:00', '10:00:00', 0, '2023-09-30 01:56:57', '2023-09-30 01:56:57'),
(936, 1008, 'wednesday', '09:00:00', '10:00:00', 0, '2023-09-30 01:56:57', '2023-09-30 01:56:57'),
(937, 1008, 'thursday', '09:00:00', '10:00:00', 0, '2023-09-30 01:56:57', '2023-09-30 01:56:57'),
(938, 1008, 'friday', '09:00:00', '10:00:00', 0, '2023-09-30 01:56:57', '2023-09-30 01:56:57'),
(939, 1008, 'saturday', '09:00:00', '10:00:00', 0, '2023-09-30 01:56:57', '2023-09-30 01:56:57'),
(940, 1008, 'sunday', '09:00:00', '10:00:00', 0, '2023-09-30 01:56:57', '2023-09-30 01:56:57'),
(941, 1009, 'monday', '09:00:00', '10:00:00', 0, '2023-09-30 14:23:30', '2023-09-30 14:23:30'),
(942, 1009, 'tuesday', '09:00:00', '10:00:00', 0, '2023-09-30 14:23:30', '2023-09-30 14:23:30'),
(943, 1009, 'wednesday', '09:00:00', '10:00:00', 0, '2023-09-30 14:23:30', '2023-09-30 14:23:30'),
(944, 1009, 'thursday', '09:00:00', '10:00:00', 0, '2023-09-30 14:23:30', '2023-09-30 14:23:30'),
(945, 1009, 'friday', '09:00:00', '10:00:00', 0, '2023-09-30 14:23:30', '2023-09-30 14:23:30'),
(946, 1009, 'saturday', '09:00:00', '10:00:00', 0, '2023-09-30 14:23:30', '2023-09-30 14:23:30'),
(947, 1009, 'sunday', '09:00:00', '10:00:00', 0, '2023-09-30 14:23:30', '2023-09-30 14:23:30'),
(948, 1010, 'monday', '09:00:00', '10:00:00', 0, '2023-10-03 07:14:14', '2023-10-03 07:14:14'),
(949, 1010, 'tuesday', '09:00:00', '10:00:00', 0, '2023-10-03 07:14:14', '2023-10-03 07:14:14'),
(950, 1010, 'wednesday', '09:00:00', '10:00:00', 0, '2023-10-03 07:14:14', '2023-10-03 07:14:14'),
(951, 1010, 'thursday', '09:00:00', '10:00:00', 0, '2023-10-03 07:14:14', '2023-10-03 07:14:14'),
(952, 1010, 'friday', '09:00:00', '10:00:00', 0, '2023-10-03 07:14:14', '2023-10-03 07:14:14'),
(953, 1010, 'saturday', '09:00:00', '10:00:00', 0, '2023-10-03 07:14:14', '2023-10-03 07:14:14'),
(954, 1010, 'sunday', '09:00:00', '10:00:00', 0, '2023-10-03 07:14:14', '2023-10-03 07:14:14'),
(955, 1013, 'monday', '09:00:00', '10:00:00', 0, '2023-10-04 11:16:34', '2023-10-04 11:16:34'),
(956, 1013, 'tuesday', '09:00:00', '10:00:00', 0, '2023-10-04 11:16:34', '2023-10-04 11:16:34'),
(957, 1013, 'wednesday', '09:00:00', '10:00:00', 0, '2023-10-04 11:16:34', '2023-10-04 11:16:34'),
(958, 1013, 'thursday', '09:00:00', '10:00:00', 0, '2023-10-04 11:16:34', '2023-10-04 11:16:34'),
(959, 1013, 'friday', '09:00:00', '10:00:00', 0, '2023-10-04 11:16:34', '2023-10-04 11:16:34'),
(960, 1013, 'saturday', '09:00:00', '10:00:00', 0, '2023-10-04 11:16:34', '2023-10-04 11:16:34'),
(961, 1013, 'sunday', '09:00:00', '10:00:00', 0, '2023-10-04 11:16:34', '2023-10-04 11:16:34'),
(962, 1025, 'monday', '09:00:00', '10:00:00', 0, '2023-10-09 22:27:19', '2023-10-09 22:27:19'),
(963, 1025, 'tuesday', '09:00:00', '10:00:00', 0, '2023-10-09 22:27:19', '2023-10-09 22:27:19'),
(964, 1025, 'wednesday', '09:00:00', '10:00:00', 0, '2023-10-09 22:27:19', '2023-10-09 22:27:19'),
(965, 1025, 'thursday', '09:00:00', '10:00:00', 0, '2023-10-09 22:27:19', '2023-10-09 22:27:19'),
(966, 1025, 'friday', '09:00:00', '10:00:00', 0, '2023-10-09 22:27:19', '2023-10-09 22:27:19'),
(967, 1025, 'saturday', '09:00:00', '10:00:00', 0, '2023-10-09 22:27:19', '2023-10-09 22:27:19'),
(968, 1025, 'sunday', '09:00:00', '10:00:00', 0, '2023-10-09 22:27:19', '2023-10-09 22:27:19'),
(969, 1028, 'monday', '09:00:00', '10:00:00', 0, '2023-10-11 12:22:50', '2023-10-11 12:22:50'),
(970, 1028, 'tuesday', '09:00:00', '10:00:00', 0, '2023-10-11 12:22:50', '2023-10-11 12:22:50'),
(971, 1028, 'wednesday', '09:00:00', '10:00:00', 0, '2023-10-11 12:22:50', '2023-10-11 12:22:50'),
(972, 1028, 'thursday', '09:00:00', '10:00:00', 0, '2023-10-11 12:22:50', '2023-10-11 12:22:50'),
(973, 1028, 'friday', '09:00:00', '10:00:00', 0, '2023-10-11 12:22:50', '2023-10-11 12:22:50'),
(974, 1028, 'saturday', '09:00:00', '10:00:00', 0, '2023-10-11 12:22:50', '2023-10-11 12:22:50'),
(975, 1028, 'sunday', '09:00:00', '10:00:00', 0, '2023-10-11 12:22:50', '2023-10-11 12:22:50'),
(976, 1034, 'monday', '09:00:00', '10:00:00', 0, '2023-10-13 21:09:00', '2023-10-13 21:09:00'),
(977, 1034, 'tuesday', '09:00:00', '10:00:00', 0, '2023-10-13 21:09:00', '2023-10-13 21:09:00'),
(978, 1034, 'wednesday', '09:00:00', '10:00:00', 0, '2023-10-13 21:09:00', '2023-10-13 21:09:00'),
(979, 1034, 'thursday', '09:00:00', '10:00:00', 0, '2023-10-13 21:09:00', '2023-10-13 21:09:00'),
(980, 1034, 'friday', '09:00:00', '10:00:00', 0, '2023-10-13 21:09:00', '2023-10-13 21:09:00'),
(981, 1034, 'saturday', '09:00:00', '10:00:00', 0, '2023-10-13 21:09:00', '2023-10-13 21:09:00'),
(982, 1034, 'sunday', '09:00:00', '10:00:00', 0, '2023-10-13 21:09:00', '2023-10-13 21:09:00'),
(983, 1039, 'monday', '09:00:00', '10:00:00', 0, '2023-10-16 03:17:48', '2023-10-16 03:17:48'),
(984, 1039, 'tuesday', '09:00:00', '10:00:00', 0, '2023-10-16 03:17:48', '2023-10-16 03:17:48'),
(985, 1039, 'wednesday', '09:00:00', '10:00:00', 0, '2023-10-16 03:17:48', '2023-10-16 03:17:48'),
(986, 1039, 'thursday', '09:00:00', '10:00:00', 0, '2023-10-16 03:17:48', '2023-10-16 03:17:48'),
(987, 1039, 'friday', '09:00:00', '10:00:00', 0, '2023-10-16 03:17:48', '2023-10-16 03:17:48'),
(988, 1039, 'saturday', '09:00:00', '10:00:00', 0, '2023-10-16 03:17:48', '2023-10-16 03:17:48'),
(989, 1039, 'sunday', '09:00:00', '10:00:00', 0, '2023-10-16 03:17:48', '2023-10-16 03:17:48'),
(990, 1045, 'monday', '09:00:00', '10:00:00', 0, '2023-10-20 10:53:23', '2023-10-20 10:53:23'),
(991, 1045, 'tuesday', '09:00:00', '10:00:00', 0, '2023-10-20 10:53:23', '2023-10-20 10:53:23'),
(992, 1045, 'wednesday', '09:00:00', '10:00:00', 0, '2023-10-20 10:53:23', '2023-10-20 10:53:23'),
(993, 1045, 'thursday', '09:00:00', '10:00:00', 0, '2023-10-20 10:53:23', '2023-10-20 10:53:23'),
(994, 1045, 'friday', '09:00:00', '10:00:00', 0, '2023-10-20 10:53:23', '2023-10-20 10:53:23'),
(995, 1045, 'saturday', '09:00:00', '10:00:00', 0, '2023-10-20 10:53:23', '2023-10-20 10:53:23'),
(996, 1045, 'sunday', '09:00:00', '10:00:00', 0, '2023-10-20 10:53:23', '2023-10-20 10:53:23'),
(997, 1048, 'monday', '09:00:00', '10:00:00', 0, '2023-10-21 18:09:25', '2023-10-21 18:09:25'),
(998, 1048, 'tuesday', '09:00:00', '10:00:00', 0, '2023-10-21 18:09:25', '2023-10-21 18:09:25'),
(999, 1048, 'wednesday', '09:00:00', '10:00:00', 0, '2023-10-21 18:09:25', '2023-10-21 18:09:25'),
(1000, 1048, 'thursday', '09:00:00', '10:00:00', 0, '2023-10-21 18:09:25', '2023-10-21 18:09:25'),
(1001, 1048, 'friday', '09:00:00', '10:00:00', 0, '2023-10-21 18:09:25', '2023-10-21 18:09:25'),
(1002, 1048, 'saturday', '09:00:00', '10:00:00', 0, '2023-10-21 18:09:25', '2023-10-21 18:09:25'),
(1003, 1048, 'sunday', '09:00:00', '10:00:00', 0, '2023-10-21 18:09:25', '2023-10-21 18:09:25'),
(1004, 1050, 'monday', '09:00:00', '10:00:00', 0, '2023-10-23 13:53:31', '2023-10-23 13:53:31'),
(1005, 1050, 'tuesday', '09:00:00', '10:00:00', 0, '2023-10-23 13:53:31', '2023-10-23 13:53:31'),
(1006, 1050, 'wednesday', '09:00:00', '10:00:00', 0, '2023-10-23 13:53:31', '2023-10-23 13:53:31'),
(1007, 1050, 'thursday', '09:00:00', '10:00:00', 0, '2023-10-23 13:53:31', '2023-10-23 13:53:31'),
(1008, 1050, 'friday', '09:00:00', '10:00:00', 0, '2023-10-23 13:53:31', '2023-10-23 13:53:31'),
(1009, 1050, 'saturday', '09:00:00', '10:00:00', 0, '2023-10-23 13:53:31', '2023-10-23 13:53:31'),
(1010, 1050, 'sunday', '09:00:00', '10:00:00', 0, '2023-10-23 13:53:31', '2023-10-23 13:53:31'),
(1011, 1052, 'monday', '09:00:00', '10:00:00', 0, '2023-10-24 12:10:31', '2023-10-24 12:10:31'),
(1012, 1052, 'tuesday', '09:00:00', '10:00:00', 0, '2023-10-24 12:10:31', '2023-10-24 12:10:31'),
(1013, 1052, 'wednesday', '09:00:00', '10:00:00', 0, '2023-10-24 12:10:31', '2023-10-24 12:10:31'),
(1014, 1052, 'thursday', '09:00:00', '10:00:00', 0, '2023-10-24 12:10:31', '2023-10-24 12:10:31'),
(1015, 1052, 'friday', '09:00:00', '10:00:00', 0, '2023-10-24 12:10:31', '2023-10-24 12:10:31'),
(1016, 1052, 'saturday', '09:00:00', '10:00:00', 0, '2023-10-24 12:10:31', '2023-10-24 12:10:31'),
(1017, 1052, 'sunday', '09:00:00', '10:00:00', 0, '2023-10-24 12:10:31', '2023-10-24 12:10:31'),
(1018, 1057, 'monday', '09:00:00', '17:00:00', 1, '2023-10-27 06:30:18', '2023-10-27 06:30:18'),
(1019, 1057, 'tuesday', '09:00:00', '17:00:00', 1, '2023-10-27 06:30:18', '2023-10-27 06:30:18'),
(1020, 1057, 'wednesday', '09:00:00', '17:00:00', 1, '2023-10-27 06:30:18', '2023-10-27 06:30:18'),
(1021, 1057, 'thursday', '09:00:00', '17:00:00', 1, '2023-10-27 06:30:18', '2023-10-27 06:30:18'),
(1022, 1057, 'friday', '09:00:00', '17:00:00', 1, '2023-10-27 06:30:18', '2023-10-27 06:30:18'),
(1023, 1057, 'saturday', '09:00:00', '10:00:00', 0, '2023-10-27 06:30:18', '2023-10-27 06:30:18'),
(1024, 1057, 'sunday', '09:00:00', '10:00:00', 0, '2023-10-27 06:30:18', '2023-10-27 06:30:18'),
(1025, 1061, 'monday', '09:00:00', '10:00:00', 0, '2023-10-29 20:17:17', '2023-10-29 20:17:17'),
(1026, 1061, 'tuesday', '09:00:00', '10:00:00', 0, '2023-10-29 20:17:17', '2023-10-29 20:17:17'),
(1027, 1061, 'wednesday', '09:00:00', '10:00:00', 0, '2023-10-29 20:17:17', '2023-10-29 20:17:17'),
(1028, 1061, 'thursday', '09:00:00', '10:00:00', 0, '2023-10-29 20:17:17', '2023-10-29 20:17:17'),
(1029, 1061, 'friday', '09:00:00', '10:00:00', 0, '2023-10-29 20:17:17', '2023-10-29 20:17:17'),
(1030, 1061, 'saturday', '09:00:00', '10:00:00', 0, '2023-10-29 20:17:17', '2023-10-29 20:17:17'),
(1031, 1061, 'sunday', '09:00:00', '10:00:00', 0, '2023-10-29 20:17:17', '2023-10-29 20:17:17'),
(1032, 1063, 'monday', '09:00:00', '10:00:00', 0, '2023-10-31 21:30:08', '2023-10-31 21:30:08'),
(1033, 1063, 'tuesday', '09:00:00', '10:00:00', 0, '2023-10-31 21:30:08', '2023-10-31 21:30:08'),
(1034, 1063, 'wednesday', '09:00:00', '10:00:00', 0, '2023-10-31 21:30:08', '2023-10-31 21:30:08'),
(1035, 1063, 'thursday', '09:00:00', '10:00:00', 0, '2023-10-31 21:30:08', '2023-10-31 21:30:08'),
(1036, 1063, 'friday', '09:00:00', '10:00:00', 0, '2023-10-31 21:30:08', '2023-10-31 21:30:08'),
(1037, 1063, 'saturday', '09:00:00', '10:00:00', 0, '2023-10-31 21:30:08', '2023-10-31 21:30:08'),
(1038, 1063, 'sunday', '09:00:00', '10:00:00', 0, '2023-10-31 21:30:08', '2023-10-31 21:30:08'),
(1039, 1067, 'monday', '09:00:00', '10:00:00', 0, '2023-11-03 03:32:20', '2023-11-03 03:32:20'),
(1040, 1067, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-03 03:32:20', '2023-11-03 03:32:20'),
(1041, 1067, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-03 03:32:20', '2023-11-03 03:32:20'),
(1042, 1067, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-03 03:32:20', '2023-11-03 03:32:20'),
(1043, 1067, 'friday', '09:00:00', '10:00:00', 0, '2023-11-03 03:32:20', '2023-11-03 03:32:20'),
(1044, 1067, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-03 03:32:20', '2023-11-03 03:32:20'),
(1045, 1067, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-03 03:32:20', '2023-11-03 03:32:20'),
(1046, 1068, 'monday', '09:00:00', '10:00:00', 0, '2023-11-03 23:06:50', '2023-11-03 23:06:50'),
(1047, 1068, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-03 23:06:50', '2023-11-03 23:06:50');
INSERT INTO `partner_timings` (`id`, `partner_id`, `day`, `opening_time`, `closing_time`, `is_open`, `created_at`, `updated_at`) VALUES
(1048, 1068, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-03 23:06:50', '2023-11-03 23:06:50'),
(1049, 1068, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-03 23:06:50', '2023-11-03 23:06:50'),
(1050, 1068, 'friday', '09:00:00', '10:00:00', 0, '2023-11-03 23:06:50', '2023-11-03 23:06:50'),
(1051, 1068, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-03 23:06:50', '2023-11-03 23:06:50'),
(1052, 1068, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-03 23:06:50', '2023-11-03 23:06:50'),
(1053, 1069, 'monday', '09:00:00', '10:00:00', 0, '2023-11-04 11:44:34', '2023-11-04 11:44:34'),
(1054, 1069, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-04 11:44:34', '2023-11-04 11:44:34'),
(1055, 1069, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-04 11:44:34', '2023-11-04 11:44:34'),
(1056, 1069, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-04 11:44:34', '2023-11-04 11:44:34'),
(1057, 1069, 'friday', '09:00:00', '10:00:00', 0, '2023-11-04 11:44:34', '2023-11-04 11:44:34'),
(1058, 1069, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-04 11:44:34', '2023-11-04 11:44:34'),
(1059, 1069, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-04 11:44:34', '2023-11-04 11:44:34'),
(1060, 1087, 'monday', '09:00:00', '10:00:00', 0, '2023-11-07 17:58:30', '2023-11-07 17:58:30'),
(1061, 1087, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-07 17:58:30', '2023-11-07 17:58:30'),
(1062, 1087, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-07 17:58:30', '2023-11-07 17:58:30'),
(1063, 1087, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-07 17:58:30', '2023-11-07 17:58:30'),
(1064, 1087, 'friday', '09:00:00', '10:00:00', 0, '2023-11-07 17:58:30', '2023-11-07 17:58:30'),
(1065, 1087, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-07 17:58:30', '2023-11-07 17:58:30'),
(1066, 1087, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-07 17:58:30', '2023-11-07 17:58:30'),
(1067, 1094, 'monday', '09:00:00', '10:00:00', 0, '2023-11-10 13:38:33', '2023-11-10 13:38:33'),
(1068, 1094, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-10 13:38:33', '2023-11-10 13:38:33'),
(1069, 1094, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-10 13:38:33', '2023-11-10 13:38:33'),
(1070, 1094, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-10 13:38:33', '2023-11-10 13:38:33'),
(1071, 1094, 'friday', '09:00:00', '10:00:00', 0, '2023-11-10 13:38:33', '2023-11-10 13:38:33'),
(1072, 1094, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-10 13:38:33', '2023-11-10 13:38:33'),
(1073, 1094, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-10 13:38:33', '2023-11-10 13:38:33'),
(1074, 1096, 'monday', '09:00:00', '10:00:00', 0, '2023-11-13 14:13:36', '2023-11-13 14:13:36'),
(1075, 1096, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-13 14:13:36', '2023-11-13 14:13:36'),
(1076, 1096, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-13 14:13:36', '2023-11-13 14:13:36'),
(1077, 1096, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-13 14:13:36', '2023-11-13 14:13:36'),
(1078, 1096, 'friday', '09:00:00', '10:00:00', 0, '2023-11-13 14:13:36', '2023-11-13 14:13:36'),
(1079, 1096, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-13 14:13:36', '2023-11-13 14:13:36'),
(1080, 1096, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-13 14:13:36', '2023-11-13 14:13:36'),
(1081, 1097, 'monday', '09:00:00', '10:00:00', 0, '2023-11-14 15:35:52', '2023-11-14 15:35:52'),
(1082, 1097, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-14 15:35:52', '2023-11-14 15:35:52'),
(1083, 1097, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-14 15:35:52', '2023-11-14 15:35:52'),
(1084, 1097, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-14 15:35:52', '2023-11-14 15:35:52'),
(1085, 1097, 'friday', '09:00:00', '10:00:00', 0, '2023-11-14 15:35:52', '2023-11-14 15:35:52'),
(1086, 1097, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-14 15:35:52', '2023-11-14 15:35:52'),
(1087, 1097, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-14 15:35:52', '2023-11-14 15:35:52'),
(1088, 1098, 'monday', '09:00:00', '10:00:00', 0, '2023-11-15 01:07:53', '2023-11-15 01:07:53'),
(1089, 1098, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-15 01:07:53', '2023-11-15 01:07:53'),
(1090, 1098, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-15 01:07:53', '2023-11-15 01:07:53'),
(1091, 1098, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-15 01:07:53', '2023-11-15 01:07:53'),
(1092, 1098, 'friday', '09:00:00', '10:00:00', 0, '2023-11-15 01:07:53', '2023-11-15 01:07:53'),
(1093, 1098, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-15 01:07:53', '2023-11-15 01:07:53'),
(1094, 1098, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-15 01:07:53', '2023-11-15 01:07:53'),
(1095, 1100, 'monday', '09:00:00', '10:00:00', 0, '2023-11-16 09:45:48', '2023-11-16 09:45:48'),
(1096, 1100, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-16 09:45:48', '2023-11-16 09:45:48'),
(1097, 1100, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-16 09:45:48', '2023-11-16 09:45:48'),
(1098, 1100, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-16 09:45:48', '2023-11-16 09:45:48'),
(1099, 1100, 'friday', '09:00:00', '10:00:00', 0, '2023-11-16 09:45:48', '2023-11-16 09:45:48'),
(1100, 1100, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-16 09:45:48', '2023-11-16 09:45:48'),
(1101, 1100, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-16 09:45:48', '2023-11-16 09:45:48'),
(1102, 1105, 'monday', '09:00:00', '10:00:00', 0, '2023-11-18 10:56:08', '2023-11-18 10:56:08'),
(1103, 1105, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-18 10:56:08', '2023-11-18 10:56:08'),
(1104, 1105, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-18 10:56:08', '2023-11-18 10:56:08'),
(1105, 1105, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-18 10:56:08', '2023-11-18 10:56:08'),
(1106, 1105, 'friday', '09:00:00', '10:00:00', 0, '2023-11-18 10:56:08', '2023-11-18 10:56:08'),
(1107, 1105, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-18 10:56:08', '2023-11-18 10:56:08'),
(1108, 1105, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-18 10:56:08', '2023-11-18 10:56:08'),
(1109, 1107, 'monday', '09:00:00', '10:00:00', 0, '2023-11-18 22:00:51', '2023-11-18 22:00:51'),
(1110, 1107, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-18 22:00:51', '2023-11-18 22:00:51'),
(1111, 1107, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-18 22:00:51', '2023-11-18 22:00:51'),
(1112, 1107, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-18 22:00:51', '2023-11-18 22:00:51'),
(1113, 1107, 'friday', '09:00:00', '10:00:00', 0, '2023-11-18 22:00:51', '2023-11-18 22:00:51'),
(1114, 1107, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-18 22:00:51', '2023-11-18 22:00:51'),
(1115, 1107, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-18 22:00:51', '2023-11-18 22:00:51'),
(1116, 1111, 'monday', '09:00:00', '10:00:00', 0, '2023-11-20 07:10:47', '2023-11-20 07:10:47'),
(1117, 1111, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-20 07:10:47', '2023-11-20 07:10:47'),
(1118, 1111, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-20 07:10:47', '2023-11-20 07:10:47'),
(1119, 1111, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-20 07:10:47', '2023-11-20 07:10:47'),
(1120, 1111, 'friday', '09:00:00', '10:00:00', 0, '2023-11-20 07:10:47', '2023-11-20 07:10:47'),
(1121, 1111, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-20 07:10:47', '2023-11-20 07:10:47'),
(1122, 1111, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-20 07:10:47', '2023-11-20 07:10:47'),
(1123, 1115, 'monday', '09:00:00', '10:00:00', 0, '2023-11-21 12:37:01', '2023-11-21 12:37:01'),
(1124, 1115, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-21 12:37:01', '2023-11-21 12:37:01'),
(1125, 1115, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-21 12:37:01', '2023-11-21 12:37:01'),
(1126, 1115, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-21 12:37:01', '2023-11-21 12:37:01'),
(1127, 1115, 'friday', '09:00:00', '10:00:00', 0, '2023-11-21 12:37:01', '2023-11-21 12:37:01'),
(1128, 1115, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-21 12:37:01', '2023-11-21 12:37:01'),
(1129, 1115, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-21 12:37:01', '2023-11-21 12:37:01'),
(1130, 1118, 'monday', '09:00:00', '10:00:00', 0, '2023-11-22 08:01:04', '2023-11-22 08:01:04'),
(1131, 1118, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-22 08:01:04', '2023-11-22 08:01:04'),
(1132, 1118, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-22 08:01:04', '2023-11-22 08:01:04'),
(1133, 1118, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-22 08:01:04', '2023-11-22 08:01:04'),
(1134, 1118, 'friday', '09:00:00', '10:00:00', 0, '2023-11-22 08:01:04', '2023-11-22 08:01:04'),
(1135, 1118, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-22 08:01:04', '2023-11-22 08:01:04'),
(1136, 1118, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-22 08:01:04', '2023-11-22 08:01:04'),
(1137, 1120, 'monday', '09:00:00', '10:00:00', 0, '2023-11-22 17:35:09', '2023-11-22 17:35:09'),
(1138, 1120, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-22 17:35:09', '2023-11-22 17:35:09'),
(1139, 1120, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-22 17:35:09', '2023-11-22 17:35:09'),
(1140, 1120, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-22 17:35:09', '2023-11-22 17:35:09'),
(1141, 1120, 'friday', '09:00:00', '10:00:00', 0, '2023-11-22 17:35:09', '2023-11-22 17:35:09'),
(1142, 1120, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-22 17:35:09', '2023-11-22 17:35:09'),
(1143, 1120, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-22 17:35:09', '2023-11-22 17:35:09'),
(1144, 1123, 'monday', '09:00:00', '10:00:00', 0, '2023-11-23 07:28:04', '2023-11-23 07:28:04'),
(1145, 1123, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-23 07:28:04', '2023-11-23 07:28:04'),
(1146, 1123, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-23 07:28:04', '2023-11-23 07:28:04'),
(1147, 1123, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-23 07:28:04', '2023-11-23 07:28:04'),
(1148, 1123, 'friday', '09:00:00', '10:00:00', 0, '2023-11-23 07:28:04', '2023-11-23 07:28:04'),
(1149, 1123, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-23 07:28:04', '2023-11-23 07:28:04'),
(1150, 1123, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-23 07:28:04', '2023-11-23 07:28:04'),
(1151, 1125, 'monday', '09:00:00', '10:00:00', 0, '2023-11-23 17:45:51', '2023-11-23 17:45:51'),
(1152, 1125, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-23 17:45:51', '2023-11-23 17:45:51'),
(1153, 1125, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-23 17:45:51', '2023-11-23 17:45:51'),
(1154, 1125, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-23 17:45:51', '2023-11-23 17:45:51'),
(1155, 1125, 'friday', '09:00:00', '10:00:00', 0, '2023-11-23 17:45:51', '2023-11-23 17:45:51'),
(1156, 1125, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-23 17:45:51', '2023-11-23 17:45:51'),
(1157, 1125, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-23 17:45:51', '2023-11-23 17:45:51'),
(1158, 1130, 'monday', '09:00:00', '10:00:00', 0, '2023-11-25 23:47:06', '2023-11-25 23:47:06'),
(1159, 1130, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-25 23:47:06', '2023-11-25 23:47:06'),
(1160, 1130, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-25 23:47:06', '2023-11-25 23:47:06'),
(1161, 1130, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-25 23:47:06', '2023-11-25 23:47:06'),
(1162, 1130, 'friday', '09:00:00', '10:00:00', 0, '2023-11-25 23:47:06', '2023-11-25 23:47:06'),
(1163, 1130, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-25 23:47:06', '2023-11-25 23:47:06'),
(1164, 1130, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-25 23:47:06', '2023-11-25 23:47:06'),
(1165, 1131, 'monday', '09:00:00', '10:00:00', 0, '2023-11-27 02:43:21', '2023-11-27 02:43:21'),
(1166, 1131, 'tuesday', '09:00:00', '10:00:00', 0, '2023-11-27 02:43:21', '2023-11-27 02:43:21'),
(1167, 1131, 'wednesday', '09:00:00', '10:00:00', 0, '2023-11-27 02:43:21', '2023-11-27 02:43:21'),
(1168, 1131, 'thursday', '09:00:00', '10:00:00', 0, '2023-11-27 02:43:21', '2023-11-27 02:43:21'),
(1169, 1131, 'friday', '09:00:00', '10:00:00', 0, '2023-11-27 02:43:21', '2023-11-27 02:43:21'),
(1170, 1131, 'saturday', '09:00:00', '10:00:00', 0, '2023-11-27 02:43:21', '2023-11-27 02:43:21'),
(1171, 1131, 'sunday', '09:00:00', '10:00:00', 0, '2023-11-27 02:43:21', '2023-11-27 02:43:21'),
(1172, 1140, 'monday', '09:00:00', '10:00:00', 0, '2023-12-06 08:38:37', '2023-12-06 08:38:37'),
(1173, 1140, 'tuesday', '09:00:00', '10:00:00', 0, '2023-12-06 08:38:37', '2023-12-06 08:38:37'),
(1174, 1140, 'wednesday', '09:00:00', '10:00:00', 0, '2023-12-06 08:38:37', '2023-12-06 08:38:37'),
(1175, 1140, 'thursday', '09:00:00', '10:00:00', 0, '2023-12-06 08:38:37', '2023-12-06 08:38:37'),
(1176, 1140, 'friday', '09:00:00', '10:00:00', 0, '2023-12-06 08:38:37', '2023-12-06 08:38:37'),
(1177, 1140, 'saturday', '09:00:00', '10:00:00', 0, '2023-12-06 08:38:37', '2023-12-06 08:38:37'),
(1178, 1140, 'sunday', '09:00:00', '10:00:00', 0, '2023-12-06 08:38:37', '2023-12-06 08:38:37'),
(1179, 1146, 'monday', '09:00:00', '10:00:00', 0, '2023-12-11 18:57:04', '2023-12-11 18:57:04'),
(1180, 1146, 'tuesday', '09:00:00', '10:00:00', 0, '2023-12-11 18:57:04', '2023-12-11 18:57:04'),
(1181, 1146, 'wednesday', '09:00:00', '10:00:00', 0, '2023-12-11 18:57:04', '2023-12-11 18:57:04'),
(1182, 1146, 'thursday', '09:00:00', '10:00:00', 0, '2023-12-11 18:57:04', '2023-12-11 18:57:04'),
(1183, 1146, 'friday', '09:00:00', '10:00:00', 0, '2023-12-11 18:57:04', '2023-12-11 18:57:04'),
(1184, 1146, 'saturday', '09:00:00', '10:00:00', 0, '2023-12-11 18:57:04', '2023-12-11 18:57:04'),
(1185, 1146, 'sunday', '09:00:00', '10:00:00', 0, '2023-12-11 18:57:04', '2023-12-11 18:57:04'),
(1186, 1147, 'monday', '09:00:00', '10:00:00', 0, '2023-12-11 20:52:37', '2023-12-11 20:52:37'),
(1187, 1147, 'tuesday', '09:00:00', '10:00:00', 0, '2023-12-11 20:52:37', '2023-12-11 20:52:37'),
(1188, 1147, 'wednesday', '09:00:00', '10:00:00', 0, '2023-12-11 20:52:37', '2023-12-11 20:52:37'),
(1189, 1147, 'thursday', '09:00:00', '10:00:00', 0, '2023-12-11 20:52:37', '2023-12-11 20:52:37'),
(1190, 1147, 'friday', '09:00:00', '10:00:00', 0, '2023-12-11 20:52:37', '2023-12-11 20:52:37'),
(1191, 1147, 'saturday', '09:00:00', '10:00:00', 0, '2023-12-11 20:52:37', '2023-12-11 20:52:37'),
(1192, 1147, 'sunday', '09:00:00', '10:00:00', 0, '2023-12-11 20:52:37', '2023-12-11 20:52:37'),
(1193, 1149, 'monday', '09:00:00', '10:00:00', 0, '2023-12-12 08:39:26', '2023-12-12 08:39:26'),
(1194, 1149, 'tuesday', '09:00:00', '10:00:00', 0, '2023-12-12 08:39:26', '2023-12-12 08:39:26'),
(1195, 1149, 'wednesday', '09:00:00', '10:00:00', 0, '2023-12-12 08:39:26', '2023-12-12 08:39:26'),
(1196, 1149, 'thursday', '09:00:00', '10:00:00', 0, '2023-12-12 08:39:26', '2023-12-12 08:39:26'),
(1197, 1149, 'friday', '09:00:00', '10:00:00', 0, '2023-12-12 08:39:26', '2023-12-12 08:39:26'),
(1198, 1149, 'saturday', '09:00:00', '10:00:00', 0, '2023-12-12 08:39:26', '2023-12-12 08:39:26'),
(1199, 1149, 'sunday', '09:00:00', '10:00:00', 0, '2023-12-12 08:39:26', '2023-12-12 08:39:26'),
(1200, 1150, 'monday', '09:00:00', '10:00:00', 0, '2023-12-12 08:48:13', '2023-12-12 08:48:13'),
(1201, 1150, 'tuesday', '09:00:00', '10:00:00', 0, '2023-12-12 08:48:13', '2023-12-12 08:48:13'),
(1202, 1150, 'wednesday', '09:00:00', '10:00:00', 0, '2023-12-12 08:48:13', '2023-12-12 08:48:13'),
(1203, 1150, 'thursday', '09:00:00', '10:00:00', 0, '2023-12-12 08:48:13', '2023-12-12 08:48:13'),
(1204, 1150, 'friday', '09:00:00', '10:00:00', 0, '2023-12-12 08:48:13', '2023-12-12 08:48:13'),
(1205, 1150, 'saturday', '09:00:00', '10:00:00', 0, '2023-12-12 08:48:13', '2023-12-12 08:48:13'),
(1206, 1150, 'sunday', '09:00:00', '10:00:00', 0, '2023-12-12 08:48:13', '2023-12-12 08:48:13'),
(1207, 1152, 'monday', '09:00:00', '10:00:00', 0, '2023-12-12 21:20:34', '2023-12-12 21:20:34'),
(1208, 1152, 'tuesday', '09:00:00', '10:00:00', 0, '2023-12-12 21:20:34', '2023-12-12 21:20:34'),
(1209, 1152, 'wednesday', '09:00:00', '10:00:00', 0, '2023-12-12 21:20:34', '2023-12-12 21:20:34'),
(1210, 1152, 'thursday', '09:00:00', '10:00:00', 0, '2023-12-12 21:20:34', '2023-12-12 21:20:34'),
(1211, 1152, 'friday', '09:00:00', '10:00:00', 0, '2023-12-12 21:20:34', '2023-12-12 21:20:34'),
(1212, 1152, 'saturday', '09:00:00', '10:00:00', 0, '2023-12-12 21:20:34', '2023-12-12 21:20:34'),
(1213, 1152, 'sunday', '09:00:00', '10:00:00', 0, '2023-12-12 21:20:34', '2023-12-12 21:20:34'),
(1214, 1155, 'monday', '09:00:00', '10:00:00', 0, '2023-12-15 07:17:45', '2023-12-15 07:17:45'),
(1215, 1155, 'tuesday', '09:00:00', '10:00:00', 0, '2023-12-15 07:17:45', '2023-12-15 07:17:45'),
(1216, 1155, 'wednesday', '09:00:00', '10:00:00', 0, '2023-12-15 07:17:45', '2023-12-15 07:17:45'),
(1217, 1155, 'thursday', '09:00:00', '10:00:00', 0, '2023-12-15 07:17:45', '2023-12-15 07:17:45'),
(1218, 1155, 'friday', '09:00:00', '10:00:00', 0, '2023-12-15 07:17:45', '2023-12-15 07:17:45'),
(1219, 1155, 'saturday', '09:00:00', '10:00:00', 0, '2023-12-15 07:17:45', '2023-12-15 07:17:45'),
(1220, 1155, 'sunday', '09:00:00', '10:00:00', 0, '2023-12-15 07:17:45', '2023-12-15 07:17:45'),
(1221, 1156, 'monday', '09:00:00', '10:00:00', 0, '2023-12-15 13:24:36', '2023-12-15 13:24:36'),
(1222, 1156, 'tuesday', '09:00:00', '10:00:00', 0, '2023-12-15 13:24:36', '2023-12-15 13:24:36'),
(1223, 1156, 'wednesday', '09:00:00', '10:00:00', 0, '2023-12-15 13:24:36', '2023-12-15 13:24:36'),
(1224, 1156, 'thursday', '09:00:00', '10:00:00', 0, '2023-12-15 13:24:36', '2023-12-15 13:24:36'),
(1225, 1156, 'friday', '09:00:00', '10:00:00', 0, '2023-12-15 13:24:36', '2023-12-15 13:24:36'),
(1226, 1156, 'saturday', '09:00:00', '10:00:00', 0, '2023-12-15 13:24:36', '2023-12-15 13:24:36'),
(1227, 1156, 'sunday', '09:00:00', '10:00:00', 0, '2023-12-15 13:24:36', '2023-12-15 13:24:36'),
(1228, 1160, 'monday', '09:00:00', '10:00:00', 0, '2023-12-17 03:46:31', '2023-12-17 03:46:31'),
(1229, 1160, 'tuesday', '09:00:00', '10:00:00', 0, '2023-12-17 03:46:31', '2023-12-17 03:46:31'),
(1230, 1160, 'wednesday', '09:00:00', '10:00:00', 0, '2023-12-17 03:46:31', '2023-12-17 03:46:31'),
(1231, 1160, 'thursday', '09:00:00', '10:00:00', 0, '2023-12-17 03:46:31', '2023-12-17 03:46:31'),
(1232, 1160, 'friday', '09:00:00', '10:00:00', 0, '2023-12-17 03:46:31', '2023-12-17 03:46:31'),
(1233, 1160, 'saturday', '09:00:00', '10:00:00', 0, '2023-12-17 03:46:31', '2023-12-17 03:46:31'),
(1234, 1160, 'sunday', '09:00:00', '10:00:00', 0, '2023-12-17 03:46:31', '2023-12-17 03:46:31'),
(1235, 1161, 'monday', '09:00:00', '10:00:00', 0, '2023-12-18 14:57:45', '2023-12-18 14:57:45'),
(1236, 1161, 'tuesday', '09:00:00', '10:00:00', 0, '2023-12-18 14:57:45', '2023-12-18 14:57:45'),
(1237, 1161, 'wednesday', '09:00:00', '10:00:00', 0, '2023-12-18 14:57:45', '2023-12-18 14:57:45'),
(1238, 1161, 'thursday', '09:00:00', '10:00:00', 0, '2023-12-18 14:57:45', '2023-12-18 14:57:45'),
(1239, 1161, 'friday', '09:00:00', '10:00:00', 0, '2023-12-18 14:57:45', '2023-12-18 14:57:45'),
(1240, 1161, 'saturday', '09:00:00', '10:00:00', 0, '2023-12-18 14:57:45', '2023-12-18 14:57:45'),
(1241, 1161, 'sunday', '09:00:00', '10:00:00', 0, '2023-12-18 14:57:45', '2023-12-18 14:57:45'),
(1242, 1171, 'monday', '09:00:00', '10:00:00', 0, '2023-12-28 11:40:00', '2023-12-28 11:40:00'),
(1243, 1171, 'tuesday', '09:00:00', '10:00:00', 0, '2023-12-28 11:40:00', '2023-12-28 11:40:00'),
(1244, 1171, 'wednesday', '09:00:00', '10:00:00', 0, '2023-12-28 11:40:00', '2023-12-28 11:40:00'),
(1245, 1171, 'thursday', '09:00:00', '10:00:00', 0, '2023-12-28 11:40:00', '2023-12-28 11:40:00'),
(1246, 1171, 'friday', '09:00:00', '10:00:00', 0, '2023-12-28 11:40:00', '2023-12-28 11:40:00'),
(1247, 1171, 'saturday', '09:00:00', '10:00:00', 0, '2023-12-28 11:40:00', '2023-12-28 11:40:00'),
(1248, 1171, 'sunday', '09:00:00', '10:00:00', 0, '2023-12-28 11:40:00', '2023-12-28 11:40:00'),
(1249, 1172, 'monday', '09:00:00', '10:00:00', 0, '2023-12-28 13:31:26', '2023-12-28 13:31:26'),
(1250, 1172, 'tuesday', '09:00:00', '10:00:00', 0, '2023-12-28 13:31:26', '2023-12-28 13:31:26'),
(1251, 1172, 'wednesday', '09:00:00', '10:00:00', 0, '2023-12-28 13:31:26', '2023-12-28 13:31:26'),
(1252, 1172, 'thursday', '09:00:00', '10:00:00', 0, '2023-12-28 13:31:26', '2023-12-28 13:31:26'),
(1253, 1172, 'friday', '09:00:00', '10:00:00', 0, '2023-12-28 13:31:26', '2023-12-28 13:31:26'),
(1254, 1172, 'saturday', '09:00:00', '10:00:00', 0, '2023-12-28 13:31:26', '2023-12-28 13:31:26'),
(1255, 1172, 'sunday', '09:00:00', '10:00:00', 0, '2023-12-28 13:31:26', '2023-12-28 13:31:26'),
(1256, 1176, 'monday', '09:00:00', '10:00:00', 0, '2023-12-31 12:34:49', '2023-12-31 12:34:49'),
(1257, 1176, 'tuesday', '09:00:00', '10:00:00', 0, '2023-12-31 12:34:49', '2023-12-31 12:34:49'),
(1258, 1176, 'wednesday', '09:00:00', '10:00:00', 0, '2023-12-31 12:34:49', '2023-12-31 12:34:49'),
(1259, 1176, 'thursday', '09:00:00', '10:00:00', 0, '2023-12-31 12:34:49', '2023-12-31 12:34:49'),
(1260, 1176, 'friday', '09:00:00', '10:00:00', 0, '2023-12-31 12:34:49', '2023-12-31 12:34:49'),
(1261, 1176, 'saturday', '09:00:00', '10:00:00', 0, '2023-12-31 12:34:49', '2023-12-31 12:34:49'),
(1262, 1176, 'sunday', '09:00:00', '10:00:00', 0, '2023-12-31 12:34:49', '2023-12-31 12:34:49'),
(1263, 1177, 'monday', '09:00:00', '10:00:00', 0, '2024-01-01 21:08:45', '2024-01-01 21:08:45'),
(1264, 1177, 'tuesday', '09:00:00', '10:00:00', 0, '2024-01-01 21:08:45', '2024-01-01 21:08:45'),
(1265, 1177, 'wednesday', '09:00:00', '10:00:00', 0, '2024-01-01 21:08:45', '2024-01-01 21:08:45'),
(1266, 1177, 'thursday', '09:00:00', '10:00:00', 0, '2024-01-01 21:08:45', '2024-01-01 21:08:45'),
(1267, 1177, 'friday', '09:00:00', '10:00:00', 0, '2024-01-01 21:08:45', '2024-01-01 21:08:45'),
(1268, 1177, 'saturday', '09:00:00', '10:00:00', 0, '2024-01-01 21:08:45', '2024-01-01 21:08:45'),
(1269, 1177, 'sunday', '09:00:00', '10:00:00', 0, '2024-01-01 21:08:45', '2024-01-01 21:08:45'),
(1270, 1179, 'monday', '09:00:00', '10:00:00', 0, '2024-01-04 01:48:02', '2024-01-04 01:48:02'),
(1271, 1179, 'tuesday', '09:00:00', '10:00:00', 0, '2024-01-04 01:48:02', '2024-01-04 01:48:02'),
(1272, 1179, 'wednesday', '09:00:00', '10:00:00', 0, '2024-01-04 01:48:02', '2024-01-04 01:48:02'),
(1273, 1179, 'thursday', '09:00:00', '10:00:00', 0, '2024-01-04 01:48:02', '2024-01-04 01:48:02'),
(1274, 1179, 'friday', '09:00:00', '10:00:00', 0, '2024-01-04 01:48:02', '2024-01-04 01:48:02'),
(1275, 1179, 'saturday', '09:00:00', '10:00:00', 0, '2024-01-04 01:48:02', '2024-01-04 01:48:02'),
(1276, 1179, 'sunday', '09:00:00', '10:00:00', 0, '2024-01-04 01:48:02', '2024-01-04 01:48:02'),
(1277, 1189, 'monday', '09:00:00', '10:00:00', 0, '2024-01-11 03:46:00', '2024-01-11 03:46:00'),
(1278, 1189, 'tuesday', '09:00:00', '10:00:00', 0, '2024-01-11 03:46:00', '2024-01-11 03:46:00'),
(1279, 1189, 'wednesday', '09:00:00', '10:00:00', 0, '2024-01-11 03:46:00', '2024-01-11 03:46:00'),
(1280, 1189, 'thursday', '09:00:00', '10:00:00', 0, '2024-01-11 03:46:00', '2024-01-11 03:46:00'),
(1281, 1189, 'friday', '09:00:00', '10:00:00', 0, '2024-01-11 03:46:00', '2024-01-11 03:46:00'),
(1282, 1189, 'saturday', '09:00:00', '10:00:00', 0, '2024-01-11 03:46:00', '2024-01-11 03:46:00'),
(1283, 1189, 'sunday', '09:00:00', '10:00:00', 0, '2024-01-11 03:46:00', '2024-01-11 03:46:00'),
(1284, 1197, 'monday', '09:00:00', '10:00:00', 0, '2024-01-13 15:32:43', '2024-01-13 15:32:43'),
(1285, 1197, 'tuesday', '09:00:00', '10:00:00', 0, '2024-01-13 15:32:43', '2024-01-13 15:32:43'),
(1286, 1197, 'wednesday', '09:00:00', '10:00:00', 0, '2024-01-13 15:32:43', '2024-01-13 15:32:43'),
(1287, 1197, 'thursday', '09:00:00', '10:00:00', 0, '2024-01-13 15:32:43', '2024-01-13 15:32:43'),
(1288, 1197, 'friday', '09:00:00', '10:00:00', 0, '2024-01-13 15:32:43', '2024-01-13 15:32:43'),
(1289, 1197, 'saturday', '09:00:00', '10:00:00', 0, '2024-01-13 15:32:43', '2024-01-13 15:32:43'),
(1290, 1197, 'sunday', '09:00:00', '10:00:00', 0, '2024-01-13 15:32:43', '2024-01-13 15:32:43'),
(1291, 1202, 'monday', '09:00:00', '10:00:00', 0, '2024-01-16 12:32:16', '2024-01-16 12:32:16'),
(1292, 1202, 'tuesday', '09:00:00', '10:00:00', 0, '2024-01-16 12:32:16', '2024-01-16 12:32:16'),
(1293, 1202, 'wednesday', '09:00:00', '10:00:00', 0, '2024-01-16 12:32:16', '2024-01-16 12:32:16'),
(1294, 1202, 'thursday', '09:00:00', '10:00:00', 0, '2024-01-16 12:32:16', '2024-01-16 12:32:16'),
(1295, 1202, 'friday', '09:00:00', '10:00:00', 0, '2024-01-16 12:32:16', '2024-01-16 12:32:16'),
(1296, 1202, 'saturday', '09:00:00', '10:00:00', 0, '2024-01-16 12:32:16', '2024-01-16 12:32:16'),
(1297, 1202, 'sunday', '09:00:00', '10:00:00', 0, '2024-01-16 12:32:16', '2024-01-16 12:32:16'),
(1298, 1204, 'monday', '09:00:00', '10:00:00', 0, '2024-01-16 21:20:43', '2024-01-16 21:20:43'),
(1299, 1204, 'tuesday', '09:00:00', '10:00:00', 0, '2024-01-16 21:20:43', '2024-01-16 21:20:43'),
(1300, 1204, 'wednesday', '09:00:00', '10:00:00', 0, '2024-01-16 21:20:43', '2024-01-16 21:20:43'),
(1301, 1204, 'thursday', '09:00:00', '10:00:00', 0, '2024-01-16 21:20:43', '2024-01-16 21:20:43'),
(1302, 1204, 'friday', '09:00:00', '10:00:00', 0, '2024-01-16 21:20:43', '2024-01-16 21:20:43'),
(1303, 1204, 'saturday', '09:00:00', '10:00:00', 0, '2024-01-16 21:20:43', '2024-01-16 21:20:43'),
(1304, 1204, 'sunday', '09:00:00', '10:00:00', 0, '2024-01-16 21:20:43', '2024-01-16 21:20:43'),
(1305, 1205, 'monday', '09:00:00', '10:00:00', 0, '2024-01-17 20:40:55', '2024-01-17 20:40:55'),
(1306, 1205, 'tuesday', '09:00:00', '10:00:00', 0, '2024-01-17 20:40:55', '2024-01-17 20:40:55'),
(1307, 1205, 'wednesday', '09:00:00', '10:00:00', 0, '2024-01-17 20:40:55', '2024-01-17 20:40:55'),
(1308, 1205, 'thursday', '09:00:00', '10:00:00', 0, '2024-01-17 20:40:55', '2024-01-17 20:40:55'),
(1309, 1205, 'friday', '09:00:00', '10:00:00', 0, '2024-01-17 20:40:55', '2024-01-17 20:40:55'),
(1310, 1205, 'saturday', '09:00:00', '10:00:00', 0, '2024-01-17 20:40:55', '2024-01-17 20:40:55'),
(1311, 1205, 'sunday', '09:00:00', '10:00:00', 0, '2024-01-17 20:40:55', '2024-01-17 20:40:55'),
(1312, 1207, 'monday', '09:00:00', '10:00:00', 0, '2024-01-18 14:17:43', '2024-01-18 14:17:43'),
(1313, 1207, 'tuesday', '09:00:00', '10:00:00', 0, '2024-01-18 14:17:43', '2024-01-18 14:17:43'),
(1314, 1207, 'wednesday', '09:00:00', '10:00:00', 0, '2024-01-18 14:17:43', '2024-01-18 14:17:43'),
(1315, 1207, 'thursday', '09:00:00', '10:00:00', 0, '2024-01-18 14:17:43', '2024-01-18 14:17:43'),
(1316, 1207, 'friday', '09:00:00', '10:00:00', 0, '2024-01-18 14:17:43', '2024-01-18 14:17:43'),
(1317, 1207, 'saturday', '09:00:00', '10:00:00', 0, '2024-01-18 14:17:43', '2024-01-18 14:17:43'),
(1318, 1207, 'sunday', '09:00:00', '10:00:00', 0, '2024-01-18 14:17:43', '2024-01-18 14:17:43'),
(1319, 1211, 'monday', '09:00:00', '10:00:00', 0, '2024-01-24 08:30:11', '2024-01-24 08:30:11'),
(1320, 1211, 'tuesday', '09:00:00', '10:00:00', 0, '2024-01-24 08:30:11', '2024-01-24 08:30:11'),
(1321, 1211, 'wednesday', '09:00:00', '10:00:00', 0, '2024-01-24 08:30:11', '2024-01-24 08:30:11'),
(1322, 1211, 'thursday', '09:00:00', '10:00:00', 0, '2024-01-24 08:30:11', '2024-01-24 08:30:11'),
(1323, 1211, 'friday', '09:00:00', '10:00:00', 0, '2024-01-24 08:30:11', '2024-01-24 08:30:11'),
(1324, 1211, 'saturday', '09:00:00', '10:00:00', 0, '2024-01-24 08:30:11', '2024-01-24 08:30:11'),
(1325, 1211, 'sunday', '09:00:00', '10:00:00', 0, '2024-01-24 08:30:11', '2024-01-24 08:30:11'),
(1326, 1213, 'monday', '09:00:00', '10:00:00', 0, '2024-01-24 12:50:59', '2024-01-24 12:50:59'),
(1327, 1213, 'tuesday', '09:00:00', '10:00:00', 0, '2024-01-24 12:50:59', '2024-01-24 12:50:59'),
(1328, 1213, 'wednesday', '09:00:00', '10:00:00', 0, '2024-01-24 12:50:59', '2024-01-24 12:50:59'),
(1329, 1213, 'thursday', '09:00:00', '10:00:00', 0, '2024-01-24 12:50:59', '2024-01-24 12:50:59'),
(1330, 1213, 'friday', '09:00:00', '10:00:00', 0, '2024-01-24 12:50:59', '2024-01-24 12:50:59'),
(1331, 1213, 'saturday', '09:00:00', '10:00:00', 0, '2024-01-24 12:50:59', '2024-01-24 12:50:59'),
(1332, 1213, 'sunday', '09:00:00', '10:00:00', 0, '2024-01-24 12:50:59', '2024-01-24 12:50:59'),
(1333, 1215, 'monday', '09:00:00', '10:00:00', 0, '2024-01-26 14:40:14', '2024-01-26 14:40:14'),
(1334, 1215, 'tuesday', '09:00:00', '10:00:00', 0, '2024-01-26 14:40:14', '2024-01-26 14:40:14'),
(1335, 1215, 'wednesday', '09:00:00', '10:00:00', 0, '2024-01-26 14:40:14', '2024-01-26 14:40:14'),
(1336, 1215, 'thursday', '09:00:00', '10:00:00', 0, '2024-01-26 14:40:14', '2024-01-26 14:40:14'),
(1337, 1215, 'friday', '09:00:00', '10:00:00', 0, '2024-01-26 14:40:14', '2024-01-26 14:40:14'),
(1338, 1215, 'saturday', '09:00:00', '10:00:00', 0, '2024-01-26 14:40:14', '2024-01-26 14:40:14'),
(1339, 1215, 'sunday', '09:00:00', '10:00:00', 0, '2024-01-26 14:40:14', '2024-01-26 14:40:14'),
(1340, 1221, 'monday', '09:00:00', '10:00:00', 0, '2024-01-28 12:32:58', '2024-01-28 12:32:58'),
(1341, 1221, 'tuesday', '09:00:00', '10:00:00', 0, '2024-01-28 12:32:58', '2024-01-28 12:32:58'),
(1342, 1221, 'wednesday', '09:00:00', '10:00:00', 0, '2024-01-28 12:32:58', '2024-01-28 12:32:58'),
(1343, 1221, 'thursday', '09:00:00', '10:00:00', 0, '2024-01-28 12:32:58', '2024-01-28 12:32:58'),
(1344, 1221, 'friday', '09:00:00', '10:00:00', 0, '2024-01-28 12:32:58', '2024-01-28 12:32:58'),
(1345, 1221, 'saturday', '09:00:00', '10:00:00', 0, '2024-01-28 12:32:58', '2024-01-28 12:32:58'),
(1346, 1221, 'sunday', '09:00:00', '10:00:00', 0, '2024-01-28 12:32:58', '2024-01-28 12:32:58'),
(1347, 1222, 'monday', '09:00:00', '10:00:00', 0, '2024-01-28 17:14:36', '2024-01-28 17:14:36'),
(1348, 1222, 'tuesday', '09:00:00', '10:00:00', 0, '2024-01-28 17:14:36', '2024-01-28 17:14:36'),
(1349, 1222, 'wednesday', '09:00:00', '10:00:00', 0, '2024-01-28 17:14:36', '2024-01-28 17:14:36'),
(1350, 1222, 'thursday', '09:00:00', '10:00:00', 0, '2024-01-28 17:14:36', '2024-01-28 17:14:36'),
(1351, 1222, 'friday', '09:00:00', '10:00:00', 0, '2024-01-28 17:14:36', '2024-01-28 17:14:36'),
(1352, 1222, 'saturday', '09:00:00', '10:00:00', 0, '2024-01-28 17:14:36', '2024-01-28 17:14:36'),
(1353, 1222, 'sunday', '09:00:00', '10:00:00', 0, '2024-01-28 17:14:36', '2024-01-28 17:14:36'),
(1354, 1235, 'monday', '09:00:00', '10:00:00', 0, '2024-02-03 08:54:26', '2024-02-03 08:54:26'),
(1355, 1235, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-03 08:54:26', '2024-02-03 08:54:26'),
(1356, 1235, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-03 08:54:26', '2024-02-03 08:54:26'),
(1357, 1235, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-03 08:54:26', '2024-02-03 08:54:26'),
(1358, 1235, 'friday', '09:00:00', '10:00:00', 0, '2024-02-03 08:54:26', '2024-02-03 08:54:26'),
(1359, 1235, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-03 08:54:26', '2024-02-03 08:54:26'),
(1360, 1235, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-03 08:54:26', '2024-02-03 08:54:26'),
(1361, 1236, 'monday', '09:00:00', '10:00:00', 0, '2024-02-04 09:35:58', '2024-02-04 09:35:58'),
(1362, 1236, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-04 09:35:58', '2024-02-04 09:35:58'),
(1363, 1236, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-04 09:35:58', '2024-02-04 09:35:58'),
(1364, 1236, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-04 09:35:58', '2024-02-04 09:35:58'),
(1365, 1236, 'friday', '09:00:00', '10:00:00', 0, '2024-02-04 09:35:58', '2024-02-04 09:35:58'),
(1366, 1236, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-04 09:35:58', '2024-02-04 09:35:58'),
(1367, 1236, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-04 09:35:58', '2024-02-04 09:35:58'),
(1368, 1243, 'monday', '09:00:00', '10:00:00', 0, '2024-02-05 01:54:00', '2024-02-05 01:54:00'),
(1369, 1243, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-05 01:54:00', '2024-02-05 01:54:00'),
(1370, 1243, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-05 01:54:00', '2024-02-05 01:54:00'),
(1371, 1243, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-05 01:54:00', '2024-02-05 01:54:00'),
(1372, 1243, 'friday', '09:00:00', '10:00:00', 0, '2024-02-05 01:54:00', '2024-02-05 01:54:00'),
(1373, 1243, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-05 01:54:00', '2024-02-05 01:54:00'),
(1374, 1243, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-05 01:54:00', '2024-02-05 01:54:00'),
(1375, 1244, 'monday', '09:00:00', '10:00:00', 0, '2024-02-05 02:14:06', '2024-02-05 02:14:06'),
(1376, 1244, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-05 02:14:06', '2024-02-05 02:14:06'),
(1377, 1244, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-05 02:14:06', '2024-02-05 02:14:06'),
(1378, 1244, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-05 02:14:06', '2024-02-05 02:14:06'),
(1379, 1244, 'friday', '09:00:00', '10:00:00', 0, '2024-02-05 02:14:06', '2024-02-05 02:14:06'),
(1380, 1244, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-05 02:14:06', '2024-02-05 02:14:06'),
(1381, 1244, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-05 02:14:06', '2024-02-05 02:14:06'),
(1382, 1269, 'monday', '09:00:00', '10:00:00', 0, '2024-02-09 03:37:12', '2024-02-09 03:37:12'),
(1383, 1269, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-09 03:37:12', '2024-02-09 03:37:12'),
(1384, 1269, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-09 03:37:12', '2024-02-09 03:37:12'),
(1385, 1269, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-09 03:37:12', '2024-02-09 03:37:12'),
(1386, 1269, 'friday', '09:00:00', '10:00:00', 0, '2024-02-09 03:37:12', '2024-02-09 03:37:12'),
(1387, 1269, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-09 03:37:12', '2024-02-09 03:37:12'),
(1388, 1269, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-09 03:37:12', '2024-02-09 03:37:12'),
(1389, 1270, 'monday', '09:00:00', '10:00:00', 0, '2024-02-10 14:27:03', '2024-02-10 14:27:03'),
(1390, 1270, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-10 14:27:03', '2024-02-10 14:27:03'),
(1391, 1270, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-10 14:27:03', '2024-02-10 14:27:03'),
(1392, 1270, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-10 14:27:03', '2024-02-10 14:27:03'),
(1393, 1270, 'friday', '09:00:00', '10:00:00', 0, '2024-02-10 14:27:03', '2024-02-10 14:27:03'),
(1394, 1270, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-10 14:27:03', '2024-02-10 14:27:03'),
(1395, 1270, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-10 14:27:03', '2024-02-10 14:27:03'),
(1396, 1277, 'monday', '09:00:00', '10:00:00', 0, '2024-02-13 18:29:38', '2024-02-13 18:29:38'),
(1397, 1277, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-13 18:29:38', '2024-02-13 18:29:38'),
(1398, 1277, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-13 18:29:38', '2024-02-13 18:29:38'),
(1399, 1277, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-13 18:29:38', '2024-02-13 18:29:38'),
(1400, 1277, 'friday', '09:00:00', '10:00:00', 0, '2024-02-13 18:29:38', '2024-02-13 18:29:38'),
(1401, 1277, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-13 18:29:38', '2024-02-13 18:29:38'),
(1402, 1277, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-13 18:29:38', '2024-02-13 18:29:38'),
(1403, 1278, 'monday', '09:00:00', '10:00:00', 0, '2024-02-13 22:10:27', '2024-02-13 22:10:27'),
(1404, 1278, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-13 22:10:27', '2024-02-13 22:10:27'),
(1405, 1278, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-13 22:10:27', '2024-02-13 22:10:27'),
(1406, 1278, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-13 22:10:27', '2024-02-13 22:10:27'),
(1407, 1278, 'friday', '09:00:00', '10:00:00', 0, '2024-02-13 22:10:27', '2024-02-13 22:10:27'),
(1408, 1278, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-13 22:10:27', '2024-02-13 22:10:27'),
(1409, 1278, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-13 22:10:27', '2024-02-13 22:10:27'),
(1410, 1280, 'monday', '09:00:00', '10:00:00', 0, '2024-02-15 13:57:20', '2024-02-15 13:57:20'),
(1411, 1280, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-15 13:57:20', '2024-02-15 13:57:20'),
(1412, 1280, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-15 13:57:20', '2024-02-15 13:57:20'),
(1413, 1280, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-15 13:57:20', '2024-02-15 13:57:20'),
(1414, 1280, 'friday', '09:00:00', '10:00:00', 0, '2024-02-15 13:57:20', '2024-02-15 13:57:20'),
(1415, 1280, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-15 13:57:20', '2024-02-15 13:57:20'),
(1416, 1280, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-15 13:57:20', '2024-02-15 13:57:20'),
(1417, 1281, 'monday', '09:00:00', '10:00:00', 0, '2024-02-15 23:11:10', '2024-02-15 23:11:10'),
(1418, 1281, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-15 23:11:10', '2024-02-15 23:11:10'),
(1419, 1281, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-15 23:11:10', '2024-02-15 23:11:10'),
(1420, 1281, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-15 23:11:10', '2024-02-15 23:11:10'),
(1421, 1281, 'friday', '09:00:00', '10:00:00', 0, '2024-02-15 23:11:10', '2024-02-15 23:11:10'),
(1422, 1281, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-15 23:11:10', '2024-02-15 23:11:10'),
(1423, 1281, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-15 23:11:10', '2024-02-15 23:11:10'),
(1424, 1286, 'monday', '09:00:00', '10:00:00', 0, '2024-02-18 12:50:51', '2024-02-18 12:50:51'),
(1425, 1286, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-18 12:50:51', '2024-02-18 12:50:51'),
(1426, 1286, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-18 12:50:51', '2024-02-18 12:50:51'),
(1427, 1286, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-18 12:50:51', '2024-02-18 12:50:51'),
(1428, 1286, 'friday', '09:00:00', '10:00:00', 0, '2024-02-18 12:50:51', '2024-02-18 12:50:51'),
(1429, 1286, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-18 12:50:51', '2024-02-18 12:50:51'),
(1430, 1286, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-18 12:50:51', '2024-02-18 12:50:51'),
(1438, 1292, 'monday', '09:00:00', '10:00:00', 0, '2024-02-21 11:47:33', '2024-02-21 11:47:33'),
(1439, 1292, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-21 11:47:33', '2024-02-21 11:47:33'),
(1440, 1292, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-21 11:47:33', '2024-02-21 11:47:33'),
(1441, 1292, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-21 11:47:33', '2024-02-21 11:47:33'),
(1442, 1292, 'friday', '09:00:00', '10:00:00', 0, '2024-02-21 11:47:33', '2024-02-21 11:47:33'),
(1443, 1292, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-21 11:47:33', '2024-02-21 11:47:33'),
(1444, 1292, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-21 11:47:33', '2024-02-21 11:47:33'),
(1445, 1293, 'monday', '09:00:00', '10:00:00', 0, '2024-02-22 08:50:02', '2024-02-22 08:50:02'),
(1446, 1293, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-22 08:50:02', '2024-02-22 08:50:02'),
(1447, 1293, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-22 08:50:02', '2024-02-22 08:50:02'),
(1448, 1293, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-22 08:50:02', '2024-02-22 08:50:02'),
(1449, 1293, 'friday', '09:00:00', '10:00:00', 0, '2024-02-22 08:50:02', '2024-02-22 08:50:02'),
(1450, 1293, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-22 08:50:02', '2024-02-22 08:50:02'),
(1451, 1293, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-22 08:50:02', '2024-02-22 08:50:02'),
(1452, 1294, 'monday', '09:00:00', '10:00:00', 0, '2024-02-22 11:09:04', '2024-02-22 11:09:04'),
(1453, 1294, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-22 11:09:04', '2024-02-22 11:09:04'),
(1454, 1294, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-22 11:09:04', '2024-02-22 11:09:04'),
(1455, 1294, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-22 11:09:04', '2024-02-22 11:09:04'),
(1456, 1294, 'friday', '09:00:00', '10:00:00', 0, '2024-02-22 11:09:04', '2024-02-22 11:09:04'),
(1457, 1294, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-22 11:09:04', '2024-02-22 11:09:04'),
(1458, 1294, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-22 11:09:04', '2024-02-22 11:09:04'),
(1459, 1295, 'monday', '09:00:00', '10:00:00', 0, '2024-02-23 10:19:46', '2024-02-23 10:19:46'),
(1460, 1295, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-23 10:19:46', '2024-02-23 10:19:46'),
(1461, 1295, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-23 10:19:46', '2024-02-23 10:19:46'),
(1462, 1295, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-23 10:19:46', '2024-02-23 10:19:46'),
(1463, 1295, 'friday', '09:00:00', '10:00:00', 0, '2024-02-23 10:19:46', '2024-02-23 10:19:46'),
(1464, 1295, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-23 10:19:46', '2024-02-23 10:19:46'),
(1465, 1295, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-23 10:19:46', '2024-02-23 10:19:46'),
(1466, 1296, 'monday', '09:00:00', '10:00:00', 0, '2024-02-23 10:31:32', '2024-02-23 10:31:32'),
(1467, 1296, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-23 10:31:32', '2024-02-23 10:31:32'),
(1468, 1296, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-23 10:31:32', '2024-02-23 10:31:32'),
(1469, 1296, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-23 10:31:32', '2024-02-23 10:31:32'),
(1470, 1296, 'friday', '09:00:00', '10:00:00', 0, '2024-02-23 10:31:32', '2024-02-23 10:31:32'),
(1471, 1296, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-23 10:31:32', '2024-02-23 10:31:32'),
(1472, 1296, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-23 10:31:32', '2024-02-23 10:31:32'),
(1473, 1301, 'monday', '09:00:00', '10:00:00', 0, '2024-02-25 19:54:46', '2024-02-25 19:54:46'),
(1474, 1301, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-25 19:54:46', '2024-02-25 19:54:46'),
(1475, 1301, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-25 19:54:46', '2024-02-25 19:54:46'),
(1476, 1301, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-25 19:54:46', '2024-02-25 19:54:46'),
(1477, 1301, 'friday', '09:00:00', '10:00:00', 0, '2024-02-25 19:54:46', '2024-02-25 19:54:46'),
(1478, 1301, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-25 19:54:46', '2024-02-25 19:54:46'),
(1479, 1301, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-25 19:54:46', '2024-02-25 19:54:46'),
(1480, 1304, 'monday', '09:00:00', '10:00:00', 0, '2024-02-26 12:48:07', '2024-02-26 12:48:07'),
(1481, 1304, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-26 12:48:07', '2024-02-26 12:48:07'),
(1482, 1304, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-26 12:48:07', '2024-02-26 12:48:07'),
(1483, 1304, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-26 12:48:07', '2024-02-26 12:48:07'),
(1484, 1304, 'friday', '09:00:00', '10:00:00', 0, '2024-02-26 12:48:07', '2024-02-26 12:48:07'),
(1485, 1304, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-26 12:48:07', '2024-02-26 12:48:07'),
(1486, 1304, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-26 12:48:07', '2024-02-26 12:48:07'),
(1487, 1306, 'monday', '09:00:00', '10:00:00', 0, '2024-02-27 11:32:43', '2024-02-27 11:32:43'),
(1488, 1306, 'tuesday', '09:00:00', '10:00:00', 0, '2024-02-27 11:32:43', '2024-02-27 11:32:43'),
(1489, 1306, 'wednesday', '09:00:00', '10:00:00', 0, '2024-02-27 11:32:43', '2024-02-27 11:32:43'),
(1490, 1306, 'thursday', '09:00:00', '10:00:00', 0, '2024-02-27 11:32:43', '2024-02-27 11:32:43'),
(1491, 1306, 'friday', '09:00:00', '10:00:00', 0, '2024-02-27 11:32:43', '2024-02-27 11:32:43'),
(1492, 1306, 'saturday', '09:00:00', '10:00:00', 0, '2024-02-27 11:32:43', '2024-02-27 11:32:43'),
(1493, 1306, 'sunday', '09:00:00', '10:00:00', 0, '2024-02-27 11:32:43', '2024-02-27 11:32:43'),
(1494, 1317, 'monday', '09:00:00', '10:00:00', 0, '2024-03-03 05:05:16', '2024-03-03 05:05:16'),
(1495, 1317, 'tuesday', '09:00:00', '10:00:00', 0, '2024-03-03 05:05:16', '2024-03-03 05:05:16'),
(1496, 1317, 'wednesday', '09:00:00', '10:00:00', 0, '2024-03-03 05:05:16', '2024-03-03 05:05:16'),
(1497, 1317, 'thursday', '09:00:00', '10:00:00', 0, '2024-03-03 05:05:16', '2024-03-03 05:05:16'),
(1498, 1317, 'friday', '09:00:00', '10:00:00', 0, '2024-03-03 05:05:16', '2024-03-03 05:05:16'),
(1499, 1317, 'saturday', '09:00:00', '10:00:00', 0, '2024-03-03 05:05:16', '2024-03-03 05:05:16'),
(1500, 1317, 'sunday', '09:00:00', '10:00:00', 0, '2024-03-03 05:05:16', '2024-03-03 05:05:16'),
(1501, 1320, 'monday', '09:00:00', '10:00:00', 0, '2024-03-05 02:26:05', '2024-03-05 02:26:05'),
(1502, 1320, 'tuesday', '09:00:00', '10:00:00', 0, '2024-03-05 02:26:05', '2024-03-05 02:26:05'),
(1503, 1320, 'wednesday', '09:00:00', '10:00:00', 0, '2024-03-05 02:26:05', '2024-03-05 02:26:05'),
(1504, 1320, 'thursday', '09:00:00', '10:00:00', 0, '2024-03-05 02:26:05', '2024-03-05 02:26:05'),
(1505, 1320, 'friday', '09:00:00', '10:00:00', 0, '2024-03-05 02:26:05', '2024-03-05 02:26:05'),
(1506, 1320, 'saturday', '09:00:00', '10:00:00', 0, '2024-03-05 02:26:05', '2024-03-05 02:26:05'),
(1507, 1320, 'sunday', '09:00:00', '10:00:00', 0, '2024-03-05 02:26:05', '2024-03-05 02:26:05'),
(1508, 1327, 'monday', '09:00:00', '10:00:00', 0, '2024-03-11 22:03:34', '2024-03-11 22:03:34'),
(1509, 1327, 'tuesday', '09:00:00', '10:00:00', 0, '2024-03-11 22:03:34', '2024-03-11 22:03:34'),
(1510, 1327, 'wednesday', '09:00:00', '10:00:00', 0, '2024-03-11 22:03:34', '2024-03-11 22:03:34'),
(1511, 1327, 'thursday', '09:00:00', '10:00:00', 0, '2024-03-11 22:03:34', '2024-03-11 22:03:34'),
(1512, 1327, 'friday', '09:00:00', '10:00:00', 0, '2024-03-11 22:03:34', '2024-03-11 22:03:34'),
(1513, 1327, 'saturday', '09:00:00', '10:00:00', 0, '2024-03-11 22:03:34', '2024-03-11 22:03:34'),
(1514, 1327, 'sunday', '09:00:00', '10:00:00', 0, '2024-03-11 22:03:34', '2024-03-11 22:03:34'),
(1515, 1335, 'monday', '09:00:00', '10:00:00', 0, '2024-03-20 21:18:29', '2024-03-20 21:18:29'),
(1516, 1335, 'tuesday', '09:00:00', '10:00:00', 0, '2024-03-20 21:18:29', '2024-03-20 21:18:29'),
(1517, 1335, 'wednesday', '09:00:00', '10:00:00', 0, '2024-03-20 21:18:29', '2024-03-20 21:18:29'),
(1518, 1335, 'thursday', '09:00:00', '10:00:00', 0, '2024-03-20 21:18:29', '2024-03-20 21:18:29'),
(1519, 1335, 'friday', '09:00:00', '10:00:00', 0, '2024-03-20 21:18:29', '2024-03-20 21:18:29'),
(1520, 1335, 'saturday', '09:00:00', '10:00:00', 0, '2024-03-20 21:18:29', '2024-03-20 21:18:29'),
(1521, 1335, 'sunday', '09:00:00', '10:00:00', 0, '2024-03-20 21:18:29', '2024-03-20 21:18:29'),
(1522, 1336, 'monday', '09:00:00', '10:00:00', 0, '2024-03-21 08:45:17', '2024-03-21 08:45:17'),
(1523, 1336, 'tuesday', '09:00:00', '10:00:00', 0, '2024-03-21 08:45:17', '2024-03-21 08:45:17'),
(1524, 1336, 'wednesday', '09:00:00', '10:00:00', 0, '2024-03-21 08:45:17', '2024-03-21 08:45:17'),
(1525, 1336, 'thursday', '09:00:00', '10:00:00', 0, '2024-03-21 08:45:17', '2024-03-21 08:45:17'),
(1526, 1336, 'friday', '09:00:00', '10:00:00', 0, '2024-03-21 08:45:17', '2024-03-21 08:45:17'),
(1527, 1336, 'saturday', '09:00:00', '10:00:00', 0, '2024-03-21 08:45:17', '2024-03-21 08:45:17'),
(1528, 1336, 'sunday', '09:00:00', '10:00:00', 0, '2024-03-21 08:45:17', '2024-03-21 08:45:17'),
(1529, 1340, 'monday', '09:00:00', '10:00:00', 0, '2024-03-26 21:44:21', '2024-03-26 21:44:21'),
(1530, 1340, 'tuesday', '09:00:00', '10:00:00', 0, '2024-03-26 21:44:21', '2024-03-26 21:44:21'),
(1531, 1340, 'wednesday', '09:00:00', '10:00:00', 0, '2024-03-26 21:44:21', '2024-03-26 21:44:21'),
(1532, 1340, 'thursday', '09:00:00', '10:00:00', 0, '2024-03-26 21:44:22', '2024-03-26 21:44:22'),
(1533, 1340, 'friday', '09:00:00', '10:00:00', 0, '2024-03-26 21:44:22', '2024-03-26 21:44:22'),
(1534, 1340, 'saturday', '09:00:00', '10:00:00', 0, '2024-03-26 21:44:22', '2024-03-26 21:44:22'),
(1535, 1340, 'sunday', '09:00:00', '10:00:00', 0, '2024-03-26 21:44:22', '2024-03-26 21:44:22'),
(1536, 1343, 'monday', '09:00:00', '10:00:00', 0, '2024-03-28 02:21:56', '2024-03-28 02:21:56'),
(1537, 1343, 'tuesday', '09:00:00', '10:00:00', 0, '2024-03-28 02:21:56', '2024-03-28 02:21:56'),
(1538, 1343, 'wednesday', '09:00:00', '10:00:00', 0, '2024-03-28 02:21:56', '2024-03-28 02:21:56'),
(1539, 1343, 'thursday', '09:00:00', '10:00:00', 0, '2024-03-28 02:21:56', '2024-03-28 02:21:56'),
(1540, 1343, 'friday', '09:00:00', '10:00:00', 0, '2024-03-28 02:21:56', '2024-03-28 02:21:56'),
(1541, 1343, 'saturday', '09:00:00', '10:00:00', 0, '2024-03-28 02:21:56', '2024-03-28 02:21:56'),
(1542, 1343, 'sunday', '09:00:00', '10:00:00', 0, '2024-03-28 02:21:56', '2024-03-28 02:21:56'),
(1543, 1347, 'monday', '09:00:00', '10:00:00', 0, '2024-04-03 13:30:16', '2024-04-03 13:30:16'),
(1544, 1347, 'tuesday', '09:00:00', '10:00:00', 0, '2024-04-03 13:30:16', '2024-04-03 13:30:16'),
(1545, 1347, 'wednesday', '09:00:00', '10:00:00', 0, '2024-04-03 13:30:16', '2024-04-03 13:30:16'),
(1546, 1347, 'thursday', '09:00:00', '10:00:00', 0, '2024-04-03 13:30:16', '2024-04-03 13:30:16'),
(1547, 1347, 'friday', '09:00:00', '10:00:00', 0, '2024-04-03 13:30:16', '2024-04-03 13:30:16'),
(1548, 1347, 'saturday', '09:00:00', '10:00:00', 0, '2024-04-03 13:30:16', '2024-04-03 13:30:16'),
(1549, 1347, 'sunday', '09:00:00', '10:00:00', 0, '2024-04-03 13:30:16', '2024-04-03 13:30:16'),
(1550, 1348, 'monday', '09:00:00', '10:00:00', 0, '2024-04-03 19:17:52', '2024-04-03 19:17:52'),
(1551, 1348, 'tuesday', '09:00:00', '10:00:00', 0, '2024-04-03 19:17:52', '2024-04-03 19:17:52'),
(1552, 1348, 'wednesday', '09:00:00', '10:00:00', 0, '2024-04-03 19:17:52', '2024-04-03 19:17:52'),
(1553, 1348, 'thursday', '09:00:00', '10:00:00', 0, '2024-04-03 19:17:52', '2024-04-03 19:17:52'),
(1554, 1348, 'friday', '09:00:00', '10:00:00', 0, '2024-04-03 19:17:52', '2024-04-03 19:17:52'),
(1555, 1348, 'saturday', '09:00:00', '10:00:00', 0, '2024-04-03 19:17:52', '2024-04-03 19:17:52'),
(1556, 1348, 'sunday', '09:00:00', '10:00:00', 0, '2024-04-03 19:17:52', '2024-04-03 19:17:52'),
(1557, 1350, 'monday', '09:00:00', '10:00:00', 0, '2024-04-03 21:23:13', '2024-04-03 21:23:13'),
(1558, 1350, 'tuesday', '09:00:00', '10:00:00', 0, '2024-04-03 21:23:13', '2024-04-03 21:23:13'),
(1559, 1350, 'wednesday', '09:00:00', '10:00:00', 0, '2024-04-03 21:23:13', '2024-04-03 21:23:13'),
(1560, 1350, 'thursday', '09:00:00', '10:00:00', 0, '2024-04-03 21:23:13', '2024-04-03 21:23:13'),
(1561, 1350, 'friday', '09:00:00', '10:00:00', 0, '2024-04-03 21:23:13', '2024-04-03 21:23:13'),
(1562, 1350, 'saturday', '09:00:00', '10:00:00', 0, '2024-04-03 21:23:13', '2024-04-03 21:23:13'),
(1563, 1350, 'sunday', '09:00:00', '10:00:00', 0, '2024-04-03 21:23:13', '2024-04-03 21:23:13'),
(1564, 1351, 'monday', '09:00:00', '10:00:00', 0, '2024-04-06 17:42:45', '2024-04-06 17:42:45'),
(1565, 1351, 'tuesday', '09:00:00', '10:00:00', 0, '2024-04-06 17:42:45', '2024-04-06 17:42:45'),
(1566, 1351, 'wednesday', '09:00:00', '10:00:00', 0, '2024-04-06 17:42:45', '2024-04-06 17:42:45'),
(1567, 1351, 'thursday', '09:00:00', '10:00:00', 0, '2024-04-06 17:42:45', '2024-04-06 17:42:45'),
(1568, 1351, 'friday', '09:00:00', '10:00:00', 0, '2024-04-06 17:42:45', '2024-04-06 17:42:45'),
(1569, 1351, 'saturday', '09:00:00', '10:00:00', 0, '2024-04-06 17:42:45', '2024-04-06 17:42:45'),
(1570, 1351, 'sunday', '09:00:00', '10:00:00', 0, '2024-04-06 17:42:45', '2024-04-06 17:42:45'),
(1571, 1392, 'monday', '09:00:00', '10:00:00', 0, '2024-05-16 05:57:14', '2024-05-16 05:57:14'),
(1572, 1392, 'tuesday', '09:00:00', '10:00:00', 0, '2024-05-16 05:57:14', '2024-05-16 05:57:14');
INSERT INTO `partner_timings` (`id`, `partner_id`, `day`, `opening_time`, `closing_time`, `is_open`, `created_at`, `updated_at`) VALUES
(1573, 1392, 'wednesday', '09:00:00', '10:00:00', 0, '2024-05-16 05:57:14', '2024-05-16 05:57:14'),
(1574, 1392, 'thursday', '09:00:00', '10:00:00', 0, '2024-05-16 05:57:14', '2024-05-16 05:57:14'),
(1575, 1392, 'friday', '09:00:00', '10:00:00', 0, '2024-05-16 05:57:14', '2024-05-16 05:57:14'),
(1576, 1392, 'saturday', '09:00:00', '10:00:00', 0, '2024-05-16 05:57:14', '2024-05-16 05:57:14'),
(1577, 1392, 'sunday', '09:00:00', '10:00:00', 0, '2024-05-16 05:57:14', '2024-05-16 05:57:14'),
(1578, 1393, 'monday', '09:00:00', '10:00:00', 0, '2024-05-16 06:26:07', '2024-05-16 06:26:07'),
(1579, 1393, 'tuesday', '09:00:00', '10:00:00', 0, '2024-05-16 06:26:07', '2024-05-16 06:26:07'),
(1580, 1393, 'wednesday', '09:00:00', '10:00:00', 0, '2024-05-16 06:26:07', '2024-05-16 06:26:07'),
(1581, 1393, 'thursday', '09:00:00', '10:00:00', 0, '2024-05-16 06:26:07', '2024-05-16 06:26:07'),
(1582, 1393, 'friday', '09:00:00', '10:00:00', 0, '2024-05-16 06:26:07', '2024-05-16 06:26:07'),
(1583, 1393, 'saturday', '09:00:00', '10:00:00', 0, '2024-05-16 06:26:07', '2024-05-16 06:26:07'),
(1584, 1393, 'sunday', '09:00:00', '10:00:00', 0, '2024-05-16 06:26:07', '2024-05-16 06:26:07'),
(1585, 1394, 'monday', '09:00:00', '10:00:00', 0, '2024-05-16 10:38:31', '2024-05-16 10:38:31'),
(1586, 1394, 'tuesday', '09:00:00', '10:00:00', 0, '2024-05-16 10:38:31', '2024-05-16 10:38:31'),
(1587, 1394, 'wednesday', '09:00:00', '10:00:00', 0, '2024-05-16 10:38:31', '2024-05-16 10:38:31'),
(1588, 1394, 'thursday', '09:00:00', '10:00:00', 0, '2024-05-16 10:38:31', '2024-05-16 10:38:31'),
(1589, 1394, 'friday', '09:00:00', '10:00:00', 0, '2024-05-16 10:38:31', '2024-05-16 10:38:31'),
(1590, 1394, 'saturday', '09:00:00', '10:00:00', 0, '2024-05-16 10:38:31', '2024-05-16 10:38:31'),
(1591, 1394, 'sunday', '09:00:00', '10:00:00', 0, '2024-05-16 10:38:31', '2024-05-16 10:38:31'),
(1592, 1398, 'monday', '09:00:00', '10:00:00', 0, '2024-05-18 06:29:57', '2024-05-18 06:29:57'),
(1593, 1398, 'tuesday', '09:00:00', '10:00:00', 0, '2024-05-18 06:29:57', '2024-05-18 06:29:57'),
(1594, 1398, 'wednesday', '09:00:00', '10:00:00', 0, '2024-05-18 06:29:57', '2024-05-18 06:29:57'),
(1595, 1398, 'thursday', '09:00:00', '10:00:00', 0, '2024-05-18 06:29:57', '2024-05-18 06:29:57'),
(1596, 1398, 'friday', '09:00:00', '10:00:00', 0, '2024-05-18 06:29:57', '2024-05-18 06:29:57'),
(1597, 1398, 'saturday', '09:00:00', '10:00:00', 0, '2024-05-18 06:29:57', '2024-05-18 06:29:57'),
(1598, 1398, 'sunday', '09:00:00', '10:00:00', 0, '2024-05-18 06:29:57', '2024-05-18 06:29:57'),
(1599, 1403, 'monday', '09:00:00', '10:00:00', 0, '2024-05-22 10:52:45', '2024-05-22 10:52:45'),
(1600, 1403, 'tuesday', '09:00:00', '10:00:00', 0, '2024-05-22 10:52:45', '2024-05-22 10:52:45'),
(1601, 1403, 'wednesday', '09:00:00', '10:00:00', 0, '2024-05-22 10:52:45', '2024-05-22 10:52:45'),
(1602, 1403, 'thursday', '09:00:00', '10:00:00', 0, '2024-05-22 10:52:45', '2024-05-22 10:52:45'),
(1603, 1403, 'friday', '09:00:00', '10:00:00', 0, '2024-05-22 10:52:45', '2024-05-22 10:52:45'),
(1604, 1403, 'saturday', '09:00:00', '10:00:00', 0, '2024-05-22 10:52:45', '2024-05-22 10:52:45'),
(1605, 1403, 'sunday', '09:00:00', '10:00:00', 0, '2024-05-22 10:52:45', '2024-05-22 10:52:45'),
(1606, 1406, 'monday', '09:00:00', '10:00:00', 0, '2024-05-24 12:01:31', '2024-05-24 12:01:31'),
(1607, 1406, 'tuesday', '09:00:00', '10:00:00', 0, '2024-05-24 12:01:31', '2024-05-24 12:01:31'),
(1608, 1406, 'wednesday', '09:00:00', '10:00:00', 0, '2024-05-24 12:01:31', '2024-05-24 12:01:31'),
(1609, 1406, 'thursday', '09:00:00', '10:00:00', 0, '2024-05-24 12:01:31', '2024-05-24 12:01:31'),
(1610, 1406, 'friday', '09:00:00', '10:00:00', 0, '2024-05-24 12:01:31', '2024-05-24 12:01:31'),
(1611, 1406, 'saturday', '09:00:00', '10:00:00', 0, '2024-05-24 12:01:31', '2024-05-24 12:01:31'),
(1612, 1406, 'sunday', '09:00:00', '10:00:00', 0, '2024-05-24 12:01:31', '2024-05-24 12:01:31'),
(1613, 1407, 'monday', '09:00:00', '10:00:00', 0, '2024-05-25 21:23:45', '2024-05-25 21:23:45'),
(1614, 1407, 'tuesday', '09:00:00', '10:00:00', 0, '2024-05-25 21:23:45', '2024-05-25 21:23:45'),
(1615, 1407, 'wednesday', '09:00:00', '10:00:00', 0, '2024-05-25 21:23:45', '2024-05-25 21:23:45'),
(1616, 1407, 'thursday', '09:00:00', '10:00:00', 0, '2024-05-25 21:23:45', '2024-05-25 21:23:45'),
(1617, 1407, 'friday', '09:00:00', '10:00:00', 0, '2024-05-25 21:23:45', '2024-05-25 21:23:45'),
(1618, 1407, 'saturday', '09:00:00', '10:00:00', 0, '2024-05-25 21:23:45', '2024-05-25 21:23:45'),
(1619, 1407, 'sunday', '09:00:00', '10:00:00', 0, '2024-05-25 21:23:45', '2024-05-25 21:23:45'),
(1620, 1412, 'monday', '09:00:00', '10:00:00', 0, '2024-05-28 18:31:37', '2024-05-28 18:31:37'),
(1621, 1412, 'tuesday', '09:00:00', '10:00:00', 0, '2024-05-28 18:31:37', '2024-05-28 18:31:37'),
(1622, 1412, 'wednesday', '09:00:00', '10:00:00', 0, '2024-05-28 18:31:37', '2024-05-28 18:31:37'),
(1623, 1412, 'thursday', '09:00:00', '10:00:00', 0, '2024-05-28 18:31:37', '2024-05-28 18:31:37'),
(1624, 1412, 'friday', '09:00:00', '10:00:00', 0, '2024-05-28 18:31:37', '2024-05-28 18:31:37'),
(1625, 1412, 'saturday', '09:00:00', '10:00:00', 0, '2024-05-28 18:31:37', '2024-05-28 18:31:37'),
(1626, 1412, 'sunday', '09:00:00', '10:00:00', 0, '2024-05-28 18:31:37', '2024-05-28 18:31:37'),
(1627, 1413, 'monday', '09:00:00', '10:00:00', 0, '2024-05-29 10:44:24', '2024-05-29 10:44:24'),
(1628, 1413, 'tuesday', '09:00:00', '10:00:00', 0, '2024-05-29 10:44:24', '2024-05-29 10:44:24'),
(1629, 1413, 'wednesday', '09:00:00', '10:00:00', 0, '2024-05-29 10:44:24', '2024-05-29 10:44:24'),
(1630, 1413, 'thursday', '09:00:00', '10:00:00', 0, '2024-05-29 10:44:24', '2024-05-29 10:44:24'),
(1631, 1413, 'friday', '09:00:00', '10:00:00', 0, '2024-05-29 10:44:24', '2024-05-29 10:44:24'),
(1632, 1413, 'saturday', '09:00:00', '10:00:00', 0, '2024-05-29 10:44:24', '2024-05-29 10:44:24'),
(1633, 1413, 'sunday', '09:00:00', '10:00:00', 0, '2024-05-29 10:44:24', '2024-05-29 10:44:24'),
(1634, 1416, 'monday', '09:00:00', '10:00:00', 0, '2024-05-30 09:21:04', '2024-05-30 09:21:04'),
(1635, 1416, 'tuesday', '09:00:00', '10:00:00', 0, '2024-05-30 09:21:04', '2024-05-30 09:21:04'),
(1636, 1416, 'wednesday', '09:00:00', '10:00:00', 0, '2024-05-30 09:21:04', '2024-05-30 09:21:04'),
(1637, 1416, 'thursday', '09:00:00', '10:00:00', 0, '2024-05-30 09:21:04', '2024-05-30 09:21:04'),
(1638, 1416, 'friday', '09:00:00', '10:00:00', 0, '2024-05-30 09:21:04', '2024-05-30 09:21:04'),
(1639, 1416, 'saturday', '09:00:00', '10:00:00', 0, '2024-05-30 09:21:04', '2024-05-30 09:21:04'),
(1640, 1416, 'sunday', '09:00:00', '10:00:00', 0, '2024-05-30 09:21:04', '2024-05-30 09:21:04'),
(1641, 1417, 'monday', '09:00:00', '10:00:00', 0, '2024-05-31 10:36:12', '2024-05-31 10:36:12'),
(1642, 1417, 'tuesday', '09:00:00', '10:00:00', 0, '2024-05-31 10:36:12', '2024-05-31 10:36:12'),
(1643, 1417, 'wednesday', '09:00:00', '10:00:00', 0, '2024-05-31 10:36:12', '2024-05-31 10:36:12'),
(1644, 1417, 'thursday', '09:00:00', '10:00:00', 0, '2024-05-31 10:36:12', '2024-05-31 10:36:12'),
(1645, 1417, 'friday', '09:00:00', '10:00:00', 0, '2024-05-31 10:36:12', '2024-05-31 10:36:12'),
(1646, 1417, 'saturday', '09:00:00', '10:00:00', 0, '2024-05-31 10:36:12', '2024-05-31 10:36:12'),
(1647, 1417, 'sunday', '09:00:00', '10:00:00', 0, '2024-05-31 10:36:12', '2024-05-31 10:36:12'),
(1648, 1421, 'monday', '09:00:00', '10:00:00', 0, '2024-06-01 07:36:08', '2024-06-01 07:36:08'),
(1649, 1421, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-01 07:36:08', '2024-06-01 07:36:08'),
(1650, 1421, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-01 07:36:08', '2024-06-01 07:36:08'),
(1651, 1421, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-01 07:36:08', '2024-06-01 07:36:08'),
(1652, 1421, 'friday', '09:00:00', '10:00:00', 0, '2024-06-01 07:36:08', '2024-06-01 07:36:08'),
(1653, 1421, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-01 07:36:08', '2024-06-01 07:36:08'),
(1654, 1421, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-01 07:36:08', '2024-06-01 07:36:08'),
(1655, 1425, 'monday', '09:00:00', '10:00:00', 0, '2024-06-02 18:17:14', '2024-06-02 18:17:14'),
(1656, 1425, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-02 18:17:14', '2024-06-02 18:17:14'),
(1657, 1425, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-02 18:17:14', '2024-06-02 18:17:14'),
(1658, 1425, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-02 18:17:14', '2024-06-02 18:17:14'),
(1659, 1425, 'friday', '09:00:00', '10:00:00', 0, '2024-06-02 18:17:14', '2024-06-02 18:17:14'),
(1660, 1425, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-02 18:17:14', '2024-06-02 18:17:14'),
(1661, 1425, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-02 18:17:14', '2024-06-02 18:17:14'),
(1662, 1426, 'monday', '09:00:00', '10:00:00', 0, '2024-06-03 08:00:05', '2024-06-03 08:00:05'),
(1663, 1426, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-03 08:00:05', '2024-06-03 08:00:05'),
(1664, 1426, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-03 08:00:05', '2024-06-03 08:00:05'),
(1665, 1426, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-03 08:00:05', '2024-06-03 08:00:05'),
(1666, 1426, 'friday', '09:00:00', '10:00:00', 0, '2024-06-03 08:00:05', '2024-06-03 08:00:05'),
(1667, 1426, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-03 08:00:05', '2024-06-03 08:00:05'),
(1668, 1426, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-03 08:00:05', '2024-06-03 08:00:05'),
(1669, 1430, 'monday', '09:00:00', '10:00:00', 0, '2024-06-03 16:39:33', '2024-06-03 16:39:33'),
(1670, 1430, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-03 16:39:33', '2024-06-03 16:39:33'),
(1671, 1430, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-03 16:39:33', '2024-06-03 16:39:33'),
(1672, 1430, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-03 16:39:33', '2024-06-03 16:39:33'),
(1673, 1430, 'friday', '09:00:00', '10:00:00', 0, '2024-06-03 16:39:33', '2024-06-03 16:39:33'),
(1674, 1430, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-03 16:39:33', '2024-06-03 16:39:33'),
(1675, 1430, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-03 16:39:33', '2024-06-03 16:39:33'),
(1676, 1434, 'monday', '09:00:00', '10:00:00', 1, '2024-06-05 09:25:01', '2024-06-05 09:25:01'),
(1677, 1434, 'tuesday', '09:00:00', '10:00:00', 1, '2024-06-05 09:25:01', '2024-06-05 09:25:01'),
(1678, 1434, 'wednesday', '09:00:00', '10:00:00', 1, '2024-06-05 09:25:01', '2024-06-05 09:25:01'),
(1679, 1434, 'thursday', '09:00:00', '10:00:00', 1, '2024-06-05 09:25:01', '2024-06-05 09:25:01'),
(1680, 1434, 'friday', '09:00:00', '10:00:00', 1, '2024-06-05 09:25:01', '2024-06-05 09:25:01'),
(1681, 1434, 'saturday', '09:00:00', '10:00:00', 1, '2024-06-05 09:25:01', '2024-06-05 09:25:01'),
(1682, 1434, 'sunday', '09:00:00', '10:00:00', 1, '2024-06-05 09:25:01', '2024-06-05 09:25:01'),
(1683, 1435, 'monday', '09:00:00', '10:00:00', 0, '2024-06-06 06:14:04', '2024-06-06 06:14:04'),
(1684, 1435, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-06 06:14:04', '2024-06-06 06:14:04'),
(1685, 1435, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-06 06:14:04', '2024-06-06 06:14:04'),
(1686, 1435, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-06 06:14:04', '2024-06-06 06:14:04'),
(1687, 1435, 'friday', '09:00:00', '10:00:00', 0, '2024-06-06 06:14:04', '2024-06-06 06:14:04'),
(1688, 1435, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-06 06:14:04', '2024-06-06 06:14:04'),
(1689, 1435, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-06 06:14:04', '2024-06-06 06:14:04'),
(1690, 1437, 'monday', '09:00:00', '10:00:00', 0, '2024-06-06 17:11:03', '2024-06-06 17:11:03'),
(1691, 1437, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-06 17:11:03', '2024-06-06 17:11:03'),
(1692, 1437, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-06 17:11:03', '2024-06-06 17:11:03'),
(1693, 1437, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-06 17:11:03', '2024-06-06 17:11:03'),
(1694, 1437, 'friday', '09:00:00', '10:00:00', 0, '2024-06-06 17:11:03', '2024-06-06 17:11:03'),
(1695, 1437, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-06 17:11:03', '2024-06-06 17:11:03'),
(1696, 1437, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-06 17:11:03', '2024-06-06 17:11:03'),
(1697, 1442, 'monday', '09:00:00', '10:00:00', 0, '2024-06-10 02:50:53', '2024-06-10 02:50:53'),
(1698, 1442, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-10 02:50:53', '2024-06-10 02:50:53'),
(1699, 1442, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-10 02:50:53', '2024-06-10 02:50:53'),
(1700, 1442, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-10 02:50:53', '2024-06-10 02:50:53'),
(1701, 1442, 'friday', '09:00:00', '10:00:00', 0, '2024-06-10 02:50:53', '2024-06-10 02:50:53'),
(1702, 1442, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-10 02:50:53', '2024-06-10 02:50:53'),
(1703, 1442, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-10 02:50:53', '2024-06-10 02:50:53'),
(1704, 1449, 'monday', '09:00:00', '10:00:00', 0, '2024-06-14 12:21:05', '2024-06-14 12:21:05'),
(1705, 1449, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-14 12:21:05', '2024-06-14 12:21:05'),
(1706, 1449, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-14 12:21:05', '2024-06-14 12:21:05'),
(1707, 1449, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-14 12:21:05', '2024-06-14 12:21:05'),
(1708, 1449, 'friday', '09:00:00', '10:00:00', 0, '2024-06-14 12:21:05', '2024-06-14 12:21:05'),
(1709, 1449, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-14 12:21:05', '2024-06-14 12:21:05'),
(1710, 1449, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-14 12:21:05', '2024-06-14 12:21:05'),
(1711, 1451, 'monday', '09:00:00', '10:00:00', 0, '2024-06-14 14:23:22', '2024-06-14 14:23:22'),
(1712, 1451, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-14 14:23:22', '2024-06-14 14:23:22'),
(1713, 1451, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-14 14:23:22', '2024-06-14 14:23:22'),
(1714, 1451, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-14 14:23:22', '2024-06-14 14:23:22'),
(1715, 1451, 'friday', '09:00:00', '10:00:00', 0, '2024-06-14 14:23:22', '2024-06-14 14:23:22'),
(1716, 1451, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-14 14:23:22', '2024-06-14 14:23:22'),
(1717, 1451, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-14 14:23:22', '2024-06-14 14:23:22'),
(1718, 1453, 'monday', '09:00:00', '17:25:00', 1, '2024-06-14 18:34:42', '2024-06-14 18:34:42'),
(1719, 1453, 'tuesday', '09:00:00', '20:00:00', 1, '2024-06-14 18:34:42', '2024-06-14 18:34:42'),
(1720, 1453, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-14 18:34:42', '2024-06-14 18:34:42'),
(1721, 1453, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-14 18:34:42', '2024-06-14 18:34:42'),
(1722, 1453, 'friday', '09:00:00', '10:00:00', 0, '2024-06-14 18:34:42', '2024-06-14 18:34:42'),
(1723, 1453, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-14 18:34:42', '2024-06-14 18:34:42'),
(1724, 1453, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-14 18:34:42', '2024-06-14 18:34:42'),
(1725, 1455, 'monday', '09:00:00', '10:00:00', 0, '2024-06-15 04:29:11', '2024-06-15 04:29:11'),
(1726, 1455, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-15 04:29:11', '2024-06-15 04:29:11'),
(1727, 1455, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-15 04:29:11', '2024-06-15 04:29:11'),
(1728, 1455, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-15 04:29:11', '2024-06-15 04:29:11'),
(1729, 1455, 'friday', '09:00:00', '10:00:00', 0, '2024-06-15 04:29:11', '2024-06-15 04:29:11'),
(1730, 1455, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-15 04:29:11', '2024-06-15 04:29:11'),
(1731, 1455, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-15 04:29:11', '2024-06-15 04:29:11'),
(1732, 1459, 'monday', '09:00:00', '10:00:00', 0, '2024-06-16 02:21:59', '2024-06-16 02:21:59'),
(1733, 1459, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-16 02:21:59', '2024-06-16 02:21:59'),
(1734, 1459, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-16 02:21:59', '2024-06-16 02:21:59'),
(1735, 1459, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-16 02:21:59', '2024-06-16 02:21:59'),
(1736, 1459, 'friday', '09:00:00', '10:00:00', 0, '2024-06-16 02:21:59', '2024-06-16 02:21:59'),
(1737, 1459, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-16 02:21:59', '2024-06-16 02:21:59'),
(1738, 1459, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-16 02:21:59', '2024-06-16 02:21:59'),
(1739, 1462, 'monday', '09:00:00', '10:00:00', 0, '2024-06-17 04:14:11', '2024-06-17 04:14:11'),
(1740, 1462, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-17 04:14:11', '2024-06-17 04:14:11'),
(1741, 1462, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-17 04:14:11', '2024-06-17 04:14:11'),
(1742, 1462, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-17 04:14:11', '2024-06-17 04:14:11'),
(1743, 1462, 'friday', '09:00:00', '10:00:00', 0, '2024-06-17 04:14:11', '2024-06-17 04:14:11'),
(1744, 1462, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-17 04:14:11', '2024-06-17 04:14:11'),
(1745, 1462, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-17 04:14:11', '2024-06-17 04:14:11'),
(1746, 1463, 'monday', '09:00:00', '10:00:00', 0, '2024-06-17 10:06:10', '2024-06-17 10:06:10'),
(1747, 1463, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-17 10:06:10', '2024-06-17 10:06:10'),
(1748, 1463, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-17 10:06:10', '2024-06-17 10:06:10'),
(1749, 1463, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-17 10:06:10', '2024-06-17 10:06:10'),
(1750, 1463, 'friday', '09:00:00', '10:00:00', 0, '2024-06-17 10:06:10', '2024-06-17 10:06:10'),
(1751, 1463, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-17 10:06:10', '2024-06-17 10:06:10'),
(1752, 1463, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-17 10:06:10', '2024-06-17 10:06:10'),
(1753, 1466, 'monday', '09:00:00', '10:00:00', 0, '2024-06-17 15:35:57', '2024-06-17 15:35:57'),
(1754, 1466, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-17 15:35:57', '2024-06-17 15:35:57'),
(1755, 1466, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-17 15:35:57', '2024-06-17 15:35:57'),
(1756, 1466, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-17 15:35:57', '2024-06-17 15:35:57'),
(1757, 1466, 'friday', '09:00:00', '10:00:00', 0, '2024-06-17 15:35:57', '2024-06-17 15:35:57'),
(1758, 1466, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-17 15:35:57', '2024-06-17 15:35:57'),
(1759, 1466, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-17 15:35:57', '2024-06-17 15:35:57'),
(1760, 1469, 'monday', '09:00:00', '10:00:00', 0, '2024-06-17 16:51:27', '2024-06-17 16:51:27'),
(1761, 1469, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-17 16:51:27', '2024-06-17 16:51:27'),
(1762, 1469, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-17 16:51:27', '2024-06-17 16:51:27'),
(1763, 1469, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-17 16:51:27', '2024-06-17 16:51:27'),
(1764, 1469, 'friday', '09:00:00', '10:00:00', 0, '2024-06-17 16:51:27', '2024-06-17 16:51:27'),
(1765, 1469, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-17 16:51:27', '2024-06-17 16:51:27'),
(1766, 1469, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-17 16:51:27', '2024-06-17 16:51:27'),
(1767, 1471, 'monday', '09:00:00', '10:00:00', 0, '2024-06-17 22:33:04', '2024-06-17 22:33:04'),
(1768, 1471, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-17 22:33:04', '2024-06-17 22:33:04'),
(1769, 1471, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-17 22:33:04', '2024-06-17 22:33:04'),
(1770, 1471, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-17 22:33:04', '2024-06-17 22:33:04'),
(1771, 1471, 'friday', '09:00:00', '10:00:00', 0, '2024-06-17 22:33:04', '2024-06-17 22:33:04'),
(1772, 1471, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-17 22:33:04', '2024-06-17 22:33:04'),
(1773, 1471, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-17 22:33:04', '2024-06-17 22:33:04'),
(1774, 1476, 'monday', '09:00:00', '10:00:00', 0, '2024-06-18 12:08:07', '2024-06-18 12:08:07'),
(1775, 1476, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-18 12:08:07', '2024-06-18 12:08:07'),
(1776, 1476, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-18 12:08:07', '2024-06-18 12:08:07'),
(1777, 1476, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-18 12:08:07', '2024-06-18 12:08:07'),
(1778, 1476, 'friday', '09:00:00', '10:00:00', 0, '2024-06-18 12:08:07', '2024-06-18 12:08:07'),
(1779, 1476, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-18 12:08:07', '2024-06-18 12:08:07'),
(1780, 1476, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-18 12:08:07', '2024-06-18 12:08:07'),
(1781, 1481, 'monday', '09:00:00', '10:00:00', 0, '2024-06-18 18:15:19', '2024-06-18 18:15:19'),
(1782, 1481, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-18 18:15:19', '2024-06-18 18:15:19'),
(1783, 1481, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-18 18:15:19', '2024-06-18 18:15:19'),
(1784, 1481, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-18 18:15:19', '2024-06-18 18:15:19'),
(1785, 1481, 'friday', '09:00:00', '10:00:00', 0, '2024-06-18 18:15:19', '2024-06-18 18:15:19'),
(1786, 1481, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-18 18:15:19', '2024-06-18 18:15:19'),
(1787, 1481, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-18 18:15:19', '2024-06-18 18:15:19'),
(1788, 1484, 'monday', '09:00:00', '10:00:00', 0, '2024-06-19 01:00:09', '2024-06-19 01:00:09'),
(1789, 1484, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-19 01:00:09', '2024-06-19 01:00:09'),
(1790, 1484, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-19 01:00:09', '2024-06-19 01:00:09'),
(1791, 1484, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-19 01:00:09', '2024-06-19 01:00:09'),
(1792, 1484, 'friday', '09:00:00', '10:00:00', 0, '2024-06-19 01:00:09', '2024-06-19 01:00:09'),
(1793, 1484, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-19 01:00:09', '2024-06-19 01:00:09'),
(1794, 1484, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-19 01:00:09', '2024-06-19 01:00:09'),
(1795, 1488, 'monday', '09:00:00', '10:00:00', 0, '2024-06-20 00:48:23', '2024-06-20 00:48:23'),
(1796, 1488, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-20 00:48:23', '2024-06-20 00:48:23'),
(1797, 1488, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-20 00:48:23', '2024-06-20 00:48:23'),
(1798, 1488, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-20 00:48:23', '2024-06-20 00:48:23'),
(1799, 1488, 'friday', '09:00:00', '10:00:00', 0, '2024-06-20 00:48:23', '2024-06-20 00:48:23'),
(1800, 1488, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-20 00:48:23', '2024-06-20 00:48:23'),
(1801, 1488, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-20 00:48:23', '2024-06-20 00:48:23'),
(1802, 1493, 'monday', '09:00:00', '10:00:00', 0, '2024-06-20 10:15:59', '2024-06-20 10:15:59'),
(1803, 1493, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-20 10:15:59', '2024-06-20 10:15:59'),
(1804, 1493, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-20 10:15:59', '2024-06-20 10:15:59'),
(1805, 1493, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-20 10:15:59', '2024-06-20 10:15:59'),
(1806, 1493, 'friday', '09:00:00', '10:00:00', 0, '2024-06-20 10:15:59', '2024-06-20 10:15:59'),
(1807, 1493, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-20 10:15:59', '2024-06-20 10:15:59'),
(1808, 1493, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-20 10:15:59', '2024-06-20 10:15:59'),
(1809, 1504, 'monday', '09:00:00', '10:00:00', 0, '2024-06-23 21:20:38', '2024-06-23 21:20:38'),
(1810, 1504, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-23 21:20:38', '2024-06-23 21:20:38'),
(1811, 1504, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-23 21:20:38', '2024-06-23 21:20:38'),
(1812, 1504, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-23 21:20:38', '2024-06-23 21:20:38'),
(1813, 1504, 'friday', '09:00:00', '10:00:00', 0, '2024-06-23 21:20:38', '2024-06-23 21:20:38'),
(1814, 1504, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-23 21:20:38', '2024-06-23 21:20:38'),
(1815, 1504, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-23 21:20:38', '2024-06-23 21:20:38'),
(1816, 1507, 'monday', '09:00:00', '10:00:00', 0, '2024-06-24 00:52:06', '2024-06-24 00:52:06'),
(1817, 1507, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-24 00:52:06', '2024-06-24 00:52:06'),
(1818, 1507, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-24 00:52:06', '2024-06-24 00:52:06'),
(1819, 1507, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-24 00:52:06', '2024-06-24 00:52:06'),
(1820, 1507, 'friday', '09:00:00', '10:00:00', 0, '2024-06-24 00:52:06', '2024-06-24 00:52:06'),
(1821, 1507, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-24 00:52:06', '2024-06-24 00:52:06'),
(1822, 1507, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-24 00:52:06', '2024-06-24 00:52:06'),
(1823, 1530, 'monday', '09:00:00', '10:00:00', 0, '2024-06-29 13:56:47', '2024-06-29 13:56:47'),
(1824, 1530, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-29 13:56:47', '2024-06-29 13:56:47'),
(1825, 1530, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-29 13:56:47', '2024-06-29 13:56:47'),
(1826, 1530, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-29 13:56:47', '2024-06-29 13:56:47'),
(1827, 1530, 'friday', '09:00:00', '10:00:00', 0, '2024-06-29 13:56:47', '2024-06-29 13:56:47'),
(1828, 1530, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-29 13:56:47', '2024-06-29 13:56:47'),
(1829, 1530, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-29 13:56:47', '2024-06-29 13:56:47'),
(1830, 1531, 'monday', '09:00:00', '10:00:00', 0, '2024-06-29 15:57:03', '2024-06-29 15:57:03'),
(1831, 1531, 'tuesday', '09:00:00', '10:00:00', 0, '2024-06-29 15:57:03', '2024-06-29 15:57:03'),
(1832, 1531, 'wednesday', '09:00:00', '10:00:00', 0, '2024-06-29 15:57:03', '2024-06-29 15:57:03'),
(1833, 1531, 'thursday', '09:00:00', '10:00:00', 0, '2024-06-29 15:57:03', '2024-06-29 15:57:03'),
(1834, 1531, 'friday', '09:00:00', '10:00:00', 0, '2024-06-29 15:57:03', '2024-06-29 15:57:03'),
(1835, 1531, 'saturday', '09:00:00', '10:00:00', 0, '2024-06-29 15:57:03', '2024-06-29 15:57:03'),
(1836, 1531, 'sunday', '09:00:00', '10:00:00', 0, '2024-06-29 15:57:03', '2024-06-29 15:57:03'),
(1837, 1550, 'monday', '09:00:00', '10:00:00', 0, '2024-07-09 05:29:23', '2024-07-09 05:29:23'),
(1838, 1550, 'tuesday', '09:00:00', '10:00:00', 0, '2024-07-09 05:29:23', '2024-07-09 05:29:23'),
(1839, 1550, 'wednesday', '09:00:00', '10:00:00', 0, '2024-07-09 05:29:23', '2024-07-09 05:29:23'),
(1840, 1550, 'thursday', '09:00:00', '10:00:00', 0, '2024-07-09 05:29:23', '2024-07-09 05:29:23'),
(1841, 1550, 'friday', '09:00:00', '10:00:00', 0, '2024-07-09 05:29:23', '2024-07-09 05:29:23'),
(1842, 1550, 'saturday', '09:00:00', '10:00:00', 0, '2024-07-09 05:29:23', '2024-07-09 05:29:23'),
(1843, 1550, 'sunday', '09:00:00', '10:00:00', 0, '2024-07-09 05:29:23', '2024-07-09 05:29:23'),
(1844, 1558, 'monday', '09:00:00', '10:00:00', 0, '2024-07-10 19:09:38', '2024-07-10 19:09:38'),
(1845, 1558, 'tuesday', '09:00:00', '10:00:00', 0, '2024-07-10 19:09:38', '2024-07-10 19:09:38'),
(1846, 1558, 'wednesday', '09:00:00', '10:00:00', 0, '2024-07-10 19:09:38', '2024-07-10 19:09:38'),
(1847, 1558, 'thursday', '09:00:00', '10:00:00', 0, '2024-07-10 19:09:38', '2024-07-10 19:09:38'),
(1848, 1558, 'friday', '09:00:00', '10:00:00', 0, '2024-07-10 19:09:38', '2024-07-10 19:09:38'),
(1849, 1558, 'saturday', '09:00:00', '10:00:00', 0, '2024-07-10 19:09:38', '2024-07-10 19:09:38'),
(1850, 1558, 'sunday', '09:00:00', '10:00:00', 0, '2024-07-10 19:09:38', '2024-07-10 19:09:38'),
(1851, 1566, 'monday', '09:00:00', '10:00:00', 0, '2024-07-14 11:47:25', '2024-07-14 11:47:25'),
(1852, 1566, 'tuesday', '09:00:00', '10:00:00', 0, '2024-07-14 11:47:25', '2024-07-14 11:47:25'),
(1853, 1566, 'wednesday', '09:00:00', '10:00:00', 0, '2024-07-14 11:47:25', '2024-07-14 11:47:25'),
(1854, 1566, 'thursday', '09:00:00', '10:00:00', 0, '2024-07-14 11:47:25', '2024-07-14 11:47:25'),
(1855, 1566, 'friday', '09:00:00', '10:00:00', 0, '2024-07-14 11:47:25', '2024-07-14 11:47:25'),
(1856, 1566, 'saturday', '09:00:00', '10:00:00', 0, '2024-07-14 11:47:25', '2024-07-14 11:47:25'),
(1857, 1566, 'sunday', '09:00:00', '10:00:00', 0, '2024-07-14 11:47:25', '2024-07-14 11:47:25'),
(1858, 1571, 'monday', '09:00:00', '10:00:00', 0, '2024-07-15 19:07:55', '2024-07-15 19:07:55'),
(1859, 1571, 'tuesday', '09:00:00', '10:00:00', 0, '2024-07-15 19:07:55', '2024-07-15 19:07:55'),
(1860, 1571, 'wednesday', '09:00:00', '10:00:00', 0, '2024-07-15 19:07:55', '2024-07-15 19:07:55'),
(1861, 1571, 'thursday', '09:00:00', '10:00:00', 0, '2024-07-15 19:07:55', '2024-07-15 19:07:55'),
(1862, 1571, 'friday', '09:00:00', '10:00:00', 0, '2024-07-15 19:07:55', '2024-07-15 19:07:55'),
(1863, 1571, 'saturday', '09:00:00', '10:00:00', 0, '2024-07-15 19:07:55', '2024-07-15 19:07:55'),
(1864, 1571, 'sunday', '09:00:00', '10:00:00', 0, '2024-07-15 19:07:55', '2024-07-15 19:07:55'),
(1865, 1580, 'monday', '09:00:00', '10:00:00', 0, '2024-07-17 06:32:11', '2024-07-17 06:32:11'),
(1866, 1580, 'tuesday', '09:00:00', '10:00:00', 0, '2024-07-17 06:32:11', '2024-07-17 06:32:11'),
(1867, 1580, 'wednesday', '09:00:00', '10:00:00', 0, '2024-07-17 06:32:11', '2024-07-17 06:32:11'),
(1868, 1580, 'thursday', '09:00:00', '10:00:00', 0, '2024-07-17 06:32:11', '2024-07-17 06:32:11'),
(1869, 1580, 'friday', '09:00:00', '10:00:00', 0, '2024-07-17 06:32:11', '2024-07-17 06:32:11'),
(1870, 1580, 'saturday', '09:00:00', '10:00:00', 0, '2024-07-17 06:32:11', '2024-07-17 06:32:11'),
(1871, 1580, 'sunday', '09:00:00', '10:00:00', 0, '2024-07-17 06:32:11', '2024-07-17 06:32:11'),
(1872, 1583, 'monday', '09:00:00', '10:00:00', 0, '2024-07-17 18:58:13', '2024-07-17 18:58:13'),
(1873, 1583, 'tuesday', '09:00:00', '10:00:00', 0, '2024-07-17 18:58:13', '2024-07-17 18:58:13'),
(1874, 1583, 'wednesday', '09:00:00', '10:00:00', 0, '2024-07-17 18:58:13', '2024-07-17 18:58:13'),
(1875, 1583, 'thursday', '09:00:00', '10:00:00', 0, '2024-07-17 18:58:13', '2024-07-17 18:58:13'),
(1876, 1583, 'friday', '09:00:00', '10:00:00', 0, '2024-07-17 18:58:13', '2024-07-17 18:58:13'),
(1877, 1583, 'saturday', '09:00:00', '10:00:00', 0, '2024-07-17 18:58:13', '2024-07-17 18:58:13'),
(1878, 1583, 'sunday', '09:00:00', '10:00:00', 0, '2024-07-17 18:58:13', '2024-07-17 18:58:13'),
(1879, 1588, 'monday', '09:00:00', '10:00:00', 0, '2024-07-18 13:23:57', '2024-07-18 13:23:57'),
(1880, 1588, 'tuesday', '09:00:00', '10:00:00', 0, '2024-07-18 13:23:57', '2024-07-18 13:23:57'),
(1881, 1588, 'wednesday', '09:00:00', '10:00:00', 0, '2024-07-18 13:23:57', '2024-07-18 13:23:57'),
(1882, 1588, 'thursday', '09:00:00', '10:00:00', 0, '2024-07-18 13:23:57', '2024-07-18 13:23:57'),
(1883, 1588, 'friday', '09:00:00', '10:00:00', 0, '2024-07-18 13:23:57', '2024-07-18 13:23:57'),
(1884, 1588, 'saturday', '09:00:00', '10:00:00', 0, '2024-07-18 13:23:57', '2024-07-18 13:23:57'),
(1885, 1588, 'sunday', '09:00:00', '10:00:00', 0, '2024-07-18 13:23:57', '2024-07-18 13:23:57'),
(1886, 1592, 'monday', '09:00:00', '10:00:00', 0, '2024-07-19 18:41:02', '2024-07-19 18:41:02'),
(1887, 1592, 'tuesday', '09:00:00', '10:00:00', 0, '2024-07-19 18:41:02', '2024-07-19 18:41:02'),
(1888, 1592, 'wednesday', '09:00:00', '10:00:00', 0, '2024-07-19 18:41:02', '2024-07-19 18:41:02'),
(1889, 1592, 'thursday', '09:00:00', '10:00:00', 0, '2024-07-19 18:41:02', '2024-07-19 18:41:02'),
(1890, 1592, 'friday', '09:00:00', '10:00:00', 0, '2024-07-19 18:41:02', '2024-07-19 18:41:02'),
(1891, 1592, 'saturday', '09:00:00', '10:00:00', 0, '2024-07-19 18:41:02', '2024-07-19 18:41:02'),
(1892, 1592, 'sunday', '09:00:00', '10:00:00', 0, '2024-07-19 18:41:02', '2024-07-19 18:41:02'),
(1893, 1593, 'monday', '09:00:00', '10:00:00', 0, '2024-07-20 02:38:18', '2024-07-20 02:38:18'),
(1894, 1593, 'tuesday', '09:00:00', '10:00:00', 0, '2024-07-20 02:38:18', '2024-07-20 02:38:18'),
(1895, 1593, 'wednesday', '09:00:00', '10:00:00', 0, '2024-07-20 02:38:18', '2024-07-20 02:38:18'),
(1896, 1593, 'thursday', '09:00:00', '10:00:00', 0, '2024-07-20 02:38:18', '2024-07-20 02:38:18'),
(1897, 1593, 'friday', '09:00:00', '10:00:00', 0, '2024-07-20 02:38:18', '2024-07-20 02:38:18'),
(1898, 1593, 'saturday', '09:00:00', '10:00:00', 0, '2024-07-20 02:38:18', '2024-07-20 02:38:18'),
(1899, 1593, 'sunday', '09:00:00', '10:00:00', 0, '2024-07-20 02:38:18', '2024-07-20 02:38:18'),
(1900, 1600, 'monday', '09:00:00', '10:00:00', 0, '2024-07-22 16:54:29', '2024-07-22 16:54:29'),
(1901, 1600, 'tuesday', '09:00:00', '10:00:00', 0, '2024-07-22 16:54:29', '2024-07-22 16:54:29'),
(1902, 1600, 'wednesday', '09:00:00', '10:00:00', 0, '2024-07-22 16:54:29', '2024-07-22 16:54:29'),
(1903, 1600, 'thursday', '09:00:00', '10:00:00', 0, '2024-07-22 16:54:29', '2024-07-22 16:54:29'),
(1904, 1600, 'friday', '09:00:00', '10:00:00', 0, '2024-07-22 16:54:29', '2024-07-22 16:54:29'),
(1905, 1600, 'saturday', '09:00:00', '10:00:00', 0, '2024-07-22 16:54:29', '2024-07-22 16:54:29'),
(1906, 1600, 'sunday', '09:00:00', '10:00:00', 0, '2024-07-22 16:54:29', '2024-07-22 16:54:29'),
(1907, 1606, 'monday', '09:00:00', '10:00:00', 0, '2024-07-24 03:12:56', '2024-07-24 03:12:56'),
(1908, 1606, 'tuesday', '09:00:00', '10:00:00', 0, '2024-07-24 03:12:56', '2024-07-24 03:12:56'),
(1909, 1606, 'wednesday', '09:00:00', '10:00:00', 0, '2024-07-24 03:12:56', '2024-07-24 03:12:56'),
(1910, 1606, 'thursday', '09:00:00', '10:00:00', 0, '2024-07-24 03:12:56', '2024-07-24 03:12:56'),
(1911, 1606, 'friday', '09:00:00', '10:00:00', 0, '2024-07-24 03:12:56', '2024-07-24 03:12:56'),
(1912, 1606, 'saturday', '09:00:00', '10:00:00', 0, '2024-07-24 03:12:56', '2024-07-24 03:12:56'),
(1913, 1606, 'sunday', '09:00:00', '10:00:00', 0, '2024-07-24 03:12:56', '2024-07-24 03:12:56'),
(1914, 1612, 'monday', '09:00:00', '10:00:00', 0, '2024-07-26 10:54:21', '2024-07-26 10:54:21'),
(1915, 1612, 'tuesday', '09:00:00', '10:00:00', 0, '2024-07-26 10:54:21', '2024-07-26 10:54:21'),
(1916, 1612, 'wednesday', '09:00:00', '10:00:00', 0, '2024-07-26 10:54:21', '2024-07-26 10:54:21'),
(1917, 1612, 'thursday', '09:00:00', '10:00:00', 0, '2024-07-26 10:54:21', '2024-07-26 10:54:21'),
(1918, 1612, 'friday', '09:00:00', '10:00:00', 0, '2024-07-26 10:54:21', '2024-07-26 10:54:21'),
(1919, 1612, 'saturday', '09:00:00', '10:00:00', 0, '2024-07-26 10:54:21', '2024-07-26 10:54:21'),
(1920, 1612, 'sunday', '09:00:00', '10:00:00', 0, '2024-07-26 10:54:21', '2024-07-26 10:54:21'),
(1921, 1615, 'monday', '09:00:00', '10:00:00', 0, '2024-07-27 15:36:36', '2024-07-27 15:36:36'),
(1922, 1615, 'tuesday', '09:00:00', '10:00:00', 0, '2024-07-27 15:36:36', '2024-07-27 15:36:36'),
(1923, 1615, 'wednesday', '09:00:00', '10:00:00', 0, '2024-07-27 15:36:36', '2024-07-27 15:36:36'),
(1924, 1615, 'thursday', '09:00:00', '10:00:00', 0, '2024-07-27 15:36:36', '2024-07-27 15:36:36'),
(1925, 1615, 'friday', '09:00:00', '10:00:00', 0, '2024-07-27 15:36:36', '2024-07-27 15:36:36'),
(1926, 1615, 'saturday', '09:00:00', '10:00:00', 0, '2024-07-27 15:36:36', '2024-07-27 15:36:36'),
(1927, 1615, 'sunday', '09:00:00', '10:00:00', 0, '2024-07-27 15:36:36', '2024-07-27 15:36:36'),
(1928, 1619, 'monday', '09:00:00', '10:00:00', 0, '2024-07-28 18:28:25', '2024-07-28 18:28:25'),
(1929, 1619, 'tuesday', '09:00:00', '10:00:00', 0, '2024-07-28 18:28:25', '2024-07-28 18:28:25'),
(1930, 1619, 'wednesday', '09:00:00', '10:00:00', 0, '2024-07-28 18:28:25', '2024-07-28 18:28:25'),
(1931, 1619, 'thursday', '09:00:00', '10:00:00', 0, '2024-07-28 18:28:25', '2024-07-28 18:28:25'),
(1932, 1619, 'friday', '09:00:00', '10:00:00', 0, '2024-07-28 18:28:25', '2024-07-28 18:28:25'),
(1933, 1619, 'saturday', '09:00:00', '10:00:00', 0, '2024-07-28 18:28:25', '2024-07-28 18:28:25'),
(1934, 1619, 'sunday', '09:00:00', '10:00:00', 0, '2024-07-28 18:28:25', '2024-07-28 18:28:25'),
(1935, 1623, 'monday', '09:00:00', '10:00:00', 0, '2024-07-30 15:44:16', '2024-07-30 15:44:16'),
(1936, 1623, 'tuesday', '09:00:00', '10:00:00', 0, '2024-07-30 15:44:16', '2024-07-30 15:44:16'),
(1937, 1623, 'wednesday', '09:00:00', '10:00:00', 0, '2024-07-30 15:44:16', '2024-07-30 15:44:16'),
(1938, 1623, 'thursday', '09:00:00', '10:00:00', 0, '2024-07-30 15:44:16', '2024-07-30 15:44:16'),
(1939, 1623, 'friday', '09:00:00', '10:00:00', 0, '2024-07-30 15:44:16', '2024-07-30 15:44:16'),
(1940, 1623, 'saturday', '09:00:00', '10:00:00', 0, '2024-07-30 15:44:16', '2024-07-30 15:44:16'),
(1941, 1623, 'sunday', '09:00:00', '10:00:00', 0, '2024-07-30 15:44:16', '2024-07-30 15:44:16'),
(1942, 1631, 'monday', '00:00:00', '00:00:00', 0, '2024-08-02 04:51:57', '2024-08-02 04:51:57'),
(1943, 1631, 'tuesday', '00:00:00', '00:00:00', 0, '2024-08-02 04:51:57', '2024-08-02 04:51:57'),
(1944, 1631, 'wednesday', '00:00:00', '00:00:00', 0, '2024-08-02 04:51:57', '2024-08-02 04:51:57'),
(1945, 1631, 'thursday', '00:00:00', '00:00:00', 0, '2024-08-02 04:51:57', '2024-08-02 04:51:57'),
(1946, 1631, 'friday', '00:00:00', '00:00:00', 0, '2024-08-02 04:51:57', '2024-08-02 04:51:57'),
(1947, 1631, 'saturday', '00:00:00', '00:00:00', 0, '2024-08-02 04:51:57', '2024-08-02 04:51:57'),
(1948, 1631, 'sunday', '00:00:00', '00:00:00', 0, '2024-08-02 04:51:57', '2024-08-02 04:51:57'),
(1949, 1633, 'monday', '09:00:00', '10:00:00', 0, '2024-08-02 10:28:44', '2024-08-02 10:28:44'),
(1950, 1633, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-02 10:28:44', '2024-08-02 10:28:44'),
(1951, 1633, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-02 10:28:44', '2024-08-02 10:28:44'),
(1952, 1633, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-02 10:28:44', '2024-08-02 10:28:44'),
(1953, 1633, 'friday', '09:00:00', '10:00:00', 0, '2024-08-02 10:28:44', '2024-08-02 10:28:44'),
(1954, 1633, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-02 10:28:44', '2024-08-02 10:28:44'),
(1955, 1633, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-02 10:28:44', '2024-08-02 10:28:44'),
(1956, 1636, 'monday', '09:00:00', '10:00:00', 0, '2024-08-02 16:46:03', '2024-08-02 16:46:03'),
(1957, 1636, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-02 16:46:03', '2024-08-02 16:46:03'),
(1958, 1636, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-02 16:46:03', '2024-08-02 16:46:03'),
(1959, 1636, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-02 16:46:03', '2024-08-02 16:46:03'),
(1960, 1636, 'friday', '09:00:00', '10:00:00', 0, '2024-08-02 16:46:03', '2024-08-02 16:46:03'),
(1961, 1636, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-02 16:46:03', '2024-08-02 16:46:03'),
(1962, 1636, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-02 16:46:03', '2024-08-02 16:46:03'),
(1963, 1648, 'monday', '09:00:00', '10:00:00', 0, '2024-08-05 13:36:10', '2024-08-05 13:36:10'),
(1964, 1648, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-05 13:36:10', '2024-08-05 13:36:10'),
(1965, 1648, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-05 13:36:10', '2024-08-05 13:36:10'),
(1966, 1648, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-05 13:36:10', '2024-08-05 13:36:10'),
(1967, 1648, 'friday', '09:00:00', '10:00:00', 0, '2024-08-05 13:36:10', '2024-08-05 13:36:10'),
(1968, 1648, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-05 13:36:10', '2024-08-05 13:36:10'),
(1969, 1648, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-05 13:36:10', '2024-08-05 13:36:10'),
(1970, 1660, 'monday', '09:00:00', '10:00:00', 0, '2024-08-06 15:01:41', '2024-08-06 15:01:41'),
(1971, 1660, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-06 15:01:41', '2024-08-06 15:01:41'),
(1972, 1660, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-06 15:01:41', '2024-08-06 15:01:41'),
(1973, 1660, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-06 15:01:41', '2024-08-06 15:01:41'),
(1974, 1660, 'friday', '09:00:00', '10:00:00', 0, '2024-08-06 15:01:41', '2024-08-06 15:01:41'),
(1975, 1660, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-06 15:01:41', '2024-08-06 15:01:41'),
(1976, 1660, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-06 15:01:41', '2024-08-06 15:01:41'),
(1977, 1663, 'monday', '09:00:00', '10:00:00', 0, '2024-08-07 12:47:51', '2024-08-07 12:47:51'),
(1978, 1663, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-07 12:47:51', '2024-08-07 12:47:51'),
(1979, 1663, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-07 12:47:51', '2024-08-07 12:47:51'),
(1980, 1663, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-07 12:47:51', '2024-08-07 12:47:51'),
(1981, 1663, 'friday', '09:00:00', '10:00:00', 0, '2024-08-07 12:47:51', '2024-08-07 12:47:51'),
(1982, 1663, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-07 12:47:51', '2024-08-07 12:47:51'),
(1983, 1663, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-07 12:47:51', '2024-08-07 12:47:51'),
(1984, 1665, 'monday', '09:00:00', '10:00:00', 0, '2024-08-07 18:15:52', '2024-08-07 18:15:52'),
(1985, 1665, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-07 18:15:52', '2024-08-07 18:15:52'),
(1986, 1665, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-07 18:15:52', '2024-08-07 18:15:52'),
(1987, 1665, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-07 18:15:52', '2024-08-07 18:15:52'),
(1988, 1665, 'friday', '09:00:00', '10:00:00', 0, '2024-08-07 18:15:52', '2024-08-07 18:15:52'),
(1989, 1665, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-07 18:15:52', '2024-08-07 18:15:52'),
(1990, 1665, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-07 18:15:52', '2024-08-07 18:15:52'),
(1991, 1675, 'monday', '09:00:00', '10:00:00', 0, '2024-08-10 16:42:12', '2024-08-10 16:42:12'),
(1992, 1675, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-10 16:42:12', '2024-08-10 16:42:12'),
(1993, 1675, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-10 16:42:12', '2024-08-10 16:42:12'),
(1994, 1675, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-10 16:42:12', '2024-08-10 16:42:12'),
(1995, 1675, 'friday', '09:00:00', '10:00:00', 0, '2024-08-10 16:42:12', '2024-08-10 16:42:12'),
(1996, 1675, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-10 16:42:12', '2024-08-10 16:42:12'),
(1997, 1675, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-10 16:42:12', '2024-08-10 16:42:12'),
(1998, 1686, 'monday', '09:00:00', '10:00:00', 0, '2024-08-13 12:37:27', '2024-08-13 12:37:27'),
(1999, 1686, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-13 12:37:27', '2024-08-13 12:37:27'),
(2000, 1686, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-13 12:37:27', '2024-08-13 12:37:27'),
(2001, 1686, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-13 12:37:27', '2024-08-13 12:37:27'),
(2002, 1686, 'friday', '09:00:00', '10:00:00', 0, '2024-08-13 12:37:27', '2024-08-13 12:37:27'),
(2003, 1686, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-13 12:37:27', '2024-08-13 12:37:27'),
(2004, 1686, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-13 12:37:27', '2024-08-13 12:37:27'),
(2005, 1701, 'monday', '09:00:00', '10:00:00', 0, '2024-08-17 03:13:35', '2024-08-17 03:13:35'),
(2006, 1701, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-17 03:13:35', '2024-08-17 03:13:35'),
(2007, 1701, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-17 03:13:35', '2024-08-17 03:13:35'),
(2008, 1701, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-17 03:13:35', '2024-08-17 03:13:35'),
(2009, 1701, 'friday', '09:00:00', '10:00:00', 0, '2024-08-17 03:13:35', '2024-08-17 03:13:35'),
(2010, 1701, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-17 03:13:35', '2024-08-17 03:13:35'),
(2011, 1701, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-17 03:13:35', '2024-08-17 03:13:35'),
(2012, 1713, 'monday', '09:00:00', '10:00:00', 0, '2024-08-18 15:18:16', '2024-08-18 15:18:16'),
(2013, 1713, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-18 15:18:16', '2024-08-18 15:18:16'),
(2014, 1713, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-18 15:18:16', '2024-08-18 15:18:16'),
(2015, 1713, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-18 15:18:16', '2024-08-18 15:18:16'),
(2016, 1713, 'friday', '09:00:00', '10:00:00', 0, '2024-08-18 15:18:16', '2024-08-18 15:18:16'),
(2017, 1713, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-18 15:18:16', '2024-08-18 15:18:16'),
(2018, 1713, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-18 15:18:16', '2024-08-18 15:18:16'),
(2019, 1717, 'monday', '09:00:00', '10:00:00', 0, '2024-08-19 13:35:38', '2024-08-19 13:35:38'),
(2020, 1717, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-19 13:35:38', '2024-08-19 13:35:38'),
(2021, 1717, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-19 13:35:38', '2024-08-19 13:35:38'),
(2022, 1717, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-19 13:35:38', '2024-08-19 13:35:38'),
(2023, 1717, 'friday', '09:00:00', '10:00:00', 0, '2024-08-19 13:35:38', '2024-08-19 13:35:38'),
(2024, 1717, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-19 13:35:38', '2024-08-19 13:35:38'),
(2025, 1717, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-19 13:35:38', '2024-08-19 13:35:38'),
(2026, 1718, 'monday', '09:00:00', '10:00:00', 0, '2024-08-19 16:32:37', '2024-08-19 16:32:37'),
(2027, 1718, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-19 16:32:37', '2024-08-19 16:32:37'),
(2028, 1718, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-19 16:32:37', '2024-08-19 16:32:37'),
(2029, 1718, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-19 16:32:37', '2024-08-19 16:32:37'),
(2030, 1718, 'friday', '09:00:00', '10:00:00', 0, '2024-08-19 16:32:37', '2024-08-19 16:32:37'),
(2031, 1718, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-19 16:32:37', '2024-08-19 16:32:37'),
(2032, 1718, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-19 16:32:37', '2024-08-19 16:32:37'),
(2033, 1723, 'monday', '09:00:00', '10:00:00', 0, '2024-08-20 17:07:53', '2024-08-20 17:07:53'),
(2034, 1723, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-20 17:07:53', '2024-08-20 17:07:53'),
(2035, 1723, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-20 17:07:53', '2024-08-20 17:07:53'),
(2036, 1723, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-20 17:07:53', '2024-08-20 17:07:53'),
(2037, 1723, 'friday', '09:00:00', '10:00:00', 0, '2024-08-20 17:07:53', '2024-08-20 17:07:53'),
(2038, 1723, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-20 17:07:53', '2024-08-20 17:07:53'),
(2039, 1723, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-20 17:07:53', '2024-08-20 17:07:53'),
(2040, 1741, 'monday', '09:00:00', '10:00:00', 0, '2024-08-26 16:50:16', '2024-08-26 16:50:16'),
(2041, 1741, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-26 16:50:16', '2024-08-26 16:50:16'),
(2042, 1741, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-26 16:50:16', '2024-08-26 16:50:16'),
(2043, 1741, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-26 16:50:16', '2024-08-26 16:50:16'),
(2044, 1741, 'friday', '09:00:00', '10:00:00', 0, '2024-08-26 16:50:16', '2024-08-26 16:50:16'),
(2045, 1741, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-26 16:50:16', '2024-08-26 16:50:16'),
(2046, 1741, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-26 16:50:16', '2024-08-26 16:50:16'),
(2047, 1744, 'monday', '09:00:00', '10:00:00', 0, '2024-08-27 07:44:06', '2024-08-27 07:44:06'),
(2048, 1744, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-27 07:44:06', '2024-08-27 07:44:06'),
(2049, 1744, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-27 07:44:06', '2024-08-27 07:44:06'),
(2050, 1744, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-27 07:44:06', '2024-08-27 07:44:06'),
(2051, 1744, 'friday', '09:00:00', '10:00:00', 0, '2024-08-27 07:44:06', '2024-08-27 07:44:06'),
(2052, 1744, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-27 07:44:06', '2024-08-27 07:44:06'),
(2053, 1744, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-27 07:44:06', '2024-08-27 07:44:06'),
(2054, 1745, 'monday', '09:00:00', '10:00:00', 0, '2024-08-27 11:50:58', '2024-08-27 11:50:58'),
(2055, 1745, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-27 11:50:58', '2024-08-27 11:50:58'),
(2056, 1745, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-27 11:50:58', '2024-08-27 11:50:58'),
(2057, 1745, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-27 11:50:58', '2024-08-27 11:50:58'),
(2058, 1745, 'friday', '09:00:00', '10:00:00', 0, '2024-08-27 11:50:58', '2024-08-27 11:50:58'),
(2059, 1745, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-27 11:50:58', '2024-08-27 11:50:58'),
(2060, 1745, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-27 11:50:58', '2024-08-27 11:50:58'),
(2061, 1749, 'monday', '09:00:00', '10:00:00', 0, '2024-08-28 09:33:46', '2024-08-28 09:33:46'),
(2062, 1749, 'tuesday', '09:00:00', '10:00:00', 1, '2024-08-28 09:33:46', '2024-08-28 09:33:46'),
(2063, 1749, 'wednesday', '09:00:00', '10:00:00', 1, '2024-08-28 09:33:46', '2024-08-28 09:33:46'),
(2064, 1749, 'thursday', '09:00:00', '10:00:00', 1, '2024-08-28 09:33:46', '2024-08-28 09:33:46'),
(2065, 1749, 'friday', '09:00:00', '10:00:00', 1, '2024-08-28 09:33:46', '2024-08-28 09:33:46'),
(2066, 1749, 'saturday', '09:00:00', '10:00:00', 1, '2024-08-28 09:33:46', '2024-08-28 09:33:46'),
(2067, 1749, 'sunday', '09:00:00', '10:00:00', 1, '2024-08-28 09:33:46', '2024-08-28 09:33:46'),
(2068, 1757, 'monday', '09:00:00', '10:00:00', 0, '2024-08-30 15:46:25', '2024-08-30 15:46:25'),
(2069, 1757, 'tuesday', '09:00:00', '10:00:00', 0, '2024-08-30 15:46:25', '2024-08-30 15:46:25'),
(2070, 1757, 'wednesday', '09:00:00', '10:00:00', 0, '2024-08-30 15:46:25', '2024-08-30 15:46:25'),
(2071, 1757, 'thursday', '09:00:00', '10:00:00', 0, '2024-08-30 15:46:25', '2024-08-30 15:46:25'),
(2072, 1757, 'friday', '09:00:00', '10:00:00', 0, '2024-08-30 15:46:25', '2024-08-30 15:46:25'),
(2073, 1757, 'saturday', '09:00:00', '10:00:00', 0, '2024-08-30 15:46:25', '2024-08-30 15:46:25'),
(2074, 1757, 'sunday', '09:00:00', '10:00:00', 0, '2024-08-30 15:46:25', '2024-08-30 15:46:25'),
(2075, 1776, 'monday', '09:00:00', '10:00:00', 0, '2024-09-02 15:13:23', '2024-09-02 15:13:23'),
(2076, 1776, 'tuesday', '09:00:00', '10:00:00', 0, '2024-09-02 15:13:23', '2024-09-02 15:13:23'),
(2077, 1776, 'wednesday', '09:00:00', '10:00:00', 0, '2024-09-02 15:13:23', '2024-09-02 15:13:23'),
(2078, 1776, 'thursday', '09:00:00', '10:00:00', 0, '2024-09-02 15:13:23', '2024-09-02 15:13:23'),
(2079, 1776, 'friday', '09:00:00', '10:00:00', 0, '2024-09-02 15:13:23', '2024-09-02 15:13:23'),
(2080, 1776, 'saturday', '09:00:00', '10:00:00', 0, '2024-09-02 15:13:23', '2024-09-02 15:13:23'),
(2081, 1776, 'sunday', '09:00:00', '10:00:00', 0, '2024-09-02 15:13:23', '2024-09-02 15:13:23'),
(2082, 1790, 'monday', '09:00:00', '10:00:00', 0, '2024-09-17 02:18:57', '2024-09-17 02:18:57'),
(2083, 1790, 'tuesday', '09:00:00', '10:00:00', 0, '2024-09-17 02:18:57', '2024-09-17 02:18:57'),
(2084, 1790, 'wednesday', '09:00:00', '10:00:00', 0, '2024-09-17 02:18:57', '2024-09-17 02:18:57'),
(2085, 1790, 'thursday', '09:00:00', '10:00:00', 0, '2024-09-17 02:18:57', '2024-09-17 02:18:57'),
(2086, 1790, 'friday', '09:00:00', '10:00:00', 0, '2024-09-17 02:18:57', '2024-09-17 02:18:57'),
(2087, 1790, 'saturday', '09:00:00', '10:00:00', 0, '2024-09-17 02:18:57', '2024-09-17 02:18:57'),
(2088, 1790, 'sunday', '09:00:00', '10:00:00', 0, '2024-09-17 02:18:57', '2024-09-17 02:18:57'),
(2089, 1796, 'monday', '09:00:00', '10:00:00', 0, '2024-09-18 19:46:24', '2024-09-18 19:46:24'),
(2090, 1796, 'tuesday', '09:00:00', '10:00:00', 0, '2024-09-18 19:46:24', '2024-09-18 19:46:24');
INSERT INTO `partner_timings` (`id`, `partner_id`, `day`, `opening_time`, `closing_time`, `is_open`, `created_at`, `updated_at`) VALUES
(2091, 1796, 'wednesday', '09:00:00', '10:00:00', 0, '2024-09-18 19:46:24', '2024-09-18 19:46:24'),
(2092, 1796, 'thursday', '09:00:00', '10:00:00', 0, '2024-09-18 19:46:24', '2024-09-18 19:46:24'),
(2093, 1796, 'friday', '09:00:00', '10:00:00', 0, '2024-09-18 19:46:24', '2024-09-18 19:46:24'),
(2094, 1796, 'saturday', '09:00:00', '10:00:00', 0, '2024-09-18 19:46:24', '2024-09-18 19:46:24'),
(2095, 1796, 'sunday', '09:00:00', '10:00:00', 0, '2024-09-18 19:46:24', '2024-09-18 19:46:24'),
(2096, 1797, 'monday', '09:00:00', '10:00:00', 0, '2024-09-18 19:51:08', '2024-09-18 19:51:08'),
(2097, 1797, 'tuesday', '09:00:00', '10:00:00', 0, '2024-09-18 19:51:08', '2024-09-18 19:51:08'),
(2098, 1797, 'wednesday', '09:00:00', '10:00:00', 0, '2024-09-18 19:51:08', '2024-09-18 19:51:08'),
(2099, 1797, 'thursday', '09:00:00', '10:00:00', 0, '2024-09-18 19:51:08', '2024-09-18 19:51:08'),
(2100, 1797, 'friday', '09:00:00', '10:00:00', 0, '2024-09-18 19:51:08', '2024-09-18 19:51:08'),
(2101, 1797, 'saturday', '09:00:00', '10:00:00', 0, '2024-09-18 19:51:08', '2024-09-18 19:51:08'),
(2102, 1797, 'sunday', '09:00:00', '10:00:00', 0, '2024-09-18 19:51:08', '2024-09-18 19:51:08'),
(2103, 1798, 'monday', '09:00:00', '10:00:00', 0, '2024-09-19 06:56:45', '2024-09-19 06:56:45'),
(2104, 1798, 'tuesday', '09:00:00', '10:00:00', 0, '2024-09-19 06:56:45', '2024-09-19 06:56:45'),
(2105, 1798, 'wednesday', '09:00:00', '10:00:00', 0, '2024-09-19 06:56:45', '2024-09-19 06:56:45'),
(2106, 1798, 'thursday', '09:00:00', '10:00:00', 0, '2024-09-19 06:56:45', '2024-09-19 06:56:45'),
(2107, 1798, 'friday', '09:00:00', '10:00:00', 0, '2024-09-19 06:56:45', '2024-09-19 06:56:45'),
(2108, 1798, 'saturday', '09:00:00', '10:00:00', 0, '2024-09-19 06:56:45', '2024-09-19 06:56:45'),
(2109, 1798, 'sunday', '09:00:00', '10:00:00', 0, '2024-09-19 06:56:45', '2024-09-19 06:56:45'),
(2110, 1804, 'monday', '09:00:00', '10:00:00', 0, '2024-09-20 10:20:45', '2024-09-20 10:20:45'),
(2111, 1804, 'tuesday', '09:00:00', '10:00:00', 0, '2024-09-20 10:20:45', '2024-09-20 10:20:45'),
(2112, 1804, 'wednesday', '09:00:00', '10:00:00', 0, '2024-09-20 10:20:45', '2024-09-20 10:20:45'),
(2113, 1804, 'thursday', '09:00:00', '10:00:00', 0, '2024-09-20 10:20:45', '2024-09-20 10:20:45'),
(2114, 1804, 'friday', '09:00:00', '10:00:00', 0, '2024-09-20 10:20:45', '2024-09-20 10:20:45'),
(2115, 1804, 'saturday', '09:00:00', '10:00:00', 0, '2024-09-20 10:20:45', '2024-09-20 10:20:45'),
(2116, 1804, 'sunday', '09:00:00', '10:00:00', 0, '2024-09-20 10:20:45', '2024-09-20 10:20:45'),
(2117, 1805, 'monday', '09:00:00', '10:00:00', 0, '2024-09-20 21:28:49', '2024-09-20 21:28:49'),
(2118, 1805, 'tuesday', '09:00:00', '10:00:00', 0, '2024-09-20 21:28:49', '2024-09-20 21:28:49'),
(2119, 1805, 'wednesday', '09:00:00', '10:00:00', 0, '2024-09-20 21:28:49', '2024-09-20 21:28:49'),
(2120, 1805, 'thursday', '09:00:00', '10:00:00', 0, '2024-09-20 21:28:49', '2024-09-20 21:28:49'),
(2121, 1805, 'friday', '09:00:00', '10:00:00', 0, '2024-09-20 21:28:49', '2024-09-20 21:28:49'),
(2122, 1805, 'saturday', '09:00:00', '10:00:00', 0, '2024-09-20 21:28:49', '2024-09-20 21:28:49'),
(2123, 1805, 'sunday', '09:00:00', '10:00:00', 0, '2024-09-20 21:28:49', '2024-09-20 21:28:49'),
(2124, 1807, 'monday', '09:00:00', '10:00:00', 0, '2024-09-21 22:52:24', '2024-09-21 22:52:24'),
(2125, 1807, 'tuesday', '09:00:00', '10:00:00', 0, '2024-09-21 22:52:24', '2024-09-21 22:52:24'),
(2126, 1807, 'wednesday', '09:00:00', '10:00:00', 0, '2024-09-21 22:52:24', '2024-09-21 22:52:24'),
(2127, 1807, 'thursday', '09:00:00', '10:00:00', 0, '2024-09-21 22:52:24', '2024-09-21 22:52:24'),
(2128, 1807, 'friday', '09:00:00', '10:00:00', 0, '2024-09-21 22:52:24', '2024-09-21 22:52:24'),
(2129, 1807, 'saturday', '09:00:00', '10:00:00', 0, '2024-09-21 22:52:24', '2024-09-21 22:52:24'),
(2130, 1807, 'sunday', '09:00:00', '10:00:00', 0, '2024-09-21 22:52:24', '2024-09-21 22:52:24'),
(2131, 1811, 'monday', '09:00:00', '10:00:00', 0, '2024-09-23 11:46:40', '2024-09-23 11:46:40'),
(2132, 1811, 'tuesday', '09:00:00', '10:00:00', 0, '2024-09-23 11:46:40', '2024-09-23 11:46:40'),
(2133, 1811, 'wednesday', '09:00:00', '10:00:00', 0, '2024-09-23 11:46:40', '2024-09-23 11:46:40'),
(2134, 1811, 'thursday', '09:00:00', '10:00:00', 0, '2024-09-23 11:46:40', '2024-09-23 11:46:40'),
(2135, 1811, 'friday', '09:00:00', '10:00:00', 0, '2024-09-23 11:46:40', '2024-09-23 11:46:40'),
(2136, 1811, 'saturday', '09:00:00', '10:00:00', 0, '2024-09-23 11:46:40', '2024-09-23 11:46:40'),
(2137, 1811, 'sunday', '09:00:00', '10:00:00', 0, '2024-09-23 11:46:40', '2024-09-23 11:46:40'),
(2138, 1812, 'monday', '09:00:00', '10:00:00', 0, '2024-09-23 13:04:30', '2024-09-23 13:04:30'),
(2139, 1812, 'tuesday', '09:00:00', '10:00:00', 0, '2024-09-23 13:04:30', '2024-09-23 13:04:30'),
(2140, 1812, 'wednesday', '09:00:00', '10:00:00', 0, '2024-09-23 13:04:30', '2024-09-23 13:04:30'),
(2141, 1812, 'thursday', '09:00:00', '10:00:00', 0, '2024-09-23 13:04:30', '2024-09-23 13:04:30'),
(2142, 1812, 'friday', '09:00:00', '10:00:00', 0, '2024-09-23 13:04:30', '2024-09-23 13:04:30'),
(2143, 1812, 'saturday', '09:00:00', '10:00:00', 0, '2024-09-23 13:04:30', '2024-09-23 13:04:30'),
(2144, 1812, 'sunday', '09:00:00', '10:00:00', 0, '2024-09-23 13:04:30', '2024-09-23 13:04:30'),
(2145, 1814, 'monday', '09:00:00', '10:00:00', 0, '2024-09-24 03:19:59', '2024-09-24 03:19:59'),
(2146, 1814, 'tuesday', '09:00:00', '10:00:00', 0, '2024-09-24 03:19:59', '2024-09-24 03:19:59'),
(2147, 1814, 'wednesday', '09:00:00', '10:00:00', 0, '2024-09-24 03:19:59', '2024-09-24 03:19:59'),
(2148, 1814, 'thursday', '09:00:00', '10:00:00', 0, '2024-09-24 03:19:59', '2024-09-24 03:19:59'),
(2149, 1814, 'friday', '09:00:00', '10:00:00', 0, '2024-09-24 03:19:59', '2024-09-24 03:19:59'),
(2150, 1814, 'saturday', '09:00:00', '10:00:00', 0, '2024-09-24 03:19:59', '2024-09-24 03:19:59'),
(2151, 1814, 'sunday', '09:00:00', '10:00:00', 0, '2024-09-24 03:19:59', '2024-09-24 03:19:59'),
(2152, 1816, 'monday', '09:00:00', '10:00:00', 0, '2024-09-26 06:30:39', '2024-09-26 06:30:39'),
(2153, 1816, 'tuesday', '09:00:00', '10:00:00', 0, '2024-09-26 06:30:39', '2024-09-26 06:30:39'),
(2154, 1816, 'wednesday', '09:00:00', '10:00:00', 0, '2024-09-26 06:30:39', '2024-09-26 06:30:39'),
(2155, 1816, 'thursday', '09:00:00', '10:00:00', 0, '2024-09-26 06:30:39', '2024-09-26 06:30:39'),
(2156, 1816, 'friday', '09:00:00', '10:00:00', 0, '2024-09-26 06:30:39', '2024-09-26 06:30:39'),
(2157, 1816, 'saturday', '09:00:00', '10:00:00', 0, '2024-09-26 06:30:39', '2024-09-26 06:30:39'),
(2158, 1816, 'sunday', '09:00:00', '10:00:00', 0, '2024-09-26 06:30:39', '2024-09-26 06:30:39'),
(2159, 1825, 'monday', '09:00:00', '10:00:00', 0, '2024-09-30 13:53:19', '2024-09-30 13:53:19'),
(2160, 1825, 'tuesday', '09:00:00', '10:00:00', 0, '2024-09-30 13:53:19', '2024-09-30 13:53:19'),
(2161, 1825, 'wednesday', '09:00:00', '10:00:00', 0, '2024-09-30 13:53:19', '2024-09-30 13:53:19'),
(2162, 1825, 'thursday', '09:00:00', '10:00:00', 0, '2024-09-30 13:53:19', '2024-09-30 13:53:19'),
(2163, 1825, 'friday', '09:00:00', '10:00:00', 0, '2024-09-30 13:53:19', '2024-09-30 13:53:19'),
(2164, 1825, 'saturday', '09:00:00', '10:00:00', 0, '2024-09-30 13:53:19', '2024-09-30 13:53:19'),
(2165, 1825, 'sunday', '09:00:00', '10:00:00', 0, '2024-09-30 13:53:19', '2024-09-30 13:53:19'),
(2166, 1826, 'monday', '09:00:00', '10:00:00', 0, '2024-10-01 06:29:44', '2024-10-01 06:29:44'),
(2167, 1826, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-01 06:29:44', '2024-10-01 06:29:44'),
(2168, 1826, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-01 06:29:44', '2024-10-01 06:29:44'),
(2169, 1826, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-01 06:29:44', '2024-10-01 06:29:44'),
(2170, 1826, 'friday', '09:00:00', '10:00:00', 0, '2024-10-01 06:29:44', '2024-10-01 06:29:44'),
(2171, 1826, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-01 06:29:44', '2024-10-01 06:29:44'),
(2172, 1826, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-01 06:29:44', '2024-10-01 06:29:44'),
(2173, 1832, 'monday', '09:00:00', '10:00:00', 0, '2024-10-03 20:10:15', '2024-10-03 20:10:15'),
(2174, 1832, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-03 20:10:15', '2024-10-03 20:10:15'),
(2175, 1832, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-03 20:10:15', '2024-10-03 20:10:15'),
(2176, 1832, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-03 20:10:15', '2024-10-03 20:10:15'),
(2177, 1832, 'friday', '09:00:00', '10:00:00', 0, '2024-10-03 20:10:15', '2024-10-03 20:10:15'),
(2178, 1832, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-03 20:10:15', '2024-10-03 20:10:15'),
(2179, 1832, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-03 20:10:15', '2024-10-03 20:10:15'),
(2180, 1833, 'monday', '00:00:00', '00:00:00', 0, '2024-10-04 19:08:33', '2024-10-04 19:08:33'),
(2181, 1833, 'tuesday', '00:00:00', '00:00:00', 0, '2024-10-04 19:08:33', '2024-10-04 19:08:33'),
(2182, 1833, 'wednesday', '00:00:00', '00:00:00', 0, '2024-10-04 19:08:33', '2024-10-04 19:08:33'),
(2183, 1833, 'thursday', '00:00:00', '00:00:00', 0, '2024-10-04 19:08:33', '2024-10-04 19:08:33'),
(2184, 1833, 'friday', '00:00:00', '00:00:00', 0, '2024-10-04 19:08:33', '2024-10-04 19:08:33'),
(2185, 1833, 'saturday', '00:00:00', '00:00:00', 0, '2024-10-04 19:08:33', '2024-10-04 19:08:33'),
(2186, 1833, 'sunday', '00:00:00', '00:00:00', 0, '2024-10-04 19:08:33', '2024-10-04 19:08:33'),
(2187, 1841, 'monday', '09:00:00', '10:00:00', 0, '2024-10-08 08:03:40', '2024-10-08 08:03:40'),
(2188, 1841, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-08 08:03:40', '2024-10-08 08:03:40'),
(2189, 1841, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-08 08:03:40', '2024-10-08 08:03:40'),
(2190, 1841, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-08 08:03:40', '2024-10-08 08:03:40'),
(2191, 1841, 'friday', '09:00:00', '10:00:00', 0, '2024-10-08 08:03:40', '2024-10-08 08:03:40'),
(2192, 1841, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-08 08:03:40', '2024-10-08 08:03:40'),
(2193, 1841, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-08 08:03:40', '2024-10-08 08:03:40'),
(2194, 1842, 'monday', '09:00:00', '10:00:00', 0, '2024-10-09 17:57:38', '2024-10-09 17:57:38'),
(2195, 1842, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-09 17:57:38', '2024-10-09 17:57:38'),
(2196, 1842, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-09 17:57:38', '2024-10-09 17:57:38'),
(2197, 1842, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-09 17:57:38', '2024-10-09 17:57:38'),
(2198, 1842, 'friday', '09:00:00', '10:00:00', 0, '2024-10-09 17:57:38', '2024-10-09 17:57:38'),
(2199, 1842, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-09 17:57:38', '2024-10-09 17:57:38'),
(2200, 1842, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-09 17:57:38', '2024-10-09 17:57:38'),
(2201, 1844, 'monday', '09:00:00', '10:00:00', 0, '2024-10-09 23:24:30', '2024-10-09 23:24:30'),
(2202, 1844, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-09 23:24:30', '2024-10-09 23:24:30'),
(2203, 1844, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-09 23:24:30', '2024-10-09 23:24:30'),
(2204, 1844, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-09 23:24:30', '2024-10-09 23:24:30'),
(2205, 1844, 'friday', '09:00:00', '10:00:00', 0, '2024-10-09 23:24:30', '2024-10-09 23:24:30'),
(2206, 1844, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-09 23:24:30', '2024-10-09 23:24:30'),
(2207, 1844, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-09 23:24:30', '2024-10-09 23:24:30'),
(2208, 1846, 'monday', '09:00:00', '10:00:00', 0, '2024-10-12 03:18:30', '2024-10-12 03:18:30'),
(2209, 1846, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-12 03:18:30', '2024-10-12 03:18:30'),
(2210, 1846, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-12 03:18:30', '2024-10-12 03:18:30'),
(2211, 1846, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-12 03:18:30', '2024-10-12 03:18:30'),
(2212, 1846, 'friday', '09:00:00', '10:00:00', 0, '2024-10-12 03:18:30', '2024-10-12 03:18:30'),
(2213, 1846, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-12 03:18:30', '2024-10-12 03:18:30'),
(2214, 1846, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-12 03:18:30', '2024-10-12 03:18:30'),
(2215, 1851, 'monday', '09:00:00', '10:00:00', 0, '2024-10-14 05:47:27', '2024-10-14 05:47:27'),
(2216, 1851, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-14 05:47:27', '2024-10-14 05:47:27'),
(2217, 1851, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-14 05:47:27', '2024-10-14 05:47:27'),
(2218, 1851, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-14 05:47:27', '2024-10-14 05:47:27'),
(2219, 1851, 'friday', '09:00:00', '10:00:00', 0, '2024-10-14 05:47:27', '2024-10-14 05:47:27'),
(2220, 1851, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-14 05:47:27', '2024-10-14 05:47:27'),
(2221, 1851, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-14 05:47:27', '2024-10-14 05:47:27'),
(2222, 1856, 'monday', '09:00:00', '10:00:00', 0, '2024-10-16 05:41:55', '2024-10-16 05:41:55'),
(2223, 1856, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-16 05:41:55', '2024-10-16 05:41:55'),
(2224, 1856, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-16 05:41:55', '2024-10-16 05:41:55'),
(2225, 1856, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-16 05:41:55', '2024-10-16 05:41:55'),
(2226, 1856, 'friday', '09:00:00', '10:00:00', 0, '2024-10-16 05:41:55', '2024-10-16 05:41:55'),
(2227, 1856, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-16 05:41:55', '2024-10-16 05:41:55'),
(2228, 1856, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-16 05:41:55', '2024-10-16 05:41:55'),
(2229, 1859, 'monday', '09:00:00', '10:00:00', 0, '2024-10-16 22:42:19', '2024-10-16 22:42:19'),
(2230, 1859, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-16 22:42:19', '2024-10-16 22:42:19'),
(2231, 1859, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-16 22:42:19', '2024-10-16 22:42:19'),
(2232, 1859, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-16 22:42:19', '2024-10-16 22:42:19'),
(2233, 1859, 'friday', '09:00:00', '10:00:00', 0, '2024-10-16 22:42:19', '2024-10-16 22:42:19'),
(2234, 1859, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-16 22:42:19', '2024-10-16 22:42:19'),
(2235, 1859, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-16 22:42:19', '2024-10-16 22:42:19'),
(2236, 1861, 'monday', '09:00:00', '10:00:00', 0, '2024-10-18 19:44:00', '2024-10-18 19:44:00'),
(2237, 1861, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-18 19:44:00', '2024-10-18 19:44:00'),
(2238, 1861, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-18 19:44:00', '2024-10-18 19:44:00'),
(2239, 1861, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-18 19:44:00', '2024-10-18 19:44:00'),
(2240, 1861, 'friday', '09:00:00', '10:00:00', 0, '2024-10-18 19:44:00', '2024-10-18 19:44:00'),
(2241, 1861, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-18 19:44:00', '2024-10-18 19:44:00'),
(2242, 1861, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-18 19:44:00', '2024-10-18 19:44:00'),
(2243, 1862, 'monday', '09:00:00', '10:00:00', 0, '2024-10-18 21:04:02', '2024-10-18 21:04:02'),
(2244, 1862, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-18 21:04:02', '2024-10-18 21:04:02'),
(2245, 1862, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-18 21:04:02', '2024-10-18 21:04:02'),
(2246, 1862, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-18 21:04:02', '2024-10-18 21:04:02'),
(2247, 1862, 'friday', '09:00:00', '10:00:00', 0, '2024-10-18 21:04:02', '2024-10-18 21:04:02'),
(2248, 1862, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-18 21:04:02', '2024-10-18 21:04:02'),
(2249, 1862, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-18 21:04:02', '2024-10-18 21:04:02'),
(2250, 1866, 'monday', '09:00:00', '10:00:00', 0, '2024-10-19 22:02:18', '2024-10-19 22:02:18'),
(2251, 1866, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-19 22:02:18', '2024-10-19 22:02:18'),
(2252, 1866, 'wednesday', '09:00:00', '10:00:00', 1, '2024-10-19 22:02:18', '2024-10-19 22:02:18'),
(2253, 1866, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-19 22:02:18', '2024-10-19 22:02:18'),
(2254, 1866, 'friday', '09:00:00', '10:00:00', 1, '2024-10-19 22:02:18', '2024-10-19 22:02:18'),
(2255, 1866, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-19 22:02:18', '2024-10-19 22:02:18'),
(2256, 1866, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-19 22:02:18', '2024-10-19 22:02:18'),
(2257, 1867, 'monday', '09:00:00', '10:00:00', 0, '2024-10-20 07:52:53', '2024-10-20 07:52:53'),
(2258, 1867, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-20 07:52:53', '2024-10-20 07:52:53'),
(2259, 1867, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-20 07:52:53', '2024-10-20 07:52:53'),
(2260, 1867, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-20 07:52:53', '2024-10-20 07:52:53'),
(2261, 1867, 'friday', '09:00:00', '10:00:00', 0, '2024-10-20 07:52:53', '2024-10-20 07:52:53'),
(2262, 1867, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-20 07:52:53', '2024-10-20 07:52:53'),
(2263, 1867, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-20 07:52:53', '2024-10-20 07:52:53'),
(2264, 1870, 'monday', '09:00:00', '10:00:00', 0, '2024-10-22 07:33:08', '2024-10-22 07:33:08'),
(2265, 1870, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-22 07:33:08', '2024-10-22 07:33:08'),
(2266, 1870, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-22 07:33:08', '2024-10-22 07:33:08'),
(2267, 1870, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-22 07:33:08', '2024-10-22 07:33:08'),
(2268, 1870, 'friday', '09:00:00', '10:00:00', 0, '2024-10-22 07:33:08', '2024-10-22 07:33:08'),
(2269, 1870, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-22 07:33:08', '2024-10-22 07:33:08'),
(2270, 1870, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-22 07:33:08', '2024-10-22 07:33:08'),
(2271, 1872, 'monday', '09:00:00', '10:00:00', 0, '2024-10-22 21:10:33', '2024-10-22 21:10:33'),
(2272, 1872, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-22 21:10:33', '2024-10-22 21:10:33'),
(2273, 1872, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-22 21:10:33', '2024-10-22 21:10:33'),
(2274, 1872, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-22 21:10:33', '2024-10-22 21:10:33'),
(2275, 1872, 'friday', '09:00:00', '10:00:00', 0, '2024-10-22 21:10:33', '2024-10-22 21:10:33'),
(2276, 1872, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-22 21:10:33', '2024-10-22 21:10:33'),
(2277, 1872, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-22 21:10:33', '2024-10-22 21:10:33'),
(2278, 1876, 'monday', '09:00:00', '10:00:00', 0, '2024-10-24 09:44:33', '2024-10-24 09:44:33'),
(2279, 1876, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-24 09:44:33', '2024-10-24 09:44:33'),
(2280, 1876, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-24 09:44:33', '2024-10-24 09:44:33'),
(2281, 1876, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-24 09:44:33', '2024-10-24 09:44:33'),
(2282, 1876, 'friday', '09:00:00', '10:00:00', 0, '2024-10-24 09:44:33', '2024-10-24 09:44:33'),
(2283, 1876, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-24 09:44:33', '2024-10-24 09:44:33'),
(2284, 1876, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-24 09:44:33', '2024-10-24 09:44:33'),
(2285, 1877, 'monday', '09:00:00', '10:00:00', 0, '2024-10-24 21:10:51', '2024-10-24 21:10:51'),
(2286, 1877, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-24 21:10:51', '2024-10-24 21:10:51'),
(2287, 1877, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-24 21:10:51', '2024-10-24 21:10:51'),
(2288, 1877, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-24 21:10:51', '2024-10-24 21:10:51'),
(2289, 1877, 'friday', '09:00:00', '10:00:00', 0, '2024-10-24 21:10:51', '2024-10-24 21:10:51'),
(2290, 1877, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-24 21:10:51', '2024-10-24 21:10:51'),
(2291, 1877, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-24 21:10:51', '2024-10-24 21:10:51'),
(2292, 1881, 'monday', '09:00:00', '10:00:00', 0, '2024-10-25 17:48:59', '2024-10-25 17:48:59'),
(2293, 1881, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-25 17:48:59', '2024-10-25 17:48:59'),
(2294, 1881, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-25 17:48:59', '2024-10-25 17:48:59'),
(2295, 1881, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-25 17:48:59', '2024-10-25 17:48:59'),
(2296, 1881, 'friday', '09:00:00', '10:00:00', 0, '2024-10-25 17:48:59', '2024-10-25 17:48:59'),
(2297, 1881, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-25 17:48:59', '2024-10-25 17:48:59'),
(2298, 1881, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-25 17:48:59', '2024-10-25 17:48:59'),
(2299, 1883, 'monday', '09:00:00', '10:00:00', 0, '2024-10-26 16:30:41', '2024-10-26 16:30:41'),
(2300, 1883, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-26 16:30:41', '2024-10-26 16:30:41'),
(2301, 1883, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-26 16:30:41', '2024-10-26 16:30:41'),
(2302, 1883, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-26 16:30:41', '2024-10-26 16:30:41'),
(2303, 1883, 'friday', '09:00:00', '10:00:00', 0, '2024-10-26 16:30:41', '2024-10-26 16:30:41'),
(2304, 1883, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-26 16:30:41', '2024-10-26 16:30:41'),
(2305, 1883, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-26 16:30:41', '2024-10-26 16:30:41'),
(2306, 1884, 'monday', '09:00:00', '10:00:00', 0, '2024-10-27 02:34:16', '2024-10-27 02:34:16'),
(2307, 1884, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-27 02:34:16', '2024-10-27 02:34:16'),
(2308, 1884, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-27 02:34:16', '2024-10-27 02:34:16'),
(2309, 1884, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-27 02:34:16', '2024-10-27 02:34:16'),
(2310, 1884, 'friday', '09:00:00', '10:00:00', 0, '2024-10-27 02:34:16', '2024-10-27 02:34:16'),
(2311, 1884, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-27 02:34:16', '2024-10-27 02:34:16'),
(2312, 1884, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-27 02:34:16', '2024-10-27 02:34:16'),
(2313, 1886, 'monday', '09:00:00', '10:00:00', 0, '2024-10-29 00:23:51', '2024-10-29 00:23:51'),
(2314, 1886, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-29 00:23:51', '2024-10-29 00:23:51'),
(2315, 1886, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-29 00:23:51', '2024-10-29 00:23:51'),
(2316, 1886, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-29 00:23:51', '2024-10-29 00:23:51'),
(2317, 1886, 'friday', '09:00:00', '10:00:00', 0, '2024-10-29 00:23:51', '2024-10-29 00:23:51'),
(2318, 1886, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-29 00:23:51', '2024-10-29 00:23:51'),
(2319, 1886, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-29 00:23:51', '2024-10-29 00:23:51'),
(2327, 1888, 'monday', '09:00:00', '10:00:00', 0, '2024-10-29 06:14:46', '2024-10-29 06:14:46'),
(2328, 1888, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-29 06:14:46', '2024-10-29 06:14:46'),
(2329, 1888, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-29 06:14:46', '2024-10-29 06:14:46'),
(2330, 1888, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-29 06:14:46', '2024-10-29 06:14:46'),
(2331, 1888, 'friday', '09:00:00', '10:00:00', 0, '2024-10-29 06:14:46', '2024-10-29 06:14:46'),
(2332, 1888, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-29 06:14:46', '2024-10-29 06:14:46'),
(2333, 1888, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-29 06:14:46', '2024-10-29 06:14:46'),
(2334, 1889, 'monday', '09:00:00', '10:00:00', 0, '2024-10-29 07:13:05', '2024-10-29 07:13:05'),
(2335, 1889, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-29 07:13:05', '2024-10-29 07:13:05'),
(2336, 1889, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-29 07:13:05', '2024-10-29 07:13:05'),
(2337, 1889, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-29 07:13:05', '2024-10-29 07:13:05'),
(2338, 1889, 'friday', '09:00:00', '10:00:00', 0, '2024-10-29 07:13:05', '2024-10-29 07:13:05'),
(2339, 1889, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-29 07:13:05', '2024-10-29 07:13:05'),
(2340, 1889, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-29 07:13:05', '2024-10-29 07:13:05'),
(2341, 1894, 'monday', '09:00:00', '10:00:00', 0, '2024-10-31 18:07:35', '2024-10-31 18:07:35'),
(2342, 1894, 'tuesday', '09:00:00', '10:00:00', 0, '2024-10-31 18:07:35', '2024-10-31 18:07:35'),
(2343, 1894, 'wednesday', '09:00:00', '10:00:00', 0, '2024-10-31 18:07:35', '2024-10-31 18:07:35'),
(2344, 1894, 'thursday', '09:00:00', '10:00:00', 0, '2024-10-31 18:07:35', '2024-10-31 18:07:35'),
(2345, 1894, 'friday', '09:00:00', '10:00:00', 0, '2024-10-31 18:07:35', '2024-10-31 18:07:35'),
(2346, 1894, 'saturday', '09:00:00', '10:00:00', 0, '2024-10-31 18:07:35', '2024-10-31 18:07:35'),
(2347, 1894, 'sunday', '09:00:00', '10:00:00', 0, '2024-10-31 18:07:35', '2024-10-31 18:07:35'),
(2348, 1897, 'monday', '09:00:00', '10:00:00', 0, '2024-11-01 17:31:24', '2024-11-01 17:31:24'),
(2349, 1897, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-01 17:31:24', '2024-11-01 17:31:24'),
(2350, 1897, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-01 17:31:24', '2024-11-01 17:31:24'),
(2351, 1897, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-01 17:31:24', '2024-11-01 17:31:24'),
(2352, 1897, 'friday', '09:00:00', '10:00:00', 0, '2024-11-01 17:31:24', '2024-11-01 17:31:24'),
(2353, 1897, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-01 17:31:24', '2024-11-01 17:31:24'),
(2354, 1897, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-01 17:31:24', '2024-11-01 17:31:24'),
(2355, 1903, 'monday', '09:00:00', '10:00:00', 0, '2024-11-06 03:38:32', '2024-11-06 03:38:32'),
(2356, 1903, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-06 03:38:32', '2024-11-06 03:38:32'),
(2357, 1903, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-06 03:38:32', '2024-11-06 03:38:32'),
(2358, 1903, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-06 03:38:32', '2024-11-06 03:38:32'),
(2359, 1903, 'friday', '09:00:00', '10:00:00', 0, '2024-11-06 03:38:32', '2024-11-06 03:38:32'),
(2360, 1903, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-06 03:38:32', '2024-11-06 03:38:32'),
(2361, 1903, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-06 03:38:32', '2024-11-06 03:38:32'),
(2362, 1910, 'monday', '09:00:00', '10:00:00', 0, '2024-11-09 00:51:24', '2024-11-09 00:51:24'),
(2363, 1910, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-09 00:51:24', '2024-11-09 00:51:24'),
(2364, 1910, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-09 00:51:24', '2024-11-09 00:51:24'),
(2365, 1910, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-09 00:51:24', '2024-11-09 00:51:24'),
(2366, 1910, 'friday', '09:00:00', '10:00:00', 0, '2024-11-09 00:51:24', '2024-11-09 00:51:24'),
(2367, 1910, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-09 00:51:24', '2024-11-09 00:51:24'),
(2368, 1910, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-09 00:51:24', '2024-11-09 00:51:24'),
(2369, 1912, 'monday', '09:00:00', '10:00:00', 0, '2024-11-09 05:09:01', '2024-11-09 05:09:01'),
(2370, 1912, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-09 05:09:01', '2024-11-09 05:09:01'),
(2371, 1912, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-09 05:09:01', '2024-11-09 05:09:01'),
(2372, 1912, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-09 05:09:01', '2024-11-09 05:09:01'),
(2373, 1912, 'friday', '09:00:00', '10:00:00', 0, '2024-11-09 05:09:01', '2024-11-09 05:09:01'),
(2374, 1912, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-09 05:09:01', '2024-11-09 05:09:01'),
(2375, 1912, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-09 05:09:01', '2024-11-09 05:09:01'),
(2376, 1925, 'monday', '09:00:00', '10:00:00', 0, '2024-11-12 07:56:26', '2024-11-12 07:56:26'),
(2377, 1925, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-12 07:56:26', '2024-11-12 07:56:26'),
(2378, 1925, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-12 07:56:26', '2024-11-12 07:56:26'),
(2379, 1925, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-12 07:56:26', '2024-11-12 07:56:26'),
(2380, 1925, 'friday', '09:00:00', '10:00:00', 0, '2024-11-12 07:56:26', '2024-11-12 07:56:26'),
(2381, 1925, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-12 07:56:26', '2024-11-12 07:56:26'),
(2382, 1925, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-12 07:56:26', '2024-11-12 07:56:26'),
(2383, 1932, 'monday', '09:00:00', '10:00:00', 0, '2024-11-13 07:37:57', '2024-11-13 07:37:57'),
(2384, 1932, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-13 07:37:57', '2024-11-13 07:37:57'),
(2385, 1932, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-13 07:37:57', '2024-11-13 07:37:57'),
(2386, 1932, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-13 07:37:57', '2024-11-13 07:37:57'),
(2387, 1932, 'friday', '09:00:00', '10:00:00', 0, '2024-11-13 07:37:57', '2024-11-13 07:37:57'),
(2388, 1932, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-13 07:37:57', '2024-11-13 07:37:57'),
(2389, 1932, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-13 07:37:57', '2024-11-13 07:37:57'),
(2390, 1937, 'monday', '09:00:00', '10:00:00', 0, '2024-11-14 01:13:28', '2024-11-14 01:13:28'),
(2391, 1937, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-14 01:13:28', '2024-11-14 01:13:28'),
(2392, 1937, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-14 01:13:28', '2024-11-14 01:13:28'),
(2393, 1937, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-14 01:13:28', '2024-11-14 01:13:28'),
(2394, 1937, 'friday', '09:00:00', '10:00:00', 0, '2024-11-14 01:13:28', '2024-11-14 01:13:28'),
(2395, 1937, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-14 01:13:28', '2024-11-14 01:13:28'),
(2396, 1937, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-14 01:13:28', '2024-11-14 01:13:28'),
(2397, 1939, 'monday', '09:00:00', '10:00:00', 0, '2024-11-14 06:45:15', '2024-11-14 06:45:15'),
(2398, 1939, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-14 06:45:15', '2024-11-14 06:45:15'),
(2399, 1939, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-14 06:45:15', '2024-11-14 06:45:15'),
(2400, 1939, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-14 06:45:15', '2024-11-14 06:45:15'),
(2401, 1939, 'friday', '09:00:00', '10:00:00', 0, '2024-11-14 06:45:15', '2024-11-14 06:45:15'),
(2402, 1939, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-14 06:45:15', '2024-11-14 06:45:15'),
(2403, 1939, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-14 06:45:15', '2024-11-14 06:45:15'),
(2404, 1943, 'monday', '09:00:00', '10:00:00', 0, '2024-11-15 03:15:13', '2024-11-15 03:15:13'),
(2405, 1943, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-15 03:15:13', '2024-11-15 03:15:13'),
(2406, 1943, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-15 03:15:13', '2024-11-15 03:15:13'),
(2407, 1943, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-15 03:15:13', '2024-11-15 03:15:13'),
(2408, 1943, 'friday', '09:00:00', '10:00:00', 0, '2024-11-15 03:15:13', '2024-11-15 03:15:13'),
(2409, 1943, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-15 03:15:13', '2024-11-15 03:15:13'),
(2410, 1943, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-15 03:15:13', '2024-11-15 03:15:13'),
(2411, 1951, 'monday', '09:00:00', '10:00:00', 0, '2024-11-17 21:50:19', '2024-11-17 21:50:19'),
(2412, 1951, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-17 21:50:19', '2024-11-17 21:50:19'),
(2413, 1951, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-17 21:50:19', '2024-11-17 21:50:19'),
(2414, 1951, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-17 21:50:19', '2024-11-17 21:50:19'),
(2415, 1951, 'friday', '09:00:00', '10:00:00', 0, '2024-11-17 21:50:19', '2024-11-17 21:50:19'),
(2416, 1951, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-17 21:50:19', '2024-11-17 21:50:19'),
(2417, 1951, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-17 21:50:19', '2024-11-17 21:50:19'),
(2418, 1952, 'monday', '09:00:00', '10:00:00', 0, '2024-11-18 04:26:13', '2024-11-18 04:26:13'),
(2419, 1952, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-18 04:26:13', '2024-11-18 04:26:13'),
(2420, 1952, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-18 04:26:13', '2024-11-18 04:26:13'),
(2421, 1952, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-18 04:26:13', '2024-11-18 04:26:13'),
(2422, 1952, 'friday', '09:00:00', '10:00:00', 0, '2024-11-18 04:26:13', '2024-11-18 04:26:13'),
(2423, 1952, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-18 04:26:13', '2024-11-18 04:26:13'),
(2424, 1952, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-18 04:26:13', '2024-11-18 04:26:13'),
(2425, 1956, 'monday', '09:00:00', '10:00:00', 0, '2024-11-18 18:36:27', '2024-11-18 18:36:27'),
(2426, 1956, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-18 18:36:27', '2024-11-18 18:36:27'),
(2427, 1956, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-18 18:36:27', '2024-11-18 18:36:27'),
(2428, 1956, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-18 18:36:27', '2024-11-18 18:36:27'),
(2429, 1956, 'friday', '09:00:00', '10:00:00', 0, '2024-11-18 18:36:27', '2024-11-18 18:36:27'),
(2430, 1956, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-18 18:36:27', '2024-11-18 18:36:27'),
(2431, 1956, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-18 18:36:27', '2024-11-18 18:36:27'),
(2432, 1960, 'monday', '09:00:00', '10:00:00', 0, '2024-11-19 07:52:26', '2024-11-19 07:52:26'),
(2433, 1960, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-19 07:52:26', '2024-11-19 07:52:26'),
(2434, 1960, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-19 07:52:26', '2024-11-19 07:52:26'),
(2435, 1960, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-19 07:52:26', '2024-11-19 07:52:26'),
(2436, 1960, 'friday', '09:00:00', '10:00:00', 0, '2024-11-19 07:52:26', '2024-11-19 07:52:26'),
(2437, 1960, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-19 07:52:26', '2024-11-19 07:52:26'),
(2438, 1960, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-19 07:52:26', '2024-11-19 07:52:26'),
(2439, 1962, 'monday', '09:00:00', '10:00:00', 0, '2024-11-20 11:51:59', '2024-11-20 11:51:59'),
(2440, 1962, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-20 11:51:59', '2024-11-20 11:51:59'),
(2441, 1962, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-20 11:51:59', '2024-11-20 11:51:59'),
(2442, 1962, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-20 11:51:59', '2024-11-20 11:51:59'),
(2443, 1962, 'friday', '09:00:00', '10:00:00', 0, '2024-11-20 11:51:59', '2024-11-20 11:51:59'),
(2444, 1962, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-20 11:51:59', '2024-11-20 11:51:59'),
(2445, 1962, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-20 11:51:59', '2024-11-20 11:51:59'),
(2446, 1963, 'monday', '00:00:00', '00:00:00', 0, '2024-11-20 12:09:55', '2024-11-20 12:09:55'),
(2447, 1963, 'tuesday', '00:00:00', '00:00:00', 0, '2024-11-20 12:09:55', '2024-11-20 12:09:55'),
(2448, 1963, 'wednesday', '00:00:00', '00:00:00', 0, '2024-11-20 12:09:55', '2024-11-20 12:09:55'),
(2449, 1963, 'thursday', '00:00:00', '00:00:00', 0, '2024-11-20 12:09:55', '2024-11-20 12:09:55'),
(2450, 1963, 'friday', '00:00:00', '00:00:00', 0, '2024-11-20 12:09:55', '2024-11-20 12:09:55'),
(2451, 1963, 'saturday', '00:00:00', '00:00:00', 0, '2024-11-20 12:09:55', '2024-11-20 12:09:55'),
(2452, 1963, 'sunday', '00:00:00', '00:00:00', 0, '2024-11-20 12:09:55', '2024-11-20 12:09:55'),
(2453, 1964, 'monday', '09:00:00', '10:00:00', 0, '2024-11-20 12:19:01', '2024-11-20 12:19:01'),
(2454, 1964, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-20 12:19:01', '2024-11-20 12:19:01'),
(2455, 1964, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-20 12:19:01', '2024-11-20 12:19:01'),
(2456, 1964, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-20 12:19:01', '2024-11-20 12:19:01'),
(2457, 1964, 'friday', '09:00:00', '10:00:00', 0, '2024-11-20 12:19:01', '2024-11-20 12:19:01'),
(2458, 1964, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-20 12:19:01', '2024-11-20 12:19:01'),
(2459, 1964, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-20 12:19:01', '2024-11-20 12:19:01'),
(2460, 1974, 'monday', '09:00:00', '10:00:00', 0, '2024-11-23 19:18:08', '2024-11-23 19:18:08'),
(2461, 1974, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-23 19:18:08', '2024-11-23 19:18:08'),
(2462, 1974, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-23 19:18:08', '2024-11-23 19:18:08'),
(2463, 1974, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-23 19:18:08', '2024-11-23 19:18:08'),
(2464, 1974, 'friday', '09:00:00', '10:00:00', 0, '2024-11-23 19:18:08', '2024-11-23 19:18:08'),
(2465, 1974, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-23 19:18:08', '2024-11-23 19:18:08'),
(2466, 1974, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-23 19:18:08', '2024-11-23 19:18:08'),
(2467, 1977, 'monday', '09:00:00', '10:00:00', 0, '2024-11-24 12:14:39', '2024-11-24 12:14:39'),
(2468, 1977, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-24 12:14:39', '2024-11-24 12:14:39'),
(2469, 1977, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-24 12:14:39', '2024-11-24 12:14:39'),
(2470, 1977, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-24 12:14:39', '2024-11-24 12:14:39'),
(2471, 1977, 'friday', '09:00:00', '10:00:00', 0, '2024-11-24 12:14:39', '2024-11-24 12:14:39'),
(2472, 1977, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-24 12:14:39', '2024-11-24 12:14:39'),
(2473, 1977, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-24 12:14:39', '2024-11-24 12:14:39'),
(2474, 1981, 'monday', '09:00:00', '10:00:00', 0, '2024-11-25 02:31:46', '2024-11-25 02:31:46'),
(2475, 1981, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-25 02:31:46', '2024-11-25 02:31:46'),
(2476, 1981, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-25 02:31:46', '2024-11-25 02:31:46'),
(2477, 1981, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-25 02:31:46', '2024-11-25 02:31:46'),
(2478, 1981, 'friday', '09:00:00', '10:00:00', 0, '2024-11-25 02:31:46', '2024-11-25 02:31:46'),
(2479, 1981, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-25 02:31:46', '2024-11-25 02:31:46'),
(2480, 1981, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-25 02:31:46', '2024-11-25 02:31:46'),
(2481, 1982, 'monday', '09:00:00', '10:00:00', 0, '2024-11-25 10:31:30', '2024-11-25 10:31:30'),
(2482, 1982, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-25 10:31:30', '2024-11-25 10:31:30'),
(2483, 1982, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-25 10:31:30', '2024-11-25 10:31:30'),
(2484, 1982, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-25 10:31:30', '2024-11-25 10:31:30'),
(2485, 1982, 'friday', '09:00:00', '10:00:00', 0, '2024-11-25 10:31:30', '2024-11-25 10:31:30'),
(2486, 1982, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-25 10:31:30', '2024-11-25 10:31:30'),
(2487, 1982, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-25 10:31:30', '2024-11-25 10:31:30'),
(2488, 1988, 'monday', '09:00:00', '10:00:00', 0, '2024-11-27 04:40:56', '2024-11-27 04:40:56'),
(2489, 1988, 'tuesday', '09:00:00', '10:00:00', 0, '2024-11-27 04:40:56', '2024-11-27 04:40:56'),
(2490, 1988, 'wednesday', '09:00:00', '10:00:00', 0, '2024-11-27 04:40:56', '2024-11-27 04:40:56'),
(2491, 1988, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-27 04:40:56', '2024-11-27 04:40:56'),
(2492, 1988, 'friday', '09:00:00', '10:00:00', 0, '2024-11-27 04:40:56', '2024-11-27 04:40:56'),
(2493, 1988, 'saturday', '09:00:00', '10:00:00', 0, '2024-11-27 04:40:56', '2024-11-27 04:40:56'),
(2494, 1988, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-27 04:40:56', '2024-11-27 04:40:56'),
(2495, 1994, 'monday', '09:00:00', '10:00:00', 1, '2024-11-30 18:26:43', '2024-11-30 18:26:43'),
(2496, 1994, 'tuesday', '09:00:00', '10:00:00', 1, '2024-11-30 18:26:43', '2024-11-30 18:26:43'),
(2497, 1994, 'wednesday', '09:00:00', '10:00:00', 1, '2024-11-30 18:26:43', '2024-11-30 18:26:43'),
(2498, 1994, 'thursday', '09:00:00', '10:00:00', 0, '2024-11-30 18:26:43', '2024-11-30 18:26:43'),
(2499, 1994, 'friday', '09:00:00', '10:00:00', 1, '2024-11-30 18:26:43', '2024-11-30 18:26:43'),
(2500, 1994, 'saturday', '09:00:00', '10:00:00', 1, '2024-11-30 18:26:43', '2024-11-30 18:26:43'),
(2501, 1994, 'sunday', '09:00:00', '10:00:00', 0, '2024-11-30 18:26:43', '2024-11-30 18:26:43'),
(2509, 2011, 'monday', '09:00:00', '10:00:00', 0, '2024-12-05 11:17:09', '2024-12-05 11:17:09'),
(2510, 2011, 'tuesday', '09:00:00', '10:00:00', 0, '2024-12-05 11:17:09', '2024-12-05 11:17:09'),
(2511, 2011, 'wednesday', '09:00:00', '10:00:00', 0, '2024-12-05 11:17:09', '2024-12-05 11:17:09'),
(2512, 2011, 'thursday', '09:00:00', '10:00:00', 0, '2024-12-05 11:17:09', '2024-12-05 11:17:09'),
(2513, 2011, 'friday', '09:00:00', '10:00:00', 0, '2024-12-05 11:17:09', '2024-12-05 11:17:09'),
(2514, 2011, 'saturday', '09:00:00', '10:00:00', 0, '2024-12-05 11:17:09', '2024-12-05 11:17:09'),
(2515, 2011, 'sunday', '09:00:00', '10:00:00', 0, '2024-12-05 11:17:09', '2024-12-05 11:17:09'),
(2516, 2013, 'monday', '09:00:00', '10:00:00', 0, '2024-12-06 14:57:28', '2024-12-06 14:57:28'),
(2517, 2013, 'tuesday', '09:00:00', '10:00:00', 0, '2024-12-06 14:57:28', '2024-12-06 14:57:28'),
(2518, 2013, 'wednesday', '09:00:00', '10:00:00', 0, '2024-12-06 14:57:28', '2024-12-06 14:57:28'),
(2519, 2013, 'thursday', '09:00:00', '10:00:00', 0, '2024-12-06 14:57:28', '2024-12-06 14:57:28'),
(2520, 2013, 'friday', '09:00:00', '10:00:00', 0, '2024-12-06 14:57:28', '2024-12-06 14:57:28'),
(2521, 2013, 'saturday', '09:00:00', '10:00:00', 0, '2024-12-06 14:57:28', '2024-12-06 14:57:28'),
(2522, 2013, 'sunday', '09:00:00', '10:00:00', 0, '2024-12-06 14:57:28', '2024-12-06 14:57:28'),
(2523, 2015, 'monday', '09:00:00', '10:00:00', 0, '2024-12-06 18:21:01', '2024-12-06 18:21:01'),
(2524, 2015, 'tuesday', '09:00:00', '10:00:00', 0, '2024-12-06 18:21:01', '2024-12-06 18:21:01'),
(2525, 2015, 'wednesday', '09:00:00', '10:00:00', 0, '2024-12-06 18:21:01', '2024-12-06 18:21:01'),
(2526, 2015, 'thursday', '09:00:00', '10:00:00', 0, '2024-12-06 18:21:01', '2024-12-06 18:21:01'),
(2527, 2015, 'friday', '09:00:00', '10:00:00', 0, '2024-12-06 18:21:01', '2024-12-06 18:21:01'),
(2528, 2015, 'saturday', '09:00:00', '10:00:00', 0, '2024-12-06 18:21:01', '2024-12-06 18:21:01'),
(2529, 2015, 'sunday', '09:00:00', '10:00:00', 0, '2024-12-06 18:21:01', '2024-12-06 18:21:01'),
(2530, 2017, 'monday', '09:00:00', '10:00:00', 0, '2024-12-08 03:39:05', '2024-12-08 03:39:05'),
(2531, 2017, 'tuesday', '09:00:00', '10:00:00', 0, '2024-12-08 03:39:05', '2024-12-08 03:39:05'),
(2532, 2017, 'wednesday', '09:00:00', '10:00:00', 0, '2024-12-08 03:39:05', '2024-12-08 03:39:05'),
(2533, 2017, 'thursday', '09:00:00', '10:00:00', 0, '2024-12-08 03:39:05', '2024-12-08 03:39:05'),
(2534, 2017, 'friday', '09:00:00', '10:00:00', 0, '2024-12-08 03:39:05', '2024-12-08 03:39:05'),
(2535, 2017, 'saturday', '09:00:00', '10:00:00', 0, '2024-12-08 03:39:05', '2024-12-08 03:39:05'),
(2536, 2017, 'sunday', '09:00:00', '10:00:00', 0, '2024-12-08 03:39:05', '2024-12-08 03:39:05'),
(2537, 2027, 'monday', '09:00:00', '10:00:00', 0, '2024-12-12 08:36:00', '2024-12-12 08:36:00'),
(2538, 2027, 'tuesday', '09:00:00', '10:00:00', 0, '2024-12-12 08:36:00', '2024-12-12 08:36:00'),
(2539, 2027, 'wednesday', '09:00:00', '10:00:00', 0, '2024-12-12 08:36:00', '2024-12-12 08:36:00'),
(2540, 2027, 'thursday', '09:00:00', '10:00:00', 0, '2024-12-12 08:36:00', '2024-12-12 08:36:00'),
(2541, 2027, 'friday', '09:00:00', '10:00:00', 0, '2024-12-12 08:36:00', '2024-12-12 08:36:00'),
(2542, 2027, 'saturday', '09:00:00', '10:00:00', 0, '2024-12-12 08:36:00', '2024-12-12 08:36:00'),
(2543, 2027, 'sunday', '09:00:00', '10:00:00', 0, '2024-12-12 08:36:00', '2024-12-12 08:36:00'),
(2544, 2028, 'monday', '09:00:00', '10:00:00', 0, '2024-12-12 19:44:46', '2024-12-12 19:44:46'),
(2545, 2028, 'tuesday', '09:00:00', '10:00:00', 0, '2024-12-12 19:44:46', '2024-12-12 19:44:46'),
(2546, 2028, 'wednesday', '09:00:00', '10:00:00', 0, '2024-12-12 19:44:46', '2024-12-12 19:44:46'),
(2547, 2028, 'thursday', '09:00:00', '10:00:00', 0, '2024-12-12 19:44:46', '2024-12-12 19:44:46'),
(2548, 2028, 'friday', '09:00:00', '10:00:00', 0, '2024-12-12 19:44:46', '2024-12-12 19:44:46'),
(2549, 2028, 'saturday', '09:00:00', '10:00:00', 0, '2024-12-12 19:44:46', '2024-12-12 19:44:46'),
(2550, 2028, 'sunday', '09:00:00', '10:00:00', 0, '2024-12-12 19:44:46', '2024-12-12 19:44:46'),
(2551, 2033, 'monday', '09:00:00', '10:00:00', 0, '2024-12-15 08:15:49', '2024-12-15 08:15:49'),
(2552, 2033, 'tuesday', '09:00:00', '10:00:00', 0, '2024-12-15 08:15:49', '2024-12-15 08:15:49'),
(2553, 2033, 'wednesday', '09:00:00', '10:00:00', 0, '2024-12-15 08:15:49', '2024-12-15 08:15:49'),
(2554, 2033, 'thursday', '09:00:00', '10:00:00', 0, '2024-12-15 08:15:49', '2024-12-15 08:15:49'),
(2555, 2033, 'friday', '09:00:00', '10:00:00', 0, '2024-12-15 08:15:49', '2024-12-15 08:15:49'),
(2556, 2033, 'saturday', '09:00:00', '10:00:00', 0, '2024-12-15 08:15:49', '2024-12-15 08:15:49'),
(2557, 2033, 'sunday', '09:00:00', '10:00:00', 0, '2024-12-15 08:15:49', '2024-12-15 08:15:49'),
(2558, 2046, 'monday', '09:00:00', '10:00:00', 0, '2024-12-20 09:02:38', '2024-12-20 09:02:38'),
(2559, 2046, 'tuesday', '09:00:00', '10:00:00', 0, '2024-12-20 09:02:38', '2024-12-20 09:02:38'),
(2560, 2046, 'wednesday', '09:00:00', '10:00:00', 0, '2024-12-20 09:02:38', '2024-12-20 09:02:38'),
(2561, 2046, 'thursday', '09:00:00', '10:00:00', 0, '2024-12-20 09:02:38', '2024-12-20 09:02:38'),
(2562, 2046, 'friday', '09:00:00', '10:00:00', 0, '2024-12-20 09:02:38', '2024-12-20 09:02:38'),
(2563, 2046, 'saturday', '09:00:00', '10:00:00', 0, '2024-12-20 09:02:38', '2024-12-20 09:02:38'),
(2564, 2046, 'sunday', '09:00:00', '10:00:00', 0, '2024-12-20 09:02:38', '2024-12-20 09:02:38'),
(2565, 2047, 'monday', '09:00:00', '18:00:00', 1, '2024-12-20 12:13:57', '2024-12-20 12:13:57'),
(2566, 2047, 'tuesday', '09:09:00', '18:00:00', 1, '2024-12-20 12:13:57', '2024-12-20 12:13:57'),
(2567, 2047, 'wednesday', '09:00:00', '18:00:00', 1, '2024-12-20 12:13:57', '2024-12-20 12:13:57'),
(2568, 2047, 'thursday', '09:00:00', '18:00:00', 1, '2024-12-20 12:13:57', '2024-12-20 12:13:57'),
(2569, 2047, 'friday', '09:00:00', '18:00:00', 1, '2024-12-20 12:13:57', '2024-12-20 12:13:57'),
(2570, 2047, 'saturday', '09:00:00', '18:00:00', 1, '2024-12-20 12:13:57', '2024-12-20 12:13:57'),
(2571, 2047, 'sunday', '09:00:00', '18:00:00', 1, '2024-12-20 12:13:57', '2024-12-20 12:13:57'),
(2572, 2051, 'monday', '09:00:00', '10:00:00', 0, '2024-12-23 12:11:06', '2024-12-23 12:11:06'),
(2573, 2051, 'tuesday', '09:00:00', '10:00:00', 0, '2024-12-23 12:11:06', '2024-12-23 12:11:06'),
(2574, 2051, 'wednesday', '09:00:00', '10:00:00', 0, '2024-12-23 12:11:06', '2024-12-23 12:11:06'),
(2575, 2051, 'thursday', '09:00:00', '10:00:00', 0, '2024-12-23 12:11:06', '2024-12-23 12:11:06'),
(2576, 2051, 'friday', '09:00:00', '10:00:00', 0, '2024-12-23 12:11:06', '2024-12-23 12:11:06'),
(2577, 2051, 'saturday', '09:00:00', '10:00:00', 0, '2024-12-23 12:11:06', '2024-12-23 12:11:06'),
(2578, 2051, 'sunday', '09:00:00', '10:00:00', 0, '2024-12-23 12:11:06', '2024-12-23 12:11:06'),
(2579, 2054, 'monday', '09:00:00', '10:00:00', 0, '2024-12-24 08:10:24', '2024-12-24 08:10:24'),
(2580, 2054, 'tuesday', '09:00:00', '10:00:00', 0, '2024-12-24 08:10:24', '2024-12-24 08:10:24'),
(2581, 2054, 'wednesday', '09:00:00', '10:00:00', 0, '2024-12-24 08:10:24', '2024-12-24 08:10:24'),
(2582, 2054, 'thursday', '09:00:00', '10:00:00', 0, '2024-12-24 08:10:24', '2024-12-24 08:10:24'),
(2583, 2054, 'friday', '09:00:00', '10:00:00', 0, '2024-12-24 08:10:24', '2024-12-24 08:10:24'),
(2584, 2054, 'saturday', '09:00:00', '10:00:00', 0, '2024-12-24 08:10:24', '2024-12-24 08:10:24'),
(2585, 2054, 'sunday', '09:00:00', '10:00:00', 0, '2024-12-24 08:10:24', '2024-12-24 08:10:24'),
(2586, 2056, 'monday', '09:00:00', '10:00:00', 0, '2024-12-24 09:23:39', '2024-12-24 09:23:39'),
(2587, 2056, 'tuesday', '09:00:00', '10:00:00', 0, '2024-12-24 09:23:39', '2024-12-24 09:23:39'),
(2588, 2056, 'wednesday', '09:00:00', '10:00:00', 0, '2024-12-24 09:23:39', '2024-12-24 09:23:39'),
(2589, 2056, 'thursday', '09:00:00', '10:00:00', 0, '2024-12-24 09:23:39', '2024-12-24 09:23:39'),
(2590, 2056, 'friday', '09:00:00', '10:00:00', 0, '2024-12-24 09:23:39', '2024-12-24 09:23:39'),
(2591, 2056, 'saturday', '09:00:00', '10:00:00', 0, '2024-12-24 09:23:39', '2024-12-24 09:23:39'),
(2592, 2056, 'sunday', '09:00:00', '10:00:00', 0, '2024-12-24 09:23:39', '2024-12-24 09:23:39'),
(2593, 2073, 'monday', '09:00:00', '10:00:00', 0, '2024-12-31 18:29:54', '2024-12-31 18:29:54'),
(2594, 2073, 'tuesday', '09:00:00', '10:00:00', 0, '2024-12-31 18:29:54', '2024-12-31 18:29:54'),
(2595, 2073, 'wednesday', '09:00:00', '10:00:00', 0, '2024-12-31 18:29:54', '2024-12-31 18:29:54'),
(2596, 2073, 'thursday', '09:00:00', '10:00:00', 0, '2024-12-31 18:29:54', '2024-12-31 18:29:54'),
(2597, 2073, 'friday', '09:00:00', '10:00:00', 0, '2024-12-31 18:29:54', '2024-12-31 18:29:54'),
(2598, 2073, 'saturday', '09:00:00', '10:00:00', 0, '2024-12-31 18:29:54', '2024-12-31 18:29:54'),
(2599, 2073, 'sunday', '09:00:00', '10:00:00', 0, '2024-12-31 18:29:54', '2024-12-31 18:29:54'),
(2600, 2082, 'monday', '09:00:00', '10:00:00', 0, '2025-01-04 21:40:00', '2025-01-04 21:40:00'),
(2601, 2082, 'tuesday', '09:00:00', '10:00:00', 0, '2025-01-04 21:40:00', '2025-01-04 21:40:00'),
(2602, 2082, 'wednesday', '09:00:00', '10:00:00', 0, '2025-01-04 21:40:00', '2025-01-04 21:40:00'),
(2603, 2082, 'thursday', '09:00:00', '10:00:00', 0, '2025-01-04 21:40:00', '2025-01-04 21:40:00'),
(2604, 2082, 'friday', '09:00:00', '10:00:00', 0, '2025-01-04 21:40:00', '2025-01-04 21:40:00'),
(2605, 2082, 'saturday', '09:00:00', '10:00:00', 0, '2025-01-04 21:40:00', '2025-01-04 21:40:00'),
(2606, 2082, 'sunday', '09:00:00', '10:00:00', 0, '2025-01-04 21:40:00', '2025-01-04 21:40:00'),
(2607, 2089, 'monday', '09:00:00', '10:00:00', 0, '2025-01-08 09:08:26', '2025-01-08 09:08:26'),
(2608, 2089, 'tuesday', '09:00:00', '10:00:00', 0, '2025-01-08 09:08:26', '2025-01-08 09:08:26'),
(2609, 2089, 'wednesday', '09:00:00', '10:00:00', 0, '2025-01-08 09:08:26', '2025-01-08 09:08:26'),
(2610, 2089, 'thursday', '09:00:00', '10:00:00', 0, '2025-01-08 09:08:26', '2025-01-08 09:08:26'),
(2611, 2089, 'friday', '09:00:00', '10:00:00', 0, '2025-01-08 09:08:26', '2025-01-08 09:08:26'),
(2612, 2089, 'saturday', '09:00:00', '10:00:00', 0, '2025-01-08 09:08:26', '2025-01-08 09:08:26'),
(2613, 2089, 'sunday', '09:00:00', '10:00:00', 0, '2025-01-08 09:08:26', '2025-01-08 09:08:26'),
(2614, 2093, 'monday', '09:00:00', '20:00:00', 1, '2025-01-09 15:53:12', '2025-01-09 15:53:12'),
(2615, 2093, 'tuesday', '09:00:00', '10:00:00', 1, '2025-01-09 15:53:12', '2025-01-09 15:53:12'),
(2616, 2093, 'wednesday', '09:00:00', '10:00:00', 1, '2025-01-09 15:53:12', '2025-01-09 15:53:12'),
(2617, 2093, 'thursday', '09:00:00', '10:00:00', 1, '2025-01-09 15:53:12', '2025-01-09 15:53:12'),
(2618, 2093, 'friday', '09:00:00', '10:00:00', 1, '2025-01-09 15:53:12', '2025-01-09 15:53:12'),
(2619, 2093, 'saturday', '09:00:00', '10:00:00', 1, '2025-01-09 15:53:12', '2025-01-09 15:53:12'),
(2620, 2093, 'sunday', '09:00:00', '10:00:00', 0, '2025-01-09 15:53:12', '2025-01-09 15:53:12'),
(2621, 2094, 'monday', '09:00:00', '10:00:00', 0, '2025-01-10 06:59:31', '2025-01-10 06:59:31'),
(2622, 2094, 'tuesday', '09:00:00', '10:00:00', 0, '2025-01-10 06:59:31', '2025-01-10 06:59:31');
INSERT INTO `partner_timings` (`id`, `partner_id`, `day`, `opening_time`, `closing_time`, `is_open`, `created_at`, `updated_at`) VALUES
(2623, 2094, 'wednesday', '09:00:00', '10:00:00', 0, '2025-01-10 06:59:31', '2025-01-10 06:59:31'),
(2624, 2094, 'thursday', '09:00:00', '10:00:00', 0, '2025-01-10 06:59:31', '2025-01-10 06:59:31'),
(2625, 2094, 'friday', '09:00:00', '10:00:00', 0, '2025-01-10 06:59:31', '2025-01-10 06:59:31'),
(2626, 2094, 'saturday', '09:00:00', '10:00:00', 0, '2025-01-10 06:59:31', '2025-01-10 06:59:31'),
(2627, 2094, 'sunday', '09:00:00', '10:00:00', 0, '2025-01-10 06:59:31', '2025-01-10 06:59:31'),
(2628, 2099, 'monday', '09:00:00', '10:00:00', 0, '2025-01-11 10:26:24', '2025-01-11 10:26:24'),
(2629, 2099, 'tuesday', '09:00:00', '10:00:00', 0, '2025-01-11 10:26:24', '2025-01-11 10:26:24'),
(2630, 2099, 'wednesday', '09:00:00', '10:00:00', 0, '2025-01-11 10:26:24', '2025-01-11 10:26:24'),
(2631, 2099, 'thursday', '09:00:00', '10:00:00', 0, '2025-01-11 10:26:24', '2025-01-11 10:26:24'),
(2632, 2099, 'friday', '09:00:00', '10:00:00', 0, '2025-01-11 10:26:24', '2025-01-11 10:26:24'),
(2633, 2099, 'saturday', '09:00:00', '10:00:00', 0, '2025-01-11 10:26:24', '2025-01-11 10:26:24'),
(2634, 2099, 'sunday', '09:00:00', '10:00:00', 0, '2025-01-11 10:26:24', '2025-01-11 10:26:24'),
(2635, 2106, 'monday', '09:00:00', '10:00:00', 0, '2025-01-17 02:01:36', '2025-01-17 02:01:36'),
(2636, 2106, 'tuesday', '09:00:00', '10:00:00', 0, '2025-01-17 02:01:36', '2025-01-17 02:01:36'),
(2637, 2106, 'wednesday', '09:00:00', '10:00:00', 0, '2025-01-17 02:01:36', '2025-01-17 02:01:36'),
(2638, 2106, 'thursday', '09:00:00', '10:00:00', 0, '2025-01-17 02:01:36', '2025-01-17 02:01:36'),
(2639, 2106, 'friday', '09:00:00', '10:00:00', 0, '2025-01-17 02:01:36', '2025-01-17 02:01:36'),
(2640, 2106, 'saturday', '09:00:00', '10:00:00', 0, '2025-01-17 02:01:36', '2025-01-17 02:01:36'),
(2641, 2106, 'sunday', '09:00:00', '10:00:00', 0, '2025-01-17 02:01:36', '2025-01-17 02:01:36'),
(2642, 2107, 'monday', '09:00:00', '10:00:00', 0, '2025-01-19 04:21:13', '2025-01-19 04:21:13'),
(2643, 2107, 'tuesday', '09:00:00', '10:00:00', 0, '2025-01-19 04:21:13', '2025-01-19 04:21:13'),
(2644, 2107, 'wednesday', '09:00:00', '10:00:00', 0, '2025-01-19 04:21:13', '2025-01-19 04:21:13'),
(2645, 2107, 'thursday', '09:00:00', '10:00:00', 0, '2025-01-19 04:21:13', '2025-01-19 04:21:13'),
(2646, 2107, 'friday', '09:00:00', '10:00:00', 0, '2025-01-19 04:21:13', '2025-01-19 04:21:13'),
(2647, 2107, 'saturday', '09:00:00', '10:00:00', 0, '2025-01-19 04:21:13', '2025-01-19 04:21:13'),
(2648, 2107, 'sunday', '09:00:00', '10:00:00', 0, '2025-01-19 04:21:13', '2025-01-19 04:21:13'),
(2649, 2109, 'monday', '09:00:00', '10:00:00', 0, '2025-01-19 13:15:34', '2025-01-19 13:15:34'),
(2650, 2109, 'tuesday', '09:00:00', '10:00:00', 0, '2025-01-19 13:15:34', '2025-01-19 13:15:34'),
(2651, 2109, 'wednesday', '09:00:00', '10:00:00', 0, '2025-01-19 13:15:34', '2025-01-19 13:15:34'),
(2652, 2109, 'thursday', '09:00:00', '10:00:00', 0, '2025-01-19 13:15:34', '2025-01-19 13:15:34'),
(2653, 2109, 'friday', '09:00:00', '10:00:00', 0, '2025-01-19 13:15:34', '2025-01-19 13:15:34'),
(2654, 2109, 'saturday', '09:00:00', '10:00:00', 0, '2025-01-19 13:15:34', '2025-01-19 13:15:34'),
(2655, 2109, 'sunday', '09:00:00', '10:00:00', 0, '2025-01-19 13:15:34', '2025-01-19 13:15:34'),
(2656, 2115, 'monday', '09:00:00', '10:00:00', 0, '2025-01-21 05:36:04', '2025-01-21 05:36:04'),
(2657, 2115, 'tuesday', '09:00:00', '10:00:00', 0, '2025-01-21 05:36:04', '2025-01-21 05:36:04'),
(2658, 2115, 'wednesday', '09:00:00', '10:00:00', 0, '2025-01-21 05:36:04', '2025-01-21 05:36:04'),
(2659, 2115, 'thursday', '09:00:00', '10:00:00', 0, '2025-01-21 05:36:04', '2025-01-21 05:36:04'),
(2660, 2115, 'friday', '09:00:00', '10:00:00', 0, '2025-01-21 05:36:04', '2025-01-21 05:36:04'),
(2661, 2115, 'saturday', '09:00:00', '10:00:00', 0, '2025-01-21 05:36:04', '2025-01-21 05:36:04'),
(2662, 2115, 'sunday', '09:00:00', '10:00:00', 0, '2025-01-21 05:36:04', '2025-01-21 05:36:04'),
(2663, 2126, 'monday', '00:00:00', '00:00:00', 1, '2025-01-28 12:19:00', '2025-01-28 12:19:00'),
(2664, 2126, 'tuesday', '00:00:00', '00:00:00', 1, '2025-01-28 12:19:00', '2025-01-28 12:19:00'),
(2665, 2126, 'wednesday', '00:00:00', '00:00:00', 1, '2025-01-28 12:19:00', '2025-01-28 12:19:00'),
(2666, 2126, 'thursday', '00:00:00', '00:00:00', 1, '2025-01-28 12:19:00', '2025-01-28 12:19:00'),
(2667, 2126, 'friday', '00:00:00', '00:00:00', 1, '2025-01-28 12:19:00', '2025-01-28 12:19:00'),
(2668, 2126, 'saturday', '00:00:00', '00:00:00', 0, '2025-01-28 12:19:00', '2025-01-28 12:19:00'),
(2669, 2126, 'sunday', '00:00:00', '00:00:00', 0, '2025-01-28 12:19:00', '2025-01-28 12:19:00'),
(2670, 2133, 'monday', '09:00:00', '10:00:00', 0, '2025-01-31 06:55:58', '2025-01-31 06:55:58'),
(2671, 2133, 'tuesday', '09:00:00', '10:00:00', 0, '2025-01-31 06:55:58', '2025-01-31 06:55:58'),
(2672, 2133, 'wednesday', '09:00:00', '10:00:00', 0, '2025-01-31 06:55:59', '2025-01-31 06:55:59'),
(2673, 2133, 'thursday', '09:00:00', '10:00:00', 0, '2025-01-31 06:55:59', '2025-01-31 06:55:59'),
(2674, 2133, 'friday', '09:00:00', '10:00:00', 0, '2025-01-31 06:55:59', '2025-01-31 06:55:59'),
(2675, 2133, 'saturday', '09:00:00', '10:00:00', 0, '2025-01-31 06:55:59', '2025-01-31 06:55:59'),
(2676, 2133, 'sunday', '09:00:00', '10:00:00', 0, '2025-01-31 06:55:59', '2025-01-31 06:55:59'),
(2677, 2146, 'monday', '09:00:00', '10:00:00', 0, '2025-02-08 11:13:46', '2025-02-08 11:13:46'),
(2678, 2146, 'tuesday', '09:00:00', '10:00:00', 0, '2025-02-08 11:13:46', '2025-02-08 11:13:46'),
(2679, 2146, 'wednesday', '09:00:00', '10:00:00', 0, '2025-02-08 11:13:46', '2025-02-08 11:13:46'),
(2680, 2146, 'thursday', '09:00:00', '10:00:00', 0, '2025-02-08 11:13:46', '2025-02-08 11:13:46'),
(2681, 2146, 'friday', '09:00:00', '10:00:00', 0, '2025-02-08 11:13:46', '2025-02-08 11:13:46'),
(2682, 2146, 'saturday', '09:00:00', '10:00:00', 0, '2025-02-08 11:13:46', '2025-02-08 11:13:46'),
(2683, 2146, 'sunday', '09:00:00', '10:00:00', 0, '2025-02-08 11:13:46', '2025-02-08 11:13:46'),
(2684, 2148, 'monday', '00:00:00', '00:00:00', 0, '2025-02-09 22:45:07', '2025-02-09 22:45:07'),
(2685, 2148, 'tuesday', '00:00:00', '00:00:00', 0, '2025-02-09 22:45:07', '2025-02-09 22:45:07'),
(2686, 2148, 'wednesday', '00:00:00', '00:00:00', 0, '2025-02-09 22:45:07', '2025-02-09 22:45:07'),
(2687, 2148, 'thursday', '00:00:00', '00:00:00', 0, '2025-02-09 22:45:07', '2025-02-09 22:45:07'),
(2688, 2148, 'friday', '00:00:00', '00:00:00', 0, '2025-02-09 22:45:07', '2025-02-09 22:45:07'),
(2689, 2148, 'saturday', '00:00:00', '00:00:00', 0, '2025-02-09 22:45:07', '2025-02-09 22:45:07'),
(2690, 2148, 'sunday', '00:00:00', '00:00:00', 0, '2025-02-09 22:45:07', '2025-02-09 22:45:07'),
(2691, 2157, 'monday', '09:00:00', '10:00:00', 0, '2025-02-10 22:38:39', '2025-02-10 22:38:39'),
(2692, 2157, 'tuesday', '09:00:00', '10:00:00', 0, '2025-02-10 22:38:39', '2025-02-10 22:38:39'),
(2693, 2157, 'wednesday', '09:00:00', '10:00:00', 0, '2025-02-10 22:38:39', '2025-02-10 22:38:39'),
(2694, 2157, 'thursday', '09:00:00', '10:00:00', 0, '2025-02-10 22:38:39', '2025-02-10 22:38:39'),
(2695, 2157, 'friday', '09:00:00', '10:00:00', 0, '2025-02-10 22:38:39', '2025-02-10 22:38:39'),
(2696, 2157, 'saturday', '09:00:00', '10:00:00', 0, '2025-02-10 22:38:39', '2025-02-10 22:38:39'),
(2697, 2157, 'sunday', '09:00:00', '10:00:00', 0, '2025-02-10 22:38:39', '2025-02-10 22:38:39'),
(2698, 2163, 'monday', '09:00:00', '10:00:00', 0, '2025-02-11 14:44:57', '2025-02-11 14:44:57'),
(2699, 2163, 'tuesday', '09:00:00', '10:00:00', 0, '2025-02-11 14:44:57', '2025-02-11 14:44:57'),
(2700, 2163, 'wednesday', '09:00:00', '10:00:00', 0, '2025-02-11 14:44:57', '2025-02-11 14:44:57'),
(2701, 2163, 'thursday', '09:00:00', '10:00:00', 0, '2025-02-11 14:44:57', '2025-02-11 14:44:57'),
(2702, 2163, 'friday', '09:00:00', '10:00:00', 0, '2025-02-11 14:44:57', '2025-02-11 14:44:57'),
(2703, 2163, 'saturday', '09:00:00', '10:00:00', 0, '2025-02-11 14:44:57', '2025-02-11 14:44:57'),
(2704, 2163, 'sunday', '09:00:00', '10:00:00', 0, '2025-02-11 14:44:57', '2025-02-11 14:44:57'),
(2705, 2166, 'monday', '09:00:00', '10:00:00', 0, '2025-02-12 00:43:29', '2025-02-12 00:43:29'),
(2706, 2166, 'tuesday', '09:00:00', '10:00:00', 0, '2025-02-12 00:43:29', '2025-02-12 00:43:29'),
(2707, 2166, 'wednesday', '09:00:00', '10:00:00', 0, '2025-02-12 00:43:29', '2025-02-12 00:43:29'),
(2708, 2166, 'thursday', '09:00:00', '10:00:00', 0, '2025-02-12 00:43:29', '2025-02-12 00:43:29'),
(2709, 2166, 'friday', '09:00:00', '10:00:00', 0, '2025-02-12 00:43:29', '2025-02-12 00:43:29'),
(2710, 2166, 'saturday', '09:00:00', '10:00:00', 0, '2025-02-12 00:43:29', '2025-02-12 00:43:29'),
(2711, 2166, 'sunday', '09:00:00', '10:00:00', 0, '2025-02-12 00:43:29', '2025-02-12 00:43:29'),
(2712, 2176, 'monday', '09:00:00', '10:00:00', 0, '2025-02-14 16:02:05', '2025-02-14 16:02:05'),
(2713, 2176, 'tuesday', '09:00:00', '10:00:00', 0, '2025-02-14 16:02:05', '2025-02-14 16:02:05'),
(2714, 2176, 'wednesday', '09:00:00', '10:00:00', 0, '2025-02-14 16:02:05', '2025-02-14 16:02:05'),
(2715, 2176, 'thursday', '09:00:00', '10:00:00', 0, '2025-02-14 16:02:05', '2025-02-14 16:02:05'),
(2716, 2176, 'friday', '09:00:00', '10:00:00', 0, '2025-02-14 16:02:05', '2025-02-14 16:02:05'),
(2717, 2176, 'saturday', '09:00:00', '10:00:00', 0, '2025-02-14 16:02:05', '2025-02-14 16:02:05'),
(2718, 2176, 'sunday', '09:00:00', '10:00:00', 0, '2025-02-14 16:02:05', '2025-02-14 16:02:05'),
(2719, 2186, 'monday', '09:00:00', '10:00:00', 1, '2025-02-19 21:10:37', '2025-02-19 21:10:37'),
(2720, 2186, 'tuesday', '09:00:00', '10:00:00', 1, '2025-02-19 21:10:37', '2025-02-19 21:10:37'),
(2721, 2186, 'wednesday', '09:00:00', '10:00:00', 1, '2025-02-19 21:10:37', '2025-02-19 21:10:37'),
(2722, 2186, 'thursday', '09:00:00', '10:00:00', 1, '2025-02-19 21:10:37', '2025-02-19 21:10:37'),
(2723, 2186, 'friday', '09:00:00', '10:00:00', 1, '2025-02-19 21:10:37', '2025-02-19 21:10:37'),
(2724, 2186, 'saturday', '09:00:00', '10:00:00', 1, '2025-02-19 21:10:37', '2025-02-19 21:10:37'),
(2725, 2186, 'sunday', '09:00:00', '10:00:00', 1, '2025-02-19 21:10:37', '2025-02-19 21:10:37'),
(2726, 2192, 'monday', '09:00:00', '10:00:00', 0, '2025-02-22 11:10:33', '2025-02-22 11:10:33'),
(2727, 2192, 'tuesday', '09:00:00', '10:00:00', 0, '2025-02-22 11:10:33', '2025-02-22 11:10:33'),
(2728, 2192, 'wednesday', '09:00:00', '10:00:00', 0, '2025-02-22 11:10:33', '2025-02-22 11:10:33'),
(2729, 2192, 'thursday', '09:00:00', '10:00:00', 0, '2025-02-22 11:10:33', '2025-02-22 11:10:33'),
(2730, 2192, 'friday', '09:00:00', '10:00:00', 0, '2025-02-22 11:10:33', '2025-02-22 11:10:33'),
(2731, 2192, 'saturday', '09:00:00', '10:00:00', 0, '2025-02-22 11:10:33', '2025-02-22 11:10:33'),
(2732, 2192, 'sunday', '09:00:00', '10:00:00', 0, '2025-02-22 11:10:33', '2025-02-22 11:10:33'),
(2733, 2193, 'monday', '09:00:00', '10:00:00', 0, '2025-02-24 14:04:00', '2025-02-24 14:04:00'),
(2734, 2193, 'tuesday', '09:00:00', '10:00:00', 0, '2025-02-24 14:04:00', '2025-02-24 14:04:00'),
(2735, 2193, 'wednesday', '09:00:00', '10:00:00', 0, '2025-02-24 14:04:00', '2025-02-24 14:04:00'),
(2736, 2193, 'thursday', '09:00:00', '10:00:00', 0, '2025-02-24 14:04:00', '2025-02-24 14:04:00'),
(2737, 2193, 'friday', '09:00:00', '10:00:00', 0, '2025-02-24 14:04:00', '2025-02-24 14:04:00'),
(2738, 2193, 'saturday', '09:00:00', '10:00:00', 0, '2025-02-24 14:04:00', '2025-02-24 14:04:00'),
(2739, 2193, 'sunday', '09:00:00', '10:00:00', 0, '2025-02-24 14:04:00', '2025-02-24 14:04:00'),
(2740, 2196, 'monday', '09:00:00', '10:00:00', 0, '2025-02-25 08:57:46', '2025-02-25 08:57:46'),
(2741, 2196, 'tuesday', '09:00:00', '10:00:00', 0, '2025-02-25 08:57:46', '2025-02-25 08:57:46'),
(2742, 2196, 'wednesday', '09:00:00', '10:00:00', 0, '2025-02-25 08:57:46', '2025-02-25 08:57:46'),
(2743, 2196, 'thursday', '09:00:00', '10:00:00', 0, '2025-02-25 08:57:46', '2025-02-25 08:57:46'),
(2744, 2196, 'friday', '09:00:00', '10:00:00', 0, '2025-02-25 08:57:46', '2025-02-25 08:57:46'),
(2745, 2196, 'saturday', '09:00:00', '10:00:00', 0, '2025-02-25 08:57:46', '2025-02-25 08:57:46'),
(2746, 2196, 'sunday', '09:00:00', '10:00:00', 0, '2025-02-25 08:57:46', '2025-02-25 08:57:46'),
(2747, 2200, 'monday', '09:00:00', '10:00:00', 0, '2025-02-25 20:27:24', '2025-02-25 20:27:24'),
(2748, 2200, 'tuesday', '09:00:00', '10:00:00', 0, '2025-02-25 20:27:24', '2025-02-25 20:27:24'),
(2749, 2200, 'wednesday', '09:00:00', '10:00:00', 0, '2025-02-25 20:27:24', '2025-02-25 20:27:24'),
(2750, 2200, 'thursday', '09:00:00', '10:00:00', 0, '2025-02-25 20:27:24', '2025-02-25 20:27:24'),
(2751, 2200, 'friday', '09:00:00', '10:00:00', 0, '2025-02-25 20:27:24', '2025-02-25 20:27:24'),
(2752, 2200, 'saturday', '09:00:00', '10:00:00', 0, '2025-02-25 20:27:24', '2025-02-25 20:27:24'),
(2753, 2200, 'sunday', '09:00:00', '10:00:00', 0, '2025-02-25 20:27:24', '2025-02-25 20:27:24'),
(2754, 2206, 'monday', '09:00:00', '10:00:00', 0, '2025-02-27 19:45:01', '2025-02-27 19:45:01'),
(2755, 2206, 'tuesday', '09:00:00', '10:00:00', 0, '2025-02-27 19:45:01', '2025-02-27 19:45:01'),
(2756, 2206, 'wednesday', '09:00:00', '10:00:00', 0, '2025-02-27 19:45:01', '2025-02-27 19:45:01'),
(2757, 2206, 'thursday', '09:00:00', '10:00:00', 0, '2025-02-27 19:45:01', '2025-02-27 19:45:01'),
(2758, 2206, 'friday', '09:00:00', '10:00:00', 0, '2025-02-27 19:45:01', '2025-02-27 19:45:01'),
(2759, 2206, 'saturday', '09:00:00', '10:00:00', 0, '2025-02-27 19:45:01', '2025-02-27 19:45:01'),
(2760, 2206, 'sunday', '09:00:00', '10:00:00', 0, '2025-02-27 19:45:01', '2025-02-27 19:45:01'),
(2761, 2209, 'monday', '09:00:00', '10:00:00', 0, '2025-02-28 07:52:24', '2025-02-28 07:52:24'),
(2762, 2209, 'tuesday', '09:00:00', '10:00:00', 0, '2025-02-28 07:52:24', '2025-02-28 07:52:24'),
(2763, 2209, 'wednesday', '09:00:00', '10:00:00', 0, '2025-02-28 07:52:24', '2025-02-28 07:52:24'),
(2764, 2209, 'thursday', '09:00:00', '10:00:00', 0, '2025-02-28 07:52:24', '2025-02-28 07:52:24'),
(2765, 2209, 'friday', '09:00:00', '10:00:00', 0, '2025-02-28 07:52:24', '2025-02-28 07:52:24'),
(2766, 2209, 'saturday', '09:00:00', '10:00:00', 0, '2025-02-28 07:52:24', '2025-02-28 07:52:24'),
(2767, 2209, 'sunday', '09:00:00', '10:00:00', 0, '2025-02-28 07:52:24', '2025-02-28 07:52:24'),
(2768, 2213, 'monday', '09:00:00', '10:00:00', 0, '2025-03-02 17:54:31', '2025-03-02 17:54:31'),
(2769, 2213, 'tuesday', '09:00:00', '10:00:00', 0, '2025-03-02 17:54:31', '2025-03-02 17:54:31'),
(2770, 2213, 'wednesday', '09:00:00', '10:00:00', 0, '2025-03-02 17:54:31', '2025-03-02 17:54:31'),
(2771, 2213, 'thursday', '09:00:00', '10:00:00', 0, '2025-03-02 17:54:31', '2025-03-02 17:54:31'),
(2772, 2213, 'friday', '09:00:00', '10:00:00', 0, '2025-03-02 17:54:31', '2025-03-02 17:54:31'),
(2773, 2213, 'saturday', '09:00:00', '10:00:00', 0, '2025-03-02 17:54:31', '2025-03-02 17:54:31'),
(2774, 2213, 'sunday', '09:00:00', '10:00:00', 0, '2025-03-02 17:54:31', '2025-03-02 17:54:31'),
(2775, 2220, 'monday', '09:00:00', '10:00:00', 0, '2025-03-05 20:38:29', '2025-03-05 20:38:29'),
(2776, 2220, 'tuesday', '09:00:00', '10:00:00', 0, '2025-03-05 20:38:29', '2025-03-05 20:38:29'),
(2777, 2220, 'wednesday', '09:00:00', '10:00:00', 0, '2025-03-05 20:38:29', '2025-03-05 20:38:29'),
(2778, 2220, 'thursday', '09:00:00', '10:00:00', 0, '2025-03-05 20:38:29', '2025-03-05 20:38:29'),
(2779, 2220, 'friday', '09:00:00', '10:00:00', 0, '2025-03-05 20:38:29', '2025-03-05 20:38:29'),
(2780, 2220, 'saturday', '09:00:00', '10:00:00', 0, '2025-03-05 20:38:29', '2025-03-05 20:38:29'),
(2781, 2220, 'sunday', '09:00:00', '10:00:00', 0, '2025-03-05 20:38:29', '2025-03-05 20:38:29'),
(2782, 2223, 'monday', '09:00:00', '10:00:00', 0, '2025-03-08 15:04:29', '2025-03-08 15:04:29'),
(2783, 2223, 'tuesday', '09:00:00', '10:00:00', 0, '2025-03-08 15:04:29', '2025-03-08 15:04:29'),
(2784, 2223, 'wednesday', '09:00:00', '10:00:00', 0, '2025-03-08 15:04:29', '2025-03-08 15:04:29'),
(2785, 2223, 'thursday', '09:00:00', '10:00:00', 0, '2025-03-08 15:04:29', '2025-03-08 15:04:29'),
(2786, 2223, 'friday', '09:00:00', '10:00:00', 0, '2025-03-08 15:04:29', '2025-03-08 15:04:29'),
(2787, 2223, 'saturday', '09:00:00', '10:00:00', 0, '2025-03-08 15:04:29', '2025-03-08 15:04:29'),
(2788, 2223, 'sunday', '09:00:00', '10:00:00', 0, '2025-03-08 15:04:29', '2025-03-08 15:04:29'),
(2789, 2225, 'monday', '09:00:00', '10:00:00', 0, '2025-03-08 19:59:16', '2025-03-08 19:59:16'),
(2790, 2225, 'tuesday', '09:00:00', '10:00:00', 0, '2025-03-08 19:59:16', '2025-03-08 19:59:16'),
(2791, 2225, 'wednesday', '09:00:00', '10:00:00', 0, '2025-03-08 19:59:16', '2025-03-08 19:59:16'),
(2792, 2225, 'thursday', '09:00:00', '10:00:00', 0, '2025-03-08 19:59:16', '2025-03-08 19:59:16'),
(2793, 2225, 'friday', '09:00:00', '10:00:00', 0, '2025-03-08 19:59:16', '2025-03-08 19:59:16'),
(2794, 2225, 'saturday', '09:00:00', '10:00:00', 0, '2025-03-08 19:59:16', '2025-03-08 19:59:16'),
(2795, 2225, 'sunday', '09:00:00', '10:00:00', 0, '2025-03-08 19:59:16', '2025-03-08 19:59:16'),
(2796, 2234, 'monday', '09:00:00', '10:00:00', 0, '2025-03-11 06:59:22', '2025-03-11 06:59:22'),
(2797, 2234, 'tuesday', '09:00:00', '10:00:00', 0, '2025-03-11 06:59:22', '2025-03-11 06:59:22'),
(2798, 2234, 'wednesday', '09:00:00', '10:00:00', 0, '2025-03-11 06:59:22', '2025-03-11 06:59:22'),
(2799, 2234, 'thursday', '09:00:00', '10:00:00', 0, '2025-03-11 06:59:22', '2025-03-11 06:59:22'),
(2800, 2234, 'friday', '09:00:00', '10:00:00', 0, '2025-03-11 06:59:22', '2025-03-11 06:59:22'),
(2801, 2234, 'saturday', '09:00:00', '10:00:00', 0, '2025-03-11 06:59:22', '2025-03-11 06:59:22'),
(2802, 2234, 'sunday', '09:00:00', '10:00:00', 0, '2025-03-11 06:59:22', '2025-03-11 06:59:22'),
(2803, 2235, 'monday', '00:00:00', '00:00:00', 0, '2025-03-12 14:31:15', '2025-03-12 14:31:15'),
(2804, 2235, 'tuesday', '00:00:00', '00:00:00', 0, '2025-03-12 14:31:16', '2025-03-12 14:31:16'),
(2805, 2235, 'wednesday', '00:00:00', '00:00:00', 0, '2025-03-12 14:31:16', '2025-03-12 14:31:16'),
(2806, 2235, 'thursday', '00:00:00', '00:00:00', 0, '2025-03-12 14:31:16', '2025-03-12 14:31:16'),
(2807, 2235, 'friday', '00:00:00', '00:00:00', 0, '2025-03-12 14:31:16', '2025-03-12 14:31:16'),
(2808, 2235, 'saturday', '00:00:00', '00:00:00', 0, '2025-03-12 14:31:16', '2025-03-12 14:31:16'),
(2809, 2235, 'sunday', '00:00:00', '00:00:00', 0, '2025-03-12 14:31:16', '2025-03-12 14:31:16'),
(2810, 2237, 'monday', '09:00:00', '10:00:00', 0, '2025-03-13 18:47:39', '2025-03-13 18:47:39'),
(2811, 2237, 'tuesday', '09:00:00', '10:00:00', 0, '2025-03-13 18:47:39', '2025-03-13 18:47:39'),
(2812, 2237, 'wednesday', '09:00:00', '10:00:00', 0, '2025-03-13 18:47:39', '2025-03-13 18:47:39'),
(2813, 2237, 'thursday', '09:00:00', '10:00:00', 0, '2025-03-13 18:47:39', '2025-03-13 18:47:39'),
(2814, 2237, 'friday', '09:00:00', '10:00:00', 0, '2025-03-13 18:47:39', '2025-03-13 18:47:39'),
(2815, 2237, 'saturday', '09:00:00', '10:00:00', 0, '2025-03-13 18:47:39', '2025-03-13 18:47:39'),
(2816, 2237, 'sunday', '09:00:00', '10:00:00', 0, '2025-03-13 18:47:39', '2025-03-13 18:47:39'),
(2817, 2240, 'monday', '09:00:00', '10:00:00', 0, '2025-03-14 07:43:19', '2025-03-14 07:43:19'),
(2818, 2240, 'tuesday', '09:00:00', '10:00:00', 0, '2025-03-14 07:43:19', '2025-03-14 07:43:19'),
(2819, 2240, 'wednesday', '09:00:00', '10:00:00', 0, '2025-03-14 07:43:19', '2025-03-14 07:43:19'),
(2820, 2240, 'thursday', '09:00:00', '10:00:00', 0, '2025-03-14 07:43:19', '2025-03-14 07:43:19'),
(2821, 2240, 'friday', '09:00:00', '10:00:00', 0, '2025-03-14 07:43:19', '2025-03-14 07:43:19'),
(2822, 2240, 'saturday', '09:00:00', '10:00:00', 0, '2025-03-14 07:43:19', '2025-03-14 07:43:19'),
(2823, 2240, 'sunday', '09:00:00', '10:00:00', 0, '2025-03-14 07:43:19', '2025-03-14 07:43:19'),
(2824, 2248, 'monday', '09:00:00', '10:00:00', 0, '2025-03-19 04:51:27', '2025-03-19 04:51:27'),
(2825, 2248, 'tuesday', '09:00:00', '10:00:00', 0, '2025-03-19 04:51:27', '2025-03-19 04:51:27'),
(2826, 2248, 'wednesday', '09:00:00', '10:00:00', 0, '2025-03-19 04:51:27', '2025-03-19 04:51:27'),
(2827, 2248, 'thursday', '09:00:00', '10:00:00', 0, '2025-03-19 04:51:27', '2025-03-19 04:51:27'),
(2828, 2248, 'friday', '09:00:00', '10:00:00', 0, '2025-03-19 04:51:27', '2025-03-19 04:51:27'),
(2829, 2248, 'saturday', '09:00:00', '10:00:00', 0, '2025-03-19 04:51:27', '2025-03-19 04:51:27'),
(2830, 2248, 'sunday', '09:00:00', '10:00:00', 0, '2025-03-19 04:51:27', '2025-03-19 04:51:27'),
(2831, 2256, 'monday', '09:00:00', '10:00:00', 0, '2025-03-21 15:54:15', '2025-03-21 15:54:15'),
(2832, 2256, 'tuesday', '09:00:00', '10:00:00', 0, '2025-03-21 15:54:15', '2025-03-21 15:54:15'),
(2833, 2256, 'wednesday', '09:00:00', '10:00:00', 0, '2025-03-21 15:54:15', '2025-03-21 15:54:15'),
(2834, 2256, 'thursday', '09:00:00', '10:00:00', 0, '2025-03-21 15:54:15', '2025-03-21 15:54:15'),
(2835, 2256, 'friday', '09:00:00', '10:00:00', 0, '2025-03-21 15:54:15', '2025-03-21 15:54:15'),
(2836, 2256, 'saturday', '09:00:00', '10:00:00', 0, '2025-03-21 15:54:15', '2025-03-21 15:54:15'),
(2837, 2256, 'sunday', '09:00:00', '10:00:00', 0, '2025-03-21 15:54:15', '2025-03-21 15:54:15'),
(2838, 2260, 'monday', '09:00:00', '10:00:00', 0, '2025-03-23 19:50:08', '2025-03-23 19:50:08'),
(2839, 2260, 'tuesday', '09:00:00', '10:00:00', 0, '2025-03-23 19:50:08', '2025-03-23 19:50:08'),
(2840, 2260, 'wednesday', '09:00:00', '10:00:00', 0, '2025-03-23 19:50:08', '2025-03-23 19:50:08'),
(2841, 2260, 'thursday', '09:00:00', '10:00:00', 0, '2025-03-23 19:50:08', '2025-03-23 19:50:08'),
(2842, 2260, 'friday', '09:00:00', '10:00:00', 0, '2025-03-23 19:50:08', '2025-03-23 19:50:08'),
(2843, 2260, 'saturday', '09:00:00', '10:00:00', 0, '2025-03-23 19:50:08', '2025-03-23 19:50:08'),
(2844, 2260, 'sunday', '09:00:00', '10:00:00', 0, '2025-03-23 19:50:08', '2025-03-23 19:50:08'),
(2845, 2269, 'monday', '09:00:00', '10:00:00', 0, '2025-03-27 09:32:26', '2025-03-27 09:32:26'),
(2846, 2269, 'tuesday', '09:00:00', '10:00:00', 0, '2025-03-27 09:32:26', '2025-03-27 09:32:26'),
(2847, 2269, 'wednesday', '09:00:00', '10:00:00', 0, '2025-03-27 09:32:26', '2025-03-27 09:32:26'),
(2848, 2269, 'thursday', '09:00:00', '10:00:00', 0, '2025-03-27 09:32:26', '2025-03-27 09:32:26'),
(2849, 2269, 'friday', '09:00:00', '10:00:00', 0, '2025-03-27 09:32:26', '2025-03-27 09:32:26'),
(2850, 2269, 'saturday', '09:00:00', '10:00:00', 0, '2025-03-27 09:32:26', '2025-03-27 09:32:26'),
(2851, 2269, 'sunday', '09:00:00', '10:00:00', 0, '2025-03-27 09:32:26', '2025-03-27 09:32:26'),
(2852, 2272, 'monday', '09:00:00', '10:00:00', 0, '2025-03-28 05:46:41', '2025-03-28 05:46:41'),
(2853, 2272, 'tuesday', '09:00:00', '10:00:00', 0, '2025-03-28 05:46:41', '2025-03-28 05:46:41'),
(2854, 2272, 'wednesday', '09:00:00', '10:00:00', 0, '2025-03-28 05:46:41', '2025-03-28 05:46:41'),
(2855, 2272, 'thursday', '09:00:00', '10:00:00', 0, '2025-03-28 05:46:41', '2025-03-28 05:46:41'),
(2856, 2272, 'friday', '09:00:00', '10:00:00', 0, '2025-03-28 05:46:41', '2025-03-28 05:46:41'),
(2857, 2272, 'saturday', '09:00:00', '10:00:00', 0, '2025-03-28 05:46:41', '2025-03-28 05:46:41'),
(2858, 2272, 'sunday', '09:00:00', '10:00:00', 0, '2025-03-28 05:46:41', '2025-03-28 05:46:41'),
(2859, 2276, 'monday', '09:00:00', '10:00:00', 0, '2025-03-29 06:24:23', '2025-03-29 06:24:23'),
(2860, 2276, 'tuesday', '09:00:00', '10:00:00', 0, '2025-03-29 06:24:23', '2025-03-29 06:24:23'),
(2861, 2276, 'wednesday', '09:00:00', '10:00:00', 0, '2025-03-29 06:24:23', '2025-03-29 06:24:23'),
(2862, 2276, 'thursday', '09:00:00', '10:00:00', 0, '2025-03-29 06:24:23', '2025-03-29 06:24:23'),
(2863, 2276, 'friday', '09:00:00', '10:00:00', 0, '2025-03-29 06:24:23', '2025-03-29 06:24:23'),
(2864, 2276, 'saturday', '09:00:00', '10:00:00', 0, '2025-03-29 06:24:23', '2025-03-29 06:24:23'),
(2865, 2276, 'sunday', '09:00:00', '10:00:00', 0, '2025-03-29 06:24:23', '2025-03-29 06:24:23'),
(2866, 2277, 'monday', '09:00:00', '10:00:00', 0, '2025-03-30 04:30:03', '2025-03-30 04:30:03'),
(2867, 2277, 'tuesday', '09:00:00', '10:00:00', 0, '2025-03-30 04:30:04', '2025-03-30 04:30:04'),
(2868, 2277, 'wednesday', '09:00:00', '10:00:00', 0, '2025-03-30 04:30:04', '2025-03-30 04:30:04'),
(2869, 2277, 'thursday', '09:00:00', '10:00:00', 0, '2025-03-30 04:30:04', '2025-03-30 04:30:04'),
(2870, 2277, 'friday', '09:00:00', '10:00:00', 0, '2025-03-30 04:30:04', '2025-03-30 04:30:04'),
(2871, 2277, 'saturday', '09:00:00', '10:00:00', 0, '2025-03-30 04:30:04', '2025-03-30 04:30:04'),
(2872, 2277, 'sunday', '09:00:00', '10:00:00', 0, '2025-03-30 04:30:04', '2025-03-30 04:30:04'),
(2873, 2278, 'monday', '09:00:00', '10:00:00', 0, '2025-03-30 07:15:04', '2025-03-30 07:15:04'),
(2874, 2278, 'tuesday', '09:00:00', '10:00:00', 0, '2025-03-30 07:15:04', '2025-03-30 07:15:04'),
(2875, 2278, 'wednesday', '09:00:00', '10:00:00', 0, '2025-03-30 07:15:04', '2025-03-30 07:15:04'),
(2876, 2278, 'thursday', '09:00:00', '10:00:00', 0, '2025-03-30 07:15:04', '2025-03-30 07:15:04'),
(2877, 2278, 'friday', '09:00:00', '10:00:00', 0, '2025-03-30 07:15:04', '2025-03-30 07:15:04'),
(2878, 2278, 'saturday', '09:00:00', '10:00:00', 0, '2025-03-30 07:15:04', '2025-03-30 07:15:04'),
(2879, 2278, 'sunday', '09:00:00', '10:00:00', 0, '2025-03-30 07:15:04', '2025-03-30 07:15:04'),
(2880, 2293, 'monday', '09:00:00', '10:00:00', 0, '2025-04-04 13:40:13', '2025-04-04 13:40:13'),
(2881, 2293, 'tuesday', '09:00:00', '10:00:00', 0, '2025-04-04 13:40:13', '2025-04-04 13:40:13'),
(2882, 2293, 'wednesday', '09:00:00', '10:00:00', 0, '2025-04-04 13:40:13', '2025-04-04 13:40:13'),
(2883, 2293, 'thursday', '09:00:00', '10:00:00', 0, '2025-04-04 13:40:13', '2025-04-04 13:40:13'),
(2884, 2293, 'friday', '09:00:00', '10:00:00', 0, '2025-04-04 13:40:13', '2025-04-04 13:40:13'),
(2885, 2293, 'saturday', '09:00:00', '10:00:00', 0, '2025-04-04 13:40:13', '2025-04-04 13:40:13'),
(2886, 2293, 'sunday', '09:00:00', '10:00:00', 0, '2025-04-04 13:40:14', '2025-04-04 13:40:14'),
(2887, 2294, 'monday', '09:00:00', '10:00:00', 0, '2025-04-05 06:30:20', '2025-04-05 06:30:20'),
(2888, 2294, 'tuesday', '09:00:00', '10:00:00', 0, '2025-04-05 06:30:20', '2025-04-05 06:30:20'),
(2889, 2294, 'wednesday', '09:00:00', '10:00:00', 0, '2025-04-05 06:30:20', '2025-04-05 06:30:20'),
(2890, 2294, 'thursday', '09:00:00', '10:00:00', 0, '2025-04-05 06:30:20', '2025-04-05 06:30:20'),
(2891, 2294, 'friday', '09:00:00', '10:00:00', 0, '2025-04-05 06:30:20', '2025-04-05 06:30:20'),
(2892, 2294, 'saturday', '09:00:00', '10:00:00', 0, '2025-04-05 06:30:20', '2025-04-05 06:30:20'),
(2893, 2294, 'sunday', '09:00:00', '10:00:00', 0, '2025-04-05 06:30:20', '2025-04-05 06:30:20'),
(2894, 2300, 'monday', '09:00:00', '10:00:00', 0, '2025-04-07 05:26:20', '2025-04-07 05:26:20'),
(2895, 2300, 'tuesday', '09:00:00', '10:00:00', 0, '2025-04-07 05:26:21', '2025-04-07 05:26:21'),
(2896, 2300, 'wednesday', '09:00:00', '10:00:00', 0, '2025-04-07 05:26:21', '2025-04-07 05:26:21'),
(2897, 2300, 'thursday', '09:00:00', '10:00:00', 0, '2025-04-07 05:26:21', '2025-04-07 05:26:21'),
(2898, 2300, 'friday', '09:00:00', '10:00:00', 0, '2025-04-07 05:26:21', '2025-04-07 05:26:21'),
(2899, 2300, 'saturday', '09:00:00', '10:00:00', 0, '2025-04-07 05:26:21', '2025-04-07 05:26:21'),
(2900, 2300, 'sunday', '09:00:00', '10:00:00', 0, '2025-04-07 05:26:21', '2025-04-07 05:26:21'),
(2901, 2303, 'monday', '09:00:00', '10:00:00', 0, '2025-04-07 15:57:21', '2025-04-07 15:57:21'),
(2902, 2303, 'tuesday', '09:00:00', '10:00:00', 0, '2025-04-07 15:57:21', '2025-04-07 15:57:21'),
(2903, 2303, 'wednesday', '09:00:00', '10:00:00', 0, '2025-04-07 15:57:21', '2025-04-07 15:57:21'),
(2904, 2303, 'thursday', '09:00:00', '10:00:00', 0, '2025-04-07 15:57:21', '2025-04-07 15:57:21'),
(2905, 2303, 'friday', '09:00:00', '10:00:00', 0, '2025-04-07 15:57:21', '2025-04-07 15:57:21'),
(2906, 2303, 'saturday', '09:00:00', '10:00:00', 0, '2025-04-07 15:57:21', '2025-04-07 15:57:21'),
(2907, 2303, 'sunday', '09:00:00', '10:00:00', 0, '2025-04-07 15:57:21', '2025-04-07 15:57:21'),
(2908, 2305, 'monday', '09:00:00', '10:00:00', 0, '2025-04-07 23:01:49', '2025-04-07 23:01:49'),
(2909, 2305, 'tuesday', '09:00:00', '10:00:00', 0, '2025-04-07 23:01:49', '2025-04-07 23:01:49'),
(2910, 2305, 'wednesday', '09:00:00', '10:00:00', 0, '2025-04-07 23:01:49', '2025-04-07 23:01:49'),
(2911, 2305, 'thursday', '09:00:00', '10:00:00', 0, '2025-04-07 23:01:49', '2025-04-07 23:01:49'),
(2912, 2305, 'friday', '09:00:00', '10:00:00', 0, '2025-04-07 23:01:49', '2025-04-07 23:01:49'),
(2913, 2305, 'saturday', '09:00:00', '10:00:00', 0, '2025-04-07 23:01:49', '2025-04-07 23:01:49'),
(2914, 2305, 'sunday', '09:00:00', '10:00:00', 0, '2025-04-07 23:01:49', '2025-04-07 23:01:49'),
(2915, 2306, 'monday', '09:00:00', '10:00:00', 0, '2025-04-07 23:47:58', '2025-04-07 23:47:58'),
(2916, 2306, 'tuesday', '09:00:00', '10:00:00', 0, '2025-04-07 23:47:58', '2025-04-07 23:47:58'),
(2917, 2306, 'wednesday', '09:00:00', '10:00:00', 0, '2025-04-07 23:47:58', '2025-04-07 23:47:58'),
(2918, 2306, 'thursday', '09:00:00', '10:00:00', 0, '2025-04-07 23:47:58', '2025-04-07 23:47:58'),
(2919, 2306, 'friday', '09:00:00', '10:00:00', 0, '2025-04-07 23:47:58', '2025-04-07 23:47:58'),
(2920, 2306, 'saturday', '09:00:00', '10:00:00', 0, '2025-04-07 23:47:58', '2025-04-07 23:47:58'),
(2921, 2306, 'sunday', '09:00:00', '10:00:00', 0, '2025-04-07 23:47:58', '2025-04-07 23:47:58'),
(2922, 2307, 'monday', '09:00:00', '10:00:00', 0, '2025-04-08 06:31:58', '2025-04-08 06:31:58'),
(2923, 2307, 'tuesday', '09:00:00', '10:00:00', 0, '2025-04-08 06:31:58', '2025-04-08 06:31:58'),
(2924, 2307, 'wednesday', '09:00:00', '10:00:00', 0, '2025-04-08 06:31:58', '2025-04-08 06:31:58'),
(2925, 2307, 'thursday', '09:00:00', '10:00:00', 0, '2025-04-08 06:31:58', '2025-04-08 06:31:58'),
(2926, 2307, 'friday', '09:00:00', '10:00:00', 0, '2025-04-08 06:31:58', '2025-04-08 06:31:58'),
(2927, 2307, 'saturday', '09:00:00', '10:00:00', 0, '2025-04-08 06:31:58', '2025-04-08 06:31:58'),
(2928, 2307, 'sunday', '09:00:00', '10:00:00', 0, '2025-04-08 06:31:58', '2025-04-08 06:31:58'),
(2929, 2308, 'monday', '09:00:00', '10:00:00', 0, '2025-04-08 06:51:45', '2025-04-08 06:51:45'),
(2930, 2308, 'tuesday', '09:00:00', '10:00:00', 0, '2025-04-08 06:51:45', '2025-04-08 06:51:45'),
(2931, 2308, 'wednesday', '09:00:00', '10:00:00', 0, '2025-04-08 06:51:45', '2025-04-08 06:51:45'),
(2932, 2308, 'thursday', '09:00:00', '10:00:00', 0, '2025-04-08 06:51:45', '2025-04-08 06:51:45'),
(2933, 2308, 'friday', '09:00:00', '10:00:00', 0, '2025-04-08 06:51:45', '2025-04-08 06:51:45'),
(2934, 2308, 'saturday', '09:00:00', '10:00:00', 0, '2025-04-08 06:51:45', '2025-04-08 06:51:45'),
(2935, 2308, 'sunday', '09:00:00', '10:00:00', 0, '2025-04-08 06:51:45', '2025-04-08 06:51:45'),
(2936, 2311, 'monday', '00:00:00', '00:00:00', 0, '2025-04-09 01:24:10', '2025-04-09 01:24:10'),
(2937, 2311, 'tuesday', '00:00:00', '00:00:00', 0, '2025-04-09 01:24:10', '2025-04-09 01:24:10'),
(2938, 2311, 'wednesday', '00:00:00', '00:00:00', 0, '2025-04-09 01:24:10', '2025-04-09 01:24:10'),
(2939, 2311, 'thursday', '00:00:00', '00:00:00', 0, '2025-04-09 01:24:10', '2025-04-09 01:24:10'),
(2940, 2311, 'friday', '00:00:00', '00:00:00', 0, '2025-04-09 01:24:10', '2025-04-09 01:24:10'),
(2941, 2311, 'saturday', '00:00:00', '00:00:00', 0, '2025-04-09 01:24:10', '2025-04-09 01:24:10'),
(2942, 2311, 'sunday', '00:00:00', '00:00:00', 0, '2025-04-09 01:24:10', '2025-04-09 01:24:10'),
(2943, 2313, 'monday', '09:00:00', '10:00:00', 0, '2025-04-09 18:46:00', '2025-04-09 18:46:00'),
(2944, 2313, 'tuesday', '09:00:00', '10:00:00', 0, '2025-04-09 18:46:00', '2025-04-09 18:46:00'),
(2945, 2313, 'wednesday', '09:00:00', '10:00:00', 0, '2025-04-09 18:46:00', '2025-04-09 18:46:00'),
(2946, 2313, 'thursday', '09:00:00', '10:00:00', 0, '2025-04-09 18:46:01', '2025-04-09 18:46:01'),
(2947, 2313, 'friday', '09:00:00', '10:00:00', 0, '2025-04-09 18:46:01', '2025-04-09 18:46:01'),
(2948, 2313, 'saturday', '09:00:00', '10:00:00', 0, '2025-04-09 18:46:01', '2025-04-09 18:46:01'),
(2949, 2313, 'sunday', '09:00:00', '10:00:00', 0, '2025-04-09 18:46:01', '2025-04-09 18:46:01'),
(2950, 2316, 'monday', '09:00:00', '10:00:00', 0, '2025-04-10 17:52:38', '2025-04-10 17:52:38'),
(2951, 2316, 'tuesday', '09:00:00', '10:00:00', 0, '2025-04-10 17:52:38', '2025-04-10 17:52:38'),
(2952, 2316, 'wednesday', '09:00:00', '10:00:00', 0, '2025-04-10 17:52:38', '2025-04-10 17:52:38'),
(2953, 2316, 'thursday', '09:00:00', '10:00:00', 0, '2025-04-10 17:52:38', '2025-04-10 17:52:38'),
(2954, 2316, 'friday', '09:00:00', '10:00:00', 0, '2025-04-10 17:52:38', '2025-04-10 17:52:38'),
(2955, 2316, 'saturday', '09:00:00', '10:00:00', 0, '2025-04-10 17:52:38', '2025-04-10 17:52:38'),
(2956, 2316, 'sunday', '09:00:00', '10:00:00', 0, '2025-04-10 17:52:38', '2025-04-10 17:52:38'),
(2957, 2330, 'monday', '09:00:00', '10:00:00', 0, '2025-04-15 03:53:22', '2025-04-15 03:53:22'),
(2958, 2330, 'tuesday', '09:00:00', '10:00:00', 0, '2025-04-15 03:53:22', '2025-04-15 03:53:22'),
(2959, 2330, 'wednesday', '09:00:00', '10:00:00', 0, '2025-04-15 03:53:22', '2025-04-15 03:53:22'),
(2960, 2330, 'thursday', '09:00:00', '10:00:00', 0, '2025-04-15 03:53:22', '2025-04-15 03:53:22'),
(2961, 2330, 'friday', '09:00:00', '10:00:00', 0, '2025-04-15 03:53:22', '2025-04-15 03:53:22'),
(2962, 2330, 'saturday', '09:00:00', '10:00:00', 0, '2025-04-15 03:53:22', '2025-04-15 03:53:22'),
(2963, 2330, 'sunday', '09:00:00', '10:00:00', 0, '2025-04-15 03:53:22', '2025-04-15 03:53:22'),
(2964, 2333, 'monday', '09:00:00', '10:00:00', 0, '2025-04-17 08:53:24', '2025-04-17 08:53:24'),
(2965, 2333, 'tuesday', '09:00:00', '10:00:00', 0, '2025-04-17 08:53:24', '2025-04-17 08:53:24'),
(2966, 2333, 'wednesday', '09:00:00', '10:00:00', 0, '2025-04-17 08:53:24', '2025-04-17 08:53:24'),
(2967, 2333, 'thursday', '09:00:00', '10:00:00', 0, '2025-04-17 08:53:24', '2025-04-17 08:53:24'),
(2968, 2333, 'friday', '09:00:00', '10:00:00', 0, '2025-04-17 08:53:24', '2025-04-17 08:53:24'),
(2969, 2333, 'saturday', '09:00:00', '10:00:00', 0, '2025-04-17 08:53:24', '2025-04-17 08:53:24'),
(2970, 2333, 'sunday', '09:00:00', '10:00:00', 0, '2025-04-17 08:53:24', '2025-04-17 08:53:24'),
(2971, 2335, 'monday', '09:00:00', '10:00:00', 0, '2025-04-18 01:45:59', '2025-04-18 01:45:59'),
(2972, 2335, 'tuesday', '09:00:00', '10:00:00', 0, '2025-04-18 01:45:59', '2025-04-18 01:45:59'),
(2973, 2335, 'wednesday', '09:00:00', '10:00:00', 0, '2025-04-18 01:45:59', '2025-04-18 01:45:59'),
(2974, 2335, 'thursday', '09:00:00', '10:00:00', 0, '2025-04-18 01:45:59', '2025-04-18 01:45:59'),
(2975, 2335, 'friday', '09:00:00', '10:00:00', 0, '2025-04-18 01:45:59', '2025-04-18 01:45:59'),
(2976, 2335, 'saturday', '09:00:00', '10:00:00', 0, '2025-04-18 01:45:59', '2025-04-18 01:45:59'),
(2977, 2335, 'sunday', '09:00:00', '10:00:00', 0, '2025-04-18 01:45:59', '2025-04-18 01:45:59'),
(2978, 2337, 'monday', '09:00:00', '10:00:00', 0, '2025-04-18 09:40:03', '2025-04-18 09:40:03'),
(2979, 2337, 'tuesday', '09:00:00', '10:00:00', 0, '2025-04-18 09:40:03', '2025-04-18 09:40:03'),
(2980, 2337, 'wednesday', '09:00:00', '10:00:00', 0, '2025-04-18 09:40:03', '2025-04-18 09:40:03'),
(2981, 2337, 'thursday', '09:00:00', '10:00:00', 0, '2025-04-18 09:40:03', '2025-04-18 09:40:03'),
(2982, 2337, 'friday', '09:00:00', '10:00:00', 0, '2025-04-18 09:40:03', '2025-04-18 09:40:03'),
(2983, 2337, 'saturday', '09:00:00', '10:00:00', 0, '2025-04-18 09:40:03', '2025-04-18 09:40:03'),
(2984, 2337, 'sunday', '09:00:00', '10:00:00', 0, '2025-04-18 09:40:03', '2025-04-18 09:40:03'),
(3006, 2363, 'monday', '09:00:00', '10:00:00', 0, '2025-04-25 17:39:28', '2025-04-25 17:39:28'),
(3007, 2363, 'tuesday', '09:00:00', '10:00:00', 0, '2025-04-25 17:39:28', '2025-04-25 17:39:28'),
(3008, 2363, 'wednesday', '09:00:00', '10:00:00', 0, '2025-04-25 17:39:28', '2025-04-25 17:39:28'),
(3009, 2363, 'thursday', '09:00:00', '10:00:00', 0, '2025-04-25 17:39:28', '2025-04-25 17:39:28'),
(3010, 2363, 'friday', '09:00:00', '10:00:00', 0, '2025-04-25 17:39:28', '2025-04-25 17:39:28'),
(3011, 2363, 'saturday', '09:00:00', '10:00:00', 0, '2025-04-25 17:39:28', '2025-04-25 17:39:28'),
(3012, 2363, 'sunday', '09:00:00', '10:00:00', 0, '2025-04-25 17:39:28', '2025-04-25 17:39:28');

-- --------------------------------------------------------

--
-- Table structure for table `payment_request`
--

CREATE TABLE `payment_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` varchar(56) NOT NULL COMMENT 'partner | customer',
  `payment_address` varchar(1024) NOT NULL,
  `amount` double NOT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0-pending | 1- approved|2-rejected',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `promo_code` varchar(28) NOT NULL,
  `message` varchar(512) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `no_of_users` int(11) DEFAULT NULL,
  `minimum_order_amount` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `discount_type` varchar(32) DEFAULT NULL,
  `max_discount_amount` double DEFAULT NULL,
  `repeat_usage` tinyint(4) NOT NULL,
  `no_of_repeat_usage` int(11) DEFAULT NULL,
  `image` varchar(256) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `queue_jobs`
--

CREATE TABLE `queue_jobs` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `queue` varchar(64) NOT NULL,
  `payload` mediumtext NOT NULL,
  `priority` varchar(64) NOT NULL DEFAULT 'default',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `attempts` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `queue_jobs_failed`
--

CREATE TABLE `queue_jobs_failed` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `connection` varchar(64) NOT NULL,
  `queue` varchar(64) NOT NULL,
  `payload` mediumtext NOT NULL,
  `priority` varchar(64) NOT NULL DEFAULT 'default',
  `exception` mediumtext NOT NULL,
  `failed_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(1024) NOT NULL,
  `section_type` varchar(1024) NOT NULL,
  `category_ids` varchar(255) DEFAULT NULL,
  `partners_ids` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `status` text NOT NULL,
  `limit` text NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `banner_type` text DEFAULT NULL,
  `banner_url` text DEFAULT NULL,
  `app_banner_image` text DEFAULT NULL,
  `web_banner_image` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `title`, `section_type`, `category_ids`, `partners_ids`, `created_at`, `updated_at`, `status`, `limit`, `rank`, `banner_type`, `banner_url`, `app_banner_image`, `web_banner_image`, `description`) VALUES
(85, 'Home Care Services', 'categories', '220,218,217,216,215', NULL, '2022-11-03 11:01:08', '2025-04-04 15:57:05', '1', '', 7, NULL, NULL, NULL, NULL, 'Reliable Solutions for a Clean, Safe, and Comfortable Home!'),
(87, 'Laundry & Cleaning Services', 'categories', '239,238,237,236,235', NULL, '2022-11-03 11:06:42', '2025-04-04 15:57:58', '1', '', 10, NULL, NULL, NULL, NULL, 'Fresh, Spotless, and Hassle-Free—We Do the Dirty Work for You!'),
(88, 'Plumbing Solutions', 'categories', '245,244,243,242,241', NULL, '2022-11-03 11:13:49', '2025-04-04 15:55:16', '1', '', 3, NULL, NULL, NULL, NULL, 'Reliable Repairs & Expert Maintenance for Every Leak and Clog!'),
(89, 'Auto Repair & Maintenance', 'categories', '234,232,230,228', NULL, '2022-11-03 11:19:49', '2025-05-07 04:27:24', '1', '', 2, NULL, NULL, NULL, NULL, 'Keep Your Ride Running: Top Auto Repair & Maintenance Services!'),
(97, 'Local Experts Nearby', 'near_by_provider', NULL, '327,303,273,263,204', '2023-07-13 09:12:32', '2025-04-04 15:56:12', '1', '', 5, NULL, NULL, NULL, NULL, 'Trusted Professionals Ready to Assist You Anytime, Anywhere!'),
(100, 'Elite Providers', 'top_rated_partner', NULL, NULL, '2023-09-27 09:10:26', '2025-04-04 15:57:31', '1', '10', 9, NULL, NULL, NULL, NULL, 'Top-Rated Experts Delivering Premium Services Just for You!'),
(101, 'Recently Booked', 'previous_order', NULL, NULL, '2024-02-12 18:19:27', '2025-04-04 15:56:48', '1', '3', 6, NULL, NULL, NULL, NULL, 'Your Past Bookings at a Glance for Quick & Easy Rebooking!'),
(102, 'Featured Ad Providers', 'partners', NULL, '327,303,301,298,293,283,273,271,270,263,260,50', '2024-09-02 11:44:24', '2025-05-07 04:27:24', '1', '0', 1, NULL, NULL, NULL, NULL, 'Top Ad Providers: Boost Your Brand with the Best!'),
(103, '', 'banner', NULL, NULL, '2024-11-08 09:43:56', '2025-03-29 17:30:51', '1', '0', 8, 'banner_url', 'https://edemandweb.wrteam.me/become-provider', '1743243728_f19feaf17aa2065a5d7f.png', '1743249651_50887464c31e2be8fcf9.png', 'Become Provider\r\n'),
(104, '', 'banner', NULL, '293', '2024-11-08 09:47:15', '2025-03-29 16:39:43', '1', '0', 4, 'banner_provider', NULL, '1743169679_541348205b2b74039d25.png', '1743246583_9cbb7df971f61e6d9e82.png', 'Provider\r\n'),
(105, '', 'banner', NULL, NULL, '2024-11-08 09:47:48', '2025-04-01 13:27:09', '1', '0', 11, 'banner_url', 'https://codecanyon.net/item/edemand-multi-vendor-on-demand-home-doorstep-services-marketplace-with-flutter-app-admin-panel/40825792?irgwc=1&clickid=0z3RVPXjNxyPUEX0ay2aXQiVUkC0neXVqx7rSM0&iradid=275988&irpid=2430794&iradtype=ONLINE_TRACKING_LINK&irmptype=mediapartner&mp_value1=&utm_campaign=af_impact_radius_2430794&utm_medium=affiliate&utm_source=impact_radius', '1743494229_376bf62ec2d62f071b8d.png', '1743492664_5ce7cdde9d85deaac0fa.png', 'Banner\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'partner_id',
  `category_id` int(11) NOT NULL,
  `tax_type` varchar(20) NOT NULL DEFAULT ' included',
  `tax_id` int(11) NOT NULL DEFAULT 0,
  `tax` float NOT NULL,
  `title` varchar(2048) NOT NULL,
  `slug` varchar(2048) NOT NULL,
  `description` text NOT NULL,
  `tags` text NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `price` double NOT NULL,
  `discounted_price` double NOT NULL DEFAULT 0,
  `number_of_members_required` int(11) NOT NULL DEFAULT 1 COMMENT 'No of members required to perform service',
  `duration` varchar(128) NOT NULL COMMENT 'in minutes',
  `rating` double NOT NULL DEFAULT 0 COMMENT 'Average rating',
  `number_of_ratings` double NOT NULL DEFAULT 0,
  `on_site_allowed` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 - not allowed | 1 - allowed',
  `is_cancelable` tinyint(1) NOT NULL DEFAULT 0,
  `cancelable_till` varchar(200) NOT NULL,
  `max_quantity_allowed` int(11) NOT NULL DEFAULT 0 COMMENT '0 - unlimited | number - limited qty',
  `is_pay_later_allowed` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 - not allowed | 1 - allowed',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 - deactive | 1 - active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `long_description` longtext NOT NULL,
  `other_images` text NOT NULL,
  `files` text NOT NULL,
  `faqs` text NOT NULL,
  `at_store` text DEFAULT NULL,
  `at_doorstep` text DEFAULT NULL,
  `approved_by_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `category_id`, `tax_type`, `tax_id`, `tax`, `title`, `slug`, `description`, `tags`, `image`, `price`, `discounted_price`, `number_of_members_required`, `duration`, `rating`, `number_of_ratings`, `on_site_allowed`, `is_cancelable`, `cancelable_till`, `max_quantity_allowed`, `is_pay_later_allowed`, `status`, `created_at`, `updated_at`, `long_description`, `other_images`, `files`, `faqs`, `at_store`, `at_doorstep`, `approved_by_admin`) VALUES
(41, 327, 255, 'included', 6, 0, 'Switch and Socket', 'switch-and-socket', 'Replacement of single switch  and repairing', 'electrician,led,electronic,electronics,electric,maintenance,electrical,electricity,switch,socket', 'public/uploads/services/1667566610_ec8b7b023f74b6fd16a9.jpg', 100, 80, 1, '120', 0, 0, 1, 0, '', 10, 1, 1, '2022-11-04 12:56:50', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(42, 327, 254, 'included', 7, 0, 'Fan', 'fan', 'Best and quick electricity services on your location', 'electrician,led,electronic,electronics,electric,maintenance,electrical,electricity,fan', 'public/uploads/services/1667630682_53ce00a077c9d1867908.jpg', 50, 45, 1, '30', 0, 0, 1, 0, '', 5, 1, 1, '2022-11-05 06:44:42', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(43, 327, 252, 'included', 7, 0, 'Light', 'light', 'Best and quick Lights services on your location', 'electrician,led,electronic,electronics,electric,maintenance,electrical,electricity,light', 'public/uploads/services/1667630773_4783612212fd63c98b0a.jpg', 50, 45, 1, '30', 0, 0, 1, 0, '', 10, 1, 1, '2022-11-05 06:46:13', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(44, 327, 252, 'included', 7, 0, 'MCB & Fuse', 'mcb-&-fuse', 'Best and quick MCB & Fuse services in your location', 'electrician,led,electronic,electronics,electric,maintenance,electrical,electricity', 'public/uploads/services/1667630851_2b94161f1427d8482278.jpg', 100, 90, 1, '60', 0, 0, 1, 0, '', 5, 1, 1, '2022-11-05 06:47:31', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(45, 327, 252, 'included', 7, 0, 'Appliance', 'appliance', 'Best and quick Appliance services in your location', 'electrician,led,electronic,electronics,electric,maintenance,electrical,electricity,Appliance', 'public/uploads/services/1667631013_1b951d37371fe32bf4e5.jpg', 100, 90, 1, '120', 0, 0, 1, 0, '', 5, 1, 1, '2022-11-05 06:50:13', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(46, 327, 252, 'included', 7, 0, 'Wiring', 'wiring', 'Best and quick wiring services in your location', 'electrician,led,electronic,electronics,electric,maintenance,electrical,electricity,wiring', 'public/uploads/services/1667631101_107c2700eb90d43c423c.jpg', 200, 180, 2, '60', 0, 0, 1, 0, '', 5, 1, 1, '2022-11-05 06:51:41', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(47, 260, 252, 'included', 9, 0, 'Ceiling fan repair', 'ceiling-fan-repair', 'Browse through the various types of fans available online. If you need a fan to keep yourself cool, choose between ceiling fans, wall fans, a table option, ...', 'fan,celling fan', 'public/uploads/services/1667807249_bd5ce6baf3f0693c17c7.jpg', 600, 480, 25, '160', 4.5555555555556, 9, 1, 1, '30', 23, 1, 1, '2022-11-07 07:47:29', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(48, 260, 253, 'included', 6, 0, 'Outdoor lighting', 'outdoor-lighting', 'Outdoor Lights   Outdoor LED Lightings Online in India at Best Prices. Choose from various Outdoor House Lights like Outdoor Lamps', 'outdoor,electronic,service,electronic service,lightting', 'public/uploads/services/1667812651_5cdc2a7156532b4faf94.jpg', 200, 160, 6, '260', 5, 10, 1, 0, '', 6, 1, 1, '2022-11-07 09:17:31', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(49, 260, 252, 'included', 6, 0, 'Socket Switch Installation', 'socket-switch-installation', 'Socket Switch Installation', 'Socket,Switch,Electronic service,installation', 'public/uploads/services/1667812954_6433be8661a014cc913c.jpg', 150, 105, 2, '160', 5, 5, 0, 0, '', 5, 1, 1, '2022-11-07 09:22:34', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(50, 260, 252, 'included', 6, 0, 'Security System', 'security-system', 'security system', 'security,security System,Electronic service,service', 'public/uploads/services/1667813924_066b314484e34db47956.jpg', 500, 400, 5, '160', 5, 10, 1, 0, '', 2, 1, 1, '2022-11-07 09:38:44', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(51, 260, 252, 'included', 11, 0, 'Ground wiring', 'ground-wiring', 'Ground wiring', 'Ground wiring,ground wire,electronic service', 'public/uploads/services/1667814211_af672b623b6cdcd2968a.jpg', 600, 480, 5, '240', 5, 10, 1, 0, '', 2, 1, 1, '2022-11-07 09:43:31', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(57, 263, 240, 'included', 10, 0, 'Water Leaks', 'water-leaks', 'Prompt and reliable solutions for water leaks in residential and commercial properties. Our experienced team detects and repairs leaks efficiently, preventing potential damage and ensuring water conservation. Trust us to safeguard your property and restore peace of mind.', 'Water Leaks', 'public/uploads/services/1667817381_a04e80dc05b18e88d073.jpg', 300, 240, 3, '60', 0, 0, 0, 0, '', 5, 1, 1, '2022-11-07 10:36:21', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(58, 263, 240, 'included', 10, 0, 'Bathroom installation', 'bathroom-installation', 'Bathroom installation', 'Bathroom installation,plumbing service', 'public/uploads/services/1667817654_d812ae041106b98c86db.jpg', 200, 100, 2, '60', 5, 4, 1, 0, '', 5, 1, 1, '2022-11-07 10:40:54', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(59, 263, 240, 'included', 10, 0, 'wall pump repair', 'wall-pump-repair', 'wall pump repair', 'wall pump repair,pump repair,wall pump', 'public/uploads/services/1667817780_bb74c7e936e04e13b052.jpg', 350, 280, 5, '60', 5, 2, 0, 0, '', 2, 1, 1, '2022-11-07 10:43:00', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(60, 263, 240, 'included', 10, 0, 'Water Heater Repair', 'water-heater-repair', 'Water Heater Repair', 'Water Heater Repair', 'public/uploads/services/1667818090_8980b9669917c7cfb640.jpg', 200, 180, 5, '60', 5, 10, 1, 0, '', 5, 1, 1, '2022-11-07 10:48:10', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(61, 263, 240, 'included', 10, 0, 'Shower Installation', 'shower-installation', 'Shower Instsllation', 'Shower Instsllation,plumbing service,shower', 'public/uploads/services/1667818247_fdae48938be5e6f999ff.jpg', 200, 140, 2, '60', 0, 0, 0, 0, '', 2, 1, 1, '2022-11-07 10:50:47', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(62, 270, 259, 'included', 11, 0, 'Car Service', 'car-service', ' From routine maintenance to complex repairs, our car service offers expert solutions, ensuring your vehicle stays in excellent condition and on the road with confidence.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667882464_056b252e18b85cb59752.jpg', 250, 200, 2, '160', 0, 0, 1, 0, '', 5, 1, 1, '2022-11-08 04:30:11', '2025-03-26 13:44:06', '<p>&nbsp;</p>\r\n<table style=\"max-width: 800px; margin: 0 auto; background-color: #ffffff;\" cellspacing=\"0\" cellpadding=\"20\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\"><img src=\"https://img.freepik.com/free-psd/banner-template-with-mechanic-work_23-2148501377.jpg?w=2000&amp;t=st=1688989307~exp=1688989907~hmac=bb81c5146b52cb2d3565699929ab72c96452f3f08ad8dbab8417da59318234b4\" alt=\"car service\" width=\"445\" height=\"250\" /></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<h2 style=\"color: #333333;\">Why Choose Us?</h2>\r\n<ul style=\"margin: 0; padding-left: 20px;\">\r\n<li style=\"color: #666666;\">Experienced and certified mechanics</li>\r\n<li style=\"color: #666666;\">State-of-the-art facilities and equipment</li>\r\n<li style=\"color: #666666;\">Wide range of services, from routine maintenance to major repairs</li>\r\n<li style=\"color: #666666;\">Transparent pricing and no hidden fees</li>\r\n<li style=\"color: #666666;\">Fast turnaround times to minimize your inconvenience</li>\r\n<li style=\"color: #666666;\">Exceptional customer service and personalized attention</li>\r\n</ul>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style=\"color: #666666;\">Whether your car needs a simple oil change or complex engine diagnostics, we have you covered. Our team of skilled technicians is dedicated to providing the highest quality service and ensuring your complete satisfaction.</p>\r\n<p style=\"color: #666666;\">Don\'t let car troubles slow you down! Contact us today to schedule an appointment or request a free quote.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '[\"public\\/uploads\\/services\\/1688989712_57b58c1264fa09699e3f.jpg\",\"public\\/uploads\\/services\\/1688989712_a3d96f656853b44fd170.jpg\",\"public\\/uploads\\/services\\/1688989712_02251ea187acff43cc9b.jpg\",\"public\\/uploads\\/services\\/1688989712_9af9988acf9fe1372deb.jpg\"]', '', '[[\"How often should I get an oil change?\",\"It is generally recommended to get an oil change every 3,000 to 5,000 miles or as advised by your vehicle\'s manufacturer.\"],[\"What are the signs that my brakes need to be replaced?\",\"Warning signs of worn-out brakes include squeaking or grinding noises, reduced braking power, vibrating brake pedal, or the brake warning light illuminated on the dashboard.\"],[\"How frequently should I check my tire pressure?\",\"It is recommended to check your tire pressure at least once a month and before long trips. Proper tire pressure ensures optimal handling, fuel efficiency, and tire lifespan.\"],[\"When should I replace my car battery?\",\"On average, car batteries last about 3 to 5 years. Signs of a failing battery include difficulty starting the car, dim headlights, or a battery warning light on the dashboard.\"],[\"Do you offer a warranty for your services?\",\"Yes, we provide a warranty for our services. The duration and coverage may vary depending on the type of service performed. Please contact us for specific warranty details.\"]]', '1', '1', 1),
(63, 270, 259, 'included', 11, 0, 'Car Repair', 'car-repair', 'If you are looking for good car repairing services, then look no further than Maruti Motors in Mirzapur, Bhuj.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667883256_5799cda64762c81d25fe.jpg', 350, 280, 5, '160', 5, 2, 1, 0, '', 5, 1, 1, '2022-11-08 04:43:45', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(64, 270, 259, 'included', 12, 0, 'Car Wash', 'car-wash', 'If you are looking for good car washing services, then look no further than Maruti Motors in Mirzapur, Bhuj.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667882796_4bec9d83b7287e1bb34f.jpg', 400, 320, 2, '30', 0, 0, 1, 1, '30', 5, 1, 1, '2022-11-08 04:46:36', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(65, 270, 259, 'included', 11, 0, 'Ac Service & Repair ', 'ac-service-&-repair-', 'If you are looking for good car Ac Service & repairing services, then look no further than Maruti Motors in Mirjapur, Bhuj.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667882893_8aed5ceeb25356f70442.jpg', 500, 450, 2, '120', 5, 10, 1, 0, '', 5, 1, 1, '2022-11-08 04:48:13', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(66, 270, 259, 'included', 12, 0, 'Detailing Services', 'detailing-services', 'If you are looking for good Detailing Services, then look no further than Maruti Motors in Mirzapur, Bhuj.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667883017_e5b89f2d98a16fbf327e.jpg', 250, 200, 2, '60', 5, 10, 0, 0, '', 6, 1, 1, '2022-11-08 04:50:17', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(67, 270, 232, 'included', 9, 0, 'Tires & Wheels Care', 'tires-&-wheels-care', 'If you are looking for good Tires & Wheels Care  services, then look no further than Maruti Motors in Mirzapur, Bhuj.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667883446_0f970879656912a6a515.jpg', 250, 200, 5, '120', 5, 10, 1, 0, '', 5, 1, 1, '2022-11-08 04:53:45', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(68, 270, 259, 'included', 12, 0, 'Window Tinting', 'window-tinting', 'If you are looking for good Window Tinting services, then look no further than Maruti Motors in Mirzapur, Bhuj.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667883370_73f5f381040c6865cae5.jpg', 250, 200, 2, '60', 5, 10, 0, 0, '', 5, 1, 1, '2022-11-08 04:56:10', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(69, 270, 230, 'included', 12, 0, 'Batteries', 'batteries', 'If you are looking for good Batteries repairing services, then look no further than Maruti Motors in Mirzapur, Bhuj.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667883908_6e400f3979372dcde7a5.jpg', 500, 400, 3, '120', 5, 10, 0, 0, '', 52, 1, 1, '2022-11-08 05:05:08', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(70, 270, 259, 'included', 11, 0, 'Towing Service', 'towing-service', 'If you are looking for good Towing services, then look no further than Maruti Motors in Mirzapur, Bhuj.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667884012_1deaff6534944ce05c82.jpg', 300, 180, 2, '30', 0, 0, 0, 0, '', 2, 1, 1, '2022-11-08 05:06:52', '2025-03-26 13:44:06', '', '[\"public\\/uploads\\/services\\/1688640931_552643046177764dfaf3.jpg\",\"public\\/uploads\\/services\\/1688640931_a17c7d4288b91a6ba63a.jpg\",\"public\\/uploads\\/services\\/1688640931_2308972a15e9a1914fd0.jpg\",\"public\\/uploads\\/services\\/1688640931_40ce323d85cb0baf3064.jpg\",\"public\\/uploads\\/services\\/1688640931_1644184b6475b7d88b4f.jpg\"]', '', '', '1', '1', 1),
(71, 270, 228, 'included', 0, 0, 'Oil Change & Report', 'oil-change-&-report', 'If you are looking for good Oil Change & Report services, then look no further than Maruti Motors in Mirzapur, Bhuj.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667884133_b53ebbf3012855433f7b.jpg', 250, 200, 1, '30', 0, 0, 0, 0, '', 5, 1, 1, '2022-11-08 05:08:53', '2025-03-26 13:44:06', '', '[\"public\\/uploads\\/services\\/1688640332_c9dda2404b80bc934849.jpg\",\"public\\/uploads\\/services\\/1688640332_1f87982d7616b597b4fd.jpg\",\"public\\/uploads\\/services\\/1688640332_c299d5d820fb2931ae8a.jpg\",\"public\\/uploads\\/services\\/1688640332_18ddb5c854fa5991b012.jpg\",\"public\\/uploads\\/services\\/1688640332_41a9a96d4322f26f8ddd.jpg\",\"public\\/uploads\\/services\\/1688640332_feb4ee73bc3a724c69fe.jpg\",\"public\\/uploads\\/services\\/1688640332_dcc71588fffa11b59dc0.jpg\"]', '', '', '1', '1', 1),
(72, 270, 259, 'included', 7, 0, 'Denting & Painting', 'denting-&-painting', 'If you are looking for good Denting & Painting services, then look no further than Maruti Motors in Mirzapur, Bhuj.', 'carservice,cars,car,automotive,carrepair,mechanic,carcare,auto,autorepair,service', 'public/uploads/services/1667884193_b2d999077929047e41ca.jpg', 400, 280, 2, '60', 0, 0, 0, 0, '', 85, 1, 1, '2022-11-08 05:09:53', '2025-03-26 13:44:06', '', '[\"public\\/uploads\\/services\\/1688640226_91f80d7d5e4f010bcf46.jpg\",\"public\\/uploads\\/services\\/1688640226_7816dc0123fa68eeb1d1.jpg\",\"public\\/uploads\\/services\\/1688640226_1fce4d2cca701f217f54.jpg\",\"public\\/uploads\\/services\\/1688640226_e9754633f83d6fe20106.jpg\",\"public\\/uploads\\/services\\/1688640226_a62bcdfc0c8fcdadc013.jpg\",\"public\\/uploads\\/services\\/1688640226_b465c689203917e30d06.jpg\",\"public\\/uploads\\/services\\/1688640226_e395b6cde01144519bd9.jpg\"]', '', '', '1', '1', 1),
(73, 293, 218, 'included', 0, 0, 'Kitchen Cleaning', 'kitchen-cleaning', 'Kitchen cleaners perform thorough cleanings of Kitchen using cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,Kitchen Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning', 'public/uploads/services/1667886635_c0a5888fcc39d53c07d0.jpg', 100, 90, 2, '60', 0, 0, 0, 0, '', 5, 1, 1, '2022-11-08 05:35:14', '2025-03-26 13:44:06', '<table style=\"width: 80.5463%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 19.7202%; text-align: center;\"><img src=\"https://vendor.eshopweb.store/uploads/media/2023/money.png\" width=\"42\" height=\"42\" /></td>\r\n<td style=\"width: 80.1956%;\">\r\n<p><strong>100% Secure Payments</strong></p>\r\n<p>Moving your card details to a much more secure place</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 19.7202%; text-align: center;\"><img src=\"https://vendor.eshopweb.store/uploads/media/2023/trust.png\" width=\"43\" height=\"43\" /></td>\r\n<td style=\"width: 80.1956%;\">\r\n<p><strong>TrustPay</strong></p>\r\n<p>100% Payment Protection. Easy Return Policy&nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 19.7202%; text-align: center;\"><img src=\"https://vendor.eshopweb.store/uploads/media/2023/customer-service.png\" width=\"41\" height=\"41\" /></td>\r\n<td style=\"width: 80.1956%;\">\r\n<p><strong>Help Center</strong></p>\r\n<p>Got a question? Look no further. Browse our FAQs or submit your query here.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '[\"public\\/uploads\\/services\\/1687949817_deb2c7024b1197041245.jpg\",\"public\\/uploads\\/services\\/1687949817_745fe2ebb39b77955b6d.jpg\",\"public\\/uploads\\/services\\/1687949817_864bf1928821ad8ba32d.jpg\",\"public\\/uploads\\/services\\/1687949817_08838fbb5cf87b10a38e.jpg\",\"public\\/uploads\\/services\\/1687949817_5cd0d3dc6d49b689507d.jpg\",\"public\\/uploads\\/services\\/1687949817_a15446f9c3bd9b340f95.jpg\"]', '[\"public\\/uploads\\/services\\/kitchen.pdf\"]', '[[\"How often should I schedule professional kitchen cleaning?\",\"Monthly or quarterly is recommended for professional kitchen cleaning.\"],[\"What areas of the kitchen do your cleaning services cover?\",\"We cover countertops, sinks, stovetops, oven exteriors, fridge exteriors, and cabinet surfaces.\"],[\"Do you clean kitchen appliances such as microwaves and dishwashers?\",\"Yes, we clean the exteriors of appliances like microwaves and dishwashers.\"],[\"What cleaning products do you use for kitchen cleaning?\",\"We use food-safe and eco-friendly cleaning products for kitchen surfaces.\"],[\"Can you handle tough grease and stubborn stains in the kitchen?\",\"Absolutely! Our professionals are equipped to handle tough grease and stubborn stains.\"]]', '1', '1', 1),
(74, 293, 213, 'included', 11, 0, 'Bathroom Cleaning', 'bathroom-cleaning', 'Bathroom cleaners perform thorough cleanings of Bathroom using cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,Bathroom,Bathroom cleaning,Bath tab cleaning', 'public/uploads/services/1667886666_c0dd691e9044e18a1996.jpg', 600, 540, 2, '60', 5, 8, 1, 0, '', 25, 1, 1, '2022-11-08 05:37:17', '2025-03-26 13:44:06', '', '[\"public\\/uploads\\/services\\/1689221233_85f844a77222c9b7f812.jpg\",\"public\\/uploads\\/services\\/1689221233_81ac204c4878d270ea18.jpg\",\"public\\/uploads\\/services\\/1689221233_beb7f51a8eeaf3175137.jpg\",\"public\\/uploads\\/services\\/1689221233_1ffe423b40d02d84603a.jpg\",\"public\\/uploads\\/services\\/1689221233_dc2db9951d28f8a678f6.jpg\"]', '', '', '1', '1', 1),
(75, 293, 213, 'included', 11, 0, 'Full Home Cleaning', 'full-home-cleaning', 'Full home cleaners perform thorough cleanings of Full home using cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,full home', 'public/uploads/services/1667886754_b37015aeb9171e87fe41.jpg', 600, 540, 2, '180', 5, 10, 0, 0, '', 60, 1, 1, '2022-11-08 05:38:48', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(76, 293, 213, 'included', 12, 0, 'Office Cleaning', 'office-cleaning', 'Office cleaners perform thorough cleanings of Office using cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,office cleaning,office', 'public/uploads/services/1667886870_9c428144bc2c790e75b7.jpg', 400, 320, 5, '60', 5, 2, 1, 0, '', 3, 1, 1, '2022-11-08 05:42:21', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(77, 293, 213, 'included', 0, 0, 'Window Cleaning', 'window-cleaning', 'Window cleaners perform thorough cleanings of Window using cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,window cleaning,window clean', 'public/uploads/services/1667887129_59b1e300b6ec2b3ec6a3.jpg', 300, 180, 2, '60', 5, 10, 1, 0, '', 5, 1, 1, '2022-11-08 05:58:49', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(78, 293, 213, 'included', 11, 0, 'Sofa Cleaning', 'sofa-cleaning', 'House sofa cleaners perform thorough cleanings of sofa  cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,sofa cleaning,sofa dip cleaning,lather sofa cleaning', 'public/uploads/services/1667887315_cde7cd1507cd93b56255.jpg', 300, 210, 2, '60', 5, 7, 0, 0, '', 5, 1, 1, '2022-11-08 06:01:55', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(79, 293, 213, 'included', 12, 0, 'Balcony Deep Cleaning', 'balcony-deep-cleaning', 'House Balcony  cleaners perform thorough cleanings of balcony cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,homecleaning,balcony cleaning,Balcony Deep Cleaning,balcony', 'public/uploads/services/1667887411_49b120fdfbba11b80350.jpg', 400, 320, 2, '60', 5, 10, 0, 0, '', 3, 1, 1, '2022-11-08 06:03:31', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(80, 293, 213, 'included', 10, 0, 'Carpet Cleaning', 'carpet-cleaning', 'House carpet cleaners perform thorough cleanings of carpet cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,carpet,carpet cleaning,carpet clen', 'public/uploads/services/1667887507_d4fcaa478be6aeed58ae.jpg', 200, 140, 2, '60', 5, 10, 0, 0, '', 2, 1, 1, '2022-11-08 06:05:07', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(81, 293, 213, 'included', 11, 0, 'Mattress Cleaning', 'mattress-cleaning', 'House Mattress cleaners perform thorough cleanings of Mattress cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,Mattress Clean,Mattress,Mattress Cleaning', 'public/uploads/services/1667887600_b0023b366931654c0532.jpg', 300, 210, 5, '60', 5, 10, 1, 0, '', 5, 1, 1, '2022-11-08 06:06:40', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(82, 293, 213, 'included', 11, 0, 'Pillow Cleaning', 'pillow-cleaning', 'Room pillow cleaners perform thorough cleanings of room pillow cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,pillow clean,pillow cleaning,pillow', 'public/uploads/services/1667887740_92ee6f45530289ec0b96.jpg', 100, 90, 5, '30', 5, 10, 0, 0, '', 5, 1, 1, '2022-11-08 06:09:00', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(83, 293, 213, 'included', 11, 0, 'Chair Cleaning', 'chair-cleaning', 'Chair cleaners perform thorough cleanings of Chair cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,Chair,Chair cleaning,Chair clean', 'public/uploads/services/1667887912_7e14b0e936135752dbfe.jpg', 400, 360, 3, '120', 5, 10, 1, 0, '', 6, 1, 1, '2022-11-08 06:11:52', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(84, 273, 265, 'included', 11, 0, 'Haircut', 'haircut', '\"Unlock a new level of style with our expert haircut service. Step into our salon and let our talented hairstylists create a look that reflects your unique personality and leaves you feeling confident and fabulous.\"', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1667890499_5f44735c0d8c1ba95737.jpg', 50, 40, 2, '30', 5, 14, 0, 0, '', 2, 1, 1, '2022-11-08 06:41:14', '2025-03-26 13:44:06', '<p><strong>About the Process</strong></p>\r\n<table style=\"border-collapse: collapse; width: 100.073%;\" border=\"0\" cellspacing=\"5\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 3.67502%; text-align: left; vertical-align: middle;\"><img src=\"https://i.imgur.com/Db1VbId.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%; text-align: left; vertical-align: middle;\"><strong>Consultation</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">\r\n<p>Our hairstylist will begin by having a consultation with you to understand your desired haircut, style preferences, and any specific requests you may have.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/IbcdHaj.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Hair Preparation</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">Next, your hair will be prepared for the haircut. This may involve washing and conditioning your hair, or it can be done on dry hair depending on your preference and the style you\'re aiming for.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/pALt5jG.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Cutting Technique</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">Using professional cutting tools and techniques, our skilled hairstylist will carefully trim and shape your hair according to the agreed-upon style. They will ensure precision and attention to detail, making adjustments as needed to achieve the desired look.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/KWuKAfQ.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Styling and Finishing</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">Once the haircut is complete, your hairstylist will style your hair to showcase the haircut\'s full potential. This may involve blow-drying, using styling products, and adding any finishing touches to create the desired final look.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/AUcAJvU.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Guidance and Maintenance Tips</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">To help you maintain your haircut at home, your hairstylist will provide you with guidance on styling techniques, recommended products, and any specific care instructions to keep your hair looking its best until your next visit.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/r3cS0GK.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Client Satisfaction</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">Throughout the process, our hairstylist will ensure your satisfaction by actively listening to your feedback and addressing any concerns or requests you may have. Your happiness and confidence in your new haircut are our top priorities.</td>\r\n</tr>\r\n</tbody>\r\n</table>', '[\"public\\/uploads\\/services\\/1688637098_89723008aaad352bfcf7.jpg\",\"public\\/uploads\\/services\\/1688637098_112e7e152a6c77bd9775.jpg\",\"public\\/uploads\\/services\\/1688637098_d43f78148974a6fec3e4.jpg\",\"public\\/uploads\\/services\\/1688637098_3c939a1d818c86bfd145.jpg\",\"public\\/uploads\\/services\\/1688637098_2a934d9de43d92c0e809.jpg\",\"public\\/uploads\\/services\\/1688637098_f6a1d68bc49579d0a7ac.jpg\",\"public\\/uploads\\/services\\/1688637098_7102d366824df6b9aa93.jpg\"]', '', '[[\"How do I choose the right haircut for me?\",\"Our experienced hairstylists are here to guide you. They will consider your face shape, hair texture, lifestyle, and personal preferences to help you select a haircut that complements your features and suits your individual style.\"],[\"Do I need to come with a specific haircut idea in mind?\",\"Not at all! Our hairstylists are skilled in providing personalized recommendations. Feel free to discuss your preferences and hair goals, and they will suggest suitable options tailored to enhance your unique look.\"],[\"Can I bring a photo of a haircut I like?\",\"Absolutely! Visual references can be helpful in communicating your desired haircut. Show our hairstylists any inspiration photos you have, and they will work with you to achieve a similar look that suits your hair type and face shape.\"],[\"What if I want to change my hairstyle significantly?\",\"Our hairstylists love creating transformative looks! Discuss your desire for a significant change during the consultation, and they will provide expert advice and recommendations to ensure a successful and stunning transformation.\"],[\" Can you provide haircare tips for maintaining my new haircut at home?\",\"Absolutely! Our hairstylists are more than happy to share professional tips and advice on how to maintain and style your haircut at home. They will recommend suitable products and techniques to keep your hair looking its best.\"],[\"What safety measures do you have in place?\",\"Your safety is our priority. We maintain strict hygiene and sanitation protocols in our salon, including regular disinfection, sanitization of tools, and adherence to social distancing guidelines. Rest assured, you can enjoy your haircut experience in a clean and safe environment.\"]]', '1', '1', 1),
(85, 273, 265, 'included', 11, 0, 'Kids Haircut', 'kids-haircut', '\"Unlock a new level of style with our expert haircut service. Step into our salon and let our talented hairstylists create a look that reflects your unique personality and leaves you feeling confident and fabulous.\"', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1667890412_1fa8614d627a447b6772.jpg', 40, 32, 1, '30', 5, 14, 0, 0, '', 5, 1, 1, '2022-11-08 06:53:32', '2025-03-26 13:44:06', '<p><strong>About the Process</strong></p>\r\n<table style=\"border-collapse: collapse; width: 100.073%;\" border=\"0\" cellspacing=\"5\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 3.67502%; text-align: left; vertical-align: middle;\"><img src=\"https://i.imgur.com/Db1VbId.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%; text-align: left; vertical-align: middle;\"><strong>Consultation</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">\r\n<p>Our hairstylist will begin by having a consultation with you to understand your desired haircut, style preferences, and any specific requests you may have.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/IbcdHaj.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Hair Preparation</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">Next, your hair will be prepared for the haircut. This may involve washing and conditioning your hair, or it can be done on dry hair depending on your preference and the style you\'re aiming for.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/pALt5jG.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Cutting Technique</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">Using professional cutting tools and techniques, our skilled hairstylist will carefully trim and shape your hair according to the agreed-upon style. They will ensure precision and attention to detail, making adjustments as needed to achieve the desired look.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/KWuKAfQ.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Styling and Finishing</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">Once the haircut is complete, your hairstylist will style your hair to showcase the haircut\'s full potential. This may involve blow-drying, using styling products, and adding any finishing touches to create the desired final look.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/AUcAJvU.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Guidance and Maintenance Tips</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">To help you maintain your haircut at home, your hairstylist will provide you with guidance on styling techniques, recommended products, and any specific care instructions to keep your hair looking its best until your next visit.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/r3cS0GK.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Client Satisfaction</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">Throughout the process, our hairstylist will ensure your satisfaction by actively listening to your feedback and addressing any concerns or requests you may have. Your happiness and confidence in your new haircut are our top priorities.</td>\r\n</tr>\r\n</tbody>\r\n</table>', '[\"public\\/uploads\\/services\\/1688640022_16aef27a9a47db618f30.jpg\",\"public\\/uploads\\/services\\/1688640022_2e1607fa83ceba104d8f.jpg\",\"public\\/uploads\\/services\\/1688640022_87484de2856f16da7540.jpg\",\"public\\/uploads\\/services\\/1688640022_8cc28eb2705655e4a4bf.jpg\",\"public\\/uploads\\/services\\/1688640022_a96b0940c45a72793a94.jpg\",\"public\\/uploads\\/services\\/1688640022_769febbacc3359cb8389.jpg\",\"public\\/uploads\\/services\\/1688640022_acb9f60bb790cda78d8f.jpg\"]', '', '[[\"How do I choose the right haircut for me?\",\"Our experienced hairstylists are here to guide you. They will consider your face shape, hair texture, lifestyle, and personal preferences to help you select a haircut that complements your features and suits your individual style.\"],[\"Do I need to come with a specific haircut idea in mind?\",\"Not at all! Our hairstylists are skilled in providing personalized recommendations. Feel free to discuss your preferences and hair goals, and they will suggest suitable options tailored to enhance your unique look.\"],[\"Can I bring a photo of a haircut I like?\",\"Absolutely! Visual references can be helpful in communicating your desired haircut. Show our hairstylists any inspiration photos you have, and they will work with you to achieve a similar look that suits your hair type and face shape.\"],[\"What if I want to change my hairstyle significantly?\",\"Our hairstylists love creating transformative looks! Discuss your desire for a significant change during the consultation, and they will provide expert advice and recommendations to ensure a successful and stunning transformation.\"],[\" Can you provide haircare tips for maintaining my new haircut at home?\",\"Absolutely! Our hairstylists are more than happy to share professional tips and advice on how to maintain and style your haircut at home. They will recommend suitable products and techniques to keep your hair looking its best.\"],[\"What safety measures do you have in place?\",\"Your safety is our priority. We maintain strict hygiene and sanitation protocols in our salon, including regular disinfection, sanitization of tools, and adherence to social distancing guidelines. Rest assured, you can enjoy your haircut experience in a clean and safe environment.\"]]', '1', '1', 1),
(86, 273, 265, 'included', 0, 0, 'Women Hair Highlights', 'women-hair-highlights', 'Enhance your style with our expert Women Hair Highlight service, adding dimension and vibrancy to your locks.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1667891363_18966f84d25c107d4c58.jpg', 50, 45, 1, '60', 5, 14, 0, 0, '', 2, 1, 1, '2022-11-08 07:09:23', '2025-03-26 13:44:06', '<div style=\"background-color: #f9f3e9; padding: 40px;\">\r\n<h2 style=\"font-size: 36px; color: #c46132; text-align: center;\">Illuminate Your Style with Women Hair Highlights</h2>\r\n<p style=\"font-size: 20px; color: #8c593b; text-align: center;\">Enhance your look and embrace a touch of brilliance with our Women Hair Highlights service. Our skilled stylists will expertly add depth, dimension, and vibrancy to your locks, giving you a stunning and personalized style statement.</p>\r\n<h3 style=\"font-size: 24px; color: #c46132;\">Why Choose Our Women Hair Highlights Service?</h3>\r\n<ul style=\"font-size: 18px; color: #8c593b; margin-left: 30px;\">\r\n<li>Experienced stylists specialized in creating natural-looking highlights</li>\r\n<li>Customized highlight placement to accentuate your features and hair texture</li>\r\n<li>Wide range of shades and techniques to match your desired look</li>\r\n<li>Enhances hair depth and adds beautiful dimension</li>\r\n<li>Personalized consultation to understand your goals and preferences</li>\r\n<li>Uses high-quality products to ensure long-lasting and vibrant results</li>\r\n</ul>\r\n<h3 style=\"font-size: 24px; color: #c46132;\">The Women Hair Highlights Process</h3>\r\n<table style=\"font-size: 18px; color: #8c593b; margin-bottom: 30px;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"vertical-align: top;\"><strong>Step 1:</strong></td>\r\n<td>Consultation with our expert stylists to understand your desired look and recommend suitable highlight shades and techniques.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"vertical-align: top;\"><strong>Step 2:</strong></td>\r\n<td>Precise sectioning and application of highlights to create a natural and seamless blend with your base hair color.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"vertical-align: top;\"><strong>Step 3:</strong></td>\r\n<td>Expert toning and color refinement to achieve the perfect balance and desired tone.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"vertical-align: top;\"><strong>Step 4:</strong></td>\r\n<td>Final styling and personalized tips to help you maintain and enhance your highlights between appointments.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"font-size: 20px; color: #8c593b; text-align: center;\">Ready to enhance your look with beautiful highlights? <strong>Book your Women Hair Highlights appointment today</strong> and let our skilled stylists create a captivating and personalized look that complements your style.</p>\r\n</div>', '[\"public\\/uploads\\/services\\/1688639909_d685a646121ea07f044e.jpg\",\"public\\/uploads\\/services\\/1688639909_79d68e4608b284fa0324.jpg\",\"public\\/uploads\\/services\\/1688639909_ff9643f16da3ef0c948c.jpg\",\"public\\/uploads\\/services\\/1688639909_49747f04a5e90c0c2e2b.jpg\",\"public\\/uploads\\/services\\/1688639909_65505a565e06675f9883.jpg\",\"public\\/uploads\\/services\\/1688639909_60de92caaeaab1300557.jpg\",\"public\\/uploads\\/services\\/1688639909_fe3bbcfcbc06b78d3a22.jpg\"]', '', '', '1', '1', 1),
(87, 273, 265, 'included', 12, 0, 'Women Hair Bleaching', 'women-hair-bleaching', 'Transform your look with our expert Women Hair Bleaching service, offering stunning results and versatile styling options.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1667891926_99b338f6f687fb30a988.jpg', 50, 35, 1, '60', 0, 0, 0, 0, '', 2, 1, 1, '2022-11-08 07:16:18', '2025-03-26 13:44:06', '<div style=\"background-color: #f9f9f9; padding: 10px;\">\r\n<h2 style=\"font-size: 20px; color: #333;\">Transform Your Look with Women Hair Bleaching</h2>\r\n<p style=\"font-size: 14px; color: #666;\">Discover the power of a radiant and bold transformation through our Women Hair Bleaching service. Our skilled stylists will artfully lighten your hair, opening doors to a world of stunning styling options.</p>\r\n<h3 style=\"font-size: 20px; color: #333;\">Why Choose Our Women Hair Bleaching Service?</h3>\r\n<ul style=\"font-size: 14px; color: #666; margin-left: 20px;\">\r\n<li>Expert stylists with advanced bleaching techniques</li>\r\n<li>Top-quality bleaching products for impeccable results</li>\r\n<li>Customized shades to accentuate your features and style</li>\r\n<li>Versatile options including sun-kissed highlights and platinum blondes</li>\r\n<li>Nourishing treatments for soft, manageable, and radiant hair</li>\r\n<li>Comfortable and enjoyable salon experience</li>\r\n</ul>\r\n<h3 style=\"font-size: 20px; color: #333;\">The Women Hair Bleaching Process</h3>\r\n<table style=\"font-size: 14px; color: #666; margin-bottom: 30px;\">\r\n<tbody>\r\n<tr>\r\n<td><strong>Step 1:</strong></td>\r\n<td>Consultation with our expert stylists to understand your goals and recommend the ideal bleaching technique and shade.</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Step 2:</strong></td>\r\n<td>Careful application of top-quality bleaching products to achieve even and consistent results.</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Step 3:</strong></td>\r\n<td>Nourishing treatments to maintain the health and vitality of your hair during and after the bleaching process.</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Step 4:</strong></td>\r\n<td>Expert styling to showcase your new, radiant look.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"font-size: 14px; color: #666;\">Ready to embrace a stunning new look? Book your Women Hair Bleaching appointment today and embark on a transformative journey with our skilled stylists.</p>\r\n</div>', '[\"public\\/uploads\\/services\\/1688639723_944ae0508f475ee99d7a.jpg\",\"public\\/uploads\\/services\\/1688639723_0625c9d940a28e6b714e.jpg\",\"public\\/uploads\\/services\\/1688639723_4ebbef31c60156e38c51.jpg\",\"public\\/uploads\\/services\\/1688639723_ef86cc0284fcfd2e60c9.jpg\",\"public\\/uploads\\/services\\/1688639723_1834ab6acad3fff42a8b.jpg\",\"public\\/uploads\\/services\\/1688639723_a87d1e5b7791a9e1acd0.jpg\",\"public\\/uploads\\/services\\/1688639723_030ba14b0782b3124db4.jpg\"]', '', '', '1', '1', 1),
(88, 273, 265, 'included', 11, 0, 'Men Hair Colouring', 'men-hair-colouring', 'Enhance your style with our range of customized hair coloring options tailored to your preferences and delivered by our skilled colorists.', 'Colouring,salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1667892292_e03f3051b26c78faeddc.jpg', 50, 45, 1, '60', 0, 0, 0, 0, '', 1, 1, 1, '2022-11-08 07:20:21', '2025-03-26 13:44:06', '<div style=\"text-align: center; background-color: #f5f5f5; padding: 40px;\">\r\n<h2 style=\"font-size: 20px; color: #333; margin-bottom: 20px;\">Revitalize Your Look with Men Hair Coloring</h2>\r\n<p style=\"font-size: 14px; color: #666; margin-bottom: 30px;\">Unleash your style and confidence with our expert Men Hair Coloring service. Whether you want to enhance your natural hair color, experiment with trendy shades, or cover those stubborn grays, our skilled colorists are here to help you achieve the perfect look.</p>\r\n<p style=\"font-size: 14px; color: #666; margin-bottom: 30px;\">At our salon, we understand that hair coloring is an art form. We use premium hair color products that deliver vibrant and long-lasting results while maintaining the health and integrity of your hair. Our experienced colorists will carefully assess your hair type, skin tone, and personal style to recommend the most suitable color options.</p>\r\n<p style=\"font-size: 14px; color: #666; margin-bottom: 30px;\">From subtle highlights to bold transformations, our range of coloring techniques and shades ensures we can create a customized look tailored to your preferences. Whether you\'re looking for a natural sun-kissed effect, a sophisticated blend of hues, or a striking fashion color, our colorists have the expertise to bring your vision to life.</p>\r\n<p style=\"font-size: 14px; color: #666; margin-bottom: 30px;\">During your hair coloring session, we prioritize your comfort and satisfaction. Our salon provides a relaxed and inviting atmosphere where you can unwind and enjoy a personalized coloring experience. Our colorists will take the time to consult with you, answer any questions, and ensure that you leave our salon feeling confident and thrilled with your new hair color.</p>\r\n<p style=\"font-size: 14px; color: #666; margin-bottom: 30px;\">Ready to transform your look? Book your Men Hair Coloring appointment today and let our talented colorists create a hair color that perfectly reflects your individuality and style.</p>\r\n</div>', '[\"public\\/uploads\\/services\\/1688639599_721268f847863f541255.jpg\",\"public\\/uploads\\/services\\/1688639599_44de71d0fa7a53240178.jpg\",\"public\\/uploads\\/services\\/1688639599_67ef31972b69f7a12b9b.jpg\",\"public\\/uploads\\/services\\/1688639599_28a4479926c73f91cb2d.jpg\"]', '', '', '1', '1', 1),
(89, 273, 265, 'included', 10, 0, 'Beard Shave/Trim', 'beard-shave/trim', 'Achieve the perfect beard style with our expert Beard Shave/Trim service.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1667892126_495e84c035a92eaae85c.jpg', 40, 28, 1, '30', 0, 0, 0, 0, '', 1, 1, 1, '2022-11-08 07:22:06', '2025-03-26 13:44:06', '<h1 style=\"text-align: center; color: #ff6f61;\">Beard Shave/Trim Service</h1>\r\n<div style=\"display: flex; justify-content: center; align-items: center; flex-direction: column; margin-top: 20px;\"><img style=\"width: 300px; height: auto;\" src=\"https://edemand.wrteam.me/public/uploads/services/1688638693_d789a8179f650ce0e5db.jpg\" alt=\"Beard Shave/Trim\" />\r\n<p style=\"font-size: 18px; color: #444; text-align: center; margin-top: 20px;\">Are you looking for a professional beard grooming experience? Our Beard Shave/Trim service is here to meet your needs. Whether you prefer a clean shave or a well-groomed trim, our expert barbers will provide exceptional service to give you the perfect beard style.</p>\r\n</div>\r\n<h2 style=\"text-align: center; color: #ff6f61;\">Service Details</h2>\r\n<ul style=\"font-size: 16px; color: #555; margin: 0 auto; max-width: 500px;\">\r\n<li>Expert beard trimming and shaping</li>\r\n<li>Precision shaving for a clean and smooth finish</li>\r\n<li>Personalized grooming advice from experienced barbers</li>\r\n<li>Use of high-quality grooming products</li>\r\n<li>Relaxing and comfortable atmosphere</li>\r\n</ul>', '[\"public\\/uploads\\/services\\/1688638693_d789a8179f650ce0e5db.jpg\",\"public\\/uploads\\/services\\/1688638693_e8e61175e1262dac990f.jpg\",\"public\\/uploads\\/services\\/1688638693_2384f2aec994e7baa8d9.jpg\",\"public\\/uploads\\/services\\/1688638693_3356255c3859140f0aaa.jpg\",\"public\\/uploads\\/services\\/1688638693_faf04edaf8a03d38ba25.jpg\",\"public\\/uploads\\/services\\/1688638693_10a72e60c49e328bda2e.jpg\",\"public\\/uploads\\/services\\/1688638693_662646133a94665d4dbf.jpg\"]', '', '', '1', '1', 1);
INSERT INTO `services` (`id`, `user_id`, `category_id`, `tax_type`, `tax_id`, `tax`, `title`, `slug`, `description`, `tags`, `image`, `price`, `discounted_price`, `number_of_members_required`, `duration`, `rating`, `number_of_ratings`, `on_site_allowed`, `is_cancelable`, `cancelable_till`, `max_quantity_allowed`, `is_pay_later_allowed`, `status`, `created_at`, `updated_at`, `long_description`, `other_images`, `files`, `faqs`, `at_store`, `at_doorstep`, `approved_by_admin`) VALUES
(90, 273, 268, 'included', 12, 0, 'Beard Coloring', 'beard-coloring', 'Transform your look with our professional Beard Coloring service.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1667892389_7b917ec2a29fc844a3b3.jpg', 50, 40, 1, '30', 0, 0, 0, 0, '', 2, 1, 1, '2022-11-08 07:26:29', '2025-03-26 13:44:06', '<div style=\"flex: 0 0 100%; max-width: 100%; padding-right: 20px;\">\r\n<h2 style=\"color: #3498db; font-size: 28px; margin-bottom: 10px;\">Beard Color Transformation</h2>\r\n<p style=\"font-size: 16px; color: #666; margin-bottom: 20px;\">Unleash your style and redefine your beard with our professional Beard Coloring service. Experience a dramatic transformation as we enhance your beard\'s color, adding depth and dimension to your overall look.</p>\r\n<h3 style=\"color: #3498db; font-size: 20px; margin-bottom: 15px;\">Why Choose Our Beard Coloring:</h3>\r\n<ul style=\"text-align: left; font-size: 16px; color: #333; margin-bottom: 30px;\">\r\n<li>Customized color selection to match your preferences</li>\r\n<li>Precision application for a natural-looking result</li>\r\n<li>Long-lasting and fade-resistant formula</li>\r\n<li>Professional expertise for a seamless color blend</li>\r\n<li>Enhances your facial features and complements your style</li>\r\n<li>Boosts confidence with a groomed and vibrant beard</li>\r\n</ul>\r\n<p style=\"font-size: 16px; color: #666;\">Step into our salon and let our skilled professionals work their magic, transforming your beard into a statement of style. Embrace the power of color and discover a new level of confidence with our Beard Coloring service.</p>\r\n</div>\r\n<div style=\"flex: 0 0 50%; max-width: 50%;\"><img style=\"width: 100%; height: auto; border-radius: 8px;\" src=\"https://edemand.wrteam.me/public/uploads/services/1688638375_d03a5020877533172655.jpg\" alt=\"Beard Coloring\" /></div>', '[\"public\\/uploads\\/services\\/1688638375_8baaed693c7db508c3a2.jpg\",\"public\\/uploads\\/services\\/1688638375_0826b8974301c1d2787a.jpg\",\"public\\/uploads\\/services\\/1688638375_bfde90c394694c6944e3.jpg\",\"public\\/uploads\\/services\\/1688638375_d03a5020877533172655.jpg\"]', '', '', '0', '0', 1),
(92, 273, 265, 'included', 9, 0, 'Pedicure', 'pedicure', 'Indulge in a luxurious and rejuvenating pedicure experience at our salon. Our expert nail technicians are dedicated to providing exceptional care for your feet, leaving you feeling refreshed, relaxed, and ready to put your best foot forward.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1667892614_b4ad74ceb8b93add51d7.jpg', 50, 30, 1, '60', 0, 0, 0, 0, '', 2, 1, 1, '2022-11-08 07:28:49', '2025-03-26 13:44:06', '<div style=\"background-color: #f8f8f8; padding: 20px; text-align: center;\">\r\n<h2 style=\"color: #ff69b4; font-size: 28px; margin-bottom: 10px;\">Pedicure Bliss</h2>\r\n<p style=\"font-size: 16px; color: #666; margin-bottom: 20px;\">Step into relaxation and rejuvenation with our signature Pedicure experience. Treat your feet to the ultimate pampering session, leaving them feeling refreshed, revitalized, and ready to conquer the world.</p>\r\n<div style=\"display: flex; justify-content: center; align-items: center; margin-bottom: 30px;\"><img style=\"width: 300px; height: auto; border-radius: 8px;\" src=\"https://edemand.wrteam.me/public/uploads/services/1688638061_d795c7b1f27dab9cb540.jpg\" alt=\"Pedicure\" /></div>\r\n<h3 style=\"color: #ff69b4; font-size: 20px; margin-bottom: 15px;\">Key Features of our Pedicure:</h3>\r\n<ul style=\"text-align: left; font-size: 16px; color: #333; margin-bottom: 30px;\">\r\n<li>Exquisite nail shaping and cuticle care</li>\r\n<li>Revitalizing foot soak with aromatic oils</li>\r\n<li>Gentle exfoliation to remove dry skin</li>\r\n<li>Hydrating foot and leg massage</li>\r\n<li>Callus removal for soft and smooth heels</li>\r\n<li>Choice of premium nail polish or natural buffing</li>\r\n<li>Relaxing hot towel wrap</li>\r\n<li>Finishing touch with a glossy topcoat</li>\r\n</ul>\r\n<p style=\"font-size: 16px; color: #666;\">Experience pure bliss as our expert technicians work their magic, leaving your feet feeling pampered, restored, and ready to step out in style. Treat yourself to the ultimate Pedicure indulgence today!</p>\r\n<div style=\"margin-top: 30px;\">&nbsp;</div>\r\n</div>', '[\"public\\/uploads\\/services\\/1688638061_d795c7b1f27dab9cb540.jpg\",\"public\\/uploads\\/services\\/1688638061_b1016c75f4d17ffcd083.jpg\",\"public\\/uploads\\/services\\/1688638061_9c2188ac9ac1c35d3d5f.jpg\",\"public\\/uploads\\/services\\/1688638061_fc9508c22bbdeeed23cf.jpg\",\"public\\/uploads\\/services\\/1688638061_fdc3295f1d98746a2234.jpg\",\"public\\/uploads\\/services\\/1688638061_7c1b3fbd33a3081b279e.jpg\",\"public\\/uploads\\/services\\/1688638061_9c495c5dc899fe763db7.jpg\"]', '', '', '1', '1', 1),
(93, 273, 265, 'included', 10, 0, 'Manicure and Pedicure', 'manicure-and-pedicure', 'Indulge in a relaxing and rejuvenating experience for your hands and feet with our specialized Menicure and Pedicure service. Our expert nail technicians provide meticulous care and attention, leaving your nails looking clean, well-groomed, and stylish.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1667892603_34bf6a93bbd0f004f5bf.jpg', 100, 60, 1, '100', 0, 0, 0, 0, '', 1, 1, 1, '2022-11-08 07:30:03', '2025-03-26 13:44:06', '<h2 style=\"color: #ff69b4; text-align: center; font-size: 24px;\">Menicure and Pedicure</h2>\r\n<p style=\"text-align: center; font-size: 16px;\">Transform your hands and feet with our rejuvenating Menicure and Pedicure service, leaving them perfectly groomed and stylish.</p>\r\n<div style=\"display: flex; justify-content: space-around; margin-bottom: 20px;\">\r\n<div>\r\n<h3 style=\"color: #ff69b4; text-align: center; font-size: 20px;\">Menicure</h3>\r\n<img style=\"width: 200px; height: auto; display: block; margin: 0px auto 10px auto;\" src=\"https://edemand.wrteam.me/public/uploads/services/1688638088_dfb99934f594b6ff70ce.jpg\" alt=\"Menicure\" />\r\n<ul>\r\n<li style=\"list-style-type: disc;\">Nail shaping and filing</li>\r\n<li style=\"list-style-type: disc;\">Cuticle care</li>\r\n<li style=\"list-style-type: disc;\">Hand massage</li>\r\n<li style=\"list-style-type: disc;\">Optional nail buffing or clear polish</li>\r\n</ul>\r\n</div>\r\n<div>\r\n<h3 style=\"color: #ff69b4; text-align: center; font-size: 20px;\">Pedicure</h3>\r\n<img style=\"width: 200px; height: auto; display: block; margin: 0px auto 10px auto;\" src=\"https://edemand.wrteam.me/public/uploads/services/1688638088_a4d079245b25216750a3.jpg\" alt=\"Pedicure\" />\r\n<ul>\r\n<li style=\"list-style-type: disc;\">Nail trimming and shaping</li>\r\n<li style=\"list-style-type: disc;\">Cuticle care</li>\r\n<li style=\"list-style-type: disc;\">Callus removal</li>\r\n<li style=\"list-style-type: disc;\">Exfoliation and moisturization</li>\r\n<li style=\"list-style-type: disc;\">Foot and leg massage</li>\r\n<li style=\"list-style-type: disc;\">Optional nail polish application</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<p style=\"text-align: center; font-size: 16px;\">Treat yourself to a Menicure and Pedicure session and experience the benefits of well-groomed hands and feet. Whether you\'re looking for a professional appearance or simply some self-care and relaxation, our skilled technicians are here to provide exceptional service tailored to your needs.</p>\r\n<p>&nbsp;</p>', '[\"public\\/uploads\\/services\\/1688638088_eb106fbb6f82cc381903.jpg\",\"public\\/uploads\\/services\\/1688638088_dfb99934f594b6ff70ce.jpg\",\"public\\/uploads\\/services\\/1688638088_591c6d4af3f9784cc15d.jpg\",\"public\\/uploads\\/services\\/1688638088_2279c6464de7d0aa080a.jpg\",\"public\\/uploads\\/services\\/1688638088_a4d079245b25216750a3.jpg\",\"public\\/uploads\\/services\\/1688638088_d60c356e096f7a876f68.jpg\",\"public\\/uploads\\/services\\/1688638088_6d80933d1f9d4a05b2c7.jpg\"]', '', '', '1', '1', 1),
(94, 273, 265, 'included', 0, 0, 'Men\'s Face Scrub', 'men\'s-face-scrub', 'Elevate your skincare routine with our invigorating Men\'s Face Scrub. Specially formulated for men\'s skin, this scrub exfoliates, cleanses, and rejuvenates, leaving your skin feeling refreshed, smooth, and revitalized.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1667893302_41229dbcd6b6cb17d5b3.jpg', 60, 48, 1, '60', 0, 0, 0, 0, '', 2, 1, 1, '2022-11-08 07:36:31', '2025-03-26 13:44:06', '<div>\r\n<h3>Key Benefits of Our Men\'s Face Scrub:</h3>\r\n<table style=\"width: 100%; border-collapse: separate; border-spacing: 0 10px;\">\r\n<tbody>\r\n<tr>\r\n<th style=\"width: 30%; padding: 10px; text-align: left; background-color: #ffc107; color: #fff; font-weight: bold;\">Benefits</th>\r\n<th style=\"padding: 10px; text-align: left;\">Description</th>\r\n</tr>\r\n<tr>\r\n<td style=\"padding: 10px; text-align: left; background-color: #ffc107; color: #fff; font-weight: bold;\">Deep Cleansing</td>\r\n<td style=\"padding: 10px; text-align: left;\">Effectively removes dirt, oil, and impurities from your skin, leaving it clean and refreshed.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"padding: 10px; text-align: left; background-color: #ffc107; color: #fff; font-weight: bold;\">Exfoliation</td>\r\n<td style=\"padding: 10px; text-align: left;\">Gently exfoliates dead skin cells, revealing a smoother and brighter complexion.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"padding: 10px; text-align: left; background-color: #ffc107; color: #fff; font-weight: bold;\">Prevents Ingrown Hairs</td>\r\n<td style=\"padding: 10px; text-align: left;\">Helps prevent and reduce ingrown hairs by clearing clogged pores and facilitating proper hair growth.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"padding: 10px; text-align: left; background-color: #ffc107; color: #fff; font-weight: bold;\">Revitalizes Skin</td>\r\n<td style=\"padding: 10px; text-align: left;\">Stimulates blood circulation, promoting a healthy and energized appearance.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"padding: 10px; text-align: left; background-color: #ffc107; color: #fff; font-weight: bold;\">Smooths Texture</td>\r\n<td style=\"padding: 10px; text-align: left;\">Refines skin texture and helps minimize the appearance of roughness or uneven skin tone.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<p>&nbsp;</p>', '[\"public\\/uploads\\/services\\/1688637581_cc3fa3a6b181b7af81d4.jpg\",\"public\\/uploads\\/services\\/1688637581_5384870835c61c762ec9.jpg\",\"public\\/uploads\\/services\\/1688637581_b130a33e5c50fe251b21.jpg\",\"public\\/uploads\\/services\\/1688637581_37b4ceefc81159f3025c.jpg\",\"public\\/uploads\\/services\\/1688637581_7a4f9c4900ab5b1a5f6c.jpg\",\"public\\/uploads\\/services\\/1688637581_d560d917b6023d9258de.jpg\",\"public\\/uploads\\/services\\/1688637581_9ed85390641ac300059e.jpg\"]', '', '[[\"What is a full facial service?\",\"Our full facial service is a comprehensive skincare treatment that targets multiple skin concerns. It typically includes cleansing, exfoliation, steam, extractions, facial massage, mask application, and moisturization, tailored to your specific needs.\"],[\"How often should I get a full facial?\",\"The frequency of full facial treatments depends on your skin type, concerns, and personal preference. As a general guideline, monthly facials are recommended to maintain optimal skin health and address ongoing skincare needs.\"],[\"What are the benefits of a full facial service?\",\"Our full facial service offers numerous benefits, including deep cleansing, removal of dead skin cells, improved circulation, hydration, and relaxation. It helps promote healthy, glowing skin while addressing specific concerns like acne, dullness, or aging.\"],[\"Is the full facial suitable for all skin types?\",\"Yes, our skilled estheticians customize the full facial service based on your skin type and concerns. Whether you have dry, oily, sensitive, or combination skin, our professionals will tailor the treatment to deliver the best results while ensuring your comfort.\"],[\"Are the products used in the facial treatment suitable for my skin?\",\"Absolutely! We use high-quality skincare products formulated to address various skin types and concerns. Our estheticians will assess your skin during the consultation and select products that are gentle, effective, and suitable for your unique needs.\"],[\"Will I experience any discomfort during the facial treatment?\",\"Our goal is to provide a relaxing and rejuvenating experience. While certain steps, such as extractions, may cause slight discomfort, our estheticians are trained to minimize any discomfort and ensure your overall comfort throughout the treatment.\"],[\"Can I wear makeup after a full facial?\",\"It is generally recommended to avoid applying makeup immediately after a facial to allow your skin to breathe and fully benefit from the treatment. However, if you need to wear makeup, our estheticians can provide guidance on suitable products and techniques.\"]]', '1', '1', 1),
(95, 273, 265, 'included', 0, 0, 'Express Facial', 'express-facial', '\"Indulge in the ultimate pampering experience with our luxurious full facial service. Reveal your natural radiance as our skilled estheticians rejuvenate your skin, leaving you with a refreshed, glowing complexion that turns heads.\"', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1667893243_6688caf86010cacdb429.jpg', 50, 40, 1, '60', 0, 0, 0, 0, '', 1, 1, 1, '2022-11-08 07:40:43', '2025-03-26 13:44:06', '<h2><span style=\"font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Oxygen, Ubuntu, Cantarell, \'Open Sans\', \'Helvetica Neue\', sans-serif;\">Our Women Full Facial Process:</span></h2>\r\n<table style=\"width: 100%; border-collapse: collapse;\">\r\n<tbody>\r\n<tr>\r\n<th style=\"width: 25%; padding: 10px; text-align: left; background-color: #ffc107; font-weight: bold;\">Step</th>\r\n<th style=\"padding: 10px; text-align: left;\">Description</th>\r\n</tr>\r\n<tr>\r\n<td style=\"padding: 10px; text-align: left; background-color: #ffc107; font-weight: bold;\">1</td>\r\n<td style=\"padding: 10px; text-align: left;\">Consultation: Begin with a personalized consultation to understand your skincare goals, concerns, and preferences.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"padding: 10px; text-align: left; background-color: #ffc107; font-weight: bold;\">2</td>\r\n<td style=\"padding: 10px; text-align: left;\">Deep Cleansing: Thoroughly cleanse your skin to remove impurities, excess oil, and makeup, creating a fresh canvas for the facial.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"padding: 10px; text-align: left; background-color: #ffc107; font-weight: bold;\">3</td>\r\n<td style=\"padding: 10px; text-align: left;\">Exfoliation: Gently exfoliate to eliminate dead skin cells, revealing a smoother and more radiant complexion.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"padding: 10px; text-align: left; background-color: #ffc107; font-weight: bold;\">4</td>\r\n<td style=\"padding: 10px; text-align: left;\">Steam and Extractions: Enjoy the relaxing steam treatment, followed by gentle extractions to unclog pores and remove blackheads or whiteheads.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"padding: 10px; text-align: left; background-color: #ffc107; font-weight: bold;\">5</td>\r\n<td style=\"padding: 10px; text-align: left;\">Facial Massage: Experience a soothing facial massage that stimulates circulation, relaxes facial muscles, and promotes a sense of well-being.</td>\r\n</tr>\r\n</tbody>\r\n</table>', '[\"public\\/uploads\\/services\\/1688637399_0aa8f71226ae11476088.jpg\",\"public\\/uploads\\/services\\/1688637399_cebe5b414870a70cf65f.jpg\",\"public\\/uploads\\/services\\/1688637399_4ab68287cd12c154e108.jpg\",\"public\\/uploads\\/services\\/1688637399_e80dfcefcf4b4e1f29d0.jpg\",\"public\\/uploads\\/services\\/1688637399_4eff991da0eea18d0ebb.jpg\",\"public\\/uploads\\/services\\/1688637399_349b4e2b9761e2c71dbb.jpg\",\"public\\/uploads\\/services\\/1688637399_ea329afff684fb93dcde.jpg\"]', '', '[[\"What is a full facial service?\",\"Our full facial service is a comprehensive skincare treatment that targets multiple skin concerns. It typically includes cleansing, exfoliation, steam, extractions, facial massage, mask application, and moisturization, tailored to your specific needs.\"],[\"How often should I get a full facial?\",\"The frequency of full facial treatments depends on your skin type, concerns, and personal preference. As a general guideline, monthly facials are recommended to maintain optimal skin health and address ongoing skincare needs.\"],[\"What are the benefits of a full facial service?\",\"Our full facial service offers numerous benefits, including deep cleansing, removal of dead skin cells, improved circulation, hydration, and relaxation. It helps promote healthy, glowing skin while addressing specific concerns like acne, dullness, or aging.\"],[\"Is the full facial suitable for all skin types?\",\"Yes, our skilled estheticians customize the full facial service based on your skin type and concerns. Whether you have dry, oily, sensitive, or combination skin, our professionals will tailor the treatment to deliver the best results while ensuring your comfort.\"],[\"Are the products used in the facial treatment suitable for my skin?\",\"Absolutely! We use high-quality skincare products formulated to address various skin types and concerns. Our estheticians will assess your skin during the consultation and select products that are gentle, effective, and suitable for your unique needs.\"],[\"Will I experience any discomfort during the facial treatment?\",\"Our goal is to provide a relaxing and rejuvenating experience. While certain steps, such as extractions, may cause slight discomfort, our estheticians are trained to minimize any discomfort and ensure your overall comfort throughout the treatment.\"],[\"Can I wear makeup after a full facial?\",\"It is generally recommended to avoid applying makeup immediately after a facial to allow your skin to breathe and fully benefit from the treatment. However, if you need to wear makeup, our estheticians can provide guidance on suitable products and techniques.\"]]', '1', '1', 1),
(96, 273, 265, 'included', 10, 0, 'Women Full Facial', 'women-full-facial', 'Indulge in the ultimate pampering experience with our Women Full Facial. Designed to rejuvenate your skin and enhance your natural beauty, our expert estheticians provide personalized care tailored to your unique needs.', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1688558801_e3643515a8005ed0a9b2.jpg', 60, 48, 1, '60', 0, 0, 1, 0, '', 1, 1, 1, '2022-11-08 07:43:18', '2025-03-26 13:44:06', '<h2><span style=\"font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Oxygen, Ubuntu, Cantarell, \'Open Sans\', \'Helvetica Neue\', sans-serif;\">Our Women Full Facial Process:</span></h2>\r\n<table style=\"width: 100%; border-collapse: collapse;\">\r\n<tbody>\r\n<tr>\r\n<th style=\"width: 25%; padding: 10px; text-align: left; background-color: #ffc107; font-weight: bold;\">Step</th>\r\n<th style=\"padding: 10px; text-align: left;\">Description</th>\r\n</tr>\r\n<tr>\r\n<td style=\"padding: 10px; text-align: left; background-color: #ffc107; font-weight: bold;\">1</td>\r\n<td style=\"padding: 10px; text-align: left;\">Consultation: Begin with a personalized consultation to understand your skincare goals, concerns, and preferences.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"padding: 10px; text-align: left; background-color: #ffc107; font-weight: bold;\">2</td>\r\n<td style=\"padding: 10px; text-align: left;\">Deep Cleansing: Thoroughly cleanse your skin to remove impurities, excess oil, and makeup, creating a fresh canvas for the facial.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"padding: 10px; text-align: left; background-color: #ffc107; font-weight: bold;\">3</td>\r\n<td style=\"padding: 10px; text-align: left;\">Exfoliation: Gently exfoliate to eliminate dead skin cells, revealing a smoother and more radiant complexion.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"padding: 10px; text-align: left; background-color: #ffc107; font-weight: bold;\">4</td>\r\n<td style=\"padding: 10px; text-align: left;\">Steam and Extractions: Enjoy the relaxing steam treatment, followed by gentle extractions to unclog pores and remove blackheads or whiteheads.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"padding: 10px; text-align: left; background-color: #ffc107; font-weight: bold;\">5</td>\r\n<td style=\"padding: 10px; text-align: left;\">Facial Massage: Experience a soothing facial massage that stimulates circulation, relaxes facial muscles, and promotes a sense of well-being.</td>\r\n</tr>\r\n</tbody>\r\n</table>', '[\"public\\/uploads\\/services\\/1688637266_0a7e6820624689ce3670.jpg\",\"public\\/uploads\\/services\\/1688637266_53e7c2a8924f10fe6cf5.jpg\",\"public\\/uploads\\/services\\/1688637266_9bcc6f0ae4eacca0688e.jpg\",\"public\\/uploads\\/services\\/1688637266_6a39b168503c12cad762.jpg\",\"public\\/uploads\\/services\\/1688637266_9910dd4a7512536a940f.jpg\",\"public\\/uploads\\/services\\/1688637266_8c67b3ac032d4a6b6c1c.jpg\",\"public\\/uploads\\/services\\/1688637266_241f72c794b30d4ddae9.jpg\"]', '', '[[\"What is a full facial service?\",\"Our full facial service is a comprehensive skincare treatment that targets multiple skin concerns. It typically includes cleansing, exfoliation, steam, extractions, facial massage, mask application, and moisturization, tailored to your specific needs.\"],[\"How often should I get a full facial?\",\"The frequency of full facial treatments depends on your skin type, concerns, and personal preference. As a general guideline, monthly facials are recommended to maintain optimal skin health and address ongoing skincare needs.\"],[\"What are the benefits of a full facial service?\",\"Our full facial service offers numerous benefits, including deep cleansing, removal of dead skin cells, improved circulation, hydration, and relaxation. It helps promote healthy, glowing skin while addressing specific concerns like acne, dullness, or aging.\"],[\"Is the full facial suitable for all skin types?\",\"Yes, our skilled estheticians customize the full facial service based on your skin type and concerns. Whether you have dry, oily, sensitive, or combination skin, our professionals will tailor the treatment to deliver the best results while ensuring your comfort.\"],[\"Are the products used in the facial treatment suitable for my skin?\",\"Absolutely! We use high-quality skincare products formulated to address various skin types and concerns. Our estheticians will assess your skin during the consultation and select products that are gentle, effective, and suitable for your unique needs.\"],[\"Will I experience any discomfort during the facial treatment?\",\"Our goal is to provide a relaxing and rejuvenating experience. While certain steps, such as extractions, may cause slight discomfort, our estheticians are trained to minimize any discomfort and ensure your overall comfort throughout the treatment.\"],[\"Can I wear makeup after a full facial?\",\"It is generally recommended to avoid applying makeup immediately after a facial to allow your skin to breathe and fully benefit from the treatment. However, if you need to wear makeup, our estheticians can provide guidance on suitable products and techniques.\"]]', '1', '1', 1),
(97, 283, 270, 'included', 6, 0, 'Kitchen Cabinets', 'kitchen-cabinets', 'Kitchen Cabinets Trained and certified carpenters with hassle-free Kitchen Cabinets service', 'kitchen,cabinets,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667967738_2d302847b6e446d30687.jpg', 200, 120, 2, '30', 5, 7, 1, 0, '', 10, 1, 1, '2022-11-08 11:06:51', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(98, 283, 270, 'included', 15, 0, 'Wardrobe Cupboard', 'wardrobe-cupboard', 'Wardrobe Cupboard Trained and certified carpenters with hassle-free Wardrobe Cupboard service', 'wardrobe,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667968094_88fca954e8199b514805.jpg', 250, 200, 5, '2880', 5, 5, 1, 0, '', 9, 1, 1, '2022-11-09 04:28:14', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(99, 283, 270, 'included', 14, 0, 'Reception Counter', 'reception-counter', 'Reception Counter Trained and certified carpenters with hassle-free Reception Counter service', 'reception,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667968226_6e4c74c5c78851a70ca2.jpg', 300, 240, 5, '300', 5, 10, 1, 0, '', 9, 1, 1, '2022-11-09 04:30:26', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(100, 283, 270, 'included', 11, 0, 'Shelves installation', 'shelves-installation', 'Kitchen Cabinets Trained and certified carpenters with hassle-free Kitchen Cabinets service', 'shelves,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667968560_97cb980a42ae258d401c.jpg', 250, 200, 5, '300', 5, 10, 1, 0, '', 9, 1, 1, '2022-11-09 04:36:00', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(101, 283, 270, 'included', 10, 0, 'Wooden Table', 'wooden-table', 'Wooden Table Trained and certified carpenters with hassle-free Wooden Table service', 'carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667968857_2a2fa2222584fb7c62db.jpg', 250, 200, 5, '2880', 5, 10, 1, 1, '2880', 5, 1, 1, '2022-11-09 04:40:57', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(102, 283, 270, 'included', 7, 0, 'Wooden Flooring', 'wooden-flooring', 'Wooden Flooring Trained and certified carpenters with hassle-free Wooden Flooring service', 'wooden,flooring,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667968989_c7c8a73f86a23a52eba2.jpg', 300, 240, 5, '2880', 5, 10, 1, 0, '', 5, 1, 1, '2022-11-09 04:43:09', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(103, 283, 270, 'included', 12, 0, 'Kitchen & Bathroom Renovation', 'kitchen-&-bathroom-renovation', 'Kitchen & Bathroom Renovation Trained and certified carpenters with hassle-free Kitchen & Bathroom Renovation service', 'kitchen,bathroom,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667969305_15a5779819d1d513df26.jpg', 300, 240, 5, '3000', 5, 10, 0, 0, '', 9, 1, 1, '2022-11-09 04:48:25', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(104, 283, 270, 'included', 9, 0, 'Office Renovation', 'office-renovation', 'Office Renovation Trained and certified carpenters with hassle-free Office Renovation service', 'Office,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667969415_804d734db569352cb631.jpg', 300, 210, 5, '5760', 5, 3, 0, 0, '', 6, 1, 1, '2022-11-09 04:50:15', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(105, 283, 270, 'included', 10, 0, 'Shop Renovation', 'shop-renovation', 'Shop Renovation Trained and certified carpenters with hassle-free Shop Renovation service', 'Shop,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667969617_e154bc04a5e3ceba64c6.jpg', 350, 280, 5, '2880', 5, 10, 1, 0, '', 6, 1, 1, '2022-11-09 04:53:37', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(106, 283, 270, 'included', 12, 0, 'Glass Partition', 'glass-partition', 'Glass Partition Trained and certified carpenters with hassle-free Glass Partition service', 'Glass,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667971795_3daf16ea1ed47e4fcb3d.jpg', 350, 245, 6, '2880', 5, 10, 1, 0, '', 9, 1, 1, '2022-11-09 05:29:55', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(107, 260, 270, 'included', 9, 0, 'TV Installation', 'tv-installation', 'TV Installation Trained and certified carpenters with hassle-free TV Installation service', 'TV,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667971901_1ee8644d6b298e3f7c7c.jpg', 200, 140, 5, '480', 0, 0, 1, 0, '', 9, 1, 1, '2022-11-09 05:31:41', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(108, 283, 270, 'included', 7, 0, 'Drawer Installation', 'drawer-installation', 'Drawer Installation Trained and certified carpenters with hassle-free Drawer Installation service', 'Drawer,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667971959_22e3c03daafe8276e9e1.jpg', 150, 105, 2, '120', 5, 10, 0, 0, '', 3, 1, 1, '2022-11-09 05:32:39', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(109, 283, 270, 'included', 11, 0, 'Door Installation', 'door-installation', 'Door Installation Trained and certified carpenters with hassle-free Door Installation service', 'Door,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667972038_44f3121b4ebd7a473a9d.jpg', 300, 270, 3, '480', 5, 10, 1, 0, '', 4, 1, 1, '2022-11-09 05:33:58', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(110, 283, 270, 'included', 12, 0, 'Furniture Repair', 'furniture-repair', 'Furniture Repair Trained and certified carpenters with hassle-free Furniture Repair service', 'Furniture,carpentry,woodworking,carpenter,woodwork,wood,design,woodworker,interiordesign,renovation', 'public/uploads/services/1667972090_ae6494b629a0a3d93b2e.jpg', 200, 100, 3, '480', 5, 10, 0, 0, '', 5, 1, 1, '2022-11-09 05:34:50', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(111, 297, 246, 'included', 7, 0, 'General Pest Control', 'general-pest-control', 'General Pest is also pose a serious threat to health. To treat this problem of pests, you can get in touch with a reputed Pest Control Company.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests', 'public/uploads/services/1667973335_baf355118aba7e8825a2.jpg', 60, 54, 3, '120', 5, 10, 1, 0, '', 4, 1, 1, '2022-11-09 05:55:35', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(112, 297, 246, 'included', 9, 0, 'Termite Control', 'termite-control', 'Termite is also pose a serious threat to health. To treat this problem of pests, you can get in touch with a reputed Pest Control Company.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests', 'public/uploads/services/1667973444_466d5fb8494c50ce1a70.jpg', 50, 40, 3, '180', 5, 10, 1, 0, '', 4, 1, 1, '2022-11-09 05:57:24', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(113, 297, 250, 'included', 10, 0, 'Bed Bugs Control', 'bed-bugs-control', 'Bed Bugs is also pose a serious threat to health. To treat this problem of pests, you can get in touch with a reputed Pest Control Company.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests', 'public/uploads/services/1667973610_7de914ec2e5e6a89d7c2.jpg', 80, 64, 3, '300', 5, 10, 1, 0, '', 6, 1, 1, '2022-11-09 06:00:10', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(114, 297, 249, 'included', 10, 0, 'Cockroach Control', 'cockroach-control', 'Cockroach is also pose a serious threat to health. To treat this problem of pests, you can get in touch with a reputed Pest Control Company.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests', 'public/uploads/services/1667973678_4dab164563d459b3ccf2.jpg', 70, 63, 2, '180', 5, 10, 1, 0, '', 3, 1, 1, '2022-11-09 06:01:18', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(115, 297, 248, 'included', 10, 0, 'Rodents/Mice/Rat Control', 'rodents/mice/rat-control', 'Rodents Mice Rat is also pose a serious threat to health. To treat this problem of pests, you can get in touch with a reputed Pest Control Company.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests', 'public/uploads/services/1667973741_c56a9fd2897103bd6a67.jpg', 60, 54, 2, '120', 5, 10, 0, 0, '', 6, 1, 1, '2022-11-09 06:02:21', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(116, 297, 251, 'included', 9, 0, 'Ants Control', 'ants-control', 'Ants is also pose a serious threat to health. To treat this problem of pests, you can get in touch with a reputed Pest Control Company.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests', 'public/uploads/services/1667973812_ffc6322b2e910786e9ae.jpg', 60, 54, 3, '120', 5, 10, 0, 0, '', 3, 1, 1, '2022-11-09 06:03:32', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(117, 297, 246, 'included', 7, 0, 'Snakes Catching', 'snakes-catching', 'Snakes is also pose a serious threat to health. To treat this problem of pests, you can get in touch with a reputed Pest Control Company.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests', 'public/uploads/services/1667974017_d2a73e6fc15444e02c93.jpg', 80, 72, 2, '30', 5, 10, 1, 0, '', 3, 1, 1, '2022-11-09 06:06:57', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(118, 297, 246, 'included', 10, 0, 'Bee Hive Removal', 'bee-hive-removal', 'Bee Hive is also pose a serious threat to health. To treat this problem of pests, you can get in touch with a reputed Pest Control Company.', 'Bee Hive Removal,pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests', 'public/uploads/services/1667974142_a51ad1075d38b4e2ba14.jpg', 70, 56, 3, '60', 5, 10, 1, 0, '', 3, 1, 1, '2022-11-09 06:09:02', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(132, 263, 240, 'included', 0, 0, 'Tap repair ', 'tap-repair-', 'Clients remember Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Tap repair,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667984710_60711076fd98a6b864af.jpg', 400, 320, 2, '60', 0, 0, 0, 0, '', 3, 1, 1, '2022-11-09 09:05:10', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(133, 298, 240, 'included', 0, 10, 'Tap installation', 'tap-installation', 'Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Tap installation,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667984836_a552c71721a88aebf150.jpg', 300, 240, 2, '60', 5, 10, 0, 0, '', 2, 1, 1, '2022-11-09 09:07:16', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(134, 298, 240, 'included', 0, 10, 'Tap replacement', 'tap-replacement', 'Clients remember Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Tap replacement,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667984986_e879da5413a38943e119.jpg', 300, 210, 1, '60', 5, 10, 1, 0, '', 1, 1, 1, '2022-11-09 09:09:46', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(135, 298, 240, 'included', 0, 10, 'Hot & cold water mixer Tap installation', 'hot-&-cold-water-mixer-tap-installation', 'Clients remember Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Tap,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667985118_eb8f80dc48df8bf4f7b6.jpg', 300, 240, 1, '60', 5, 10, 1, 0, '', 1, 1, 1, '2022-11-09 09:11:58', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(136, 298, 240, 'included', 0, 10, 'Pipeline leakage repair', 'pipeline-leakage-repair', 'Clients remember Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Pipeline,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667985185_1e6c3ae985b1815fde42.jpg', 100, 90, 1, '60', 5, 1, 0, 0, '', 2, 1, 1, '2022-11-09 09:13:05', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(137, 298, 240, 'included', 0, 10, 'Jet Spray Installation/Repair ', 'jet-spray-installation/repair-', 'Clients remember Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Spray,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667985243_f42f0f5beb38fda0f738.jpg', 200, 180, 1, '60', 5, 10, 0, 0, '', 2, 1, 1, '2022-11-09 09:14:03', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(138, 298, 240, 'included', 0, 10, 'Flush tank repair ', 'flush-tank-repair-', 'Clients remember Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Flush tank,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667985408_98429a39a56545840a91.jpg', 200, 160, 1, '90', 5, 10, 1, 0, '', 2, 1, 1, '2022-11-09 09:16:48', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(139, 298, 242, 'included', 0, 10, 'Shower installation (ceiling mounted)', 'shower-installation-(ceiling-mounted)', 'Shower installation Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Shower,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet', 'public/uploads/services/1667985607_1553b55dc38b3687818b.jpg', 200, 160, 1, '90', 5, 10, 1, 0, '', 2, 1, 1, '2022-11-09 09:20:07', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(140, 298, 241, 'included', 0, 10, 'Drainage pipe blockage removal', 'drainage-pipe-blockage-removal', 'Drainage pipe blockage removal Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Drainage pipe,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667985675_aa01dd0798d13d278323.jpg', 300, 210, 3, '120', 5, 10, 0, 0, '', 5, 1, 1, '2022-11-09 09:21:15', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(141, 298, 240, 'included', 0, 10, 'Western toilet installation (floor mounted)', 'western-toilet-installation-(floor-mounted)', 'Western toilet installation Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'toilet,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,shower', 'public/uploads/services/1667985777_7ad9eb207c90ad20d53d.jpg', 300, 240, 2, '120', 5, 10, 1, 0, '', 3, 1, 1, '2022-11-09 09:22:57', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(142, 298, 240, 'included', 0, 10, 'Western toilet repair (floor mounted)', 'western-toilet-repair-(floor-mounted)', 'Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Western toilet,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667985882_2ca4452a7b954cb1d621.jpg', 200, 180, 2, '60', 5, 10, 0, 1, '30', 3, 1, 1, '2022-11-09 09:24:42', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(143, 301, 221, 'included', 0, 10, 'Ac Installation-Uninstallation Service', 'ac-installation-uninstallation-service', 'AC Installation and Un-installation, for new as well as old Air conditioners', 'airconditioning,heating,airconditioner,cooling,airconditioninginstallation,service', 'public/uploads/services/1667988701_e257ec9edc3da3eb0628.jpg', 350, 280, 2, '120', 5, 2, 1, 0, '', 5, 1, 1, '2022-11-09 10:11:41', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(144, 301, 221, 'included', 0, 10, 'Ac Repair & Maintance Service', 'ac-repair-&-maintance-service', 'We, at Flew Air conditioning solution Provide Service Repair and Maintenance for multiple Types of Air conditioner (AC) like,', 'airconditioning,heating,airconditioner,cooling,airconditioninginstallation,service,Ac Repair,Maintance Service', 'public/uploads/services/1667988846_4f3ad09ee98ae1398503.jpg', 200, 120, 2, '120', 5, 3, 1, 0, '', 3, 1, 1, '2022-11-09 10:14:06', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(146, 301, 221, 'included', 0, 10, 'Ac Wash Service', 'ac-wash-service', 'We are offering Ac Wash OR Water Jet Wash service for multiple Types of Air conditioner (AC) like', 'Ac Wash Service,airconditioning,heating,airconditioner,cooling,airconditioninginstallation,service', 'public/uploads/services/1667989010_6fc127853cb3cfacd909.jpg', 200, 160, 1, '60', 5, 10, 0, 0, '', 2, 1, 1, '2022-11-09 10:16:50', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(152, 293, 213, 'included', 0, 0, 'Kitchen Cleaning', 'kitchen-cleaning', 'House cleaners perform thorough cleanings of houses using cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,Kitchen Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning', 'public/uploads/services/1667989553_8489bebca5831eedd304.jpg', 500, 400, 4, '120', 0, 0, 0, 0, '', 5, 1, 1, '2022-11-09 10:25:53', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(153, 297, 246, 'included', 0, 0, 'General Pest Control', 'general-pest-control', 'General Pest is also pose a serious threat to health. To treat this problem of pests, you can get in touch with a reputed Pest Control Company.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests', 'public/uploads/services/1667990002_802852d46960b911a446.jpg', 200, 180, 2, '60', 0, 0, 0, 0, '', 2, 1, 1, '2022-11-09 10:33:22', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1);
INSERT INTO `services` (`id`, `user_id`, `category_id`, `tax_type`, `tax_id`, `tax`, `title`, `slug`, `description`, `tags`, `image`, `price`, `discounted_price`, `number_of_members_required`, `duration`, `rating`, `number_of_ratings`, `on_site_allowed`, `is_cancelable`, `cancelable_till`, `max_quantity_allowed`, `is_pay_later_allowed`, `status`, `created_at`, `updated_at`, `long_description`, `other_images`, `files`, `faqs`, `at_store`, `at_doorstep`, `approved_by_admin`) VALUES
(154, 273, 267, 'included', 0, 0, 'Haircut', 'haircut', '\"Unlock a new level of style with our expert haircut service. Step into our salon and let our talented hairstylists create a look that reflects your unique personality and leaves you feeling confident and fabulous.\"', 'salon,hair,beauty,haircut,hairstylist,haircolor,hairstyles,hairstyle,makeup,spa', 'public/uploads/services/1667990160_2cb73070807d5799e1fd.jpg', 60, 54, 1, '30', 0, 0, 0, 0, '', 2, 1, 1, '2022-11-09 10:36:00', '2025-03-26 13:44:06', '<p><strong>About the Process</strong></p>\r\n<table style=\"border-collapse: collapse; width: 100.073%;\" border=\"0\" cellspacing=\"5\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 3.67502%; text-align: left; vertical-align: middle;\"><img src=\"https://i.imgur.com/Db1VbId.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%; text-align: left; vertical-align: middle;\"><strong>Consultation</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">\r\n<p>Our hairstylist will begin by having a consultation with you to understand your desired haircut, style preferences, and any specific requests you may have.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/IbcdHaj.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Hair Preparation</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">Next, your hair will be prepared for the haircut. This may involve washing and conditioning your hair, or it can be done on dry hair depending on your preference and the style you\'re aiming for.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/pALt5jG.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Cutting Technique</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">Using professional cutting tools and techniques, our skilled hairstylist will carefully trim and shape your hair according to the agreed-upon style. They will ensure precision and attention to detail, making adjustments as needed to achieve the desired look.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/KWuKAfQ.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Styling and Finishing</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">Once the haircut is complete, your hairstylist will style your hair to showcase the haircut\'s full potential. This may involve blow-drying, using styling products, and adding any finishing touches to create the desired final look.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/AUcAJvU.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Guidance and Maintenance Tips</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">To help you maintain your haircut at home, your hairstylist will provide you with guidance on styling techniques, recommended products, and any specific care instructions to keep your hair looking its best until your next visit.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 3.67502%;\"><img src=\"https://i.imgur.com/r3cS0GK.png\" alt=\"\" width=\"25\" height=\"25\" /></td>\r\n<td style=\"width: 96.3261%;\"><strong>Client Satisfaction</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%;\" colspan=\"2\">Throughout the process, our hairstylist will ensure your satisfaction by actively listening to your feedback and addressing any concerns or requests you may have. Your happiness and confidence in your new haircut are our top priorities.</td>\r\n</tr>\r\n</tbody>\r\n</table>', '[\"public\\/uploads\\/services\\/1688636862_d12f843149c9350bf8cc.jpg\",\"public\\/uploads\\/services\\/1688636862_780879eab43ae577a73d.jpg\",\"public\\/uploads\\/services\\/1688636862_c2d6af0cf3d49fbb2e10.jpg\",\"public\\/uploads\\/services\\/1688636862_327749eddd96681c07e1.jpg\",\"public\\/uploads\\/services\\/1688636862_393a7ddb697ae73afa0c.jpg\",\"public\\/uploads\\/services\\/1688636862_baddf7b8af9910d4e7fa.jpg\",\"public\\/uploads\\/services\\/1688636862_938b075c33625beddeae.jpg\"]', '', '[[\"How do I choose the right haircut for me?\",\"Our experienced hairstylists are here to guide you. They will consider your face shape, hair texture, lifestyle, and personal preferences to help you select a haircut that complements your features and suits your individual style.\"],[\"Do I need to come with a specific haircut idea in mind?\",\"Not at all! Our hairstylists are skilled in providing personalized recommendations. Feel free to discuss your preferences and hair goals, and they will suggest suitable options tailored to enhance your unique look.\"],[\"Can I bring a photo of a haircut I like?\",\"Absolutely! Visual references can be helpful in communicating your desired haircut. Show our hairstylists any inspiration photos you have, and they will work with you to achieve a similar look that suits your hair type and face shape.\"],[\"What if I want to change my hairstyle significantly?\",\"Our hairstylists love creating transformative looks! Discuss your desire for a significant change during the consultation, and they will provide expert advice and recommendations to ensure a successful and stunning transformation.\"],[\" Can you provide haircare tips for maintaining my new haircut at home?\",\"Absolutely! Our hairstylists are more than happy to share professional tips and advice on how to maintain and style your haircut at home. They will recommend suitable products and techniques to keep your hair looking its best.\"],[\"What safety measures do you have in place?\",\"Your safety is our priority. We maintain strict hygiene and sanitation protocols in our salon, including regular disinfection, sanitization of tools, and adherence to social distancing guidelines. Rest assured, you can enjoy your haircut experience in a clean and safe environment.\"]]', '1', '1', 1),
(157, 298, 240, 'included', 0, 0, 'Tap repair ', 'tap-repair-', 'Clients remember Plumhelp Plumbing for the professional service we deliver, the quality plumbing solutions we offer and the exceptional workmanship delivered on each and every job by our knowledgeable and efficient teams', 'Tap repair,plumbing,plumber,plumbinglife,plumbers,drains,boiler,sewer,plumbingwork,plumbingservice,pipes,toilet,shower', 'public/uploads/services/1667990728_dd28bf1fec8c7a3ea84d.jpg', 100, 90, 1, '60', 0, 0, 0, 0, '', 1, 1, 1, '2022-11-09 10:45:28', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(159, 303, 236, 'included', 0, 0, 'Dry Cleaning', 'dry-cleaning', 'Laundry Tag provide a durable means to read garments automatically without a line-of-sight for multiple wash cycles.', 'Dry Cleaning,Premium Laundry,Steam Ironing,Laundry', 'public/uploads/services/1667992529_cb976ee3f08f89b3b2e0.jpg', 200, 180, 1, '120', 0, 0, 0, 1, '30', 2, 1, 1, '2022-11-09 11:15:29', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(160, 303, 235, 'included', 17, 0, 'Premium Laundry', 'premium-laundry', 'Some of the key particulars that might be present in a laundry tag include - customer name, order number, service', 'Premium Laundry,Laundry,drycleaning', 'public/uploads/services/1667993161_a210a3f35a6a88d33b98.jpg', 200, 160, 2, '160', 0, 0, 0, 1, '30', 20, 1, 1, '2022-11-09 11:26:01', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(161, 303, 222, 'included', 0, 0, 'Steam Ironing', 'steam-ironing', 'Popular Laundry Services in Bhuj', 'Steam Ironing,Dry cleaning,laundry,laundry service', 'public/uploads/services/1667993388_ba7e61b79aef22990b23.jpg', 200, 180, 2, '120', 5, 10, 0, 0, '', 2, 1, 1, '2022-11-09 11:29:48', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(166, 293, 215, 'included', 0, 0, 'Room Cleaning', 'room-cleaning', 'room cleaning ', 'window,Bad,washroom,cleaning,badshit cleaning', 'public/uploads/services/1668495327_25ccf7925bb841b1ce1a.jpg', 200, 160, 1, '60', 5, 10, 0, 0, '', 2, 1, 1, '2022-11-15 05:35:01', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(167, 327, 253, 'included', 12, 0, 'Outdoor Lighting', 'outdoor-lighting', 'Outdoor lighting', 'outdoor lighting,lighting,electric lighting', 'public/uploads/services/1668492807_6994fd53d848e72afd16.jpg', 100, 60, 2, '60', 0, 0, 0, 1, '30', 2, 1, 1, '2022-11-15 06:13:27', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(168, 327, 254, 'included', 0, 0, 'Fan installation', 'fan-installation', 'fan installation and best work ', 'fan,fan installation,ceiling fan', 'public/uploads/services/1668494551_68e96b953a9098ddc1ab.jpg', 100, 90, 1, '30', 5, 10, 0, 0, '', 3, 1, 1, '2022-11-15 06:42:31', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(169, 293, 216, 'included', 12, 0, 'Window cleaning', 'window-cleaning', '\"See the world through crystal-clear windows! Our professional window cleaning service leaves your glass sparkling, giving you a clear view and a brighter home.\"', 'window cleaning,room window,kitchen window cleaning', 'public/uploads/services/1668495264_c78d04d785708a8d4d43.jpg', 100, 85, 2, '60', 0, 0, 0, 0, '', 5, 1, 1, '2022-11-15 06:54:24', '2025-03-26 13:44:06', '<p><img src=\"https://img.freepik.com/free-vector/residential-windows-cleaning-service-illustration_1284-59083.jpg?w=2000&amp;t=st=1688543969~exp=1688544569~hmac=4de065ffebb41890af242f02b41c97b888d42985b101d8749331352cd0e9000f\" alt=\"\" width=\"2000\" height=\"893\" /></p>\r\n<p>&nbsp;</p>\r\n<table style=\"border-collapse: collapse; width: 100.073%;\" border=\"0\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 100.001%; text-align: center; vertical-align: middle;\" colspan=\"2\"><strong>Thorough Cleaning</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 49.9272%;\"><img src=\"https://img.freepik.com/free-photo/man-cleaning-windows_23-2148119221.jpg?w=1480&amp;t=st=1688543757~exp=1688544357~hmac=4382c4f03fb8e9b7c8e66f07c42235ffdb86db76ee519eff75a1194de723001c\" alt=\"\" width=\"200\" height=\"200\" /></td>\r\n<td style=\"width: 50.074%;\">\r\n<p style=\"color: grey; font-size: 8;\">Our highly trained technicians meticulously clean each window, paying attention to every detail. From removing dirt, fingerprints, and smudges to tackling stubborn stains, we leave no trace behind.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%; text-align: center; vertical-align: middle;\" colspan=\"2\"><strong>Streak-Free Brilliance</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 49.9272%;\"><img src=\"https://img.freepik.com/free-photo/people-housework-housekeeping-concept-happy-woman-gloves-cleaning-window-with-rag-cleanser-spray-home_231208-575.jpg?w=1800&amp;t=st=1688542612~exp=1688543212~hmac=6b34ff862ec876fa61ad9a361994f63ce07310e5da5ac422d5346386467c65cc\" alt=\"\" width=\"200\" height=\"200\" /></td>\r\n<td style=\"width: 50.074%;\">\r\n<p style=\"color: grey; font-size: 8;\">Say goodbye to streaks and haze. We use professional-grade tools and techniques to ensure a streak-free shine, providing you with crystal-clear windows that let in abundant natural light.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%; text-align: center; vertical-align: middle;\" colspan=\"2\"><strong>Multi-Surface Expertise</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 49.9272%;\"><img src=\"https://img.freepik.com/free-photo/full-shot-people-cleaning-office_23-2150454557.jpg?w=826&amp;t=st=1688543698~exp=1688544298~hmac=6bd605fec7c1b0530aebdb321c0016f9ff9e9805ec3c6859e4c641f9f97de10c\" alt=\"\" width=\"200\" height=\"200\" /></td>\r\n<td style=\"width: 50.074%;\">\r\n<p style=\"color: grey; font-size: 8;\">Our expertise extends beyond standard glass windows. We clean various window types, including skylights, glass doors, French windows, and more, restoring their beauty and clarity.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100.001%; text-align: center; vertical-align: middle;\" colspan=\"2\"><strong>Hard-to-Reach Areas:</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 49.9272%;\"><img src=\"https://img.freepik.com/free-photo/workers-washing-windows-office-building_1153-4658.jpg?w=1800&amp;t=st=1688543657~exp=1688544257~hmac=de084038556effee0b863a270209c561f4ad8f363b77e336305ccaa98a87e802\" alt=\"\" width=\"200\" height=\"200\" /></td>\r\n<td style=\"width: 50.074%;\">\r\n<p style=\"color: grey; font-size: 8;\">No window is too high or inaccessible for us. Our team is equipped with the right tools and expertise to clean windows in high-rise buildings or other challenging locations, ensuring all windows are immaculate.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>', '[\"public\\/uploads\\/services\\/1688551164_8d7d4e31d731abc01f2f.jpg\",\"public\\/uploads\\/services\\/1688551164_afd13fb4916da3d523fc.jpg\",\"public\\/uploads\\/services\\/1688551164_2b091bef5b6b379fabc5.jpg\",\"public\\/uploads\\/services\\/1688551164_353d2e204929b4adaeed.jpg\",\"public\\/uploads\\/services\\/1688551164_bb9adab1cec4174ed253.jpg\",\"public\\/uploads\\/services\\/1688551164_20b56c64d94962f0e8c9.jpg\",\"public\\/uploads\\/services\\/1688551164_64ddc49f85b07bd627df.jpg\"]', '', '[[\"How often should I have my windows professionally cleaned?\",\"Regular window cleaning is recommended every six months to a year, depending on your location, weather conditions, and personal preference.\"],[\"Will you clean both the interior and exterior of my windows?\",\"Yes, our comprehensive window cleaning service covers both the inside and outside of your windows, ensuring a thorough and streak-free shine.\"],[\"What cleaning methods do you use for windows?\",\"We utilize a combination of industry-leading techniques, including eco-friendly cleaning solutions, professional-grade squeegees, and careful hand detailing to achieve exceptional results.\"],[\"Can you clean hard-to-reach windows or high-rise buildings?\",\"Absolutely! Our trained professionals are equipped to handle various window cleaning challenges, including hard-to-reach windows, skylights, and even high-rise buildings, utilizing safe and efficient access methods.\"],[\"Will your cleaning products harm my window frames or surroundings?\",\"We take great care to protect your window frames, sills, and surrounding areas. Our cleaning products are specifically chosen to be safe for your windows while effectively removing dirt and grime.\"]]', '1', '1', 1),
(170, 293, 217, 'included', 0, 0, 'Best washroom cleaning', 'best-washroom-cleaning', 'Blah Blah', 'washroom', 'public/uploads/services/1668495811_5dc02daf5851d12c38c0.jpg', 200, 140, 1, '159', 5, 10, 1, 0, '', 5, 1, 1, '2022-11-15 07:03:31', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(171, 297, 247, 'included', 0, 0, 'Mosquitoes/Flies Control', 'mosquitoes/flies-control', 'Mosquitoes is also pose a serious threat to health. To treat this problem of pests, you can get in touch with a reputed Pest Control Company.', 'pestcontrol,pestcontrolservice,pest,termitecontrol,pestmanagement,bedbugs,bugs,insects,termites,pests', 'public/uploads/services/1668497597_adee1ab8dd3c8a41727c.jpg', 150, 120, 2, '30', 5, 10, 0, 0, '', 5, 1, 1, '2022-11-15 07:33:17', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(186, 270, 259, 'included', 12, 0, 'Carwash service ', 'carwash-service-', 'demo services description ', 'carwash', 'public/uploads/services/1681216669_56e59e19bdb11c176091.jpg', 300, 210, 30, '120', 0, 0, 0, 1, '30', 30, 1, 1, '2023-02-25 13:39:41', '2025-03-26 13:44:06', '<hr style=\"height: 1px; border-width: 0; color: gray;\" />\r\n<p><strong><br />When you choose our car wash service, you can expect the following benefits:</strong></p>\r\n<table style=\"border-collapse: collapse; width: 100.072%; margin-left: auto; margin-right: auto;\" border=\"0\" cellspacing=\"5\" cellpadding=\"10\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 100%;\"><strong>Impeccable Cleanliness:</strong> Our meticulous approach ensures that every inch of your vehicle is thoroughly cleaned, leaving no dirt, grime, or smudges behind. Your car will shine like new.</td>\r\n<td style=\"width: 50%;\"><img src=\"https://img.freepik.com/free-photo/man-wash-car-using-shampoo_1150-6986.jpg?w=2000&amp;t=st=1688538303~exp=1688538903~hmac=b760b70b1ff373bc465cdff69d7e1fdad6556ceed8c59df2e86ca9cbdd09dc47\" alt=\"\" width=\"200\" height=\"200\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\"><img src=\"https://img.freepik.com/free-photo/man-washing-his-car-garage_1157-26072.jpg?w=2000&amp;t=st=1688538587~exp=1688539187~hmac=1920c467ba9fcf6885af0326db2a7bd1fb6d58a9c436ce68405edc585a77daa2\" alt=\"\" width=\"200\" height=\"200\" /></td>\r\n<td style=\"width: 100%;\"><strong>Attention to Detail:</strong> Our skilled professionals pay close attention to even the smallest details, ensuring that every nook and cranny is meticulously cleaned. We leave no spot untouched.</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 100%;\"><strong>Premium Products and Techniques:</strong> We use top-quality products and employ cutting-edge techniques to deliver outstanding results. Your vehicle will receive the best treatment available.</td>\r\n<td style=\"width: 50%;\"><img src=\"https://img.freepik.com/free-vector/car-care-product-advertising-poster-with-bottle-high-quality-automobile-wax-luxury-class-sedan-realistic_1284-31735.jpg?w=2000&amp;t=st=1688538627~exp=1688539227~hmac=a067aaf58613686f7c2f816031f2360c570c286dc25f7e33d3aa0f5440c35a1c\" alt=\"\" width=\"200\" height=\"200\" /></td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 50%;\"><img src=\"https://img.freepik.com/free-photo/man-polish-car-garage_1157-26061.jpg?w=2000&amp;t=st=1688538707~exp=1688539307~hmac=00594ca1f711f50e148c622b01381f91ff59a45d6dc8e581790b14bf2770661e\" alt=\"\" width=\"200\" height=\"200\" /></td>\r\n<td style=\"width: 100%;\"><strong>Protection for Your Paintwork:</strong> Our car wash service not only cleans your vehicle but also helps protect its paintwork. We take care to use gentle methods that won\'t harm the finish of your car.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<hr style=\"height: 1px; border-width: 0; color: gray;\" />\r\n<p><img src=\"https://img.freepik.com/free-vector/car-wash-service-icons-set_1284-13386.jpg?w=1380&amp;t=st=1688539426~exp=1688540026~hmac=32a499d2b9163eb1879b763fc2c5958cccd372ce3b47ae681101949a4fec58e5\" alt=\"\" width=\"1380\" height=\"1380\" /></p>\r\n<hr style=\"height: 1px; border-width: 0; color: gray;\" />', '[\"public\\/uploads\\/services\\/1688540367_c4144b0607b78f7c857e.jpg\",\"public\\/uploads\\/services\\/1688540367_aabf8b8fcc48fe493157.jpg\",\"public\\/uploads\\/services\\/1688540367_c73d72db0f0799c2d606.jpg\",\"public\\/uploads\\/services\\/1688540367_21f99a7be637cdc94c37.jpg\",\"public\\/uploads\\/services\\/1688540367_b0ec87681c1f6857c853.jpg\",\"public\\/uploads\\/services\\/1688540367_0ea658d0b63d5c8b4c28.jpg\",\"public\\/uploads\\/services\\/1688540367_7cb901fd7af04b0d8c8e.jpg\"]', '[\"public\\/uploads\\/services\\/car-spa-wash-brochure.pdf\"]', '[[\"How often should I get my car washed?\",\"The frequency of car washes depends on various factors such as your location, driving conditions, and personal preferences. As a general guideline, it is recommended to wash your car every two weeks to maintain its cleanliness and protect the paintwork.\"],[\"Are your car wash products safe for my vehicle?\",\"Yes, we prioritize the use of high-quality and safe car wash products. Our cleaning agents are specifically formulated to be gentle on your vehicle\'s paintwork, leaving no harm or residue behind. We take utmost care to protect and maintain the integrity of your vehicle during the cleaning process.\"],[\"Can I remain in my car during the car wash?\",\"For safety reasons, it is generally recommended that customers exit their vehicles during the car wash process. Our car wash facility is designed to accommodate customers comfortably while their vehicles are being cleaned. You can relax in our waiting area and enjoy complimentary amenities while we take care of your car.\"],[\"Can you remove stubborn stains or odors from the interior of my car?\",\"Yes, we offer interior cleaning services that target stains, spills, and odors. Our skilled team uses specialized cleaning techniques and products to tackle various interior issues. However, please note that the complete removal of certain stains or odors may depend on their severity and the type of material affected.\"]]', '1', '1', 1),
(188, 293, 270, 'included', 12, 0, 'Ceiling Fan cleaning', 'ceiling-fan-cleaning', '\"Revitalize your ceiling fan with our expert cleaning service, restoring its performance and leaving it dust-free and sparkling.\"', 'Fan cleaning', 'public/uploads/services/1678440084_41c4481c262e17a1ed6a.jpg', 500, 450, 2, '50', 0, 0, 0, 0, '', 5, 1, 1, '2023-03-10 09:21:24', '2025-03-26 13:44:06', '<table style=\"border-collapse: collapse; width: 100.072%; height: 530.555px; border-style: dashed;\" border=\"0\" cellspacing=\"0\" cellpadding=\"1\">\r\n<tbody>\r\n<tr style=\"height: 44.7969px;\">\r\n<td style=\"width: 97.8053%; height: 44.7969px;\"><strong>Sparkling Clean Blades:</strong> Bid farewell to layers of dust and grime. Our skilled technicians will meticulously clean every blade, leaving them spotless and gleaming.</td>\r\n</tr>\r\n<tr style=\"height: 17.5px;\">\r\n<td style=\"height: 17.5px;\"><hr style=\"height: 0.5px; border-width: 100%; color: gray;\" /></td>\r\n</tr>\r\n<tr style=\"height: 67.1875px;\">\r\n<td style=\"width: 97.8053%; height: 67.1875px;\"><strong>Enhanced Performance:</strong> A clean ceiling fan operates more efficiently, ensuring better airflow and improved cooling in your space. Experience the full potential of your fan\'s performance.</td>\r\n</tr>\r\n<tr style=\"height: 17.5px;\">\r\n<td style=\"height: 17.5px;\"><hr style=\"height: 0.5px; border-width: 100%; color: gray;\" /></td>\r\n</tr>\r\n<tr style=\"height: 67.1953px;\">\r\n<td style=\"width: 97.8053%; height: 67.1953px;\"><strong>Fresher Indoor Air:</strong> Dust and allergens can accumulate on ceiling fan blades, leading to poor air quality. Our thorough cleaning removes these particles, helping you breathe cleaner, fresher air.</td>\r\n</tr>\r\n<tr style=\"height: 17.5px;\">\r\n<td style=\"height: 17.5px;\"><hr style=\"height: 0.5px; border-width: 100%; color: gray;\" /></td>\r\n</tr>\r\n<tr style=\"height: 67.1953px;\">\r\n<td style=\"width: 97.8053%; height: 67.1953px;\"><strong>Quieter Operation:</strong> Dust build-up on fan blades can cause annoying squeaks or rattles. Our cleaning service eliminates dirt and debris, resulting in a quieter and more peaceful fan operation.</td>\r\n</tr>\r\n<tr style=\"height: 17.5px;\">\r\n<td style=\"height: 17.5px;\"><hr style=\"height: 0.5px; border-width: 100%; color: gray;\" /></td>\r\n</tr>\r\n<tr style=\"height: 67.1953px;\">\r\n<td style=\"width: 97.8053%; height: 67.1953px;\"><strong>Professional Expertise:</strong> Our experienced technicians possess the knowledge and tools to clean even the most hard-to-reach fans safely. Leave the ladder climbing to us and enjoy hassle-free cleaning.</td>\r\n</tr>\r\n<tr style=\"height: 17.5px;\">\r\n<td style=\"height: 17.5px;\"><hr style=\"height: 0.5px; border-width: 100%; color: gray;\" /></td>\r\n</tr>\r\n<tr style=\"height: 67.1875px;\">\r\n<td style=\"width: 97.8053%; height: 67.1875px;\"><strong>Protecting Your Space:</strong> We take extra care to safeguard your furniture and floors during the cleaning process. Our team utilizes protective coverings to ensure no mess is left behind.</td>\r\n</tr>\r\n<tr style=\"height: 17.5px;\">\r\n<td style=\"height: 17.5px;\"><hr style=\"height: 0.5px; border-width: 100%; color: gray;\" /></td>\r\n</tr>\r\n<tr style=\"height: 44.7969px;\">\r\n<td style=\"width: 97.8053%; height: 44.7969px;\"><strong>Time-Efficient Service:</strong> We value your time, and our efficient team strives to complete the cleaning promptly, minimizing any disruption to your daily routine.</td>\r\n</tr>\r\n</tbody>\r\n</table>', '', '', '[[\"Is your ceiling fan covered in dust and grime?\",\"Say goodbye to dusty blades with our professional ceiling fan cleaning service!\"],[\"Why should I clean my ceiling fan regularly?\",\"Regular cleaning ensures optimal performance, eliminates allergens, and maintains a clean and fresh environment.\"],[\"How do you clean hard-to-reach ceiling fans?\",\"Our skilled technicians have the tools and expertise to safely clean even the highest and most inaccessible ceiling fans.\"],[\"Will cleaning my ceiling fan make it run smoother and quieter?\",\"Absolutely! By removing dirt and debris, we enhance your fan\'s performance, \"],[\"Can a dirty ceiling fan affect the air quality in my home?\",\"Yes, accumulated dust and allergens on the fan blades can be circulated back into the air you breathe. Our cleaning service helps maintain a healthier indoor environment.\"]]', '1', '1', 1),
(217, 50, 252, 'included', 9, 0, 'Festive Lights installations', 'festive-lights-installations', 'Installation of festive lights', 'lights,festival', 'public/uploads/services/1683700067_c19d13e06e183df54ee5.jpg', 100, 70, 5, '30', 4.5245901639344, 61, 0, 1, '300000', 10, 1, 1, '2023-03-14 11:16:34', '2025-04-22 21:44:42', '', '', '', '', '1', '1', 1),
(218, 50, 252, 'included', 9, 0, 'Geyser Installation', 'geyser-installation', 'Installation Of Geyser', 'Geyser,Installation', 'public/uploads/services/1681216644_365559e5ac42355a4174.jpg', 250, 200, 12, '30', 4.5, 58, 0, 1, '30', 30, 1, 1, '2023-03-14 11:18:29', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(219, 50, 221, 'included', 12, 0, 'AC switchbox Installation', 'ac-switchbox-installation', 'Installation of one AC switch box', 'AC,switch,installation', 'public/uploads/services/1681216596_c9c93aa54bef44a100aa.jpg', 400, 320, 20, '60', 4.5272727272727, 55, 0, 1, '30', 10, 1, 1, '2023-03-14 11:20:58', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(220, 50, 252, 'included', 9, 0, 'Switchboard Repair', 'switchboard-repair', 'When your switchboard is causing electrical disruptions or malfunctioning, our professional Switchboard Repair Service is here to restore the power and keep your electrical system running smoothly. We understand the frustration that arises from flickering lights, tripping circuits, or faulty switches. With our expertise, we swiftly diagnose and repair issues with your switchboard, ensuring safety and optimal functionality. Whether it\'s a faulty circuit breaker, damaged wiring, or a need for an upgrade, our skilled technicians will provide reliable solutions. Trust us to handle your switchboard repairs efficiently, so you can enjoy a safe and uninterrupted power supply.', 'repair,switchboard', 'public/uploads/services/1681216554_1e86ba39c02990669efb.jpg', 150, 105, 2, '2', 4.5263157894737, 57, 0, 1, '30', 120, 1, 1, '2023-03-14 11:22:54', '2025-03-26 13:44:06', '', '', '', '{\"1\":[\"Why is my switchboard malfunctioning?\",\"Switchboards can malfunction due to various reasons, such as overloaded circuits, faulty wiring, loose connections, or damaged components. Our technicians can identify the specific issue and provide the necessary repairs.\"],\"2\":[\"What are the signs that indicate a problem with my switchboard?\",\"Signs of switchboard issues include frequent tripping of circuit breakers, flickering lights, burning smells, buzzing sounds, or outlets not functioning. If you notice any of these signs, it\'s important to seek professional switchboard repairs.\"],\"3\":[\"Is it dangerous to have a faulty switchboard?\",\"Yes, a faulty switchboard can pose serious safety risks, including electrical shocks, fires, or damage to electrical appliances. It\'s crucial to address switchboard issues promptly by seeking professional repair services.\"],\"4\":[\"How long does switchboard repair typically take?\",\"The duration of switchboard repairs depends on the complexity of the issue. Simple repairs can be completed relatively quickly, while more extensive repairs or upgrades may require additional time. Our technicians work efficiently to minimize any inconvenience caused.\"]}', '1', '1', 1),
(221, 50, 252, 'included', 12, 0, 'Fan repair', 'fan-repair', 'Is your fan not working as it should? Don\'t sweat it! Our professional Fan Repairing Service is here to keep you cool and comfortable. With our expertise and swift repairs, we\'ll have your fan spinning again in no time. Whether it\'s a faulty motor, malfunctioning switch, or wiring issue, our skilled technicians will diagnose and fix the problem efficiently. Say goodbye to sleepless nights or stuffy rooms. Experience the breeze of relief with our reliable Fan Repairing Service.', 'fan,repair', 'public/uploads/services/1681216503_808c4dc166a9e61fac4f.jpg', 200, 180, 2, '120', 4.5178571428571, 56, 0, 1, '30', 1, 1, 1, '2023-03-14 11:25:09', '2025-03-26 13:44:06', '', '', '', '[[\"How do I know if my fan needs repair?\",\"Signs that your fan may need repair include slow or erratic spinning, unusual noises, complete fan failure, or issues with the fan\'s controls. If you notice any of these signs, it\'s best to seek professional repair services.\"],[\"How long does fan repair usually take?\",\"The duration of fan repair depends on the specific issue and the availability of replacement parts, if needed. Simple repairs can often be completed within a short time, while more complex issues may require additional time for diagnostics and repairs.\"],[\"Should I attempt to repair the fan myself?\",\"Fan repair involves electrical components and can be dangerous if you lack the necessary expertise. It\'s recommended to leave fan repairs to professional technicians who have the knowledge and experience to handle electrical repairs safely.\"]]', '1', '1', 1),
(222, 50, 252, 'included', 12, 0, 'MCB fuse replacement', 'mcb-fuse-replacement', 'Upgrade your electrical safety with our professional MCB fuse replacement service. Ensure reliable circuit protection and peace of mind.', 'MCB,fuse,replacement', 'public/uploads/services/1680947082_339c8e3764a7cce54c09.jpg', 150, 120, 2, '50', 4.5084745762712, 59, 0, 1, '45', 25, 1, 1, '2023-03-14 11:26:59', '2025-03-30 11:11:55', '', '[\"public\\/uploads\\/services\\/1687870769_30a4b440c963a29978a8.jpg\"]', '[\"public\\/uploads\\/services\\/How-it-Works.docx\"]', '{\"1\":[\"What is an MCB fuse replacement service?\",\"An MCB fuse replacement service involves replacing faulty or outdated MCB (Miniature Circuit Breaker) fuses in electrical distribution boards or consumer units. It ensures proper circuit protection and helps maintain electrical safety.\"],\"2\":[\"Why do I need MCB fuse replacement?\",\"Over time, MCB fuses can become faulty, wear out, or become outdated. Replacing them is crucial to maintain the integrity of your electrical system, prevent electrical hazards, and ensure reliable circuit protection.\"],\"3\":[\"How do I know if my MCB fuses need replacement?\",\"Signs that your MCB fuses may need replacement include frequent tripping, overheating, buzzing sounds, or visible signs of damage. It\'s best to consult a qualified electrician who can assess and determine if replacement is necessary.\"],\"4\":[\"How long does the MCB fuse replacement process take?\",\"The duration of the MCB fuse replacement process depends on various factors, such as the number of fuses to be replaced and the complexity of the electrical system. Typically, a professional electrician can complete the replacement efficiently and promptly.\"]}', '1', '1', 1),
(223, 293, 238, 'included', 12, 0, 'Carpet Cleaning', 'carpet-cleaning', 'Revive the beauty of your home with our professional carpet cleaning service. Our expert team uses advanced techniques and eco-friendly cleaning solutions to remove dirt, stains, and allergens from your carpets, leaving them fresh, clean, and vibrant. Whether it\'s a high-traffic area or a special rug, we take care of every detail to ensure your carpets look and feel their best. Experience the difference of a deep and thorough carpet cleaning that not only enhances the appearance of your space but also promotes a healthier indoor environment. Trust us to bring new life to your carpets and leave your home feeling refreshed.', 'carpet,cleaning,home carpet,sofa carpet', 'public/uploads/services/1696483020_055119628e60fff81826.jpg', 500, 450, 0, '120', 0, 0, 0, 1, '30', 5, 1, 1, '2023-10-05 05:17:00', '2025-03-26 13:44:06', '<header>\r\n<h1>Welcome to Our Carpet Cleaning Services</h1>\r\n</header>\r\n<section>\r\n<h2>Why Choose Us?</h2>\r\n<p>At [Your Company Name], we specialize in providing top-notch carpet cleaning services that transform your carpets and leave your home looking and feeling fresh. Our team of experienced professionals is dedicated to delivering outstanding results that meet your highest expectations.</p>\r\n<p>Here\'s why you should choose our carpet cleaning services:</p>\r\n<ul>\r\n<li>State-of-the-art equipment: We use the latest and most advanced carpet cleaning technology to ensure deep cleaning and stain removal.</li>\r\n<li>Experienced technicians: Our trained and certified technicians have years of experience in carpet cleaning and are committed to excellence.</li>\r\n<li>Eco-friendly solutions: We prioritize the use of environmentally friendly cleaning products that are safe for your family and pets.</li>\r\n<li>Customized services: Every carpet is unique, and we tailor our cleaning approach to meet the specific needs of your carpets.</li>\r\n</ul>\r\n</section>\r\n<section>\r\n<h2>Our Services</h2>\r\n<p>We offer a wide range of carpet cleaning services, including:</p>\r\n<ul>\r\n<li>Deep steam cleaning</li>\r\n<li>Stain and spot removal</li>\r\n<li>Carpet odor removal</li>\r\n<li>Carpet protection and sealing</li>\r\n<li>Area rug cleaning</li>\r\n</ul>\r\n<p>No matter the size or condition of your carpets, we have the expertise to revitalize them and restore their original beauty.</p>\r\n</section>', '', '', '[[\"What sets your carpet cleaning service apart from others?\",\"we stand out because of our commitment to excellence. We use state-of-the-art equipment and eco-friendly cleaning solutions to ensure a deep and thorough carpet cleaning. Our experienced technicians are dedicated to providing outstanding results tailored to your specific needs.\"],[\"How often should I have my carpets professionally cleaned?\",\"The frequency of professional carpet cleaning depends on various factors, including foot traffic, pets, and lifestyle. As a general guideline, most households benefit from annual or biannual carpet cleaning. However, high-traffic areas may require more frequent cleaning. Our team can assess your specific situation and recommend a suitable cleaning schedule during your consultation.\"],[\"Is your carpet cleaning process safe for children and pets?\",\"Yes, our carpet cleaning process is safe for children and pets. We prioritize the use of eco-friendly and non-toxic cleaning solutions that are gentle on your carpets and safe for your loved ones. Our technicians take extra care to ensure that no harmful residues are left behind after the cleaning process, providing a clean and healthy environment for your family and pets.\"]]', '1', '1', 1),
(229, 50, 213, 'excluded', 6, 0, 'dehydrating service', 'smoothmeal', 'deydrating', 'dehydrating', 'public/uploads/services/1743251034_361448bdf0bc84c721e2.jpg', 500, 450, 1, '120', 0, 0, 0, 0, '', 1, 1, 1, '2025-03-29 12:23:54', '2025-04-02 11:33:38', '<p>Dehydrating service .It is good</p>', '', '', '[]', '0', '0', 1),
(230, 270, 234, 'included', 12, 0, 'ProBrake Solutions', 'probrake-solutions', 'Your vehicle’s brake system is one of its most critical safety components. At [Your Garage Name], we provide professional and reliable brake repair services to keep you and your passengers safe on the road. Whether you’re hearing squeaking sounds, feeling vibrations, or your brake warning light is on, our team is here to help.', 'brake', 'public/uploads/services/1745487062_483d13bc5f0bf8c8bea3.jpg', 250, 239, 1, '25', 0, 0, 0, 1, '30', 149, 1, 1, '2025-04-24 09:31:02', '2025-04-24 09:31:42', '<h2>Our Brake Services Include:</h2>\r\n<h3>???? Brake Inspection</h3>\r\n<p>We perform a thorough inspection of all brake system components including brake pads, rotors, calipers, brake lines, and fluid levels to detect any wear or damage.</p>\r\n<h3>????️ Brake Pad Replacement</h3>\r\n<p>Worn brake pads can reduce stopping power and damage other parts of your braking system. We use high-quality pads that provide smooth and safe braking.</p>\r\n<h3>???? Brake Rotor Resurfacing or Replacement</h3>\r\n<p>Rotors can warp or wear unevenly over time. We&rsquo;ll determine whether resurfacing or replacing your rotors is the safest and most cost-effective option.</p>\r\n<h3>???? Brake Fluid Flush</h3>\r\n<p>Old or contaminated brake fluid can lead to poor brake performance. We flush the old fluid and replace it with new, manufacturer-recommended brake fluid.</p>\r\n<h3>???? Caliper Service &amp; Replacement</h3>\r\n<p>Brake calipers are responsible for pressing the pads against the rotors. If they&rsquo;re sticking or leaking, it can compromise braking performance.</p>\r\n<h2>Why Choose Us?</h2>\r\n<ul>\r\n<li>✔️ Certified Technicians</li>\r\n<li>✔️ Genuine OEM &amp; High-Quality Aftermarket Parts</li>\r\n<li>✔️ Transparent Estimates &amp; No Hidden Charges</li>\r\n<li>✔️ Fast Turnaround Time</li>\r\n<li>✔️ Warranty on All Repairs</li>\r\n</ul>\r\n<h2>Signs You Might Need Brake Repair:</h2>\r\n<ul>\r\n<li>Squeaking, squealing, or grinding noises</li>\r\n<li>Vibration when braking</li>\r\n<li>Spongy or soft brake pedal</li>\r\n<li>Car pulling to one side while braking</li>\r\n<li>Increased stopping distance</li>\r\n<li>Brake warning light on dashboard</li>\r\n</ul>\r\n<h2>Schedule Your Brake Inspection Today!</h2>\r\n<p>Don&rsquo;t take chances with your safety. If you suspect a brake issue, visit <strong>[Your Garage Name]</strong> or book an appointment online. Our expert team will make sure your brakes are road-ready and reliable.</p>', '', '', '[[\"How do I know if my brakes need repair?\",\"Common signs include squeaking or grinding noises, vibration when braking, a soft or spongy brake pedal, longer stopping distance, or the brake warning light turning on.\"],[\"How often should I replace my brake pads?\",\"On average, brake pads should be replaced every 30,000 to 70,000 kilometers, but it depends on your driving habits and vehicle type. Regular inspections are the best way to know for sure.\"],[\"What happens if I ignore brake issues?\",\"Ignoring brake problems can lead to more expensive repairs later, reduced braking performance, or even complete brake failure, putting your safety at serious risk.\"],[\"Do you use original parts for replacements?\",\"Yes, we use genuine OEM parts or high-quality aftermarket alternatives, based on your preference and vehicle requirements.\"],[\"Is it safe to drive with squeaky brakes?\",\"Squeaky brakes might just be dirty, but they could also mean worn-out pads or damaged components. It\\u2019s best to get them inspected as soon as possible to avoid risks.\"]]', '1', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `services_ratings`
--

CREATE TABLE `services_ratings` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `rating` double NOT NULL,
  `comment` varchar(4096) DEFAULT NULL,
  `images` text DEFAULT NULL COMMENT 'multiple images( comma separated )',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `custom_job_request_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `variable` varchar(35) NOT NULL,
  `value` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `variable`, `value`, `created_at`, `updated_at`) VALUES
(1, 'test', '{\"val\" : \"this\"}', '2022-04-21 05:59:17', '0000-00-00 00:00:00'),
(2, 'languages', '{\"ar-XA\":\"Arabic [Switzerland]\",\"bn-IN\":\"Bengali [India]\",\"en-GB\":\"English [United Kingdom]\",\"fr-CA\":\"French [Canada]\",\"en-US\":\"English [United States of America]\",\"es-ES\":\"Spanish \\/ Castilian [Spain]\",\"fi-FI\":\"Finnish [Finland]\",\"gu-IN\":\"Gujarati [India]\",\"ja-JP\":\"Japanese (ja) [Japan]\",\"kn-IN\":\"Kannada [India]\",\"ml-IN\":\"Malayalam [India]\",\"sv-SE\":\"Swedish [Sweden]\",\"ta-IN\":\"Tamil [India]\",\"tr-TR\":\"Turkish [Turkey]\",\"ms-MY\":\"Malay [Malaysia]\",\"pa-IN\":\"Punjabi [India]\",\"cs-CZ\":\"Czech [Czech Republic]\",\"de-DE\":\"German [Germany]\",\"en-AU\":\"English [Australia]\",\"en-IN\":\"English [India]\",\"es-US\":\"Spanish \\/ Castilian [United States of America]\",\"fr-FR\":\"French [France, French Republic]\",\"hi-IN\":\"Hindi [India]\",\"id-ID\":\"Indonesian [Indonesia]\",\"it-IT\":\"Italian [Italy]\",\"ko-KR\":\"Korean [Korea]\",\"ru-RU\":\"Russian [Russian Federation]\",\"uk-UA\":\"Ukrainian [Ukraine]\",\"cmn-CN\":\"Mandarin Chinese [China]\",\"cmn-TW\":\"Mandarin Chinese [Taiwan]\",\"da-DK\":\"Danish [Denmark]\",\"el-GR\":\"Greek \\/ Modern [Greece]\",\"fil-PH\":\"Filipino \\/ Pilipino [Philippines]\",\"hu-HU\":\"Hungarian [Hungary]\",\"nb-NO\":\"Norwegian Bokm\\u00e5l [Norway]\",\"nl-BE\":\"Dutch [Belgium]\",\"nl-NL\":\"Dutch [Netherlands the]\",\"pt-PT\":\"Portuguese [Portugal, Portuguese Republic]\",\"sk-SK\":\"Slovak [Slovakia (Slovak Republic)]\",\"vi-VN\":\"Vietnamese [Vietnam]\",\"pl-PL\":\"Polish [Poland]\",\"pt-BR\":\"Portuguese [Brazil]\",\"ca-ES\":\"Catalan; Valencian [Spain]\",\"yue-HK\":\"Yue Chinese [Hong Kong]\",\"af-ZA\":\"Afrikaans [South Africa]\",\"bg-BG\":\"Bulgarian [Bulgaria]\",\"lv-LV\":\"Latvian [Latvia]\",\"ro-RO\":\"Romanian \\/ Moldavian \\/ Moldovan [Romania]\",\"sr-RS\":\"Serbian [Serbia]\",\"th-TH\":\"Thai [Thailand]\",\"te-IN\":\"Telugu [India]\",\"is-IS\":\"Icelandic [Iceland]\",\"cy-GB\":\"Welsh [United Kingdom]\",\"en-GB-WLS\":\"English [united kingdom]\",\"es-MX\":\"Spanish \\/ Castilian [Mexico]\",\"en-NZ\":\"English [New Zealand]\",\"en-ZA\":\"English [South Africa]\",\"ar-EG\":\"Arabic [Egypt]\",\"ar-SA\":\"Arabic [Saudi Arabia]\",\"de-AT\":\"German [Austria]\",\"de-CH\":\"German [Switzerland, Swiss Confederation]\",\"en-CA\":\"English [Canada]\",\"en-HK\":\"English [Hong Kong]\",\"en-IE\":\"English [Ireland]\",\"en-PH\":\"English [Philippines]\",\"en-SG\":\"English [Singapore]\",\"es-AR\":\"Spanish \\/ Castilian [Argentina]\",\"es-CO\":\"Spanish \\/ Castilian [Colombia]\",\"et-EE\":\"Estonian [Estonia]\",\"fr-BE\":\"French [Belgium]\",\"fr-CH\":\"French [Switzerland, Swiss Confederation]\",\"ga-IE\":\"Irish [Ireland]\",\"he-IL\":\"Hebrew (modern) [Israel]\",\"hr-HR\":\"Croatian [Croatia]\",\"lt-LT\":\"Lithuanian [Lithuania]\",\"mr-IN\":\"Marathi [India]\",\"mt-MT\":\"Maltese [Malta]\",\"sl-SI\":\"Slovene [Slovenia]\",\"sw-KE\":\"Swahili [Kenya]\",\"ur-PK\":\"Urdu [Pakistan]\",\"zh-CN\":\"Chinese [China]\",\"zh-HK\":\"Chinese [Hong Kong]\",\"zh-TW\":\"Chinese [Taiwan]\",\"es-LA\":\"Spanish \\/ Castilian [Lao]\",\"ar-MS\":\"Arabic [Montserrat]\"}', '2022-04-21 05:59:17', '0000-00-00 00:00:00'),
(13, 'payment_gateways_settings', '{\"cod_setting\":1,\"payment_gateway_setting\":1,\"paypal_status\":\"enable\",\"paypal_mode\":\"sandbox\",\"paypal_business_email\":\"business_email@gmail.com\",\"paypal_currency_code\":\"USD\",\"paypal_webhook_url\":\"http:\\/\\/localhost\\/edemand\\/api\\/webhooks\\/paypal\",\"paypal_website_url\":\"https:\\/\\/edemandweb.wrteam.me\",\"paypal_client_key\":\"your_client_key\",\"paypal_secret_key\":\"your_secret_key\",\"razorpayApiStatus\":\"enable\",\"razorpay_mode\":\"test\",\"razorpay_currency\":\"INR\",\"razorpay_secret\":\"your_secret_key\",\"razorpay_key\":\"your_api_key\",\"endpoint\":\"http:\\/\\/localhost\\/edemand\\/api\\/webhooks\\/razorpay\",\"paystack_status\":\"enable\",\"paystack_mode\":\"test\",\"paystack_currency\":\"GHS\",\"paystack_secret\":\"your_secret_key\",\"paystack_key\":\"your_public_key\",\"paystack_endpoint\":\"http:\\/\\/localhost\\/edemand\\/api\\/webhooks\\/paystack\",\"stripe_status\":\"enable\",\"stripe_mode\":\"test\",\"stripe_currency\":\"INR\",\"stripe_publishable_key\":\"your_public_key\",\"stripe_webhook_secret_key\":\"your_webhook_secret_key\",\"stripe_secret_key\":\"your_secret_key\",\"stripe_endpoint\":\"http:\\/\\/localhost\\/edemand\\/api\\/webhooks\\/stripe\",\"flutterwave_status\":\"enable\",\"flutterwave_currency_code\":\"NGN\",\"flutterwave_public_key\":\"your_public_key\",\"flutterwave_secret_key\":\"your_secret_key\",\"flutterwave_encryption_key\":\"your_encryption_key\",\"flutterwave_webhook_secret_key\":\"your_secret_key\",\"flutterwave_endpoint\":\"http:\\/\\/localhost\\/edemand\\/api\\/webhooks\\/flutterwave\",\"flutterwave_website_url\":\"https:\\/\\/edemandweb.wrteam.me\"}', '2025-05-09 06:13:46', '0000-00-00 00:00:00'),
(15, 'terms_conditions', '{\"terms_conditions\":\"<h2>Introduction<\\/h2>\\r\\n<p>These Website Standard Terms and Conditions written on this webpage shall manage your use of our website, edemand accessible at edemand.<\\/p>\\r\\n<p>These Terms will be applied fully and affect to your use of this Website. By using this Website, you agreed to accept all terms and conditions written in here. You must not use this Website if you disagree with any of these Website Standard Terms and Conditions. These Terms and Conditions have been generated with the help of the <a href=\\\"https:\\/\\/www.termsfeed.com\\/blog\\/sample-terms-and-conditions-template\\/\\\">Terms And Conditions Sample Template<\\/a>.<\\/p>\\r\\n<p>Minors or people below 18 years old are not allowed to use this Website.<\\/p>\\r\\n<h2>Intellectual Property Rights<\\/h2>\\r\\n<p>Other than the content you own, under these Terms, edemand and\\/or its licensors own all the intellectual property rights and materials contained in this Website.<\\/p>\\r\\n<p>You are granted limited license only for purposes of viewing the material contained on this Website.<\\/p>\\r\\n<h2>Restrictions<\\/h2>\\r\\n<p>You are specifically restricted from all of the following:<\\/p>\\r\\n<ul>\\r\\n<li>publishing any Website material in any other media;<\\/li>\\r\\n<li>selling, sublicensing and\\/or otherwise commercializing any Website material;<\\/li>\\r\\n<li>publicly performing and\\/or showing any Website material;<\\/li>\\r\\n<li>using this Website in any way that is or may be damaging to this Website;<\\/li>\\r\\n<li>using this Website in any way that impacts user access to this Website;<\\/li>\\r\\n<li>using this Website contrary to applicable laws and regulations, or in any way may cause harm to the Website, or to any person or business entity;<\\/li>\\r\\n<li>engaging in any data mining, data harvesting, data extracting or any other similar activity in relation to this Website;<\\/li>\\r\\n<li>using this Website to engage in any advertising or marketing.<\\/li>\\r\\n<\\/ul>\\r\\n<p>Certain areas of this Website are restricted from being access by you and edemand may further restrict access by you to any areas of this Website, at any time, in absolute discretion. Any user ID and password you may have for this Website are confidential and you must maintain confidentiality as well.<\\/p>\\r\\n<h2>Your Content<\\/h2>\\r\\n<p>In these Website Standard Terms and Conditions, \\\"Your Content\\\" shall mean any audio, video text, images or other material you choose to display on this Website. By displaying Your Content, you grant edemand a non-exclusive, worldwide irrevocable, sub licensable license to use, reproduce, adapt, publish, translate and distribute it in any and all media.<\\/p>\\r\\n<p>Your Content must be your own and must not be invading any third-party\'s rights. edemand reserves the right to remove any of Your Content from this Website at any time without notice.<\\/p>\\r\\n<h2>No warranties<\\/h2>\\r\\n<p>This Website is provided \\\"as is,\\\" with all faults, and edemand express no representations or warranties, of any kind related to this Website or the materials contained on this Website. Also, nothing contained on this Website shall be interpreted as advising you.<\\/p>\\r\\n<h2>Limitation of liability<\\/h2>\\r\\n<p>In no event shall edemand, nor any of its officers, directors and employees, shall be held liable for anything arising out of or in any way connected with your use of this Website whether such liability is under contract. &nbsp;edemand, including its officers, directors and employees shall not be held liable for any indirect, consequential or special liability arising out of or in any way related to your use of this Website.<\\/p>\\r\\n<h2>Indemnification<\\/h2>\\r\\n<p>You hereby indemnify to the fullest extent edemand from and against any and\\/or all liabilities, costs, demands, causes of action, damages and expenses arising in any way related to your breach of any of the provisions of these Terms.<\\/p>\\r\\n<h2>Severability<\\/h2>\\r\\n<p>If any provision of these Terms is found to be invalid under any applicable law, such provisions shall be deleted without affecting the remaining provisions herein.<\\/p>\\r\\n<h2>Variation of Terms<\\/h2>\\r\\n<p>edemand is permitted to revise these Terms at any time as it sees fit, and by using this Website you are expected to review these Terms on a regular basis.<\\/p>\\r\\n<h2>Assignment<\\/h2>\\r\\n<p>The edemand is allowed to assign, transfer, and subcontract its rights and\\/or obligations under these Terms without any notification. However, you are not allowed to assign, transfer, or subcontract any of your rights and\\/or obligations under these Terms.<\\/p>\\r\\n<h2>Entire Agreement<\\/h2>\\r\\n<p>These Terms constitute the entire agreement between edemand and you in relation to your use of this Website, and supersede all prior agreements and understandings.<\\/p>\\r\\n<h2>Governing Law &amp; Jurisdiction<\\/h2>\\r\\n<p>These Terms will be governed by and interpreted in accordance with the laws of the State of in, and you submit to the non-exclusive jurisdiction of the state and federal courts located in in for the resolution of any disputes.<\\/p>\\r\\n<p>&nbsp;<\\/p>\"}', '2023-05-02 04:02:05', '0000-00-00 00:00:00'),
(16, 'privacy_policy', '{\"privacy_policy\":\"<p>At eDemand, accessible from https:\\/\\/edemand.wrteam.me, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by eDemand and how we use it.<\\/p>\\r\\n<p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.<\\/p>\\r\\n<p>This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and\\/or collect in eDemand. This policy is not applicable to any information collected offline or via channels other than this website.<\\/p>\\r\\n<h2>Consent<\\/h2>\\r\\n<p>By using our website, you hereby consent to our Privacy Policy and agree to its terms.<\\/p>\\r\\n<h2>Information we collect<\\/h2>\\r\\n<p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.<\\/p>\\r\\n<p>If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and\\/or attachments you may send us, and any other information you may choose to provide.<\\/p>\\r\\n<p>When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.<\\/p>\\r\\n<h2>How we use your information<\\/h2>\\r\\n<p>We use the information we collect in various ways, including to:<\\/p>\\r\\n<ul>\\r\\n<li>Provide, operate, and maintain our website<\\/li>\\r\\n<li>Improve, personalize, and expand our website<\\/li>\\r\\n<li>Understand and analyze how you use our website<\\/li>\\r\\n<li>Develop new products, services, features, and functionality<\\/li>\\r\\n<li>Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes<\\/li>\\r\\n<li>Send you emails<\\/li>\\r\\n<li>Find and prevent fraud<\\/li>\\r\\n<\\/ul>\\r\\n<h2>Log Files<\\/h2>\\r\\n<p>eDemand follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services\' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring\\/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information.<\\/p>\\r\\n<h2>Advertising Partners Privacy Policies<\\/h2>\\r\\n<p>You may consult this list to find the Privacy Policy for each of the advertising partners of eDemand.<\\/p>\\r\\n<p>Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on eDemand, which are sent directly to users\' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and\\/or to personalize the advertising content that you see on websites that you visit.<\\/p>\\r\\n<p>Note that eDemand has no access to or control over these cookies that are used by third-party advertisers.<\\/p>\\r\\n<h2>Third Party Privacy Policies<\\/h2>\\r\\n<p>eDemand\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.<\\/p>\\r\\n<p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.<\\/p>\\r\\n<h2>CCPA Privacy Rights (Do Not Sell My Personal Information)<\\/h2>\\r\\n<p>Under the CCPA, among other rights, California consumers have the right to:<\\/p>\\r\\n<p>Request that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.<\\/p>\\r\\n<p>Request that a business delete any personal data about the consumer that a business has collected.<\\/p>\\r\\n<p>Request that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data.<\\/p>\\r\\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.<\\/p>\\r\\n<h2>GDPR Data Protection Rights<\\/h2>\\r\\n<p>We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:<\\/p>\\r\\n<p>The right to access &ndash; You have the right to request copies of your personal data. We may charge you a small fee for this service.<\\/p>\\r\\n<p>The right to rectification &ndash; You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.<\\/p>\\r\\n<p>The right to erasure &ndash; You have the right to request that we erase your personal data, under certain conditions.<\\/p>\\r\\n<p>The right to restrict processing &ndash; You have the right to request that we restrict the processing of your personal data, under certain conditions.<\\/p>\\r\\n<p>The right to object to processing &ndash; You have the right to object to our processing of your personal data, under certain conditions.<\\/p>\\r\\n<p>The right to data portability &ndash; You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.<\\/p>\\r\\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.<\\/p>\\r\\n<h2>Children\'s Information<\\/h2>\\r\\n<p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and\\/or monitor and guide their online activity.<\\/p>\\r\\n<p>eDemand does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.<\\/p>\\r\\n<h2>Changes to This Privacy Policy<\\/h2>\\r\\n<p>We may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately, after they are posted on this page.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<h2>Contact Us<\\/h2>\\r\\n<p>If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>&nbsp;<\\/p>\"}', '2023-05-02 04:02:15', '0000-00-00 00:00:00'),
(17, 'about_us', '{\"about_us\":\"<h2 style=\\\"color: #333333; text-align: center;\\\">Welcome to eDemand!<\\/h2>\\r\\n<p style=\\\"text-align: center;\\\">eDemand is a cutting-edge platform that connects users with a wide range of on-demand home and doorstep services. Whether you need a plumber, electrician, house cleaner, or any other service provider, eDemand has got you covered.<\\/p>\\r\\n<h2 style=\\\"color: #333333; text-align: center;\\\">Our Mission<\\/h2>\\r\\n<p style=\\\"text-align: center;\\\">At eDemand, our mission is to make everyday life easier for people by providing a convenient and reliable platform for accessing essential services. We aim to revolutionize the way services are delivered, making them more accessible, efficient, and affordable for everyone.<\\/p>\\r\\n<h2 style=\\\"color: #333333; text-align: center;\\\">Why Choose Us?<\\/h2>\\r\\n<p style=\\\"text-align: center;\\\">With eDemand, you can expect:<\\/p>\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul>\\r\\n<li style=\\\"list-style-type: none;\\\">\\r\\n<ul style=\\\"list-style-type: disc; margin-left: 20px;\\\">\\r\\n<li style=\\\"text-align: left;\\\">Access to a wide range of services from trusted vendors<\\/li>\\r\\n<li style=\\\"text-align: left;\\\">Convenient booking and scheduling options<\\/li>\\r\\n<li style=\\\"text-align: left;\\\">Secure and seamless payment processing<\\/li>\\r\\n<li style=\\\"text-align: left;\\\">Real-time tracking and updates on service requests<\\/li>\\r\\n<li style=\\\"text-align: left;\\\">Excellent customer support<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<h2 style=\\\"color: #333333; text-align: center;\\\">Get Started Today!<\\/h2>\\r\\n<p style=\\\"text-align: center;\\\">Ready to experience the convenience of eDemand? Download our app now and start booking your favorite services with just a few taps!<\\/p>\"}', '2025-03-27 05:29:41', '0000-00-00 00:00:00'),
(18, 'general_settings', '{\"country_currency_code\":\"USD\",\"currency\":\"$\",\"decimal_point\":\"2\",\"customer_current_version_android_app\":\"4.0.0\",\"customer_current_version_ios_app\":\"4.0.0\",\"customer_compulsary_update_force_update\":\"1\",\"provider_current_version_android_app\":\"4.0.0\",\"provider_current_version_ios_app\":\"4.0.0\",\"provider_compulsary_update_force_update\":\"1\",\"customer_playstore_url\":\"https:\\/\\/play.google.com\\/store\\/apps\\/details?id=wrteam.edemand.customer.e_demand\",\"customer_appstore_url\":\"https:\\/\\/testflight.apple.com\\/join\\/KdqqsTnH\",\"provider_playstore_url\":\"https:\\/\\/play.google.com\\/store\\/apps\\/details?id=wrteam.edemand.provider\",\"provider_appstore_url\":\"https:\\/\\/testflight.apple.com\\/join\\/n5tteGPs\",\"provider_location_in_provider_details\":\"1\",\"android_google_interstitial_id\":\"ca-app-pub-3940256099942544\\/1033173712\",\"android_google_banner_id\":\"ca-app-pub-3940256099942544\\/6300978111\",\"android_google_ads_status\":\"1\",\"ios_google_interstitial_id\":\"ca-app-pub-3940256099942544\\/4411468910\",\"ios_google_banner_id\":\"ca-app-pub-3940256099942544\\/2934735716\",\"ios_google_ads_status\":\"1\",\"customer_app_maintenance_schedule_date\":\"2023-01-17 00:00 to 2023-01-19 23:59\",\"message_for_customer_application\":\"We are currently performing maintenance on our app. We will be back up and running soon!\",\"provider_app_maintenance_schedule_date\":\"2022-12-22 00:00 to 2023-01-10 23:59\",\"message_for_provider_application\":\"We are currently performing maintenance on our app. We will be back up and running soon!\",\"provider_app_maintenance_mode\":\"0\",\"favicon\":\"1657775760_29d5c9510f319bcff33f.svg\",\"half_logo\":\"1657775760_f730e7b07a5cda36133e.svg\",\"logo\":\"1655699574_7fd61254c6132ebfd8ce.svg\",\"partner_favicon\":\"1655699528_c19e479401407f3a416d.svg\",\"partner_half_logo\":\"1657775933_c37b2c2a81820814b648.svg\",\"partner_logo\":\"edemand_provider_logo.svg\",\"login_image\":\"\",\"customer_app_maintenance_mode\":\"0\",\"company_title\":\"eDemand - On Demand Services\",\"support_name\":\"eDemand\",\"support_email\":\"support@wrteam.in\",\"phone\":\"919797945459\",\"system_timezone_gmt\":\"+05:30\",\"system_timezone\":\"Asia\\/Kolkata\",\"primary_color\":\"#0277FA\",\"secondary_color\":\"#fcfcfc\",\"primary_shadow\":\"#ffffff\",\"max_serviceable_distance\":\"5000000\",\"distance_unit\":\"km\",\"address\":\"Time Square Empire, 262-263, highway, Mirjapar, Bhuj, Mirjapar Part, Gujarat 370001\",\"short_description\":\"eDemand- On Demand services\",\"copyright_details\":\"Copyright \\u00a9 2025 eDemand. All rights reserved.\",\"booking_auto_cancle_duration\":\"1\",\"maxFilesOrImagesInOneMessage\":\"10\",\"maxFileSizeInMBCanBeSent\":\"10\",\"maxCharactersInATextMessage\":\"500\",\"otp_system\":\"1\",\"authentication_mode\":\"firebase\",\"company_map_location\":\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3666.2869218637325!2d69.64153407559186!3d23.232643908455636!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39511e5b00000001%3A0xc42d67c61628af6d!2sWRTeam%20Pvt.%20Ltd.!5e0!3m2!1sen!2sin!4v1742999646887!5m2!1sen!2sin\",\"support_hours\":\"09:00 to 18:00\",\"allow_pre_booking_chat\":\"1\",\"allow_post_booking_chat\":\"1\",\"file_manager\":\"local_server\",\"aws_access_key_id\":\"your aws access key id\",\"aws_secret_access_key\":\"you aws secret access key\",\"aws_default_region\":\"us-east-1\",\"aws_bucket\":\"your aws bucket\",\"aws_url\":\"your_aws_url\",\"storage_disk\":\"\",\"image_compression_preference\":\"0\",\"image_compression_quality\":\"0\"}', '2025-05-01 06:52:47', NULL),
(19, 'email_settings', '{\"mailProtocol\":\"SMTP\",\"smtpPort\":\"465\",\"smtpHost\":\"smtp.googlemail.com\",\"smtpEncryption\":\"ssl\",\"smtpUsername\":\"your_username@gmail.com\",\"mailType\":\"html\",\"smtpPassword\":\"1234567890\",\"update\":\"Save changes\"}', '2025-05-09 06:11:44', '0000-00-00 00:00:00'),
(21, 'refund_policy', '{\"refund_policy\":\"\"}', '2022-04-21 05:59:17', '0000-00-00 00:00:00'),
(22, 'app_settings', '{\"maintenance_date\":\"2022-11-15\",\"start_time\":\"11:01\",\"end_time\":\"15:03\",\"maintenance_mode\":\"on\"}', '2024-07-12 10:01:39', '0000-00-00 00:00:00'),
(23, 'customer_terms_conditions', '{\"customer_terms_conditions\":\"<h2>Introduction<\\/h2>\\r\\n<p>These Website Standard Terms and Conditions written on this webpage shall manage your use of our website, edemand accessible at edemand.<\\/p>\\r\\n<p>These Terms will be applied fully and affect to your use of this Website. By using this Website, you agreed to accept all terms and conditions written in here. You must not use this Website if you disagree with any of these Website Standard Terms and Conditions. These Terms and Conditions have been generated with the help of the <a href=\\\"https:\\/\\/www.termsfeed.com\\/blog\\/sample-terms-and-conditions-template\\/\\\">Terms And Conditions Sample Template<\\/a>.<\\/p>\\r\\n<p>Minors or people below 18 years old are not allowed to use this Website.<\\/p>\\r\\n<h2>Intellectual Property Rights<\\/h2>\\r\\n<p>Other than the content you own, under these Terms, edemand and\\/or its licensors own all the intellectual property rights and materials contained in this Website.<\\/p>\\r\\n<p>You are granted limited license only for purposes of viewing the material contained on this Website.<\\/p>\\r\\n<h2>Restrictions<\\/h2>\\r\\n<p>You are specifically restricted from all of the following:<\\/p>\\r\\n<ul>\\r\\n<li>publishing any Website material in any other media;<\\/li>\\r\\n<li>selling, sublicensing and\\/or otherwise commercializing any Website material;<\\/li>\\r\\n<li>publicly performing and\\/or showing any Website material;<\\/li>\\r\\n<li>using this Website in any way that is or may be damaging to this Website;<\\/li>\\r\\n<li>using this Website in any way that impacts user access to this Website;<\\/li>\\r\\n<li>using this Website contrary to applicable laws and regulations, or in any way may cause harm to the Website, or to any person or business entity;<\\/li>\\r\\n<li>engaging in any data mining, data harvesting, data extracting or any other similar activity in relation to this Website;<\\/li>\\r\\n<li>using this Website to engage in any advertising or marketing.<\\/li>\\r\\n<\\/ul>\\r\\n<p>Certain areas of this Website are restricted from being access by you and edemand may further restrict access by you to any areas of this Website, at any time, in absolute discretion. Any user ID and password you may have for this Website are confidential and you must maintain confidentiality as well.<\\/p>\\r\\n<h2>Your Content<\\/h2>\\r\\n<p>In these Website Standard Terms and Conditions, \\\"Your Content\\\" shall mean any audio, video text, images or other material you choose to display on this Website. By displaying Your Content, you grant edemand a non-exclusive, worldwide irrevocable, sub licensable license to use, reproduce, adapt, publish, translate and distribute it in any and all media.<\\/p>\\r\\n<p>Your Content must be your own and must not be invading any third-party\'s rights. edemand reserves the right to remove any of Your Content from this Website at any time without notice.<\\/p>\\r\\n<h2>No warranties<\\/h2>\\r\\n<p>This Website is provided \\\"as is,\\\" with all faults, and edemand express no representations or warranties, of any kind related to this Website or the materials contained on this Website. Also, nothing contained on this Website shall be interpreted as advising you.<\\/p>\\r\\n<h2>Limitation of liability<\\/h2>\\r\\n<p>In no event shall edemand, nor any of its officers, directors and employees, shall be held liable for anything arising out of or in any way connected with your use of this Website whether such liability is under contract. &nbsp;edemand, including its officers, directors and employees shall not be held liable for any indirect, consequential or special liability arising out of or in any way related to your use of this Website.<\\/p>\\r\\n<h2>Indemnification<\\/h2>\\r\\n<p>You hereby indemnify to the fullest extent edemand from and against any and\\/or all liabilities, costs, demands, causes of action, damages and expenses arising in any way related to your breach of any of the provisions of these Terms.<\\/p>\\r\\n<h2>Severability<\\/h2>\\r\\n<p>If any provision of these Terms is found to be invalid under any applicable law, such provisions shall be deleted without affecting the remaining provisions herein.<\\/p>\\r\\n<h2>Variation of Terms<\\/h2>\\r\\n<p>edemand is permitted to revise these Terms at any time as it sees fit, and by using this Website you are expected to review these Terms on a regular basis.<\\/p>\\r\\n<h2>Assignment<\\/h2>\\r\\n<p>The edemand is allowed to assign, transfer, and subcontract its rights and\\/or obligations under these Terms without any notification. However, you are not allowed to assign, transfer, or subcontract any of your rights and\\/or obligations under these Terms.<\\/p>\\r\\n<h2>Entire Agreement<\\/h2>\\r\\n<p>These Terms constitute the entire agreement between edemand and you in relation to your use of this Website, and supersede all prior agreements and understandings.<\\/p>\\r\\n<h2>Governing Law &amp; Jurisdiction<\\/h2>\\r\\n<p>These Terms will be governed by and interpreted in accordance with the laws of the State of in, and you submit to the non-exclusive jurisdiction of the state and federal courts located in in for the resolution of any disputes.<\\/p>\\r\\n<p>&nbsp;<\\/p>\"}', '2023-05-02 04:02:01', NULL),
(24, 'customer_privacy_policy', '{\"customer_privacy_policy\":\"<p>At eDemand, accessible from https:\\/\\/edemand.wrteam.me, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by eDemand and how we use it.<\\/p>\\r\\n<p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.<\\/p>\\r\\n<p>This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and\\/or collect in eDemand. This policy is not applicable to any information collected offline or via channels other than this website.<\\/p>\\r\\n<h2>Consent<\\/h2>\\r\\n<p>By using our website, you hereby consent to our Privacy Policy and agree to its terms.<\\/p>\\r\\n<h2>Information we collect<\\/h2>\\r\\n<p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.<\\/p>\\r\\n<p>If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and\\/or attachments you may send us, and any other information you may choose to provide.<\\/p>\\r\\n<p>When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.<\\/p>\\r\\n<h2>How we use your information<\\/h2>\\r\\n<p>We use the information we collect in various ways, including to:<\\/p>\\r\\n<ul>\\r\\n<li>Provide, operate, and maintain our website<\\/li>\\r\\n<li>Improve, personalize, and expand our website<\\/li>\\r\\n<li>Understand and analyze how you use our website<\\/li>\\r\\n<li>Develop new products, services, features, and functionality<\\/li>\\r\\n<li>Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes<\\/li>\\r\\n<li>Send you emails<\\/li>\\r\\n<li>Find and prevent fraud<\\/li>\\r\\n<\\/ul>\\r\\n<h2>Log Files<\\/h2>\\r\\n<p>eDemand follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services\' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring\\/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information.<\\/p>\\r\\n<h2>Advertising Partners Privacy Policies<\\/h2>\\r\\n<p>You may consult this list to find the Privacy Policy for each of the advertising partners of eDemand.<\\/p>\\r\\n<p>Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on eDemand, which are sent directly to users\' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and\\/or to personalize the advertising content that you see on websites that you visit.<\\/p>\\r\\n<p>Note that eDemand has no access to or control over these cookies that are used by third-party advertisers.<\\/p>\\r\\n<h2>Third Party Privacy Policies<\\/h2>\\r\\n<p>eDemand\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.<\\/p>\\r\\n<p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.<\\/p>\\r\\n<h2>CCPA Privacy Rights (Do Not Sell My Personal Information)<\\/h2>\\r\\n<p>Under the CCPA, among other rights, California consumers have the right to:<\\/p>\\r\\n<p>Request that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.<\\/p>\\r\\n<p>Request that a business delete any personal data about the consumer that a business has collected.<\\/p>\\r\\n<p>Request that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data.<\\/p>\\r\\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.<\\/p>\\r\\n<h2>GDPR Data Protection Rights<\\/h2>\\r\\n<p>We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:<\\/p>\\r\\n<p>The right to access &ndash; You have the right to request copies of your personal data. We may charge you a small fee for this service.<\\/p>\\r\\n<p>The right to rectification &ndash; You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.<\\/p>\\r\\n<p>The right to erasure &ndash; You have the right to request that we erase your personal data, under certain conditions.<\\/p>\\r\\n<p>The right to restrict processing &ndash; You have the right to request that we restrict the processing of your personal data, under certain conditions.<\\/p>\\r\\n<p>The right to object to processing &ndash; You have the right to object to our processing of your personal data, under certain conditions.<\\/p>\\r\\n<p>The right to data portability &ndash; You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.<\\/p>\\r\\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.<\\/p>\\r\\n<h2>Children\'s Information<\\/h2>\\r\\n<p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and\\/or monitor and guide their online activity.<\\/p>\\r\\n<p>eDemand does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.<\\/p>\\r\\n<h2>Changes to This Privacy Policy<\\/h2>\\r\\n<p>We may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately, after they are posted on this page.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<h2>Contact Us<\\/h2>\\r\\n<p>If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.<\\/p>\\r\\n<p>&nbsp;<\\/p>\\r\\n<p>&nbsp;<\\/p>\"}', '2023-05-02 04:02:10', NULL);
INSERT INTO `settings` (`id`, `variable`, `value`, `created_at`, `updated_at`) VALUES
(25, 'country_codes', '{\n  \"countries\": [\n    {\n      \"code\": \"+7 840\",\n      \"name\": \"Abkhazia\"\n    },\n    {\n      \"code\": \"+93\",\n      \"name\": \"Afghanistan\"\n    },\n    {\n      \"code\": \"+355\",\n      \"name\": \"Albania\"\n    },\n    {\n      \"code\": \"+213\",\n      \"name\": \"Algeria\"\n    },\n    {\n      \"code\": \"+1 684\",\n      \"name\": \"American Samoa\"\n    },\n    {\n      \"code\": \"+376\",\n      \"name\": \"Andorra\"\n    },\n    {\n      \"code\": \"+244\",\n      \"name\": \"Angola\"\n    },\n    {\n      \"code\": \"+1 264\",\n      \"name\": \"Anguilla\"\n    },\n    {\n      \"code\": \"+1 268\",\n      \"name\": \"Antigua and Barbuda\"\n    },\n    {\n      \"code\": \"+54\",\n      \"name\": \"Argentina\"\n    },\n    {\n      \"code\": \"+374\",\n      \"name\": \"Armenia\"\n    },\n    {\n      \"code\": \"+297\",\n      \"name\": \"Aruba\"\n    },\n    {\n      \"code\": \"+247\",\n      \"name\": \"Ascension\"\n    },\n    {\n      \"code\": \"+61\",\n      \"name\": \"Australia\"\n    },\n    {\n      \"code\": \"+672\",\n      \"name\": \"Australian External Territories\"\n    },\n    {\n      \"code\": \"+43\",\n      \"name\": \"Austria\"\n    },\n    {\n      \"code\": \"+994\",\n      \"name\": \"Azerbaijan\"\n    },\n    {\n      \"code\": \"+1 242\",\n      \"name\": \"Bahamas\"\n    },\n    {\n      \"code\": \"+973\",\n      \"name\": \"Bahrain\"\n    },\n    {\n      \"code\": \"+880\",\n      \"name\": \"Bangladesh\"\n    },\n    {\n      \"code\": \"+1 246\",\n      \"name\": \"Barbados\"\n    },\n    {\n      \"code\": \"+1 268\",\n      \"name\": \"Barbuda\"\n    },\n    {\n      \"code\": \"+375\",\n      \"name\": \"Belarus\"\n    },\n    {\n      \"code\": \"+32\",\n      \"name\": \"Belgium\"\n    },\n    {\n      \"code\": \"+501\",\n      \"name\": \"Belize\"\n    },\n    {\n      \"code\": \"+229\",\n      \"name\": \"Benin\"\n    },\n    {\n      \"code\": \"+1 441\",\n      \"name\": \"Bermuda\"\n    },\n    {\n      \"code\": \"+975\",\n      \"name\": \"Bhutan\"\n    },\n    {\n      \"code\": \"+591\",\n      \"name\": \"Bolivia\"\n    },\n    {\n      \"code\": \"+387\",\n      \"name\": \"Bosnia and Herzegovina\"\n    },\n    {\n      \"code\": \"+267\",\n      \"name\": \"Botswana\"\n    },\n    {\n      \"code\": \"+55\",\n      \"name\": \"Brazil\"\n    },\n    {\n      \"code\": \"+246\",\n      \"name\": \"British Indian Ocean Territory\"\n    },\n    {\n      \"code\": \"+1 284\",\n      \"name\": \"British Virgin Islands\"\n    },\n    {\n      \"code\": \"+673\",\n      \"name\": \"Brunei\"\n    },\n    {\n      \"code\": \"+359\",\n      \"name\": \"Bulgaria\"\n    },\n    {\n      \"code\": \"+226\",\n      \"name\": \"Burkina Faso\"\n    },\n    {\n      \"code\": \"+257\",\n      \"name\": \"Burundi\"\n    },\n    {\n      \"code\": \"+855\",\n      \"name\": \"Cambodia\"\n    },\n    {\n      \"code\": \"+237\",\n      \"name\": \"Cameroon\"\n    },\n    {\n      \"code\": \"+1\",\n      \"name\": \"Canada\"\n    },\n    {\n      \"code\": \"+238\",\n      \"name\": \"Cape Verde\"\n    },\n    {\n      \"code\": \"+ 345\",\n      \"name\": \"Cayman Islands\"\n    },\n    {\n      \"code\": \"+236\",\n      \"name\": \"Central African Republic\"\n    },\n    {\n      \"code\": \"+235\",\n      \"name\": \"Chad\"\n    },\n    {\n      \"code\": \"+56\",\n      \"name\": \"Chile\"\n    },\n    {\n      \"code\": \"+86\",\n      \"name\": \"China\"\n    },\n    {\n      \"code\": \"+61\",\n      \"name\": \"Christmas Island\"\n    },\n    {\n      \"code\": \"+61\",\n      \"name\": \"Cocos-Keeling Islands\"\n    },\n    {\n      \"code\": \"+57\",\n      \"name\": \"Colombia\"\n    },\n    {\n      \"code\": \"+269\",\n      \"name\": \"Comoros\"\n    },\n    {\n      \"code\": \"+242\",\n      \"name\": \"Congo\"\n    },\n    {\n      \"code\": \"+243\",\n      \"name\": \"Congo, Dem. Rep. of (Zaire)\"\n    },\n    {\n      \"code\": \"+682\",\n      \"name\": \"Cook Islands\"\n    },\n    {\n      \"code\": \"+506\",\n      \"name\": \"Costa Rica\"\n    },\n    {\n      \"code\": \"+385\",\n      \"name\": \"Croatia\"\n    },\n    {\n      \"code\": \"+53\",\n      \"name\": \"Cuba\"\n    },\n    {\n      \"code\": \"+599\",\n      \"name\": \"Curacao\"\n    },\n    {\n      \"code\": \"+537\",\n      \"name\": \"Cyprus\"\n    },\n    {\n      \"code\": \"+420\",\n      \"name\": \"Czech Republic\"\n    },\n    {\n      \"code\": \"+45\",\n      \"name\": \"Denmark\"\n    },\n    {\n      \"code\": \"+246\",\n      \"name\": \"Diego Garcia\"\n    },\n    {\n      \"code\": \"+253\",\n      \"name\": \"Djibouti\"\n    },\n    {\n      \"code\": \"+1 767\",\n      \"name\": \"Dominica\"\n    },\n    {\n      \"code\": \"+1 809\",\n      \"name\": \"Dominican Republic\"\n    },\n    {\n      \"code\": \"+670\",\n      \"name\": \"East Timor\"\n    },\n    {\n      \"code\": \"+56\",\n      \"name\": \"Easter Island\"\n    },\n    {\n      \"code\": \"+593\",\n      \"name\": \"Ecuador\"\n    },\n    {\n      \"code\": \"+20\",\n      \"name\": \"Egypt\"\n    },\n    {\n      \"code\": \"+503\",\n      \"name\": \"El Salvador\"\n    },\n    {\n      \"code\": \"+240\",\n      \"name\": \"Equatorial Guinea\"\n    },\n    {\n      \"code\": \"+291\",\n      \"name\": \"Eritrea\"\n    },\n    {\n      \"code\": \"+372\",\n      \"name\": \"Estonia\"\n    },\n    {\n      \"code\": \"+251\",\n      \"name\": \"Ethiopia\"\n    },\n    {\n      \"code\": \"+500\",\n      \"name\": \"Falkland Islands\"\n    },\n    {\n      \"code\": \"+298\",\n      \"name\": \"Faroe Islands\"\n    },\n    {\n      \"code\": \"+679\",\n      \"name\": \"Fiji\"\n    },\n    {\n      \"code\": \"+358\",\n      \"name\": \"Finland\"\n    },\n    {\n      \"code\": \"+33\",\n      \"name\": \"France\"\n    },\n    {\n      \"code\": \"+596\",\n      \"name\": \"French Antilles\"\n    },\n    {\n      \"code\": \"+594\",\n      \"name\": \"French Guiana\"\n    },\n    {\n      \"code\": \"+689\",\n      \"name\": \"French Polynesia\"\n    },\n    {\n      \"code\": \"+241\",\n      \"name\": \"Gabon\"\n    },\n    {\n      \"code\": \"+220\",\n      \"name\": \"Gambia\"\n    },\n    {\n      \"code\": \"+995\",\n      \"name\": \"Georgia\"\n    },\n    {\n      \"code\": \"+49\",\n      \"name\": \"Germany\"\n    },\n    {\n      \"code\": \"+233\",\n      \"name\": \"Ghana\"\n    },\n    {\n      \"code\": \"+350\",\n      \"name\": \"Gibraltar\"\n    },\n    {\n      \"code\": \"+30\",\n      \"name\": \"Greece\"\n    },\n    {\n      \"code\": \"+299\",\n      \"name\": \"Greenland\"\n    },\n    {\n      \"code\": \"+1 473\",\n      \"name\": \"Grenada\"\n    },\n    {\n      \"code\": \"+590\",\n      \"name\": \"Guadeloupe\"\n    },\n    {\n      \"code\": \"+1 671\",\n      \"name\": \"Guam\"\n    },\n    {\n      \"code\": \"+502\",\n      \"name\": \"Guatemala\"\n    },\n    {\n      \"code\": \"+224\",\n      \"name\": \"Guinea\"\n    },\n    {\n      \"code\": \"+245\",\n      \"name\": \"Guinea-Bissau\"\n    },\n    {\n      \"code\": \"+595\",\n      \"name\": \"Guyana\"\n    },\n    {\n      \"code\": \"+509\",\n      \"name\": \"Haiti\"\n    },\n    {\n      \"code\": \"+504\",\n      \"name\": \"Honduras\"\n    },\n    {\n      \"code\": \"+852\",\n      \"name\": \"Hong Kong SAR China\"\n    },\n    {\n      \"code\": \"+36\",\n      \"name\": \"Hungary\"\n    },\n    {\n      \"code\": \"+354\",\n      \"name\": \"Iceland\"\n    },\n    {\n      \"code\": \"+91\",\n      \"name\": \"India\"\n    },\n    {\n      \"code\": \"+62\",\n      \"name\": \"Indonesia\"\n    },\n    {\n      \"code\": \"+98\",\n      \"name\": \"Iran\"\n    },\n    {\n      \"code\": \"+964\",\n      \"name\": \"Iraq\"\n    },\n    {\n      \"code\": \"+353\",\n      \"name\": \"Ireland\"\n    },\n    {\n      \"code\": \"+972\",\n      \"name\": \"Israel\"\n    },\n    {\n      \"code\": \"+39\",\n      \"name\": \"Italy\"\n    },\n    {\n      \"code\": \"+225\",\n      \"name\": \"Ivory Coast\"\n    },\n    {\n      \"code\": \"+1 876\",\n      \"name\": \"Jamaica\"\n    },\n    {\n      \"code\": \"+81\",\n      \"name\": \"Japan\"\n    },\n    {\n      \"code\": \"+962\",\n      \"name\": \"Jordan\"\n    },\n    {\n      \"code\": \"+7 7\",\n      \"name\": \"Kazakhstan\"\n    },\n    {\n      \"code\": \"+254\",\n      \"name\": \"Kenya\"\n    },\n    {\n      \"code\": \"+686\",\n      \"name\": \"Kiribati\"\n    },\n    {\n      \"code\": \"+965\",\n      \"name\": \"Kuwait\"\n    },\n    {\n      \"code\": \"+996\",\n      \"name\": \"Kyrgyzstan\"\n    },\n    {\n      \"code\": \"+856\",\n      \"name\": \"Laos\"\n    },\n    {\n      \"code\": \"+371\",\n      \"name\": \"Latvia\"\n    },\n    {\n      \"code\": \"+961\",\n      \"name\": \"Lebanon\"\n    },\n    {\n      \"code\": \"+266\",\n      \"name\": \"Lesotho\"\n    },\n    {\n      \"code\": \"+231\",\n      \"name\": \"Liberia\"\n    },\n    {\n      \"code\": \"+218\",\n      \"name\": \"Libya\"\n    },\n    {\n      \"code\": \"+423\",\n      \"name\": \"Liechtenstein\"\n    },\n    {\n      \"code\": \"+370\",\n      \"name\": \"Lithuania\"\n    },\n    {\n      \"code\": \"+352\",\n      \"name\": \"Luxembourg\"\n    },\n    {\n      \"code\": \"+853\",\n      \"name\": \"Macau SAR China\"\n    },\n    {\n      \"code\": \"+389\",\n      \"name\": \"Macedonia\"\n    },\n    {\n      \"code\": \"+261\",\n      \"name\": \"Madagascar\"\n    },\n    {\n      \"code\": \"+265\",\n      \"name\": \"Malawi\"\n    },\n    {\n      \"code\": \"+60\",\n      \"name\": \"Malaysia\"\n    },\n    {\n      \"code\": \"+960\",\n      \"name\": \"Maldives\"\n    },\n    {\n      \"code\": \"+223\",\n      \"name\": \"Mali\"\n    },\n    {\n      \"code\": \"+356\",\n      \"name\": \"Malta\"\n    },\n    {\n      \"code\": \"+692\",\n      \"name\": \"Marshall Islands\"\n    },\n    {\n      \"code\": \"+596\",\n      \"name\": \"Martinique\"\n    },\n    {\n      \"code\": \"+222\",\n      \"name\": \"Mauritania\"\n    },\n    {\n      \"code\": \"+230\",\n      \"name\": \"Mauritius\"\n    },\n    {\n      \"code\": \"+262\",\n      \"name\": \"Mayotte\"\n    },\n    {\n      \"code\": \"+52\",\n      \"name\": \"Mexico\"\n    },\n    {\n      \"code\": \"+691\",\n      \"name\": \"Micronesia\"\n    },\n    {\n      \"code\": \"+1 808\",\n      \"name\": \"Midway Island\"\n    },\n    {\n      \"code\": \"+373\",\n      \"name\": \"Moldova\"\n    },\n    {\n      \"code\": \"+377\",\n      \"name\": \"Monaco\"\n    },\n    {\n      \"code\": \"+976\",\n      \"name\": \"Mongolia\"\n    },\n    {\n      \"code\": \"+382\",\n      \"name\": \"Montenegro\"\n    },\n    {\n      \"code\": \"+1664\",\n      \"name\": \"Montserrat\"\n    },\n    {\n      \"code\": \"+212\",\n      \"name\": \"Morocco\"\n    },\n    {\n      \"code\": \"+95\",\n      \"name\": \"Myanmar\"\n    },\n    {\n      \"code\": \"+264\",\n      \"name\": \"Namibia\"\n    },\n    {\n      \"code\": \"+674\",\n      \"name\": \"Nauru\"\n    },\n    {\n      \"code\": \"+977\",\n      \"name\": \"Nepal\"\n    },\n    {\n      \"code\": \"+31\",\n      \"name\": \"Netherlands\"\n    },\n    {\n      \"code\": \"+599\",\n      \"name\": \"Netherlands Antilles\"\n    },\n    {\n      \"code\": \"+1 869\",\n      \"name\": \"Nevis\"\n    },\n    {\n      \"code\": \"+687\",\n      \"name\": \"New Caledonia\"\n    },\n    {\n      \"code\": \"+64\",\n      \"name\": \"New Zealand\"\n    },\n    {\n      \"code\": \"+505\",\n      \"name\": \"Nicaragua\"\n    },\n    {\n      \"code\": \"+227\",\n      \"name\": \"Niger\"\n    },\n    {\n      \"code\": \"+234\",\n      \"name\": \"Nigeria\"\n    },\n    {\n      \"code\": \"+683\",\n      \"name\": \"Niue\"\n    },\n    {\n      \"code\": \"+672\",\n      \"name\": \"Norfolk Island\"\n    },\n    {\n      \"code\": \"+850\",\n      \"name\": \"North Korea\"\n    },\n    {\n      \"code\": \"+1 670\",\n      \"name\": \"Northern Mariana Islands\"\n    },\n    {\n      \"code\": \"+47\",\n      \"name\": \"Norway\"\n    },\n    {\n      \"code\": \"+968\",\n      \"name\": \"Oman\"\n    },\n    {\n      \"code\": \"+92\",\n      \"name\": \"Pakistan\"\n    },\n    {\n      \"code\": \"+680\",\n      \"name\": \"Palau\"\n    },\n    {\n      \"code\": \"+970\",\n      \"name\": \"Palestinian Territory\"\n    },\n    {\n      \"code\": \"+507\",\n      \"name\": \"Panama\"\n    },\n    {\n      \"code\": \"+675\",\n      \"name\": \"Papua New Guinea\"\n    },\n    {\n      \"code\": \"+595\",\n      \"name\": \"Paraguay\"\n    },\n    {\n      \"code\": \"+51\",\n      \"name\": \"Peru\"\n    },\n    {\n      \"code\": \"+63\",\n      \"name\": \"Philippines\"\n    },\n    {\n      \"code\": \"+48\",\n      \"name\": \"Poland\"\n    },\n    {\n      \"code\": \"+351\",\n      \"name\": \"Portugal\"\n    },\n    {\n      \"code\": \"+1 787\",\n      \"name\": \"Puerto Rico\"\n    },\n    {\n      \"code\": \"+974\",\n      \"name\": \"Qatar\"\n    },\n    {\n      \"code\": \"+262\",\n      \"name\": \"Reunion\"\n    },\n    {\n      \"code\": \"+40\",\n      \"name\": \"Romania\"\n    },\n    {\n      \"code\": \"+7\",\n      \"name\": \"Russia\"\n    },\n    {\n      \"code\": \"+250\",\n      \"name\": \"Rwanda\"\n    },\n    {\n      \"code\": \"+685\",\n      \"name\": \"Samoa\"\n    },\n    {\n      \"code\": \"+378\",\n      \"name\": \"San Marino\"\n    },\n    {\n      \"code\": \"+966\",\n      \"name\": \"Saudi Arabia\"\n    },\n    {\n      \"code\": \"+221\",\n      \"name\": \"Senegal\"\n    },\n    {\n      \"code\": \"+381\",\n      \"name\": \"Serbia\"\n    },\n    {\n      \"code\": \"+248\",\n      \"name\": \"Seychelles\"\n    },\n    {\n      \"code\": \"+232\",\n      \"name\": \"Sierra Leone\"\n    },\n    {\n      \"code\": \"+65\",\n      \"name\": \"Singapore\"\n    },\n    {\n      \"code\": \"+421\",\n      \"name\": \"Slovakia\"\n    },\n    {\n      \"code\": \"+386\",\n      \"name\": \"Slovenia\"\n    },\n    {\n      \"code\": \"+677\",\n      \"name\": \"Solomon Islands\"\n    },\n    {\n      \"code\": \"+27\",\n      \"name\": \"South Africa\"\n    },\n    {\n      \"code\": \"+500\",\n      \"name\": \"South Georgia and the South Sandwich Islands\"\n    },\n    {\n      \"code\": \"+82\",\n      \"name\": \"South Korea\"\n    },\n    {\n      \"code\": \"+34\",\n      \"name\": \"Spain\"\n    },\n    {\n      \"code\": \"+94\",\n      \"name\": \"Sri Lanka\"\n    },\n    {\n      \"code\": \"+249\",\n      \"name\": \"Sudan\"\n    },\n    {\n      \"code\": \"+597\",\n      \"name\": \"Suriname\"\n    },\n    {\n      \"code\": \"+268\",\n      \"name\": \"Swaziland\"\n    },\n    {\n      \"code\": \"+46\",\n      \"name\": \"Sweden\"\n    },\n    {\n      \"code\": \"+41\",\n      \"name\": \"Switzerland\"\n    },\n    {\n      \"code\": \"+963\",\n      \"name\": \"Syria\"\n    },\n    {\n      \"code\": \"+886\",\n      \"name\": \"Taiwan\"\n    },\n    {\n      \"code\": \"+992\",\n      \"name\": \"Tajikistan\"\n    },\n    {\n      \"code\": \"+255\",\n      \"name\": \"Tanzania\"\n    },\n    {\n      \"code\": \"+66\",\n      \"name\": \"Thailand\"\n    },\n    {\n      \"code\": \"+670\",\n      \"name\": \"Timor Leste\"\n    },\n    {\n      \"code\": \"+228\",\n      \"name\": \"Togo\"\n    },\n    {\n      \"code\": \"+690\",\n      \"name\": \"Tokelau\"\n    },\n    {\n      \"code\": \"+676\",\n      \"name\": \"Tonga\"\n    },\n    {\n      \"code\": \"+1 868\",\n      \"name\": \"Trinidad and Tobago\"\n    },\n    {\n      \"code\": \"+216\",\n      \"name\": \"Tunisia\"\n    },\n    {\n      \"code\": \"+90\",\n      \"name\": \"Turkey\"\n    },\n    {\n      \"code\": \"+993\",\n      \"name\": \"Turkmenistan\"\n    },\n    {\n      \"code\": \"+1 649\",\n      \"name\": \"Turks and Caicos Islands\"\n    },\n    {\n      \"code\": \"+688\",\n      \"name\": \"Tuvalu\"\n    },\n    {\n      \"code\": \"+1 340\",\n      \"name\": \"U.S. Virgin Islands\"\n    },\n    {\n      \"code\": \"+256\",\n      \"name\": \"Uganda\"\n    },\n    {\n      \"code\": \"+380\",\n      \"name\": \"Ukraine\"\n    },\n    {\n      \"code\": \"+971\",\n      \"name\": \"United Arab Emirates\"\n    },\n    {\n      \"code\": \"+44\",\n      \"name\": \"United Kingdom\"\n    },\n    {\n      \"code\": \"+1\",\n      \"name\": \"United States\"\n    },\n    {\n      \"code\": \"+598\",\n      \"name\": \"Uruguay\"\n    },\n    {\n      \"code\": \"+998\",\n      \"name\": \"Uzbekistan\"\n    },\n    {\n      \"code\": \"+678\",\n      \"name\": \"Vanuatu\"\n    },\n    {\n      \"code\": \"+58\",\n      \"name\": \"Venezuela\"\n    },\n    {\n      \"code\": \"+84\",\n      \"name\": \"Vietnam\"\n    },\n    {\n      \"code\": \"+1 808\",\n      \"name\": \"Wake Island\"\n    },\n    {\n      \"code\": \"+681\",\n      \"name\": \"Wallis and Futuna\"\n    },\n    {\n      \"code\": \"+967\",\n      \"name\": \"Yemen\"\n    },\n    {\n      \"code\": \"+260\",\n      \"name\": \"Zambia\"\n    },\n    {\n      \"code\": \"+255\",\n      \"name\": \"Zanzibar\"\n    },\n    {\n      \"code\": \"+263\",\n      \"name\": \"Zimbabwe\"\n    }\n  ]\n}', '2022-06-06 06:54:27', '2022-06-06 06:48:21'),
(26, 'country_code', '+91', '2022-06-06 07:52:41', '2022-06-06 07:52:26'),
(27, 'api_key_settings', '{\"API_link_for_customer_app\":\"http:\\/\\/localhost\\/edemand\\/api\\/v1\\/\",\"API_link_for_provider_app\":\"http:\\/\\/localhost\\/edemand\\/partner\\/api\\/v1\\/\",\"google_map_api\":\"your_MAP_API_KEY\"}', '2025-05-09 06:14:09', NULL),
(29, 'range_units', 'kilometers', '2022-08-10 10:37:37', NULL),
(30, 'contact_us', '{\"contact_us\":\"<p>#262-263, Time Square Empire, SH 42 Mirjapar highway,<br \\/>Bhuj - Kutch 370001 Gujarat India.<br \\/><br \\/><a class=\\\"c-link c-link--underline\\\" href=\\\"http:\\/\\/support@wrteam.in\\/\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" data-stringify-link=\\\"http:\\/\\/support@wrteam.in\\/\\\" data-sk=\\\"tooltip_parent\\\">Email Address :<\\/a>&nbsp;<a class=\\\"c-link c-link--underline\\\" href=\\\"mailto:support@wrteam.in\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" data-stringify-link=\\\"mailto:support@wrteam.in\\\" data-sk=\\\"tooltip_parent\\\" aria-haspopup=\\\"menu\\\" aria-expanded=\\\"false\\\">support@wrteam.in<\\/a><\\/p>\\r\\n<p><a class=\\\"c-link c-link--underline\\\" href=\\\"http:\\/\\/www.wrteam.in\\/\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" data-stringify-link=\\\"http:\\/\\/www.wrteam.in\\\" data-sk=\\\"tooltip_parent\\\">www.wrteam.in<\\/a><\\/p>\\r\\n<p>Phone Number :&nbsp;<a class=\\\"c-link c-link--underline\\\" href=\\\"tel:+919797945459\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" data-stringify-link=\\\"tel:+919797945459\\\" data-sk=\\\"tooltip_parent\\\">+91 8200323468<\\/a><\\/p>\"}', '2024-05-01 08:09:44', NULL),
(31, 'system_tax_settings', '{\"tax_status\":\"on\",\"tax_name\":\"GST\",\"tax\":\"10\"}', '2022-11-11 05:17:50', NULL),
(33, 'firebase_settings', '{\"apiKey\":\"Api Key\",\"authDomain\":\"Auth Domain\",\"projectId\":\"Project Id\",\"storageBucket\":\"Storage Bucket\",\"messagingSenderId\":\"Messaging Sender Id\",\"appId\":\"App Id\",\"measurementId\":\"Measurement Id\",\"vapidKey\":\"Vapid Key\",\"json_file\":\"\"}', '2025-05-09 06:15:04', NULL),
(34, 'web_settings', '{\"category_section_title\":\"Essential Repair Services\",\"category_section_description\":\"Discover top-notch services tailored to meet your every need. Our professionals are dedicated to providing reliable and efficient solutions for your home and beyond.\",\"rating_section_title\":\"What people say about our services\",\"rating_section_description\":\"Read feedback from our valued customers to see how we\\u2019ve made a difference for them. Your opinion matters to us\\u2014share your experience and help others make informed decisions.\",\"faq_section_title\":\"Frequently Asked Questions\",\"faq_section_description\":\"Find answers to common questions about our services, how to use the app, and more. If you have any additional questions, feel free to reach out to our support team for further assistance.\",\"rating_section_status\":1,\"faq_section_status\":1,\"category_section_status\":1,\"process_flow_status\":1,\"landing_page_title\":\"One Stop Solution For Your All Services\",\"process_flow_title\":\"How eDemand Work\",\"process_flow_description\":\"Learn how eDemand streamlines the service booking process for you. From selecting your desired service to tracking its progress, our user-friendly platform ensures a seamless experience.\",\"footer_description\":\"eDemand: Your premier destination for efficient and reliable on-demand services.\",\"step_1_title\":\"Request Service\",\"step_2_title\":\"Match with Providers\",\"step_3_title\":\"Monitor Progress\",\"step_4_title\":\"Receive Quality Results\",\"step_1_description\":\"Easily request the service you need with just a few taps. Get started quickly and effortlessly!\",\"step_2_description\":\"Find the perfect provider for your service needs. Our smart matching ensures you get the best fit.\",\"step_3_description\":\"Stay updated on your service progress in real-time. Track every step and stay informed.\",\"step_4_description\":\"Enjoy top-quality results delivered right to your doorstep. Satisfaction guaranteed with every service.\",\"category_ids\":[\"270\",\"265\",\"259\",\"252\",\"246\",\"240\",\"222\",\"221\",\"213\"],\"rating_ids\":[\",86,85,81,73,42,27,26\"],\"social_media\":[{\"url\":\"https:\\/\\/twitter.com\\/wrteamin\",\"file\":\"x.png\"},{\"url\":\"https:\\/\\/www.linkedin.com\\/company\\/wrteam\\/\",\"file\":\"li.png\"},{\"url\":\"https:\\/\\/api.whatsapp.com\\/send\\/?phone=%2B918200323468&text=Hello%20WRTeam&type=phone_number&app_absent=0\",\"file\":\"w.png\"},{\"url\":\"https:\\/\\/www.facebook.com\\/wrteam.in\\/\",\"file\":\"f.png\"},{\"url\":\"https:\\/\\/www.youtube.com\\/channel\\/UCLt9XRUuiWsqKng4681_6cQ\",\"file\":\"Youtube.png\"},{\"url\":\"https:\\/\\/www.instagram.com\\/wrteam.in\\/?hl=en\",\"file\":\"insta.png\"}],\"web_title\":\"Let\\u2019s Download eDemand Mobile App Free\",\"playstore_url\":\"https:\\/\\/play.google.com\\/store\\/apps\\/details?id=wrteam.edemand.customer.e_demand\",\"web_maintenance_mode\":0,\"app_section_status\":\"\",\"applestore_url\":\"https:\\/\\/testflight.apple.com\\/join\\/KdqqsTnH\",\"web_logo\":\"1712291207_ea8387289fbe73fb9692.svg\",\"web_favicon\":\"1712290334_2aea411f2bf5ddf3e429.svg\",\"web_half_logo\":\"1712290334_44294b1cf3becbbf12c8.svg\",\"footer_logo\":\"1728041471_af1190b0db783d2f4c83.png\",\"landing_page_logo\":\"1712290334_c232acc0fea1307e8e97.png\",\"landing_page_backgroud_image\":\"1727435552_acdf7561ec6b35394f6f.jpeg\",\"step_1_image\":\"1728038098_97ac34997ed2ee92e9f6.png\",\"step_2_image\":\"1728038003_14c6cf9429a5e5a8f5e1.png\",\"step_3_image\":\"1712289102_5f4cd2d127ceb36b69a0.png\",\"step_4_image\":\"1712289102_089f079a3cb8fd99f6c2.png\"}', '2025-03-27 05:49:22', NULL),
(35, 'notification_settings', '{\"provider_approved_email\":\"true\",\"provider_approved_sms\":\"true\",\"provider_approved_notification\":\"true\",\"provider_disapproved_email\":\"true\",\"provider_disapproved_sms\":\"true\",\"provider_disapproved_notification\":\"true\",\"withdraw_request_approved_email\":\"true\",\"withdraw_request_approved_sms\":\"true\",\"withdraw_request_approved_notification\":\"true\",\"withdraw_request_disapproved_email\":\"true\",\"withdraw_request_disapproved_sms\":\"true\",\"withdraw_request_disapproved_notification\":\"true\",\"payment_settlement_email\":\"true\",\"payment_settlement_sms\":\"true\",\"payment_settlement_notification\":\"true\",\"service_approved_email\":\"true\",\"service_approved_sms\":\"true\",\"service_approved_notification\":\"true\",\"service_disapproved_email\":\"true\",\"service_disapproved_sms\":\"true\",\"service_disapproved_notification\":\"true\",\"user_account_active_email\":\"true\",\"user_account_active_sms\":\"true\",\"user_account_active_notification\":\"true\",\"user_account_deactive_email\":\"true\",\"user_account_deactive_sms\":\"true\",\"user_account_deactive_notification\":\"true\",\"provider_update_information_email\":\"true\",\"provider_update_information_sms\":\"true\",\"provider_update_information_notification\":\"true\",\"new_provider_registerd_email\":\"true\",\"new_provider_registerd_sms\":\"true\",\"new_provider_registerd_notification\":\"true\",\"withdraw_request_received_email\":\"true\",\"withdraw_request_received_sms\":\"true\",\"withdraw_request_received_notification\":\"true\",\"booking_status_updated_email\":\"true\",\"booking_status_updated_sms\":\"true\",\"booking_status_updated_notification\":\"true\",\"new_booking_confirmation_to_customer_email\":\"true\",\"new_booking_confirmation_to_customer_sms\":\"true\",\"new_booking_confirmation_to_customer_notification\":\"true\",\"new_booking_received_for_provider_email\":\"true\",\"new_booking_received_for_provider_sms\":\"true\",\"new_booking_received_for_provider_notification\":\"true\",\"withdraw_request_send_email\":\"true\",\"withdraw_request_send_sms\":\"true\",\"withdraw_request_send_notification\":\"true\",\"new_rating_given_by_customer_email\":\"true\",\"new_rating_given_by_customer_sms\":\"true\",\"new_rating_given_by_customer_notification\":\"true\",\"rating_request_to_customer_email\":\"true\",\"rating_request_to_customer_sms\":\"true\",\"rating_request_to_customer_notification\":\"true\"}', '2025-04-10 13:39:34', NULL),
(36, 'sms_gateway_setting', '{\"twilio\":{\"twilio_status\":\"1\",\"twilio_account_sid\":\"\",\"twilio_auth_token\":\"\",\"twilio_from\":\"\"},\"vonage\":{\"vonage_status\":\"0\",\"vonage_api_key\":\"\",\"vonage_api_secret\":\"\"},\"current_sms_gateway\":\"twilio\"}', '2025-05-09 06:15:27', NULL),
(37, 'storage_disk', 'local_server', '2025-02-05 04:42:58', NULL),
(38, 'become_provider_page_settings', '{\"hero_section\":\"{\\\"status\\\":1,\\\"short_headline\\\":\\\"OPPORTUNITY KNOCKS\\\",\\\"title\\\":\\\"We Provide High Quality Professional Services\\\",\\\"description\\\":\\\"Become an ShebaCity provider and start earning extra money today. Enjoy flexibility, choose your hours, and take control of your financial future.\\\",\\\"images\\\":[{\\\"image\\\":\\\"1742990017_b7543a5a607df5412e6b.png\\\"},{\\\"image\\\":\\\"1742990529_dc811298a4aa05b7cb85.png\\\"},{\\\"image\\\":\\\"1742990529_5f56f34f54c25c2abf25.png\\\"},{\\\"image\\\":\\\"1742990529_70d695d2bb7e36041338.png\\\"}]}\",\"how_it_work_section\":\"{\\\"status\\\":1,\\\"short_headline\\\":\\\"HOW IT WORKS\\\",\\\"title\\\":\\\"Become a Successful Service Provider\\\",\\\"description\\\":\\\"Easily transform your skills into a thriving business. Our platform provides the tools you need to attract customers, manage bookings, and grow your service empire.\\\",\\\"steps\\\":\\\"[{\\\\\\\"title\\\\\\\":\\\\\\\"Create an Account as a Provider\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Register as a service provider in the system\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Approval from Admin\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"The admin will review and approve the provider\'s profile\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Add Services\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"The provider can list the services they offer\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Subscription Purchase\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Providers need to buy a subscription to be listed for customers.\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Receive Bookings\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Customers can book services based on the listed offerings.\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Custom Bookings\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Providers can receive custom booking requests.\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Bidding System\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Providers can bid for custom jobs, increasing their earning opportunities.\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Service Mode Selection\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Providers can choose to offer services at the customer\\\\\\\\u2019s location or at their shop.\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Earnings Based on Work\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Payment is received based on the completed services.\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Track Earnings\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Providers can view their earnings and transaction details.\\\\\\\"},{\\\\\\\"title\\\\\\\":\\\\\\\"Promocode Offers\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"Providers can offer promo codes to attract more bookings.\\\\\\\"}]\\\"}\",\"category_section\":\"{\\\"status\\\":1,\\\"short_headline\\\":\\\"YOUR NEEDS, OUR SERVICES \\\",\\\"title\\\":\\\"Discover a World of Services at Your Fingertips\\\",\\\"description\\\":\\\"Need a cleaner, a plumber, or a tech expert? We have got you covered. Discover a wide range of services, all in one place.\\\"}\",\"subscription_section\":\"{\\\"status\\\":1,\\\"short_headline\\\":\\\"UNLOCK UNLIMITED ACCESS\\\",\\\"title\\\":\\\"Elevate Your Business with Our Subscription\\\",\\\"description\\\":\\\"     Get more out of eDemand with our subscription plan. Enjoy increased visibility, access to premium features, and the ability to expand your service offerings.\\\"}\",\"top_providers_section\":\"{\\\"status\\\":1,\\\"short_headline\\\":\\\"TOP RATED PROVIDERS\\\",\\\"title\\\":\\\"Trusted by Thousands: Our Top-Rated Providers\\\",\\\"description\\\":\\\"Our top-rated providers are customer favorites. With a proven track record of excellence, they consistently deliver outstanding service.\\\"}\",\"review_section\":\"{\\\"status\\\":1,\\\"short_headline\\\":\\\"YOUR REVIEW MATTERS\\\",\\\"title\\\":\\\"What our Customers Says About Providers\\\",\\\"description\\\":\\\"Discover how eDemand has transformed businesses. Hear directly from our satisfied providers about their success stories and how our platform has helped them reach new heights.\\\"}\",\"faq_section\":\"{\\\"status\\\":1,\\\"short_headline\\\":\\\"TRANSPARENCY MATTERS\\\",\\\"title\\\":\\\"Need Help? We have Got Answers\\\",\\\"description\\\":\\\"Have questions about joining eDemand or providing services? Our FAQ section offers clear and concise answers to the most common inquiries.\\\"}\",\"feature_section\":\"{\\\"status\\\":1,\\\"features\\\":[{\\\"short_headline\\\":\\\"SET YOUR OWN HOURS, SERVE YOUR WAY\\\",\\\"title\\\":\\\"Take Control of Your Time and Business\\\",\\\"description\\\":\\\"Enjoy unparalleled flexibility as you build your service empire. Our platform empowers you to set your own schedule, choose your clients, and balance your work life seamlessly.\\\",\\\"position\\\":\\\"left\\\",\\\"image\\\":\\\"1742990476_7c946e2beefbe218e5b7.png\\\"},{\\\"short_headline\\\":\\\"CONNECT, CHAT, CARE\\\",\\\"title\\\":\\\"Instant Messaging for Better Service\\\",\\\"description\\\":\\\"Enjoy unparalleled flexibility as you build your service empire. Our platform empowers you to set your own schedule, choose your clients, and balance your work life seamlessly.\\\",\\\"position\\\":\\\"right\\\",\\\"image\\\":\\\"1742990476_21fde946dc6b5480c1dc.png\\\"},{\\\"short_headline\\\":\\\"YOUR SERVICE, YOUR RULES\\\",\\\"title\\\":\\\"Take Charge of Your Service Business\\\",\\\"description\\\":\\\"Create detailed service listings including a unique name, categorize your service for easy discovery, and outline the specific tasks involved. Enhance your listing with relevant files like images or documents. Provide a clear and informative description of your service, including pricing details and frequently asked questions.\\\\r\\\\n\\\\r\\\\nManage your service status, cancellation policy, and payment options. Choose whether your service is offered at your location or at the customers doorstep.\\\",\\\"position\\\":\\\"left\\\",\\\"image\\\":\\\"1742990476_69bd7d61c27daa6346ce.png\\\"}]}\"}', '2025-04-21 07:54:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settlement_cashcollection_history`
--

CREATE TABLE `settlement_cashcollection_history` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_request_id` int(11) DEFAULT NULL,
  `commission_percentage` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `type` text NOT NULL COMMENT ' -cash_collection_by_admin  - cod\r\n    -cash_collection_by_provider - code\r\n    -received_by_admin - online_payment\r\n    -settled_by_settlement - manual settlement by admin\r\n    -settled_by_payment_request - withrequest approved by admin',
  `date` date NOT NULL,
  `time` time NOT NULL,
  `amount` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `commission_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settlement_history`
--

CREATE TABLE `settlement_history` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `date` date NOT NULL,
  `amount` text NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `type_id` int(11) NOT NULL,
  `app_image` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - deactive \r\n1 - active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `url` text DEFAULT NULL,
  `web_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `type`, `type_id`, `app_image`, `status`, `created_at`, `updated_at`, `url`, `web_image`) VALUES
(38, 'Category', 240, '1743168351_f294f914fb98c727fa9e.png', 1, '2022-11-14 12:05:00', '2025-04-24 15:45:38', '', '1743164615_f81027d4be978ad50bfc.png'),
(39, 'Category', 213, '1743491300_1a6d5fee938f8668ce63.png', 1, '2022-11-14 12:07:00', '2025-04-24 15:46:13', '', '1743164628_e915c8972d2724c06399.png');

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `template` longtext NOT NULL,
  `parameters` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `title` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `type`, `template`, `parameters`, `created_at`, `updated_at`, `title`) VALUES
(18, 'provider_approved', 'Dear [[provider_name]], your request as a provider has been approved. You can now start providing services through our platform. Visit [[site_url]] for more details.', '[\"provider_name\",\"site_url\"]', '2024-07-16 12:19:21', '2024-07-16 12:19:21', 'Approval'),
(19, 'provider_disapproved', 'Dear [[provider_name]], we regret to inform you that your provider request with [[company_name]] has been disapproved. For further information, please contact us at [[company_contact_info]].\r\n', '[\"provider_name\",\"company_name\",\"company_contact_info\"]', '2024-07-16 12:23:29', '2024-07-16 12:23:29', 'Rejection'),
(20, 'withdraw_request_approved', 'Hello [[provider_name]], your withdrawal request has been approved. The amount of [[amount]] [[currency]] will be processed shortly.', '[\"provider_name\",\"amount\",\"currency\"]', '2024-07-16 12:24:04', '2024-07-16 12:24:04', 'Withdrawal'),
(21, 'withdraw_request_disapproved', 'Hello [[provider_name]], we regret to inform you that your withdrawal request has been disapproved.Please contact [[company_name]] at [[company_contact_info]] for more details.\r\n', '[\"provider_name\",\"company_name\",\"company_contact_info\"]', '2024-07-16 12:34:19', '2024-07-16 12:34:19', 'Withdrawal'),
(22, 'payment_settlement', 'Dear [[provider_name]], your payment of [[amount]] [[currency]] has been successfully settled. Thank you for choosing [[company_name]].\r\n', '[\"provider_name\",\"amount\",\"currency\",\"company_name\"]', '2024-07-16 12:35:19', '2024-07-16 12:35:19', 'Payment'),
(23, 'service_disapproved', 'Dear [[provider_name]], we regret to inform you that your service request ([[service_name]]) with [[company_name]] has been disapproved. Please contact us for further assistance.\r\n', '[\"provider_name\",\"service_name\",\"company_name\"]', '2024-07-16 12:36:14', '2024-07-16 12:36:14', 'Rejection'),
(24, 'service_approved', 'Hello [[provider_name]], your service request ([[service_name]]) has been approved by [[company_name]]. You can proceed with the service as planned.\r\n', '[\"provider_name\",\"service_name\",\"company_name\"]', '2024-07-16 12:37:22', '2024-07-16 12:37:22', 'Approval'),
(25, 'user_account_active', 'Hello [[user_name]], your account with [[company_name]] is now active. \r\n', '[\"user_name\",\"company_name\"]', '2024-07-16 12:37:56', '2024-07-16 12:37:56', 'Account'),
(26, 'user_account_deactive', 'Hello [[user_name]], your account with [[company_name]] has been deactivated. If you have any questions, please contact us at [[company_contact_info]].\r\n', '[\"user_name\",\"company_name\",\"company_contact_info\"]', '2024-07-16 12:38:47', '2024-07-16 12:38:47', 'Account'),
(27, 'booking_status_updated', 'Hello [[user_name]], the status of your booking ([[booking_id]]) with [[company_name]] has been updated. Visit [[site_url]] for details.\r\n', '[\"user_name\",\"booking_id\",\"company_name\",\"site_url\"]', '2024-07-16 12:44:21', '2024-07-16 12:44:21', 'Booking'),
(28, 'new_booking_confirmation_to_customer', 'Hello [[user_name]], your booking ([[booking_id]]) with [[company_name]] for [[booking_service_names]] on [[booking_date]] at [[booking_time]] has been confirmed. Thank you for choosing us!\r\n', '[\"user_name\",\"booking_id\",\"company_name\",\"booking_service_names\",\"booking_date\",\"booking_time\"]', '2024-07-16 12:46:26', '2024-07-16 12:46:26', 'Booking'),
(29, 'new_booking_received_for_provider', 'Hello [[provider_name]], a new booking ([[booking_id]]) has been received for you from [[user_name]]. Please review and confirm at [[site_url]].\r\n', '[\"provider_name\",\"booking_id\",\"user_name\",\"site_url\"]', '2024-07-16 12:47:31', '2024-07-16 12:47:31', 'New'),
(30, 'provider_update_information', 'Hello [[company_logo]], [[provider_name]] updated their details. Check once.\r\n', '[\"company_logo\",\"provider_name\"]', '2024-07-16 12:48:38', '2024-07-16 12:48:38', 'Provider Update Information'),
(31, 'new_provider_registerd', 'A new provider [[provider_name]] has registered with [[company_name]]. Visit [[site_url]] for more details.\r\n', '[\"provider_name\",\"company_name\",\"site_url\"]', '2024-07-16 12:51:15', '2024-07-16 12:51:15', 'New Provider Registered'),
(32, 'withdraw_request_received', 'Hello [[provider_name]], we have received your withdrawal request. It is currently being processed. You will be notified once it\'s approved or disapproved.\r\n', '[\"provider_name\"]', '2024-07-16 12:54:38', '2024-07-16 12:54:38', 'Withdrawal Request Received'),
(33, 'new_rating_given_by_customer', 'Dear [[provider_name]] A [[user_name]] has just rated your service. Check your dashboard for details and feedback. Thank you!', '[\"provider_name\",\"user_name\"]', '2024-08-02 17:54:27', '2024-08-02 17:54:27', 'New Rating Alert'),
(34, 'rating_request_to_customer', 'Dear [[user_name]] We value your feedback! Please take a moment to rate your recent experience with us. Your input helps us improve. \r\n\r\n', '[\"user_name\"]', '2024-08-02 17:56:08', '2024-08-02 17:56:08', 'Rating Request to customer'),
(35, 'new_booking_received_for_provider', '[[user_id]]okokkokokok', '[\"user_id\"]', '2024-11-29 22:50:10', '2024-11-29 22:50:10', 'ok');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `duration` text NOT NULL,
  `price` double NOT NULL,
  `discount_price` double NOT NULL,
  `publish` text NOT NULL,
  `order_type` text NOT NULL,
  `max_order_limit` text DEFAULT NULL,
  `service_type` text NOT NULL,
  `max_service_limit` text DEFAULT NULL,
  `tax_type` text NOT NULL,
  `tax_id` text DEFAULT NULL,
  `is_commision` text NOT NULL,
  `commission_threshold` text DEFAULT NULL,
  `commission_percentage` text DEFAULT NULL,
  `status` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `name`, `description`, `duration`, `price`, `discount_price`, `publish`, `order_type`, `max_order_limit`, `service_type`, `max_service_limit`, `tax_type`, `tax_id`, `is_commision`, `commission_threshold`, `commission_percentage`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Premium1', 'Unlock enhanced business opportunities with our subscription plans tailored for providers. Gain access to a host of premium features designed to elevate your services and maximize your reach.', '30', 599, 549, '1', 'unlimited', '0', 'unlimited', NULL, 'included', '12', 'yes', '100000', '40', '1', '2023-08-10 13:42:15', '2023-08-10 13:42:15'),
(8, 'Pro Plan', 'Buy the Pro plan and get your bookings.', '180', 1099, 999, '1', 'limited', '90', 'unlimited', NULL, 'included', '16', 'yes', '10000', '5', '1', '2023-09-11 06:14:12', '2023-09-11 06:14:12'),
(9, 'Standard', 'Buy the Standard plan and get bookings', '90', 699, 749, '1', 'limited', '50', 'unlimited', NULL, '', NULL, 'yes', '1', '10', '1', '2024-08-06 07:51:44', '2024-08-06 07:51:44'),
(10, 'Elite', 'Buy the Elite plan and get your bookings', '365', 1599, 1299, '1', 'unlimited', '0', 'unlimited', NULL, 'excluded', '', 'no', '0', '0', '1', '2024-08-06 07:56:03', '2024-08-06 07:56:03'),
(11, 'Essential', 'Try with the Essential plan and start your business', 'unlimited', 0, 500, '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '1', '2024-08-06 07:59:10', '2024-08-06 07:59:10');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `title` varchar(1024) NOT NULL,
  `percentage` double NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0- deactive | 1 - active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `title`, `percentage`, `status`, `created_at`, `updated_at`) VALUES
(6, 'GST', 5, 1, '2022-06-22 10:16:35', '2022-08-03 09:48:30'),
(7, 'NIL', 3, 1, '2022-06-22 10:16:43', '2022-08-03 09:48:25'),
(9, 'INTL', 10, 1, '2022-07-16 07:33:51', '2022-07-27 08:34:16'),
(10, 'PLTL', 1, 1, '2022-07-16 07:34:03', '2022-07-27 08:34:22'),
(11, 'BTPL', 25, 1, '2022-07-16 07:34:15', '2022-07-27 08:34:25'),
(12, 'MNLP', 10, 1, '2022-07-16 07:34:29', '2022-07-27 08:34:27'),
(14, 'mok', 1, 0, '2022-08-10 09:57:51', NULL),
(15, 'test', 5, 1, '2022-11-09 04:11:59', NULL),
(16, 'None', 0, 1, '2023-03-11 04:31:07', NULL),
(17, 'TEST', 1, 1, '2023-03-14 08:44:42', '2023-03-14 14:14:54'),
(18, 'test', 12, 1, '2025-03-27 06:08:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_default` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `slug`, `image`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Retro', 'retro', 'retro.png', 1, 1, '2021-12-03 13:33:03', '2022-08-09 10:20:22');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `transaction_type` varchar(16) NOT NULL,
  `user_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `order_id` varchar(128) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `txn_id` varchar(256) DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(12) DEFAULT NULL,
  `currency_code` varchar(5) DEFAULT NULL,
  `message` varchar(128) NOT NULL,
  `transaction_date` timestamp NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` text DEFAULT NULL,
  `subscription_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(20) NOT NULL,
  `version` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `version`, `created_at`, `updated_at`) VALUES
(1, '1.0', '2022-11-14 04:55:25', '2022-11-14 04:55:25'),
(3, '1.1.0', '2022-12-02 12:13:49', '2022-12-02 12:13:49'),
(6, '1.2.0', '2022-12-20 04:14:25', '2022-12-20 04:14:25'),
(7, '1.3.0', '2023-01-27 10:45:33', '2023-01-27 10:45:33'),
(8, '1.4.0', '2023-01-27 10:45:33', '2023-01-27 10:45:33'),
(10, '1.5.0', '2023-04-08 09:50:57', '2023-04-08 09:50:57'),
(11, '1.6.0', '2023-04-28 12:11:05', '2023-04-28 12:11:05'),
(12, '1.7.0', '2023-06-19 04:39:36', '2023-06-19 04:39:36'),
(13, '1.8.0', '2023-06-27 12:56:56', '2023-06-27 12:56:56'),
(14, '1.9.0', '2023-08-10 13:27:50', '2023-08-10 13:27:50'),
(15, '2.0.0', '2023-09-25 08:37:36', '2023-09-25 08:37:36'),
(16, '2.1.0', '2023-10-27 10:45:27', '2023-10-27 10:45:27'),
(17, '2.2.0', '2024-02-01 12:16:21', '2024-02-01 12:16:21'),
(18, '2.2.1', '2024-02-15 12:31:25', '2024-02-15 12:31:25'),
(19, '2.3.0', '2024-03-18 11:10:34', '2024-03-18 11:10:34'),
(20, '2.4.0', '2024-04-08 04:04:54', '2024-04-08 04:04:54'),
(21, '2.5.0', '2024-05-14 12:45:05', '2024-05-14 12:45:05'),
(22, '2.6.0', '2024-06-14 06:41:44', '2024-06-14 06:41:44'),
(23, '2.7.0', '2024-07-10 09:25:38', '2024-07-10 09:25:38'),
(24, '2.8.0', '2024-08-31 07:08:43', '2024-08-31 07:08:43'),
(25, '2.9.0', '2024-09-23 09:43:41', '2024-09-23 09:43:41'),
(26, '3.0.0', '2024-11-30 05:46:04', '2024-11-30 05:46:04'),
(27, '3.0.1', '2025-02-05 04:39:04', '2025-02-05 04:39:04'),
(28, '3.1.0', '2025-02-05 04:42:58', '2025-02-05 04:42:58'),
(29, '4.0.0', '2025-03-26 13:44:05', '2025-03-26 13:44:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `country_code` text NOT NULL,
  `fcm_id` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `api_key` text NOT NULL,
  `friends_code` varchar(255) DEFAULT NULL,
  `referral_code` varchar(255) DEFAULT NULL,
  `city_id` int(50) DEFAULT 0,
  `city` varchar(252) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payable_commision` int(11) NOT NULL DEFAULT 0,
  `strip_id` text DEFAULT NULL,
  `web_fcm_id` text DEFAULT NULL,
  `platform` text DEFAULT NULL,
  `panel_fcm_id` text DEFAULT NULL,
  `unsubscribe_email` varchar(255) NOT NULL DEFAULT '1',
  `uid` varchar(255) DEFAULT NULL,
  `loginType` varchar(255) DEFAULT NULL,
  `countryCodeName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `balance`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `country_code`, `fcm_id`, `image`, `api_key`, `friends_code`, `referral_code`, `city_id`, `city`, `latitude`, `longitude`, `created_at`, `updated_at`, `payable_commision`, `strip_id`, `web_fcm_id`, `platform`, `panel_fcm_id`, `unsubscribe_email`, `uid`, `loginType`, `countryCodeName`) VALUES
(1, '127.0.0.1', 'Wrteam', '$2y$12$4Eag4sMGT78JqLPfKSDFleYPX/TZYzOjrRpeKcsDnxS3qbgEMP6F6', 'wrteam@gmail.com', 0, NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1746770252, 1, 'Admin', 'istrator', 'ADMIN', '9876543210', '+91', NULL, '1713127745_b2ad80a25b45f12f8087.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODU1ODUsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjE1ODUsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMSJ9.N6hNKXlLvu-DKlGL4qcANnwrrEQ9ts1pqziPucItt60', '45dsrwr', 'MY_CODE', 10, '', '23.2740707', '69.6530334', '2022-05-24 04:44:29', '2022-05-24 04:44:29', 0, NULL, '', 'android', NULL, '1', NULL, NULL, NULL),
(50, '::1', 'Electric', '$2y$10$EeeO/x1rkDrFFY8DntNf5uyCjJ9T7KwDd8IPcoJBwVN8mcm3M1UFi', 'XXXX@gmail.com', 0, 'b1380c5ba355b7f1185e', '$2y$10$dieHbD7KDbD2xGEKgwpNQ.yFmTjXLJWnfGPyF5enwoFwCNnMMolOi', NULL, NULL, NULL, NULL, NULL, 1652250409, 1746749521, 1, 'partner', 'edemand', 'Edemand partner', '1234567890', '+91', NULL, 'public/backend/assets/profile/1742969097_4d02b386c0f0b780b015.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODY4NDEsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjI4NDEsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiNTAifQ.9PqL7oFGAS4PHvCYMhGFeFAmnI6hwpldaIUzs1lFgfQ', '', '', 18, 'bhuj', '23.2419997', '69.6669324', '2022-05-24 04:44:29', '2022-05-24 04:44:29', 0, NULL, NULL, 'ios', NULL, '1', NULL, NULL, NULL),
(260, '', 'Strombrand', '$2y$10$LCLTGT54z5uv5WH5qJQLLuSe6MslPCNOfnTl1vVMPk4RJUngdsb5y', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1680572239, 1, NULL, NULL, NULL, '12344567801', '+91', NULL, 'public/backend/assets/profile/02 StormBrand Electronic Store.jpg', '', NULL, NULL, NULL, 'Bhuj', '23.2740707', '69.6530334', '2022-11-07 07:29:11', '2022-11-07 07:29:11', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(263, '', 'divy', '$2y$12$4Eag4sMGT78JqLPfKSDFleYPX/TZYzOjrRpeKcsDnxS3qbgEMP6F6', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '12344567801', '+234', NULL, 'public/backend/assets/profile/1743420886_d3d945261f6f3f7caccb.jpg', '', NULL, NULL, NULL, 'Bhuj', '23.2740707', '69.6530334', '2022-11-07 10:31:39', '2022-11-07 10:31:39', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(270, '', 'amarik', '$2y$10$D6sdYtfZk7e9bYa3DQFVZu/ZNyPfx6gQWpcdh7usARWXELf0rz1ye', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1668582548, 1, NULL, NULL, NULL, '9988776655', '+91', NULL, 'public/backend/assets/profile/1743424881_ad710891149582cd0b37.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODU0MTAsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjE0MTAsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjcwIn0.-ByzeFrajWO1pOrHgZoBW3i0mNzrTB8v3ig0ifrMtiQ', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-08 04:17:16', '2022-11-08 04:17:16', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(273, '', 'Jack', '$2y$10$D6sdYtfZk7e9bYa3DQFVZu/ZNyPfx6gQWpcdh7usARWXELf0rz1ye', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1668409407, 1, NULL, NULL, NULL, '1234567888', '+91', NULL, 'public/backend/assets/profile/1742967144_ae77243cadd17ff2c4f3.png', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg0MjY0MzIsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2Njg0MjgyMzIsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjczIn0.IzWv2AgRqgumlymDMUGEtNtOGh_J6yH_VBr96w12rJM', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-08 06:36:44', '2022-11-08 06:36:44', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(283, '', 'Nupur Kailash', '$2y$10$D6sdYtfZk7e9bYa3DQFVZu/ZNyPfx6gQWpcdh7usARWXELf0rz1ye', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1667974321, 1, NULL, NULL, NULL, '54564344', '+91', NULL, 'public/backend/assets/profile/1742993942_71557a13acc4f1dfe43f.jpeg', '', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-08 11:01:16', '2022-11-08 11:01:16', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(293, '', 'Sameera', '$2y$10$oHvhoLB78/8Tj3d6WUEoaOXl67xLbou1XQbkgG3/AzUwfCi.sBbau', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1722626769, 1, NULL, NULL, NULL, '1234567891', '+91', NULL, 'public/backend/assets/profile/1742992459_3b1ee2b80e0a2259ae21.jpeg', '', NULL, NULL, 0, 'Dubai', '25.10631345233886', '55.25440692901611', '2022-11-09 05:11:30', '2022-11-09 05:11:30', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(297, '', 'Aarti', '$2y$10$ljAcz.E71F14C1a/ruePduDDi16RcE2.ddYV6lfzFdTthMpzBGeL.', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '12344567801', '+91', NULL, 'public/backend/assets/profile/1742991472_99120dd79584d814ebce.jpeg', '', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-09 05:53:22', '2022-11-09 05:53:22', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(298, '', 'anand', '$2y$10$fRH8HlV2VZFXoF9b1iRe0O9uNkKqi73niej/ZmhasO9TiBey.Bz4.', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1667977009, 1, NULL, NULL, NULL, '12344567801', '+91', NULL, 'public/backend/assets/profile/1742994304_1ae0ec0cdc2361c88e7a.png', '', NULL, NULL, 0, 'anjar', '23.2740707', '69.6530334', '2022-11-09 06:41:15', '2022-11-09 06:41:15', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(301, '', 'Ananya', '$2y$10$OutQAwonVK5Hv6mH9rTHNeQ5L9/4sIIMCiAyN3g0rIyngvJ1l6WYW', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '12344567801', '+234', NULL, 'public/backend/assets/profile/1743420736_ee7b45d7bb60e4e024cb.jpg', '', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-09 09:57:25', '2022-11-09 09:57:25', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(303, '', 'Himani', '$2y$10$pzyu3JDYCAdpiUuWOFy1Re/ueVhe4TocUmu1LtkyGX.f05yqNLwgq', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '12344567801', '+234', NULL, 'public/backend/assets/profile/1743425673_83dc22867fb32c384263.jpg', '', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-09 11:06:38', '2022-11-09 11:06:38', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(327, '', 'Asutosh', '$2y$10$EeeO/x1rkDrFFY8DntNf5uyCjJ9T7KwDd8IPcoJBwVN8mcm3M1UFi', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1743592030, 1, NULL, NULL, NULL, '12344567801', '+91', NULL, 'public/backend/assets/profile/1743423414_1475718107db2ec21417.png', '', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-15 06:06:30', '2022-11-15 06:06:30', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(51, 50, 3),
(223, 260, 3),
(227, 263, 3),
(241, 270, 3),
(244, 273, 3),
(251, 283, 3),
(256, 293, 3),
(258, 297, 3),
(259, 298, 3),
(262, 301, 3),
(264, 303, 3),
(284, 327, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users_tokens`
--

CREATE TABLE `users_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role` varchar(512) NOT NULL COMMENT '1. super admin\r\n2. admin\r\n3. client',
  `permissions` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `user_id`, `role`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 1, '1', NULL, '2022-07-19 07:32:07', '2022-08-05 09:58:16'),
(2, 37, '3', '{\"create\":{\"order\":0,\"category\":1,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":1,\"settings\":1},\"read\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":1,\"settings\":1},\"update\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"faq\":0,\"system\":1,\"support_ticket\":1,\"settings\":1},\"delete\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"notification\":0,\"system\":0}}', '2022-07-19 07:32:07', '2022-08-05 10:58:54'),
(10, 78, '2', '{\"create\":{\"order\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":0,\"settings\":0},\"read\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":0,\"settings\":0},\"update\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"faq\":0,\"system\":0,\"support_ticket\":0,\"settings\":0},\"delete\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"notification\":0,\"system\":0}}', '2022-07-20 10:37:18', '2022-08-05 12:21:44'),
(11, 141, '1', NULL, '2022-07-21 04:18:12', '2022-08-11 07:36:06'),
(12, 1, 'editor', '{\"create\":{\"order\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":0,\"settings\":0},\"read\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":0,\"settings\":0},\"update\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"faq\":0,\"system\":0,\"support_ticket\":0,\"settings\":0},\"delete\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"notification\":0,\"system\":0}}', '2022-10-20 11:22:19', '2022-10-20 11:22:19'),
(13, 1, 'admin', '{\"create\":{\"order\":0,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":\"\",\"notification\":1,\"city\":1,\"faq\":1,\"support_ticket\":1,\"settings\":1},\"read\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"notification\":1,\"city\":1,\"faq\":1,\"support_ticket\":1,\"settings\":1},\"update\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"city\":1,\"faq\":1,\"system\":1,\"support_ticket\":1,\"settings\":1},\"delete\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"city\":1,\"notification\":1,\"system\":1}}', '2022-11-16 07:32:15', '2022-11-16 07:32:15'),
(14, 1, 'admin', '{\"create\":{\"order\":0,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":\"\",\"notification\":1,\"city\":1,\"faq\":1,\"support_ticket\":1,\"settings\":1},\"read\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"notification\":1,\"city\":1,\"faq\":1,\"support_ticket\":1,\"settings\":1},\"update\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"city\":1,\"faq\":1,\"system\":1,\"support_ticket\":1,\"settings\":1},\"delete\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"city\":1,\"notification\":1,\"system\":1}}', '2022-11-16 07:36:04', '2022-11-16 07:36:04'),
(15, 555, '1', '', '2022-11-16 07:36:04', '2023-03-13 06:10:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `admin_contact_query`
--
ALTER TABLE `admin_contact_query`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_id` (`partner_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cash_collection`
--
ALTER TABLE `cash_collection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_codes`
--
ALTER TABLE `country_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_job_provider`
--
ALTER TABLE `custom_job_provider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_job_requests`
--
ALTER TABLE `custom_job_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `order_services`
--
ALTER TABLE `order_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`,`service_id`);

--
-- Indexes for table `partner_bids`
--
ALTER TABLE `partner_bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_details`
--
ALTER TABLE `partner_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`partner_id`),
  ADD KEY `address_id` (`address_id`(768));

--
-- Indexes for table `partner_subscriptions`
--
ALTER TABLE `partner_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_timings`
--
ALTER TABLE `partner_timings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_id` (`partner_id`);

--
-- Indexes for table `payment_request`
--
ALTER TABLE `payment_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`partner_id`),
  ADD KEY `partner_id` (`partner_id`);

--
-- Indexes for table `queue_jobs`
--
ALTER TABLE `queue_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_priority_status_available_at` (`queue`,`priority`,`status`,`available_at`);

--
-- Indexes for table `queue_jobs_failed`
--
ALTER TABLE `queue_jobs_failed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue` (`queue`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`category_id`,`tax_id`),
  ADD KEY `tax_id` (`tax_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `tax_id_2` (`tax_id`);

--
-- Indexes for table `services_ratings`
--
ALTER TABLE `services_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`service_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settlement_cashcollection_history`
--
ALTER TABLE `settlement_cashcollection_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settlement_history`
--
ALTER TABLE `settlement_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `users_tokens`
--
ALTER TABLE `users_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_contact_query`
--
ALTER TABLE `admin_contact_query`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_collection`
--
ALTER TABLE `cash_collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `country_codes`
--
ALTER TABLE `country_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `custom_job_provider`
--
ALTER TABLE `custom_job_provider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_job_requests`
--
ALTER TABLE `custom_job_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_services`
--
ALTER TABLE `order_services`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner_bids`
--
ALTER TABLE `partner_bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partner_details`
--
ALTER TABLE `partner_details`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=524;

--
-- AUTO_INCREMENT for table `partner_subscriptions`
--
ALTER TABLE `partner_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `partner_timings`
--
ALTER TABLE `partner_timings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3069;

--
-- AUTO_INCREMENT for table `payment_request`
--
ALTER TABLE `payment_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue_jobs`
--
ALTER TABLE `queue_jobs`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue_jobs_failed`
--
ALTER TABLE `queue_jobs_failed`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT for table `services_ratings`
--
ALTER TABLE `services_ratings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `settlement_cashcollection_history`
--
ALTER TABLE `settlement_cashcollection_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settlement_history`
--
ALTER TABLE `settlement_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2397;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2353;

--
-- AUTO_INCREMENT for table `users_tokens`
--
ALTER TABLE `users_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
