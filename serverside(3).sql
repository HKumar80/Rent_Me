|-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2024 at 09:15 PM
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
-- Database: `serverside`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`user_id`, `username`, `password`, `created_at`) VALUES
(1, 'h.kumar8@yahoo.com', '$2y$10$PTGdxsv859tctjxD3N3eHu.zDehuNBiuqmeQgWZAuEvTO7q9HGt1C', '2024-12-03 05:00:19'),
(2, 'sharmapranav5788@gmail.com', '$2y$10$n4A04rerI95Dtg7lUlcVgOaGNDH5DWaIEIjIGcFRG5ufYS6mtuKve', '2024-12-03 05:09:49'),
(3, 'rajvir1@gmail.com', '$2y$10$mXPti5oiU5Dx64Hg95a4JuZo49PYciad.VAUwt8nH3mrxnl2moo6a', '2024-12-03 05:36:15'),
(4, 'arsh1@icloud.com', '$2y$10$W07Dx.v0SvJUVI.Wto4iUeyh/m0DYM08IZ48KYLGeACGu0pPyYEsK', '2024-12-03 15:52:40'),
(5, 'aayaansh21@gmail.com', '$2y$10$e7yA/PzFGRwHVGlyc.c2sOsQ795B5ce/cIOePZoWBw8WK10.SWdAO', '2024-12-03 19:05:26'),
(6, 'aryan1@gmail.com', '$2y$10$8ZGbdBkFcl6e17cDVZ0speoyHP3lMZtFMOzsKO5edGgNbrQ1XLzz2', '2024-12-03 19:46:51'),
(7, 'gurnoor1@gmail.com', '$2y$10$iCwzsnZWsjY45tzqUja6T.YeUur.tp.io0dU4OAVjtwWlSAXsJwi6', '2024-12-03 21:16:42'),
(8, 'khushleen1@gmail.com', '$2y$10$lt0bI2KmcPZNN2cmgfNEYeaItz6zpLLn3FvUdojrtZbE7IzC.aJrW', '2024-12-03 21:18:40'),
(9, 'gurleen1@gmail.com', '$2y$10$jlui4/XkW7OyNEhe4mCYvuxTx6rsRhGYnpGDmUW2Zih62pj3izqrC', '2024-12-03 21:19:45'),
(10, 'arsh1@gmail.com', '$2y$10$/bkDeHA.0Zkn.APKkD6TUeJhP4iSf1/S8VetQZnvn9zMIC6HWUjtG', '2024-12-03 21:22:05'),
(11, 'sunshine1@gmail.com', '$2y$10$v8XmO60VxzWOYrHmjBpKpOu9b7LPepGsQ6SkAIM9tJxbmYnGCRhfG', '2024-12-03 21:23:12'),
(12, 'nitin1@gmail.com', '$2y$10$t38JGLQH79snXdJDMH9wguBQnaxyw15nnKx.RvOzbEKHwhlsvn21m', '2024-12-03 21:25:49'),
(13, 'harsh1@gmail.com', '$2y$10$4x3esr8fRirMJh9Uf.r7Nu88TtLEdELnn.gD8j/xaQIzyYPnSktMy', '2024-12-03 21:27:21'),
(14, 'wally', '$2y$10$WZylUmVHiMFZAjNCGtHCn.Ks063aLNj8EIewgdFf54NeRdrzzAAMG', '2024-12-04 05:02:07');

-- --------------------------------------------------------

--
-- Table structure for table `beats`
--

CREATE TABLE `beats` (
  `beat_id` int(11) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `audio_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bikes`
--

CREATE TABLE `bikes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `rate` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bikes`
--

INSERT INTO `bikes` (`id`, `name`, `description`, `category`, `image_path`, `created_at`, `rate`) VALUES
(1, 'Royal Enfield 350', 'A classic bike with a powerful engine.', 'Cruiser', '350.jpg', '2024-11-23 01:19:23', 25.50),
(2, 'KTM Duke', 'A lightweight and sporty bike.', 'Sport', 'duke.png', '2024-11-23 01:19:23', 15.00),
(3, 'Harley Davidson', 'A premium cruiser bike.', 'Cruiser', 'harley.jpg', '2024-11-23 01:19:23', 30.75),
(4, 'KTM RC', 'A performance-oriented sports bike.', 'Sport', 'ktmrc.jpg', '2024-11-23 01:19:23', 20.00),
(5, 'Ninja 300', 'A stylish and versatile bike.', 'Sport', 'ninja.jpg', '2024-11-23 01:19:23', 50.00),
(6, 'Splendor', 'An affordable and comfortable bike', 'Regular', '620d6fcaa1bf1b8ff86080b21c6cbfee.jpg', '2024-11-23 06:46:27', 10.00),
(7, 'Yamaha YZF-R1', 'A high-performance super-sport motorcycle, equipped with cutting-edge technology and advanced aerodynamics for an exhilarating ride.', 'Sport', '6.jpg', '2024-12-02 17:06:54', 55.00),
(8, 'Yamaha 7', 'A versatile motorcycle with exceptional reliability, comfort, and performance, suitable for both city commutes and long rides.', 'Regular', '7.jpg', '2024-12-02 17:08:04', 20.00),
(9, 'BMW R1250', 'A premium adventure touring bike, known for its powerful engine, advanced features, and ultimate riding comfort.', 'Cruiser', '8.jpg', '2024-12-02 17:09:11', 75.00),
(10, 'Yamaha V1FZ', 'A lightweight and agile motorcycle, designed for everyday riding with a balance of power and efficiency.', 'Regular', '9.jpg', '2024-12-02 17:11:27', 18.00),
(11, 'Bullet', 'This  is a good bike.', 'Regular', 'bullet.jpg', '2024-12-03 17:08:52', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bike_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `bike_id`, `name`, `email`, `date`, `time`, `created_at`) VALUES
(1, 1, 1, 'Pranav Sharma ', 'sharmapranav5788@gmail.com', '2024-12-05', '20:30:00', '2024-11-23 21:36:28'),
(3, 1, 1, 'Pranav Sharma', 'sharmapranav5788@gmail.com', '2024-12-06', '18:00:00', '2024-12-01 21:20:20'),
(4, 1, 5, 'Pranav Sharma', 'sharmapranav5788@gmail.com', '2024-12-11', '16:00:00', '2024-12-02 02:44:07'),
(5, 1, 5, 'Arshdeep', 'sharmapranav5788@gmail.com', '2024-12-09', '15:00:00', '2024-12-02 07:33:39'),
(6, 1, 6, 'Pranav Sharma', 'sharmapranav5788@gmail.com', '2024-12-13', '18:00:00', '2024-12-02 15:34:05'),
(7, 3, 2, 'Aayaansh Sharma', 'aayaansh21@gmail.com', '2024-12-14', '10:00:00', '2024-12-02 16:38:47'),
(8, 6, 8, 'Manisha', 'manisha10@gmail.com', '2024-12-15', '17:00:00', '2024-12-02 17:35:44'),
(9, 9, 7, 'Arshdeep', 'arshdeep6@gmail.com', '2024-12-10', '16:00:00', '2024-12-02 17:38:43'),
(10, 5, 1, 'AShok Sharma', 'ashok1@gmail.com', '2024-12-15', '09:00:00', '2024-12-02 17:41:55'),
(11, 7, 5, 'Rakesh ', 'rakesh18@gmail.com', '2024-12-16', '19:00:00', '2024-12-02 17:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price_per_month` decimal(10,2) NOT NULL,
  `location` varchar(100) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `available` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`id`, `name`, `description`, `price_per_month`, `location`, `image_path`, `available`, `created_at`) VALUES
(1, 'Cozy Apartment', 'A small cozy apartment in the city center.', 500.00, 'Downtown', 'images/Images/1.jpg', 1, '2024-11-24 10:15:56'),
(2, 'Luxury Villa', 'A luxurious villa with a private pool.', 1500.00, 'Suburbs', 'images/Images/2.jpg', 1, '2024-11-24 10:15:56'),
(3, 'Beach House', 'A beautiful house near the beach.', 1000.00, 'Seaside', 'images/Images/3.jpg', 1, '2024-11-24 10:15:56'),
(4, 'Modern Studio', 'A modern studio with all amenities.', 700.00, 'Downtown', 'images/Images/4.jpg', 1, '2024-11-24 10:15:56'),
(5, 'Rustic Cabin', 'A cabin in the woods for a peaceful retreat.', 300.00, 'Countryside', 'images/Images/5.jpg', 1, '2024-11-24 10:15:56'),
(6, 'Urban Loft', 'A stylish loft in a bustling area.', 800.00, 'Downtown', 'images/Images/6.jpg', 1, '2024-11-24 10:15:56'),
(7, 'Suburban Home', 'A family-friendly house in the suburbs.', 900.00, 'Suburbs', 'images/Images/7.jpg', 1, '2024-11-24 10:15:56'),
(8, 'Penthouse Suite', 'A luxurious penthouse with a great view.', 2000.00, 'Downtown', 'images/Images/8.jpg', 1, '2024-11-24 10:15:56'),
(9, 'Country Cottage', 'A charming cottage in a quiet village.', 400.00, 'Countryside', 'images/Images/9.jpg', 1, '2024-11-24 10:15:56'),
(10, 'Tranquil Aparts', 'A very beautiful and away from the city apartment with all the facilities nearby', 1300.00, 'Le Salle', 'images/10.jpg', 1, '2024-12-03 05:08:40');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `user_id`, `house_id`, `start_date`, `end_date`, `created_at`) VALUES
(0, 5, 1, '2024-12-16', '2025-01-16', '2024-12-03 19:27:13'),
(0, 1, 6, '2024-12-06', '2025-01-02', '2024-12-03 20:12:58'),
(0, 2, 1, '2024-12-19', '2025-02-26', '2024-12-03 20:35:29');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `content`, `created_at`, `user_id`) VALUES
(2, 'Good houses and reasonable rent.', '2024-12-03 20:11:30', 2),
(3, 'Bahut mza aya muthi marte hue gubara fta', '2024-12-03 20:13:30', 1),
(4, 'Sheer comfortable houses with very good location. Really enjoyed my stay.', '2024-12-03 21:01:25', 2),
(5, 'This is an amazing apartment! Very clean and well-maintained.', '2024-12-03 21:18:03', 7),
(6, 'I loved staying in this cozy beach house. Perfect for a weekend getaway!', '2024-12-03 21:19:23', 8),
(7, 'The villa is luxurious and spacious. Highly recommended for families.', '2024-12-03 21:20:39', 9),
(8, 'The studio is modern and comfortable, but parking was a bit of a hassle.', '2024-12-03 21:22:38', 10),
(9, 'The countryside cabin was a peaceful retreat. I would visit again!\'', '2024-12-03 21:24:45', 11),
(10, 'The loft is stylish and in a great location. Ideal for city explorers.', '2024-12-03 21:26:34', 12),
(11, 'The suburban home was perfect for my family vacation. Very spacious.', '2024-12-03 21:29:15', 13);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `bike_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `bike_id`, `user_id`, `comment`, `created_at`) VALUES
(1, 3, 1, 'This is a very classic and comfortable bike. Had a great time biking to the mountains and experiencing sheer comfort. ', '2024-11-23 06:39:01'),
(2, 6, 1, 'This is a very affordable bike and very easy to operate. It provides sheer comfort.', '2024-11-23 18:58:34'),
(5, 4, 1, 'A sport bike provided sheer comfort and a passionate ride.', '2024-12-02 16:37:10'),
(6, 10, 3, 'Compact, agile, and efficient. The Yamaha V1FZ is great for zipping through city traffic', '2024-12-02 17:22:10'),
(7, 9, 5, 'The BMW R1250 is pure luxury on two wheels. Ideal for adventure lovers and long road trips.', '2024-12-02 17:23:32'),
(8, 1, 7, 'The Royal Enfield 350 is an absolute classic! Its powerful engine and retro design make it a joy to ride on highways.', '2024-12-02 17:25:34'),
(9, 4, 9, 'A dream for sports bike enthusiasts. The KTM RC handles corners like a champ and looks stunning.', '2024-12-02 17:27:33'),
(10, 9, 10, 'The BMW R1250 is pure luxury on two wheels. Ideal for adventure lovers and long road trips.', '2024-12-02 17:31:20'),
(11, 8, 4, 'A reliable bike for everyday use. It offers great comfort and a balanced ride.', '2024-12-02 17:32:33'),
(12, 3, 6, 'The ultimate cruiser! The Harley Davidson delivers unmatched comfort and style for long-distance rides.', '2024-12-02 17:34:29'),
(13, 11, 5, 'very comfortable', '2024-12-03 17:11:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'sharmapranav5788@gmail.com', '$2y$10$5C.vI.0cb7/GxykGCjNeNuquI.RyjqX1rpM13E8i66gDW8KUdP3de', 'user', '2024-11-23 06:26:02'),
(2, 'sukhdeep3@icloud.com', '$2y$10$uo2iSMw6gs35mA7YqHavyuaS8/TC/rjtRFOb4RKWggfkYDomlGRHy', 'user', '2024-12-01 22:29:03'),
(3, 'aayaansh21@gmail.com', '$2y$10$iId5vXE5AFbKgCRYxhdVouBnNEslF1OwJ.hasmiCldnFArAV3zeoC', 'user', '2024-12-02 16:25:28'),
(4, 'tanya10@gmail.com', '$2y$10$pZCAweNAeEmx/ep/AudyMOmfEgu8WW4D2vMcwIZ/kxF2yylOYQoLK', 'user', '2024-12-02 16:26:54'),
(5, 'ashok1@gmail.com', '$2y$10$ta2Q7CarDrcskQE/Fgo3KeZQi6XBX.YSyQkVSuGJjrAO5qYTOtQwC', 'user', '2024-12-02 16:27:40'),
(6, 'manisha10@gmail.com', '$2y$10$UfBKPK2gs2ku1D5ZtaJTXOQxuEWBaiER5hwdvgm8h3gvKbl67Bjxy', 'user', '2024-12-02 16:28:16'),
(7, 'rakesh18@gmail.com', '$2y$10$2Et/A0WAOJw1BBI65VeYS.ubsxqCdi9AO8pIfg7FVRfP92QIoNxs2', 'user', '2024-12-02 16:28:36'),
(8, 'ritika2@gmail.com', '$2y$10$Ovp3/n4nCWlTfC8P4RU1aejRnzYbgjYbwbIjpLtQVuQUUcPyMNlfW', 'user', '2024-12-02 16:29:37'),
(9, 'arshdeep6@gmail.com', '$2y$10$VLaTN/79YNSPcPhonCVv4.P1b6Co0yqlX01Flj6Ou5F9mfuiKhpwW', 'user', '2024-12-02 16:30:52'),
(10, 'navdeep25@gmail.com', '$2y$10$.MGIYMP4lYkw/TqatA8Xguff69Du9VZ.DD.uFKU7LDCIVmVJTLPei', 'user', '2024-12-02 16:32:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `beats`
--
ALTER TABLE `beats`
  ADD PRIMARY KEY (`beat_id`);

--
-- Indexes for table `bikes`
--
ALTER TABLE `bikes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `bike_id` (`bike_id`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bike_id` (`bike_id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `beats`
--
ALTER TABLE `beats`
  MODIFY `beat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bikes`
--
ALTER TABLE `bikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`bike_id`) REFERENCES `bikes` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `admins` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_bike_id` FOREIGN KEY (`bike_id`) REFERENCES `bikes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
