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
(213, 0, 'Home Services', '1749557242_7aea5ac9aaa83d4a1cd4.jpg', 'home-services', 0, 1, '2022-11-02 07:12:28', '2025-02-13 11:33:29', '#2a2c3e', '#ffffff'),
(215, 213, 'Room Cleaning', '1749557242_7aea5ac9aaa83d4a1cd4.jpg', 'room-cleaning', 0, 1, '2022-11-02 07:14:09', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(216, 213, 'Window Cleaning', '1749557242_7aea5ac9aaa83d4a1cd4.jpg', 'window-cleaning', 0, 1, '2022-11-02 07:17:13', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(217, 213, 'Washroom Cleaning', '1749557242_7aea5ac9aaa83d4a1cd4.jpg', 'washroom-cleaning', 0, 1, '2022-11-02 07:19:40', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(218, 213, 'Kitchen Cleaning', '1749557242_7aea5ac9aaa83d4a1cd4.jpg', 'kitchen-cleaning', 0, 1, '2022-11-02 07:30:06', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(220, 213, 'Carpet Cleaning', '1749557242_7aea5ac9aaa83d4a1cd4.jpg', 'carpet-cleaning', 0, 1, '2022-11-02 08:22:47', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(221, 0, 'Ac Services', '1749557242_7aea5ac9aaa83d4a1cd4.jpg', 'ac-services', 0, 1, '2022-11-02 08:42:23', '2025-02-11 18:10:57', '#2a2c3e', '#ffffff'),
(222, 0, 'Laundry Services', '1749557242_7aea5ac9aaa83d4a1cd4.jpg', 'laundry-services', 0, 1, '2022-11-02 09:37:57', '2025-02-11 18:10:30', '#2a2c3e', '#ffffff'),
(223, 221, 'Making to much noise', '1749557242_7aea5ac9aaa83d4a1cd4.jpg', 'making-to-much-noise', 6, 1, '2022-11-02 09:42:11', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF'),
(224, 221, 'Compressor  switching off', '1749557242_7aea5ac9aaa83d4a1cd4.jpg', 'compressor--switching-off', 5, 1, '2022-11-02 09:43:02', '0000-00-00 00:00:00', '#2A2C3E', '#FFFFFF');
(225, 0, 'Electronic Services', '1749557242_7aea5ac9aaa83d4a1cd4.jpg', 'electronic-services', 0, 1, '2022-11-05 04:49:46', '2025-02-11 18:13:24', '#2a2c3e', '#ffffff'),

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
(19, 'How do I rate and provide feedback on a service provider on eDemand?', 'After your service is completed, you can rate and provide feedback on the service provider through the app. Your feedback can help improve the quality of services provided on the platform.', '1', '2023-03-10 06:57:24', '2023-03-10 06:57:24');

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
(5, 50, 'Electric', 'Faulty switches? Shocks and sparks? Circuit overload? Whatever the problem, find the best electrician in Dubai, United Arab Emirates to fix it on the Urban Company app. We understand our customers’ concern about quality and security. Our team ensures that all our electricians are verified, well-experienced, and skilled to handle any electrical job.  Find our professional electrician services in Dubai, United Arab Emirates at affordable cost and thank us later for making your life this easier. You don’t need to worry about bookings because we have made this procedure short and simple. We are just one click away, so you can book for expert electricians in Dubai, United Arab Emirates in one go and have them at your doorstep on the same day.', 'public/backend/assets/national_id/1742965073_53632c1b6d9890b3baa8.jpg', 'Hill View, Hill garden road', 'public/backend/assets/banner/1743418562_4e6ca37dbfa559db7c93.png', '', 'public/backend/assets/passport/1742965074_548393688f402ecc86fa.jpg', 'HDFC12456', 'G85940T', 'HDFC', '343434', '2147483647', 'HDFC12456', 'zxc', 60, 1, 50, '0', 60, 1, 25, 4.5245901639344, 61, '2022-06-15 23:30:14', '0000-00-00 00:00:00', '[\"public\\/uploads\\/partner\\/1715745925_1f8a8192e8da04fb6e03.avif\",\"public\\/uploads\\/partner\\/1715745925_ce928a1e05cd061dba3f.avif\",\"public\\/uploads\\/partner\\/1715745925_916962931f9b23fe9a15.jpg\",\"public\\/uploads\\/partner\\/1715745925_338ff2b1d8bc38e1d98a.avif\",\"public\\/uploads\\/partner\\/1715745925_450e34a1f0b2d5cefb9b.jpg\",\"public\\/uploads\\/partner\\/1715745925_4f6721975f3ec89cc7da.jpg\"]', '<p>&nbsp;</p>\r\n<h1 style=\"color: #333; font-size: 32px;\">Your Trusted Electronic Service Provider</h1>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">We Fix, You Relax!</h2>\r\n<p style=\"color: #666; font-size: 18px; margin-top: 20px;\">At our electronic service provider, we take care of all your electronic repair needs with expertise and dedication. Our team of skilled technicians is committed to providing reliable and efficient solutions, so you can sit back, relax, and enjoy your devices without any worries.</p>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Our Services</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Smartphone Repair: From screen replacements to battery replacements, we fix all types of smartphone issues.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Laptop and Computer Repair: Our expert technicians handle laptop and computer repairs, ensuring optimal performance.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> TV and Home Theater Repair: We specialize in repairing TVs, home theaters, and audio systems to enhance your entertainment experience.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Gaming Console Repair: Get back in the game with our reliable gaming console repair services.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Electronic Device Upgrades: We offer upgrade services to help you keep up with the latest technology trends.</li>\r\n</ul>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Why Choose Us?</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Expert Technicians: Our highly skilled technicians possess the knowledge and expertise to handle all types of electronic repairs.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quick Turnaround Time: We strive to provide efficient and prompt service, ensuring minimal downtime for your devices.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quality Parts: We use only high-quality parts and components for repairs, ensuring long-lasting results.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Transparent Pricing: Our pricing is fair and transparent, with no hidden costs or surprises.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Excellent Customer Service: We are committed to providing exceptional customer service, ensuring your satisfaction throughout the repair process.</li>\r\n</ul>\r\n</div>', 1, 1, '0', '1', '1', '[\"272\",\"271\",\"270\",\"269\",\"268\",\"267\",\"265\",\"259\",\"258\",\"257\",\"256\",\"255\",\"254\",\"253\",\"252\",\"251\",\"250\",\"249\",\"248\",\"247\",\"246\",\"245\",\"244\",\"243\",\"242\",\"241\",\"240\",\"239\",\"238\",\"237\",\"236\",\"235\",\"234\",\"232\",\"230\",\"229\",\"228\",\"227\",\"226\",\"225\",\"224\",\"223\",\"222\",\"221\",\"220\",\"218\",\"217\",\"216\",\"215\",\"213\"]', '1', 'electric-1-1-1'),
(42, 204, 'Electric-1', 'Whatever the problem, find the best electrician in World, We understand our customers’ concern about quality and security. Our team ensures that all our electricians are verified, well-experienced, and skilled to handle any electrical job.\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\nFind our professional electrician services in eDemand App, You don’t need to worry about bookings because we have made this procedure short and simple. We are just one click away, so you can book for expert electricians in India, eDemand in one go and have them at your doorstep on the same day', 'download.jpg.jpg', 'Electric Point', 'public/backend/assets/banner/1668492390_65a23c3d746c54bddf35_1.jpg', NULL, NULL, '370001', '12ABCDE3456FGZH', 'BOB', '2147483647', 'test', '370001', '00', 60, 0, 0, '10', 10, 0, NULL, 0, 0, '2022-11-04 07:05:08', '0000-00-00 00:00:00', '', '<p>&nbsp;</p>\r\n<h1 style=\"color: #333; font-size: 32px;\">Your Trusted Electronic Service Provider</h1>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">We Fix, You Relax!</h2>\r\n<p style=\"color: #666; font-size: 18px; margin-top: 20px;\">At our electronic service provider, we take care of all your electronic repair needs with expertise and dedication. Our team of skilled technicians is committed to providing reliable and efficient solutions, so you can sit back, relax, and enjoy your devices without any worries.</p>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Our Services</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Smartphone Repair: From screen replacements to battery replacements, we fix all types of smartphone issues.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Laptop and Computer Repair: Our expert technicians handle laptop and computer repairs, ensuring optimal performance.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> TV and Home Theater Repair: We specialize in repairing TVs, home theaters, and audio systems to enhance your entertainment experience.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Gaming Console Repair: Get back in the game with our reliable gaming console repair services.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Electronic Device Upgrades: We offer upgrade services to help you keep up with the latest technology trends.</li>\r\n</ul>\r\n</div>\r\n<div style=\"margin-top: 40px;\">\r\n<h2 style=\"color: #666; font-size: 24px;\">Why Choose Us?</h2>\r\n<ul style=\"list-style: none; padding: 0; margin-top: 20px;\">\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Expert Technicians: Our highly skilled technicians possess the knowledge and expertise to handle all types of electronic repairs.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quick Turnaround Time: We strive to provide efficient and prompt service, ensuring minimal downtime for your devices.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Quality Parts: We use only high-quality parts and components for repairs, ensuring long-lasting results.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Transparent Pricing: Our pricing is fair and transparent, with no hidden costs or surprises.</li>\r\n<li style=\"color: #666; font-size: 18px; margin-bottom: 10px;\"><span style=\"color: #00b894;\">✓</span> Excellent Customer Service: We are committed to providing exceptional customer service, ensuring your satisfaction throughout the repair process.</li>\r\n</ul>\r\n</div>', 1, 1, '0', '1', '1', NULL, '1', 'electric'),
(108, 271, 'World Clean Pvt Ltd', '', 'passport.jpg.jpg', NULL, 'public/uploads/users/partners/banner_images/004 World Clean Pvt Ltd-min.jpg', NULL, NULL, 'GST', 'Y114-7129-6149', 'Bank of India.', '2147483647', NULL, '9256086', '100008', 60, 1, 20, '10', 20, 0, NULL, 0, 0, '2022-11-07 23:53:59', '0000-00-00 00:00:00', '', '', 1, 1, '0', '1', '1', NULL, '1', 'world-clean-pvt-ltd');
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
('11', 'active', '2025-05-09 11:50:59', '2025-05-09 11:50:59', 1, 12, 50, '2025-05-09', '2025-05-09', 'Essential', 'Try with the Essential plan and start your business', 'unlimited', '0', '500', '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '0', 0),
('11', 'active', '2025-05-09 11:48:37', '2025-05-09 11:48:37', 1, 1, 25, '2025-05-09', '2025-05-09', 'Essential', 'Try with the Essential plan and start your business', 'unlimited', '0', '500', '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '0', 0),
('11', 'active', '2025-05-09 11:48:55', '2025-05-09 11:48:55', 1, 2, 204, '2025-05-09', '2025-05-09', 'Essential', 'Try with the Essential plan and start your business', 'unlimited', '0', '500', '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '0', 0),
('11', 'active', '2025-05-09 11:49:11', '2025-05-09 11:49:11', 1, 3, 271, '2025-05-09', '2025-05-09', 'Essential', 'Try with the Essential plan and start your business', 'unlimited', '0', '500', '1', 'limited', '1', 'unlimited', NULL, 'excluded', '', 'no', '1000', '20', '0', 0);

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
(486, 50, 'monday', '09:00:00', '19:00:00', 1, '2025-04-04 08:43:59', '2025-04-04 08:43:59'),
(487, 50, 'tuesday', '09:00:00', '19:00:00', 1, '2025-04-04 08:43:59', '2025-04-04 08:43:59'),
(488, 50, 'wednesday', '09:00:00', '19:00:00', 1, '2025-04-04 08:43:59', '2025-04-04 08:43:59'),
(489, 50, 'thursday', '09:00:00', '19:00:00', 1, '2025-04-04 08:43:59', '2025-04-04 08:43:59'),
(490, 50, 'friday', '09:00:00', '19:00:00', 1, '2025-04-04 08:43:59', '2025-04-04 08:43:59'),
(491, 50, 'saturday', '00:00:00', '00:00:00', 0, '2025-04-04 08:43:59', '2025-04-04 08:43:59'),
(492, 50, 'sunday', '00:00:00', '00:00:00', 0, '2025-04-04 08:43:59', '2025-04-04 08:43:59'),
(493, 204, 'monday', '09:00:00', '19:00:00', 1, '2025-04-06 09:29:36', '2025-04-06 09:29:36'),
(494, 204, 'tuesday', '09:00:00', '19:00:00', 1, '2025-04-06 09:29:36', '2025-04-06 09:29:36'),
(495, 204, 'wednesday', '09:00:00', '19:00:00', 1, '2025-04-06 09:29:36', '2025-04-06 09:29:36'),
(496, 204, 'thursday', '09:00:00', '19:00:00', 1, '2025-04-06 09:29:36', '2025-04-06 09:29:36'),
(497, 204, 'friday', '09:00:00', '19:00:00', 1, '2025-04-06 09:29:36', '2025-04-06 09:29:36'),
(498, 204, 'saturday', '00:00:00', '00:00:00', 0, '2025-04-06 09:29:36', '2025-04-06 09:29:36'),
(499, 204, 'sunday', '00:00:00', '00:00:00', 0, '2025-04-06 09:29:36', '2025-04-06 09:29:36'),
(500, 271, 'monday', '09:00:00', '19:00:00', 1, '2025-04-06 22:08:16', '2025-04-06 22:08:16'),
(501, 271, 'tuesday', '09:00:00', '19:00:00', 1, '2025-04-06 22:08:16', '2025-04-06 22:08:16'),
(502, 271, 'wednesday', '09:00:00', '19:00:00', 1, '2025-04-06 22:08:16', '2025-04-06 22:08:16'),
(503, 271, 'thursday', '09:00:00', '19:00:00', 1, '2025-04-06 22:08:16', '2025-04-06 22:08:16'),
(504, 271, 'friday', '09:00:00', '19:00:00', 1, '2025-04-06 22:08:16', '2025-04-06 22:08:16'),
(505, 271, 'saturday', '00:00:00', '00:00:00', 1, '2025-04-06 22:08:16', '2025-04-06 22:08:16'),
(506, 271, 'sunday', '00:00:00', '00:00:00', 0, '2025-04-06 22:08:16', '2025-04-06 22:08:16'),
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
(41, 50, 213, 'included', 6, 0, 'Switch and Socket', 'switch-and-socket', 'Replacement of single switch  and repairing', 'electrician,led,electronic,electronics,electric,maintenance,electrical,electricity,switch,socket', 'public/uploads/services/1667630851_2b94161f1427d8482278.jpg', 100, 80, 1, '120', 0, 0, 1, 0, '', 10, 1, 1, '2025-05-04 12:56:50', '2025-05-26 13:44:06', '', '', '', '', '1', '1', 1),
(42, 50, 213, 'included', 7, 0, 'Fan', 'fan', 'Best and quick electricity services on your location', 'electrician,led,electronic,electronics,electric,maintenance,electrical,electricity,fan', '', 50, 45, 1, '30', 0, 0, 1, 0, '', 5, 1, 1, '2022-11-05 06:44:42', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(43, 50, 221, 'included', 7, 0, 'AC compressor repair', 'ac-compressor-repair', 'Best and quick AC compressor repair services in your location', 'electrician,ac,electronic,electronics,electric,maintenance,electrical,electricity,compressor', 'public/uploads/services/', 250, 240, 1, '30', 0, 0, 1, 0, '', 10, 1, 1, '2022-11-05 06:46:13', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(44, 50, 213, 'included', 7, 0, 'MCB & Fuse', 'mcb-&-fuse', 'Best and quick MCB & Fuse services in your location', 'electrician,led,electronic,electronics,electric,maintenance,electrical,electricity', 'public/uploads/services/1667630851_2b94161f1427d8482278.jpg', 100, 90, 1, '60', 0, 0, 1, 0, '', 5, 1, 1, '2022-11-05 06:47:31', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(45, 50, 223, 'included', 7, 0, 'AC', 'ac', 'Best and quick AC services in your location', 'electrician,led,electronic,electronics,electric,maintenance,electrical,electricity,AC', 'public/uploads/services/1.jpg', 100, 90, 1, '120', 0, 0, 1, 0, '', 5, 1, 1, '2022-11-05 06:50:13', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(46, 204, 213, 'included', 7, 0, 'Compressor maintanance', 'compressor-maintanance', 'Best and quick compressor maintanance services in your location', 'electrician,ac,electronic,electronics,electric,maintenance,electrical,electricity,ac repair', 'public/uploads/services/6.jpg', 200, 180, 2, '60', 0, 0, 1, 0, '', 5, 1, 1, '2022-11-05 06:51:41', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(47, 204, 213, 'included', 9, 0, 'Ceiling fan repair', 'ceiling-fan-repair', 'Browse through the various types of fans available online. If you need a fan to keep yourself cool, choose between ceiling fans, wall fans, a table option, ...', 'fan,celling fan', 'public/uploads/services/', 600, 480, 25, '160', 4.5555555555556, 9, 1, 1, '30', 23, 1, 1, '2022-11-07 07:47:29', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(48, 204, 225, 'included', 6, 0, 'Outdoor lighting', 'outdoor-lighting', 'Outdoor Lights   Outdoor LED Lightings Online in India at Best Prices. Choose from various Outdoor House Lights like Outdoor Lamps', 'outdoor,electronic,service,electronic service,lightting', 'public/uploads/services/1667630773_4783612212fd63c98b0a.jpg', 200, 160, 6, '260', 5, 10, 1, 0, '', 6, 1, 1, '2022-11-07 09:17:31', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(49, 204, 225, 'included', 6, 0, 'Socket Switch Installation', 'socket-switch-installation', 'Socket Switch Installation', 'Socket,Switch,Electronic service,installation', 'public/uploads/services/1667630851_2b94161f1427d8482278.jpg', 150, 105, 2, '160', 5, 5, 0, 0, '', 5, 1, 1, '2022-11-07 09:22:34', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(50, 204, 213, 'included', 6, 0, 'Security System', 'security-system', 'security system', 'security,security System,Electronic service,service', 'public/uploads/services/4.jpg', 500, 400, 5, '160', 5, 10, 1, 0, '', 2, 1, 1, '2022-11-07 09:38:44', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(51, 271, 218, 'included', 0, 0, 'Kitchen Cleaning', 'kitchen-cleaning', 'Kitchen cleaners perform thorough cleanings of Kitchen using cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,Kitchen Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning', 'public/uploads/services/1667886635_c0a5888fcc39d53c07d0.jpg', 100, 90, 2, '60', 0, 0, 0, 0, '', 5, 1, 1, '2022-11-08 05:35:14', '2025-03-26 13:44:06', '<table style=\"width: 80.5463%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 19.7202%; text-align: center;\"><img src=\"https://vendor.eshopweb.store/uploads/media/2023/money.png\" width=\"42\" height=\"42\" /></td>\r\n<td style=\"width: 80.1956%;\">\r\n<p><strong>100% Secure Payments</strong></p>\r\n<p>Moving your card details to a much more secure place</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 19.7202%; text-align: center;\"><img src=\"https://vendor.eshopweb.store/uploads/media/2023/trust.png\" width=\"43\" height=\"43\" /></td>\r\n<td style=\"width: 80.1956%;\">\r\n<p><strong>TrustPay</strong></p>\r\n<p>100% Payment Protection. Easy Return Policy&nbsp;</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 19.7202%; text-align: center;\"><img src=\"https://vendor.eshopweb.store/uploads/media/2023/customer-service.png\" width=\"41\" height=\"41\" /></td>\r\n<td style=\"width: 80.1956%;\">\r\n<p><strong>Help Center</strong></p>\r\n<p>Got a question? Look no further. Browse our FAQs or submit your query here.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '[\"public\\/uploads\\/services\\/1687949817_deb2c7024b1197041245.jpg\",\"public\\/uploads\\/services\\/1687949817_745fe2ebb39b77955b6d.jpg\",\"public\\/uploads\\/services\\/1687949817_864bf1928821ad8ba32d.jpg\",\"public\\/uploads\\/services\\/1687949817_08838fbb5cf87b10a38e.jpg\",\"public\\/uploads\\/services\\/1687949817_5cd0d3dc6d49b689507d.jpg\",\"public\\/uploads\\/services\\/1687949817_a15446f9c3bd9b340f95.jpg\"]', '[\"public\\/uploads\\/services\\/kitchen.pdf\"]', '[[\"How often should I schedule professional kitchen cleaning?\",\"Monthly or quarterly is recommended for professional kitchen cleaning.\"],[\"What areas of the kitchen do your cleaning services cover?\",\"We cover countertops, sinks, stovetops, oven exteriors, fridge exteriors, and cabinet surfaces.\"],[\"Do you clean kitchen appliances such as microwaves and dishwashers?\",\"Yes, we clean the exteriors of appliances like microwaves and dishwashers.\"],[\"What cleaning products do you use for kitchen cleaning?\",\"We use food-safe and eco-friendly cleaning products for kitchen surfaces.\"],[\"Can you handle tough grease and stubborn stains in the kitchen?\",\"Absolutely! Our professionals are equipped to handle tough grease and stubborn stains.\"]]', '1', '1', 1),
(52, 271, 217, 'included', 11, 0, 'Bathroom Cleaning', 'bathroom-cleaning', 'Bathroom cleaners perform thorough cleanings of Bathroom using cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,Bathroom,Bathroom cleaning,Bath tab cleaning', 'public/uploads/services/1.png', 600, 540, 2, '60', 5, 8, 1, 0, '', 25, 1, 1, '2022-11-08 05:37:17', '2025-03-26 13:44:06', '', '[\"public\\/uploads\\/services\\/1689221233_85f844a77222c9b7f812.jpg\",\"public\\/uploads\\/services\\/1689221233_81ac204c4878d270ea18.jpg\",\"public\\/uploads\\/services\\/1689221233_beb7f51a8eeaf3175137.jpg\",\"public\\/uploads\\/services\\/1689221233_1ffe423b40d02d84603a.jpg\",\"public\\/uploads\\/services\\/1689221233_dc2db9951d28f8a678f6.jpg\"]', '', '', '1', '1', 1),
(53, 271, 213, 'included', 11, 0, 'Room Cleaning', 'room-cleaning', 'Room cleaners perform thorough cleanings of your room using cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'room cleaning,roomcleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,room', 'public/uploads/services/1667562174_2f161313c71e286b9664.jpg', 300, 240, 2, '180', 5, 10, 0, 0, '', 60, 1, 1, '2022-11-08 05:38:48', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(54, 271, 220, 'included', 12, 0, 'Carpet Cleaning', 'carpet-cleaning', 'Carpet cleaners perform thorough cleanings of your carpet using cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Carpet Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,carpetcleaning,carpet cleaning,home', 'public/uploads/services/1667887507_d4fcaa478be6aeed58ae.jpg', 400, 320, 5, '60', 5, 2, 1, 0, '', 3, 1, 1, '2022-11-08 05:42:21', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
(55, 271, 216, 'included', 0, 0, 'Window Cleaning', 'window-cleaning', 'Window cleaners perform thorough cleanings of Window using cleaning supplies and equipment that they, or the cleaning agency for which they may work', 'Home Cleaning,housecleaning,cleaning cleaningservice,clean,cleaningcompany,homecleaning,window cleaning,window clean', 'public/uploads/services/1667887129_59b1e300b6ec2b3ec6a3.jpg', 300, 180, 2, '60', 5, 10, 1, 0, '', 5, 1, 1, '2022-11-08 05:58:49', '2025-03-26 13:44:06', '', '', '', '', '1', '1', 1),
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
(1, '127.0.0.1', 'Wrteam', '$2y$12$4Eag4sMGT78JqLPfKSDFleYPX/TZYzOjrRpeKcsDnxS3qbgEMP6F6', 'wrteam@gmail.com', 0, NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1746770252, 1, 'Admin', 'istrator', 'ADMIN', '9876543210', '+91', NULL, 'profile.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODU1ODUsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjE1ODUsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMSJ9.N6hNKXlLvu-DKlGL4qcANnwrrEQ9ts1pqziPucItt60', '45dsrwr', 'MY_CODE', 10, '', '23.2740707', '69.6530334', '2022-05-24 04:44:29', '2022-05-24 04:44:29', 0, NULL, '', 'android', NULL, '1', NULL, NULL, NULL),
(50, '::1', 'Electric', '$2y$10$EeeO/x1rkDrFFY8DntNf5uyCjJ9T7KwDd8IPcoJBwVN8mcm3M1UFi', 'XXXX@gmail.com', 0, 'b1380c5ba355b7f1185e', '$2y$10$dieHbD7KDbD2xGEKgwpNQ.yFmTjXLJWnfGPyF5enwoFwCNnMMolOi', NULL, NULL, NULL, NULL, NULL, 1652250409, 1746749521, 1, 'partner', 'edemand', 'Edemand partner', '1234567890', '+91', NULL, '', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODY4NDEsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjI4NDEsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiNTAifQ.9PqL7oFGAS4PHvCYMhGFeFAmnI6hwpldaIUzs1lFgfQ', '', '', 18, 'bhuj', '23.2419997', '69.6669324', '2022-05-24 04:44:29', '2022-05-24 04:44:29', 0, NULL, NULL, 'ios', NULL, '1', NULL, NULL, NULL),
(204, '', 'Electric-1', '$2y$10$LCLTGT54z5uv5WH5qJQLLuSe6MslPCNOfnTl1vVMPk4RJUngdsb5y', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1680572239, 1, NULL, NULL, NULL, '12344567801', '+91', NULL, '', '', NULL, NULL, NULL, 'Bhuj', '23.2740707', '69.6530334', '2022-11-07 07:29:11', '2022-11-07 07:29:11', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(271, '', 'World Clean Pvt Ltd.', '$2y$12$4Eag4sMGT78JqLPfKSDFleYPX/TZYzOjrRpeKcsDnxS3qbgEMP6F6', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '12344567801', '+234', NULL, '', '', NULL, NULL, NULL, 'Bhuj', '23.2740707', '69.6530334', '2022-11-07 10:31:39', '2022-11-07 10:31:39', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(270, '', 'amarik', '$2y$10$D6sdYtfZk7e9bYa3DQFVZu/ZNyPfx6gQWpcdh7usARWXELf0rz1ye', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1668582548, 1, NULL, NULL, NULL, '9988776655', '+91', NULL, 'public/backend/assets/profile/profile.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg2ODU0MTAsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE3MDAyMjE0MTAsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjcwIn0.-ByzeFrajWO1pOrHgZoBW3i0mNzrTB8v3ig0ifrMtiQ', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-08 04:17:16', '2022-11-08 04:17:16', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(273, '', 'Jack', '$2y$10$D6sdYtfZk7e9bYa3DQFVZu/ZNyPfx6gQWpcdh7usARWXELf0rz1ye', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1668409407, 1, NULL, NULL, NULL, '1234567888', '+91', NULL, 'public/backend/assets/profile/profile.jpg', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg0MjY0MzIsImlzcyI6ImVkZW1hbmQiLCJleHAiOjE2Njg0MjgyMzIsInN1YiI6ImVkZW1hbmRfYXV0aGVudGljYXRpb24iLCJ1c2VyX2lkIjoiMjczIn0.IzWv2AgRqgumlymDMUGEtNtOGh_J6yH_VBr96w12rJM', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-08 06:36:44', '2022-11-08 06:36:44', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(283, '', 'Nupur Kailash', '$2y$10$D6sdYtfZk7e9bYa3DQFVZu/ZNyPfx6gQWpcdh7usARWXELf0rz1ye', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1667974321, 1, NULL, NULL, NULL, '54564344', '+91', NULL, 'public/backend/assets/profile/profile.jpg', '', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-08 11:01:16', '2022-11-08 11:01:16', 0, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL),
(293, '', 'Sameera', '$2y$10$oHvhoLB78/8Tj3d6WUEoaOXl67xLbou1XQbkgG3/AzUwfCi.sBbau', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1722626769, 1, NULL, NULL, NULL, '1234567891', '+91', NULL, 'public/backend/assets/profile/profile.jpg', '', NULL, NULL, 0, 'Dubai', '25.10631345233886', '55.25440692901611', '2022-11-09 05:11:30', '2022-11-09 05:11:30', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(297, '', 'Aarti', '$2y$10$ljAcz.E71F14C1a/ruePduDDi16RcE2.ddYV6lfzFdTthMpzBGeL.', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, '12344567801', '+91', NULL, 'public/backend/assets/profile/profile.jpg', '', NULL, NULL, 0, 'Bhuj', '23.2740707', '69.6530334', '2022-11-09 05:53:22', '2022-11-09 05:53:22', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL),
(298, '', 'anand', '$2y$10$fRH8HlV2VZFXoF9b1iRe0O9uNkKqi73niej/ZmhasO9TiBey.Bz4.', 'XXXX@gmail.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1667977009, 1, NULL, NULL, NULL, '12344567801', '+91', NULL, 'public/backend/assets/profile/profile.jpg', '', NULL, NULL, 0, 'anjar', '23.2740707', '69.6530334', '2022-11-09 06:41:15', '2022-11-09 06:41:15', 0, NULL, NULL, 'android', NULL, '1', NULL, NULL, NULL);

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
(223, 204, 3),
(227, 271, 3),
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
(2, 204, '3', '{\"create\":{\"order\":0,\"category\":1,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":1,\"settings\":1},\"read\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":1,\"settings\":1},\"update\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"faq\":0,\"system\":1,\"support_ticket\":1,\"settings\":1},\"delete\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"notification\":0,\"system\":0}}', '2022-07-19 07:32:07', '2022-08-05 10:58:54'),
(10, 271, '2', '{\"create\":{\"order\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":0,\"settings\":0},\"read\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":0,\"settings\":0},\"update\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"faq\":0,\"system\":0,\"support_ticket\":0,\"settings\":0},\"delete\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"notification\":0,\"system\":0}}', '2022-07-20 10:37:18', '2022-08-05 12:21:44'),
(11, 141, '1', NULL, '2022-07-21 04:18:12', '2022-08-11 07:36:06'),
(12, 1, 'editor', '{\"create\":{\"order\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":0,\"settings\":0},\"read\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"notification\":0,\"city\":0,\"faq\":0,\"support_ticket\":0,\"settings\":0},\"update\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"faq\":0,\"system\":0,\"support_ticket\":0,\"settings\":0},\"delete\":{\"orders\":0,\"category\":0,\"offers\":0,\"sliders\":0,\"tax\":0,\"services\":0,\"promo_code\":0,\"featured_section\":0,\"partner\":\"\",\"customer\":\"\",\"city\":0,\"notification\":0,\"system\":0}}', '2022-10-20 11:22:19', '2022-10-20 11:22:19'),
(13, 1, 'admin', '{\"create\":{\"order\":0,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":\"\",\"notification\":1,\"city\":1,\"faq\":1,\"support_ticket\":1,\"settings\":1},\"read\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"notification\":1,\"city\":1,\"faq\":1,\"support_ticket\":1,\"settings\":1},\"update\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"city\":1,\"faq\":1,\"system\":1,\"support_ticket\":1,\"settings\":1},\"delete\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"city\":1,\"notification\":1,\"system\":1}}', '2022-11-16 07:32:15', '2022-11-16 07:32:15'),
(14, 1, 'admin', '{\"create\":{\"order\":0,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":\"\",\"notification\":1,\"city\":1,\"faq\":1,\"support_ticket\":1,\"settings\":1},\"read\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"notification\":1,\"city\":1,\"faq\":1,\"support_ticket\":1,\"settings\":1},\"update\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"city\":1,\"faq\":1,\"system\":1,\"support_ticket\":1,\"settings\":1},\"delete\":{\"orders\":1,\"category\":1,\"offers\":1,\"sliders\":1,\"tax\":1,\"services\":1,\"promo_code\":1,\"featured_section\":1,\"partner\":1,\"customer\":1,\"city\":1,\"notification\":1,\"system\":1}}', '2022-11-16 07:36:04', '2022-11-16 07:36:04'),
(15, 555, '1', '', '2022-11-16 07:36:04', '2023-03-13 06:10:33');
