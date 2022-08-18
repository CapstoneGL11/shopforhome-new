CREATE SCHEMA `shopforhome` ;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+05:30";


--
-- Database: 'shopforhome'
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `user_id` bigint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Dumping data for table `cart`
--


INSERT INTO `cart` (`user_id`) VALUES
(1),
(2);


--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` varchar(255) NOT NULL,
  `status` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `status`) VALUES
('FLAT150', 0),
('UPTO50%', 0);

--
-- Table structure for table `hibernate_sequence`
--


CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(28),
(28);

--
-- Table structure for table `order_main`
--


CREATE TABLE `order_main` (
  `order_id` bigint(20) NOT NULL,
  `buyer_address` varchar(255) DEFAULT NULL,
  `buyer_email` varchar(255) DEFAULT NULL,
  `buyer_name` varchar(255) DEFAULT NULL,
  `buyer_phone` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `order_amount` decimal(19,2) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT 0,
  `update_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `product_category`
--


CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_type` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`category_id`, `category_name`, `category_type`, `create_time`, `update_time`) VALUES
(2147483641, 'Furniture', 0, '2022-08-09 23:03:26', '2022-08-09 23:03:26'),
(2147483642, 'Clothes', 2, '2022-08-10 00:15:02', '2022-08-10 00:15:02'),
(2147483644, 'Groceries', 3, '2022-08-10 01:01:09', '2022-08-10 01:01:09'),
(2147483645, 'Electronics', 1, '2022-08-10 00:26:05', '2022-08-10 00:26:05');


--
-- Table structure for table `product_info`
--

CREATE TABLE `product_info` (
  `product_id` varchar(255) NOT NULL,
  `category_type` int(11) DEFAULT 0,
  `create_time` datetime DEFAULT NULL,
  `product_description` varchar(255) DEFAULT NULL,
  `product_icon` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(19,2) NOT NULL,
  `product_status` int(11) DEFAULT 0,
  `product_stock` int(11) NOT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;




--
-- Table structure for table `product_in_order`
--

CREATE TABLE `product_in_order` (
  `id` bigint(20) NOT NULL,
  `category_type` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_icon` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` decimal(19,2) NOT NULL,
  `product_stock` int(11) DEFAULT NULL,
  `cart_user_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Dumping data for table `product_in_order`
--






--
-- Table structure for table `users`
--


CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `active` bit(1) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



--
-- Dumping data for table `users`
--





--
-- Table structure for table `wishlist`
--


CREATE TABLE `wishlist` (
  `id` bigint(20) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Dumping data for table `wishlist`
--









--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_main`
--
ALTER TABLE `order_main`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `UK_6kq6iveuim6wd90cxo5bksumw` (`category_type`);

--
-- Indexes for table `product_info`
--
ALTER TABLE `product_info`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_in_order`
--
ALTER TABLE `product_in_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhnivo3fl2qtco3ulm4mq0mbr5` (`cart_user_id`),
  ADD KEY `FKt0sfj3ffasrift1c4lv3ra85e` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_sx468g52bpetvlad2j9y0lptc` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKklfv8svemdde0od1rs6mgstb` (`product_id`),
  ADD KEY `FKtrd6335blsefl2gxpb8lr0gr7` (`user_id`);
COMMIT;
