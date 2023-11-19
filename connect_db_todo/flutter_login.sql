-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2023 at 07:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flutter_login`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`) VALUES
(1, 'bruce', 'bruce@gmail.com', '$2y$10$aCVxLA9q04AhsxjVXNufRuLPvZha8IPGAUb49vuw1gHRE59cxmCJK'),
(2, 'boy', 'boy@gmail.com', '$2y$10$6OPXzi2JhCvINbYKdqOzGe7P6qp2v9gEo6K8puXOakHqC5mtvH.4S'),
(3, '1', '1', '$2y$10$5MEjyJjbwk8WIjT95zx4BOqP06A9godOMuj1B4r0nWwzcxlMEhGJu'),
(4, 'b', 'b@gmail.com', '$2y$10$hY32Vj.Fdp0u.Up9RYhMQulvR..Gdl.vDWIon4m5t4b.fNZ9QMx1S'),
(6, 'a', 'a', '$2y$10$hj32VSJ9nKGo1jlYnzzUL.1UEV6joji4yk2IGHpcvv5M2EFdMXQC6'),
(9, 'h', 'h', '$2y$10$41trTunVKf.uOolR.j7YSuxoP4SVbX2wbzQi9qOKzAauUmfyV4mBO'),
(10, '5', '5', '$2y$10$zoklejilTHH8BH4gT29GXefF09wyHodaGWcOnrhli6DWkfQIZOW8K'),
(11, '3', '3', '$2y$10$N6GXZE.gf87pth.oZFNMcezeLan6C.38W0iVj3pYz/lfFeBJPXRwy'),
(12, 'macaron', 'macaron', '$2y$10$v0iHZz3DeclQbqJKpKMPo.pZFNnDFN4vOKI9N5uTdmhj5fP/Y3AGi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
