-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2017 at 07:27 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hobbybuff`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `forum_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `page_id`, `forum_id`) VALUES
(78, 'David&#039;s Category', 'akdfasdfnasjdjfna;jdnfkaj', 109, 9),
(80, 'Stephane&#039;s Page', 'asddffsdfdfasddffasddff', 113, 8),
(81, 'Novi&#39;s Interests', NULL, 114, 6),
(84, 'Mina&#39;s Interests', NULL, 117, NULL),
(90, 'Kendo', NULL, 138, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `venue` varchar(50) NOT NULL,
  `event_date` datetime NOT NULL,
  `hostedby` varchar(20) NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `name`, `description`, `venue`, `event_date`, `hostedby`, `page_id`, `category_id`) VALUES
(9, 'Practice', 'There is currently no description for this event.', '122 North Street', '2017-11-29 00:00:00', 'wine', 139, 90);

-- --------------------------------------------------------

--
-- Table structure for table `forum_pages`
--

CREATE TABLE `forum_pages` (
  `forum_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_pages`
--

INSERT INTO `forum_pages` (`forum_id`, `name`, `category_id`, `page_id`) VALUES
(6, 'Novi&#039;s forum', 81, 119),
(8, 'Stephane&#039;s Forum', 80, 140),
(9, 'David&#039;s Forum', 78, 146);

-- --------------------------------------------------------

--
-- Table structure for table `forum_posts`
--

CREATE TABLE `forum_posts` (
  `post_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(5000) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `page_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_posts`
--

INSERT INTO `forum_posts` (`post_id`, `title`, `content`, `date`, `page_id`, `category_id`) VALUES
(5, 'Testpost1', 'asdfdasdfdasddffasdfdasdfd', '2017-11-26 23:11:34', 144, 80),
(6, 'testpost2', 'asdfdfasdfdfasddfasdfdasddfasdfd', '2017-11-26 23:11:42', 145, 80),
(7, 'testpost31', 'asdffasddfsdsfadfasddfasddff', '2017-11-26 23:21:04', 147, 78),
(8, 'testpost32', 'asdfasdsdfasddfasdffasdff', '2017-11-26 23:21:11', 148, 78);

-- --------------------------------------------------------

--
-- Table structure for table `hobbies`
--

CREATE TABLE `hobbies` (
  `hobby_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `thumbnail_source` varchar(500) NOT NULL,
  `medium_source` varchar(500) NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image_id`, `thumbnail_source`, `medium_source`, `category_id`) VALUES
(18, 'C:\\xampp\\htdocs\\WD2\\_Project\\uploads\\uzu_thumbnail.jpg', 'C:\\xampp\\htdocs\\WD2\\_Project\\uploads\\uzu_medium.jpg', 80),
(19, 'C:\\xampp\\htdocs\\WD2\\_Project\\uploads\\tingeling2_thumbnail.png', 'C:\\xampp\\htdocs\\WD2\\_Project\\uploads\\tingeling2_medium.png', 78),
(20, 'C:\\xampp\\htdocs\\WD2\\_Project\\uploads\\marimo_thumbnail.png', 'C:\\xampp\\htdocs\\WD2\\_Project\\uploads\\marimo_medium.png', NULL),
(23, 'C:\\xampp\\htdocs\\WD2\\_Project\\uploads\\dangerdoggo_thumbnail.jpg', 'C:\\xampp\\htdocs\\WD2\\_Project\\uploads\\dangerdoggo_medium.jpg', 81),
(28, 'C:\\xampp\\htdocs\\WD2\\_Project\\uploads\\dangerdoggo_thumbnail.jpg', 'C:\\xampp\\htdocs\\WD2\\_Project\\uploads\\dangerdoggo_medium.jpg', 90);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(50) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category_id` int(11) DEFAULT NULL,
  `page_type` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `name`, `link`, `date_created`, `date_updated`, `category_id`, `page_type`) VALUES
(109, 'DavidStroombles', NULL, '2017-11-25 19:14:13', '2017-11-26 07:12:12', 78, 'C'),
(113, 'Stephane&#039;s Page', NULL, '2017-11-26 01:38:05', '2017-11-27 05:16:17', 80, 'C'),
(114, 'Novi&#39;s Interests', NULL, '2017-11-26 16:22:16', '2017-11-26 22:22:16', 81, 'C'),
(117, 'Mina&#39;s Interests', NULL, '2017-11-26 16:26:17', '2017-11-26 22:26:17', 84, 'C'),
(119, 'Novi&#039;s forum', NULL, '2017-11-26 16:43:53', '2017-11-26 22:43:53', 81, 'F'),
(138, 'Kendo', NULL, '2017-11-26 21:18:39', '2017-11-27 03:18:39', 90, 'C'),
(139, 'Practice', NULL, '2017-11-26 21:19:27', '2017-11-27 03:19:27', 90, 'E'),
(140, 'Stephane&#039;s Forum', NULL, '2017-11-26 22:19:51', '2017-11-27 04:42:01', 80, 'F'),
(144, 'Testpost1', NULL, '2017-11-26 23:11:34', '2017-11-27 05:26:15', 80, 'P'),
(145, 'testpost2', NULL, '2017-11-26 23:11:42', '2017-11-27 05:26:25', 80, 'P'),
(146, 'David&#039;s Forum', NULL, '2017-11-26 23:20:50', '2017-11-27 05:20:50', 78, 'F'),
(147, 'testpost31', NULL, '2017-11-26 23:21:04', '2017-11-27 05:27:04', 78, 'P'),
(148, 'testpost32', NULL, '2017-11-26 23:21:11', '2017-11-27 05:27:12', 78, 'P');

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `authorization` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`user_id`, `username`, `password`, `email`, `authorization`) VALUES
(36, 'wine', '$2y$10$BvThoday/6R82Eq0DhDKhulgZ4qnq1d3aR0gCExUKmyF0YYdNpuBS', 'wine@wine.com', 'admin'),
(37, 'Novi', '$2y$10$B/jKhj5zw3pPHCoDgV3vtO1fV4k.S7wu.wdXS28O4vq/qoU4vZczy', 'Novi', 'user'),
(38, 'David Wilson', '$2y$10$eNAxsz16dDXzY7kwLTBoKeoBi2JKNrOCyXXv.kEeiqQiBfy0j71bG', 'david@yahoo.com', 'user'),
(39, 'beer', '$2y$10$6kgM0MtdgwISSGwj8Rjc7eSYE3ucwWf/8ahMysNvP3HKPWDErgwhi', 'beer@email.com', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `fk_cat_pages` (`page_id`),
  ADD KEY `fk_forum_category` (`forum_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `fk_events_categories` (`category_id`),
  ADD KEY `fk_events_pages` (`page_id`);

--
-- Indexes for table `forum_pages`
--
ALTER TABLE `forum_pages`
  ADD PRIMARY KEY (`forum_id`),
  ADD KEY `fk_forumpage_category` (`category_id`),
  ADD KEY `fk_forumpage_pages` (`page_id`);

--
-- Indexes for table `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `fk_forum_pages` (`page_id`),
  ADD KEY `fk_category_id` (`category_id`);

--
-- Indexes for table `hobbies`
--
ALTER TABLE `hobbies`
  ADD PRIMARY KEY (`hobby_id`),
  ADD KEY `fk_categories` (`category_id`),
  ADD KEY `fk_pages` (`page_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `fk_images_categories` (`category_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `fk_pages_categories` (`category_id`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `forum_pages`
--
ALTER TABLE `forum_pages`
  MODIFY `forum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `forum_posts`
--
ALTER TABLE `forum_posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `hobbies`
--
ALTER TABLE `hobbies`
  MODIFY `hobby_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;
--
-- AUTO_INCREMENT for table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_cat_pages` FOREIGN KEY (`page_id`) REFERENCES `pages` (`page_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_forum_category` FOREIGN KEY (`forum_id`) REFERENCES `forum_pages` (`forum_id`) ON DELETE SET NULL;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_events_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_events_pages` FOREIGN KEY (`page_id`) REFERENCES `pages` (`page_id`) ON DELETE CASCADE;

--
-- Constraints for table `forum_pages`
--
ALTER TABLE `forum_pages`
  ADD CONSTRAINT `fk_forumpage_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_forumpage_pages` FOREIGN KEY (`page_id`) REFERENCES `pages` (`page_id`) ON DELETE CASCADE;

--
-- Constraints for table `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_forum_pages` FOREIGN KEY (`page_id`) REFERENCES `pages` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hobbies`
--
ALTER TABLE `hobbies`
  ADD CONSTRAINT `fk_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pages` FOREIGN KEY (`page_id`) REFERENCES `pages` (`page_id`) ON DELETE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_images_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `fk_pages_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
