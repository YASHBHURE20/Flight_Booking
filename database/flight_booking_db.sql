-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2022 at 06:56 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flight_booking_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `airlines_list`
--

CREATE TABLE `airlines_list` (
  `id` int(30) NOT NULL,
  `airlines` text NOT NULL,
  `logo_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airlines_list`
--

INSERT INTO `airlines_list` (`id`, `airlines`, `logo_path`) VALUES
(1, 'AirAsia', '1600999080_kisspng-flight-indonesia-airasia-airasia-japan-airline-tic-asia-5abad146966736.8321896415221927106161.jpg'),
(4, 'Air India', '1652503560_air-india-airline-brand-logo.png'),
(5, 'Cathay Pacific', '1652503620_cathay-pacific-airline-brand-logo.jpg'),
(6, 'Emirates', '1652503620_emirates-airline-brand-logo.png'),
(7, 'Go Air', '1652503620_go-air-airline-brand-logo.jpg'),
(8, 'Indigo', '1652503620_indigo-airline-brand-logo.png'),
(9, 'Lufthansa', '1652503620_lufthansa-airline-brand-logo.png'),
(10, 'Qatar', '1652503680_qatar-airline-brand-logo.png'),
(11, 'Spicejet', '1652503680_spicejet-airline-brand-logo.jpg'),
(12, 'Vistara', '1652503680_vistara-airline-brand-logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `airport_list`
--

CREATE TABLE `airport_list` (
  `id` int(30) NOT NULL,
  `airport` text NOT NULL,
  `location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airport_list`
--

INSERT INTO `airport_list` (`id`, `airport`, `location`) VALUES
(4, 'Dubai International Airport', 'Garhoud, Dubai'),
(6, 'Indira Gandhi International Airport', 'New Delhi'),
(7, 'Sardar Vallabhbhai Patel International Airport', 'Ahmedabad'),
(8, 'Dr. Babasaheb Ambedkar International Airport', 'Nagpur'),
(9, 'Dabolim Airport (Goa International Airport)', 'Goa'),
(10, 'Chhatrapati Shivaji International Airport', 'Mumbai'),
(11, 'Cochin International Airport', 'Kochi'),
(12, 'Netaji Subhash Chandra Bose International Airport', 'Kolkata'),
(13, 'Pune International Airport', 'Pune');

-- --------------------------------------------------------

--
-- Table structure for table `booked_flight`
--

CREATE TABLE `booked_flight` (
  `id` int(30) NOT NULL,
  `flight_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booked_flight`
--

INSERT INTO `booked_flight` (`id`, `flight_id`, `name`, `address`, `contact`) VALUES
(4, 5, 'Suresh', 'Nagpur', '1234123412'),
(5, 5, 'Mahesh', 'Nagpur', '1111111111');

-- --------------------------------------------------------

--
-- Table structure for table `flight_list`
--

CREATE TABLE `flight_list` (
  `id` int(30) NOT NULL,
  `airline_id` int(30) NOT NULL,
  `plane_no` text NOT NULL,
  `departure_airport_id` int(30) NOT NULL,
  `arrival_airport_id` int(30) NOT NULL,
  `departure_datetime` datetime NOT NULL,
  `arrival_datetime` datetime NOT NULL,
  `seats` int(10) NOT NULL DEFAULT '0',
  `price` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight_list`
--

INSERT INTO `flight_list` (`id`, `airline_id`, `plane_no`, `departure_airport_id`, `arrival_airport_id`, `departure_datetime`, `arrival_datetime`, `seats`, `price`, `date_created`) VALUES
(4, 3, 'CEB10023', 1, 5, '2021-03-20 01:00:00', '2021-03-20 02:00:00', 100, 2500, '2021-02-25 14:50:47'),
(5, 4, 'IC 218', 10, 8, '2022-05-16 13:00:00', '2022-05-16 15:00:00', 200, 3000, '2022-05-14 10:19:17'),
(6, 12, 'VT1202', 10, 9, '2022-05-17 14:00:00', '2022-05-17 15:00:00', 150, 2500, '2022-05-14 10:20:22');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Online Flight Booking System', 'info@saicompusys.com', '9822232768', '1615490820_banner.jpg', '&lt;p style=&quot;text-align: justify; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(74, 74, 74); font-family: Mukta, Lato, sans-serif; font-size: 12px; text-align: start; background-color: rgb(231, 231, 231);&quot;&gt;Our Flight booking System is India&amp;#x2019;s leading player for flight bookings, and have a dominant position in the domestic flights sector. With the cheapest fare guarantee, experience great value at the lowest price. Instant notifications ensure current flight status, instant fare drops, amazing discounts, instant refunds and rebook options, price comparisons and many more interesting features.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

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
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=admin , 2 = doctor,3=patient'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `doctor_id`, `name`, `address`, `contact`, `username`, `password`, `type`) VALUES
(1, 0, 'Administrator', '', '', 'admin', 'admin123', 1),
(16, 0, 'Ramesh', '', '', 'Ramesh', 'Ramesh123', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airlines_list`
--
ALTER TABLE `airlines_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `airport_list`
--
ALTER TABLE `airport_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booked_flight`
--
ALTER TABLE `booked_flight`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flight_list`
--
ALTER TABLE `flight_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
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
-- AUTO_INCREMENT for table `airlines_list`
--
ALTER TABLE `airlines_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `airport_list`
--
ALTER TABLE `airport_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `booked_flight`
--
ALTER TABLE `booked_flight`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `flight_list`
--
ALTER TABLE `flight_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
