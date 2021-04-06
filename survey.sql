-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2021 at 09:51 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `survey`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES('2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2017_01_29_135149_create_survey_table', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2017_01_29_135842_create_survey_attributes_table', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2017_01_29_142022_survey_submissions_table', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2017_01_29_151045_survey_users_table', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2017_01_29_232955_add_submitted_timestamp_survey_users', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surveys`
--

CREATE TABLE `surveys` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `surveys`
--

INSERT INTO `surveys` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES(1, 'Test Survey', 'Test survey description', '2021-04-06 10:51:29', '2021-04-06 10:51:29');

-- --------------------------------------------------------

--
-- Table structure for table `survey_attributes`
--

CREATE TABLE `survey_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `survey_id` int(10) UNSIGNED NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `label_value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `label_type` enum('text_field','radio_button','text_area','dropdown','checkbox') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `survey_attributes`
--

INSERT INTO `survey_attributes` (`id`, `survey_id`, `label`, `label_value`, `label_type`) VALUES(1, 1, 'Name', '', 'text_field');
INSERT INTO `survey_attributes` (`id`, `survey_id`, `label`, `label_value`, `label_type`) VALUES(2, 1, 'Province', 'Punjab,Sindh,Balochistan,KPK', 'dropdown');
INSERT INTO `survey_attributes` (`id`, `survey_id`, `label`, `label_value`, `label_type`) VALUES(3, 1, 'Gender', 'Male,Female', 'radio_button');
INSERT INTO `survey_attributes` (`id`, `survey_id`, `label`, `label_value`, `label_type`) VALUES(4, 1, 'Interests', 'Music,Art,Religion,Movies,Politics,Science,Maths', 'checkbox');
INSERT INTO `survey_attributes` (`id`, `survey_id`, `label`, `label_value`, `label_type`) VALUES(5, 1, 'Biography', '', 'text_area');

-- --------------------------------------------------------

--
-- Table structure for table `survey_submissions`
--

CREATE TABLE `survey_submissions` (
  `survey_attribute_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `survey_submissions`
--

INSERT INTO `survey_submissions` (`survey_attribute_id`, `user_id`, `value`) VALUES(1, 1, 'awer');
INSERT INTO `survey_submissions` (`survey_attribute_id`, `user_id`, `value`) VALUES(2, 1, 'Punjab');
INSERT INTO `survey_submissions` (`survey_attribute_id`, `user_id`, `value`) VALUES(3, 1, 'Male');
INSERT INTO `survey_submissions` (`survey_attribute_id`, `user_id`, `value`) VALUES(4, 1, 'Music');
INSERT INTO `survey_submissions` (`survey_attribute_id`, `user_id`, `value`) VALUES(5, 1, 'ddd');

-- --------------------------------------------------------

--
-- Table structure for table `survey_users`
--

CREATE TABLE `survey_users` (
  `survey_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('Pending','Partially Completed','Completed') COLLATE utf8_unicode_ci NOT NULL,
  `submitted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `survey_users`
--

INSERT INTO `survey_users` (`survey_id`, `user_id`, `status`, `submitted_at`) VALUES(1, 1, 'Completed', '2021-04-06 16:08:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES(1, 'Arslaan', 'Ali', 'arslaan4113@gmail.com', '$2y$10$cXgO.OPeQt1BfmWqns.r2uPqY7qhEMC926QwfOnBK2lfhKUDFB.Sy', '1H02sWolJITNc9RNhNWoXIDBylANDo0wZ1MkVPHuD8R7nBNVazwyomnfey3D', '2021-04-06 10:53:58', '2021-04-06 11:08:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_attributes`
--
ALTER TABLE `survey_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_attributes_survey_id_foreign` (`survey_id`);

--
-- Indexes for table `survey_submissions`
--
ALTER TABLE `survey_submissions`
  ADD KEY `survey_submissions_survey_attribute_id_foreign` (`survey_attribute_id`),
  ADD KEY `survey_submissions_user_id_foreign` (`user_id`);

--
-- Indexes for table `survey_users`
--
ALTER TABLE `survey_users`
  ADD KEY `survey_users_survey_id_foreign` (`survey_id`),
  ADD KEY `survey_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `surveys`
--
ALTER TABLE `surveys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `survey_attributes`
--
ALTER TABLE `survey_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `survey_attributes`
--
ALTER TABLE `survey_attributes`
  ADD CONSTRAINT `survey_attributes_survey_id_foreign` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`);

--
-- Constraints for table `survey_submissions`
--
ALTER TABLE `survey_submissions`
  ADD CONSTRAINT `survey_submissions_survey_attribute_id_foreign` FOREIGN KEY (`survey_attribute_id`) REFERENCES `survey_attributes` (`id`),
  ADD CONSTRAINT `survey_submissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `survey_users`
--
ALTER TABLE `survey_users`
  ADD CONSTRAINT `survey_users_survey_id_foreign` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`),
  ADD CONSTRAINT `survey_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
