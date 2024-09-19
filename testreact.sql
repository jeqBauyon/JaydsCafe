-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2024 at 04:51 AM
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
-- Database: `testreact`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `name`, `price`) VALUES
(1, 'taengkambing', 59.00),
(2, 'chard', 59.00),
(3, 'test', 20.00),
(4, 'test', 59.00),
(5, 'cheesesabinimam', 59.00),
(6, 'cheesesabinimam', 50.00),
(7, 'test-bibingka', 79.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','rider') NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `fullname`, `email`, `password`, `role`) VALUES
(1, 'lekra', 'soulreaper69@gmail.com', '$2b$10$WCAbBGO/glKo1.nV2eb36eTgghjWmMkOeyaUSKsuMA9ZB70RD0MFG', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(100) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 29, '2024-07-23 08:10:42', '2024-07-23 08:10:42'),
(5, 30, '2024-07-23 08:20:10', '2024-07-23 08:20:10'),
(6, 31, '2024-07-24 05:20:33', '2024-07-24 05:20:33');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `user_id` int(100) UNSIGNED NOT NULL,
  `food_id` int(50) UNSIGNED NOT NULL,
  `size` enum('Medium','Large') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `addons` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `food_id`, `size`, `price`, `quantity`, `created_at`, `updated_at`, `addons`) VALUES
(100, 31, 19, 'Medium', 316.00, 1, '2024-09-19 02:27:10', '2024-09-19 02:27:10', 'test (₱20),test (₱59),cheesesabinimam (₱59),cheesesabinimam (₱50),test-bibingka (₱79)');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(50) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `active` varchar(255) NOT NULL DEFAULT 'true',
  `featured` varchar(255) NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `image_url`, `active`, `featured`) VALUES
(1, 'Coffee', 'image/expresso.png', 'true', 'false'),
(2, 'Milktea', 'image/milktea.png', 'true', 'false'),
(3, 'Fruit-tea', 'image/fruit.png', 'true', 'false'),
(4, 'Premium Cheesecake Milktea', 'image/milktea.png', 'true', 'false'),
(5, 'Non Coffee', 'image/milktea.png', 'true', 'false'),
(7, 'taengkambing', 'taengkambing.png', 'true', 'false'),
(26, 'zero', 'image_url_1725085405582.jpg', 'true', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `id` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `About us` text NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Tel.no` varchar(100) NOT NULL,
  `Mob.no` varchar(100) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `faq_id` int(10) UNSIGNED NOT NULL,
  `operation_hours` varchar(255) NOT NULL,
  `operation_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_pages`
--

CREATE TABLE `cms_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cms_pages`
--

INSERT INTO `cms_pages` (`id`, `title`, `content`, `created_at`, `updated_at`, `category`) VALUES
(1, 'Business Name', 'Jayd\'s Cafe', '2024-08-26 03:24:36', '2024-08-31 06:36:10', 'Header'),
(2, 'About Us', 'Kame ang Jayd\'z Cafe', '2024-08-26 03:24:51', '2024-08-30 22:57:06', 'About Us'),
(3, 'Location', 'SABANG', '2024-08-26 03:25:00', '2024-08-30 22:57:10', 'About Us'),
(4, 'Facebook', 'https://www.facebook.com/chard.cardosa/', '2024-08-26 08:18:13', '2024-08-30 22:55:31', 'footer'),
(5, 'Instagram', 'https://www.instagram.com/chardgrey/', '2024-08-26 08:20:23', '2024-08-30 22:55:36', 'footer'),
(6, 'Link', 'https://github.com/chardgrey', '2024-08-26 08:22:07', '2024-08-30 22:55:40', 'footer'),
(7, 'Phone Number', '099922292992', '2024-08-26 08:32:30', '2024-08-30 22:55:59', 'contact'),
(8, 'Tel Number', '83928988', '2024-08-26 08:33:35', '2024-08-30 22:56:03', 'contact'),
(9, 'Small Logo', '/images/jaydsCoffee2.svg', '2024-08-31 05:41:38', '2024-09-15 02:19:42', 'image'),
(10, 'Big Logo', '/images/jaydsCoffee.svg', '2024-08-31 12:59:23', '2024-09-15 02:19:37', 'image'),
(11, 'Milktea Price', '39 to 49 Pesos', '2024-08-31 23:20:15', '2024-08-31 23:20:15', 'Price'),
(12, 'Coffee Price', '49 to 69 Pesos', '2024-08-31 23:20:38', '2024-08-31 23:20:38', 'Price'),
(13, 'Snack Price', '39 to 59 Pesos', '2024-08-31 23:21:02', '2024-08-31 23:21:02', 'Price'),
(14, 'Store Image', '/images/content_1725147459433.png', '2024-08-31 23:32:07', '2024-08-31 23:37:39', 'image'),
(15, 'Operation hours', '10:00AM - 9:00PM', '2024-08-31 23:43:38', '2024-08-31 23:43:38', 'About Us'),
(16, 'Operation days', 'Monday - Sunday', '2024-08-31 23:44:02', '2024-08-31 23:44:02', 'About Us');

-- --------------------------------------------------------

--
-- Table structure for table `faq_cms`
--

CREATE TABLE `faq_cms` (
  `id` int(10) UNSIGNED NOT NULL,
  `Question` varchar(255) NOT NULL,
  `Answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id` int(50) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `category_id` int(50) UNSIGNED NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id`, `name`, `description`, `image_url`, `category_id`, `visible`) VALUES
(17, 'Vanilla', 'lorem ipsum', 'image_url_1725069960966.jpg', 1, 1),
(18, 'Caramel', 'lorem ipsum', 'images/americano.png', 1, 1),
(19, 'Hazelnut', 'lorem ipsum', 'images/americano.png', 1, 1),
(20, 'Butterscotch', 'lorem ipsum', 'images/americano.png', 1, 1),
(21, 'Mocha', 'lorem ipsum', 'images/americano.png', 1, 1),
(22, 'Salted Caramel', 'lorem ipsum', 'images/americano.png', 1, 1),
(23, 'White Chocolate', 'lorem ipsum', 'images/americano.png', 1, 1),
(24, 'Almond', 'lorem ipsum', 'images/americano.png', 1, 1),
(25, 'Winter Melon', 'lorem ipsum', 'images/americano.png', 2, 1),
(26, 'Okinawa', 'lorem ipsum', 'images/americano.png', 2, 1),
(27, 'Hokkaido', 'lorem ipsum', 'images/americano.png', 2, 1),
(28, 'Cookies & Cream', 'lorem ipsum', 'images/americano.png', 2, 1),
(29, 'Caramel', 'lorem ipsum', 'images/americano.png', 2, 1),
(30, 'Brown Sugar', 'lorem ipsum', 'images/americano.png', 2, 1),
(31, 'Taro', 'lorem ipsum', 'images/americano.png', 2, 1),
(32, 'Classic Milktea', 'lorem ipsum', 'images/americano.png', 2, 1),
(33, 'Red Velvet', 'lorem ipsum', 'images/americano.png', 2, 1),
(34, 'Matcha', 'lorem ipsum', 'images/americano.png', 2, 1),
(35, 'Dark Chocolate', 'lorem ipsum', 'images/americano.png', 2, 1),
(36, 'Lychee', 'lorem ipsum', 'images/americano.png', 3, 1),
(37, 'Mixed Berries', 'lorem ipsum', 'images/americano.png', 3, 1),
(38, 'Green Apple', 'lorem ipsum', 'images/americano.png', 3, 1),
(39, 'Strawberry', 'lorem ipsum', 'images/americano.png', 3, 1),
(40, 'Blueberry', 'lorem ipsum', 'images/americano.png', 3, 1),
(41, 'Passionfruit', 'lorem ipsum', 'images/americano.png', 3, 1),
(42, 'Melon', 'lorem ipsum', 'images/americano.png', 3, 1),
(43, 'Mango', 'lorem ipsum', 'images/americano.png', 3, 1),
(44, 'Matcha Latte', 'lorem ipsum', 'images/americano.png', 5, 1),
(45, 'Strawberry Milk', 'lorem ipsum', 'images/americano.png', 5, 1),
(46, 'Taro Milk', 'lorem ipsum', 'images/americano.png', 5, 1),
(47, 'Melon Milk', 'lorem ipsum', 'images/americano.png', 5, 1),
(48, 'Chocolate Milk', 'lorem ipsum', 'images/americano.png', 5, 1),
(49, 'Matcha Latte', 'lorem ipsum', 'images/americano.png', 5, 1),
(50, 'Strawberry Milk', 'lorem ipsum', 'images/americano.png', 5, 1),
(51, 'Taro Milk', 'lorem ipsum', 'images/americano.png', 5, 1),
(52, 'Melon Milk', 'lorem ipsum', 'images/americano.png', 5, 1),
(53, 'Chocolate Milk', 'lorem ipsum', 'images/americano.png', 5, 1),
(54, 'Pearl Milktea Cheesecake', 'lorem ipsum', 'images/americano.png', 4, 1),
(55, 'Wintermelon Cheesecake', 'lorem ipsum', 'images/americano.png', 4, 1),
(56, 'Red Velvet Cheesecake', 'lorem ipsum', 'images/americano.png', 4, 1),
(57, 'Matcha Cheesecake', 'lorem ipsum', 'images/americano.png', 4, 1),
(58, 'Dark Chocolate Cheesecake', 'lorem ipsum', 'images/americano.png', 4, 1),
(59, 'Strawberry Cheesecake', 'lorem ipsum', 'images/americano.png', 4, 1),
(79, 'ice cream', 'ice cream', 'ice cream', 4, 1),
(82, 'taengkambing', 'taengkambing', 'taengkambing', 1, 1),
(104, 'tanginatalaga', 'tanginatalaga', '/images/americano.png', 1, 1),
(109, 'test', 'test', '/images/image_url_1726386182356.png', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_sizes`
--

CREATE TABLE `food_sizes` (
  `id` int(11) NOT NULL,
  `food_id` int(50) UNSIGNED DEFAULT NULL,
  `size` enum('small','medium','large') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_sizes`
--

INSERT INTO `food_sizes` (`id`, `food_id`, `size`, `price`, `date_created`, `date_update`) VALUES
(1, 17, 'medium', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(2, 17, 'large', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(3, 18, 'medium', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(4, 18, 'large', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(5, 19, 'medium', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(6, 19, 'large', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(7, 20, 'medium', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(8, 20, 'large', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(9, 21, 'medium', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(10, 21, 'large', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(11, 22, 'medium', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(12, 23, 'large', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(13, 24, 'medium', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(14, 24, 'large', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(15, 25, 'medium', 39.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(16, 25, 'large', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(17, 26, 'medium', 39.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(18, 26, 'large', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(19, 27, 'medium', 39.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(20, 27, 'large', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(21, 28, 'medium', 39.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(22, 28, 'large', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(23, 29, 'medium', 39.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(24, 29, 'large', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(25, 30, 'medium', 39.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(26, 30, 'large', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(27, 31, 'medium', 39.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(28, 31, 'large', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(29, 32, 'medium', 39.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(30, 32, 'large', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(31, 33, 'medium', 39.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(32, 33, 'large', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(33, 34, 'medium', 39.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(34, 34, 'large', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(35, 35, 'medium', 39.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(36, 35, 'large', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(37, 36, 'medium', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(38, 36, 'large', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(39, 37, 'medium', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(40, 37, 'large', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(41, 38, 'medium', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(42, 38, 'large', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(43, 39, 'medium', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(44, 39, 'large', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(45, 40, 'medium', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(46, 40, 'large', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(47, 41, 'medium', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(48, 41, 'large', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(49, 42, 'medium', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(50, 42, 'large', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(51, 43, 'medium', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(52, 43, 'large', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(85, 44, 'medium', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(86, 44, 'large', 69.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(87, 45, 'medium', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(88, 45, 'large', 69.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(89, 46, 'medium', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(90, 46, 'large', 69.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(91, 47, 'medium', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(92, 47, 'large', 69.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(93, 48, 'medium', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(94, 48, 'large', 69.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(95, 49, 'medium', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(96, 49, 'large', 69.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(97, 50, 'medium', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(98, 50, 'large', 69.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(99, 51, 'medium', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(100, 51, 'large', 69.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(101, 52, 'medium', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(102, 52, 'large', 69.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(103, 53, 'medium', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(104, 53, 'large', 69.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(105, 54, 'medium', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(106, 54, 'large', 69.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(107, 55, 'medium', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(108, 55, 'large', 69.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(109, 56, 'medium', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(110, 56, 'large', 69.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(111, 57, 'medium', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(112, 57, 'large', 69.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(113, 58, 'medium', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(114, 58, 'large', 69.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(115, 59, 'medium', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(117, 23, 'medium', 49.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(118, 22, 'large', 59.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(134, 79, 'medium', 67.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(135, 79, 'large', 69.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(140, 82, 'medium', 299.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(141, 82, 'large', 1000.00, '2024-08-31 15:17:30', '2024-08-31 15:18:07'),
(149, 17, '', 6969.00, '2024-08-31 15:37:30', '2024-08-31 15:37:30'),
(168, 104, 'medium', 0.00, '2024-09-15 07:17:58', '2024-09-15 07:17:58'),
(173, 109, 'medium', 0.00, '2024-09-15 07:43:02', '2024-09-15 07:43:02');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(100) UNSIGNED NOT NULL,
  `customer_id` int(100) UNSIGNED NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('paid','pending','completed','cancelled','') NOT NULL,
  `totalPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `status`, `totalPrice`) VALUES
(60, 31, '2024-09-18 19:15:30', 'paid', 187),
(61, 31, '2024-09-19 02:19:07', 'paid', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders_food`
--

CREATE TABLE `orders_food` (
  `id` int(11) NOT NULL,
  `order_id` int(100) UNSIGNED NOT NULL,
  `food_id` int(50) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(100) NOT NULL,
  `addons` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_food`
--

INSERT INTO `orders_food` (`id`, `order_id`, `food_id`, `quantity`, `size`, `addons`) VALUES
(80, 60, 18, 1, 'Medium', 'chard (₱59),test (₱20),cheesesabinimam (₱59)');

-- --------------------------------------------------------

--
-- Table structure for table `order_addons`
--

CREATE TABLE `order_addons` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `addon_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(100) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `verification_token` varchar(255) NOT NULL,
  `verified` varchar(250) NOT NULL DEFAULT 'false',
  `pnum` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `address`, `role`, `created_at`, `updated_at`, `verification_token`, `verified`, `pnum`) VALUES
(29, 'chardsd', 'cilayap482@modotso.com', '$2b$10$/Zy8Kp69PUPEfsaEbUvdFuMl2Hes3J05Kjd3SSWEJE0b1eoaMOZ8G', 'hello 214sd', 'user', '2024-07-23 08:10:42', '2024-07-23 08:15:03', '49hl4jgopk', 'true', ''),
(30, 'dagangbukid', 'fobedo2401@reebsd.com', '$2b$10$LQfRgTYjqCoUngDsW9sQM.6lKfNq21fEMzVTh6ydb6Orj8uJqQxg.', 'DYAN LANG', 'user', '2024-07-23 08:20:10', '2024-07-23 08:20:10', 'cn0d0eco8k', 'false', ''),
(31, 'chardgrey', 'cardosarichard@gmail.com', '$2b$10$2CfKaulWCdIfErdXWtxDz.J5PC2CYidnxPHi2sWv822mG8lWKcdmu', 'Blk 99 Lot 99 Dasmarinas Cavite', 'user', '2024-07-24 05:20:33', '2024-07-24 05:21:06', '254kh7vd2k', 'true', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Cart_owner` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `addons_id` (`addons`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_pages`
--
ALTER TABLE `cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_cms`
--
ALTER TABLE `faq_cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_category_id` (`category_id`);

--
-- Indexes for table `food_sizes`
--
ALTER TABLE `food_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_food_size` (`food_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `Fk_user_id` (`customer_id`);

--
-- Indexes for table `orders_food`
--
ALTER TABLE `orders_food`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Order_id` (`order_id`),
  ADD KEY `FK_Foods_id` (`food_id`);

--
-- Indexes for table `order_addons`
--
ALTER TABLE `order_addons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_addons_order` (`order_id`),
  ADD KEY `fk_addons_id` (`addon_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_pages`
--
ALTER TABLE `cms_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `faq_cms`
--
ALTER TABLE `faq_cms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(50) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `food_sizes`
--
ALTER TABLE `food_sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `orders_food`
--
ALTER TABLE `orders_food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `order_addons`
--
ALTER TABLE `order_addons`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `Cart_owner` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `food_id` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`),
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `FK_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `food_sizes`
--
ALTER TABLE `food_sizes`
  ADD CONSTRAINT `FK_food_size` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `Fk_user_id` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `orders_food`
--
ALTER TABLE `orders_food`
  ADD CONSTRAINT `FK_Foods_id` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`),
  ADD CONSTRAINT `FK_Order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `order_addons`
--
ALTER TABLE `order_addons`
  ADD CONSTRAINT `fk_addons_id` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_addons_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
