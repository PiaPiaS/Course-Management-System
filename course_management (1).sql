-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2024 at 12:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `course_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `name`, `duration`) VALUES
(2, 'COMPUTING', 3),
(6, 'BIT', 3),
(7, 'BBA', 3);

-- --------------------------------------------------------

--
-- Table structure for table `course_admin`
--

CREATE TABLE `course_admin` (
  `id` int(11) NOT NULL,
  `firstname` varchar(80) NOT NULL,
  `lastname` varchar(80) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `confirm_password` varchar(80) NOT NULL,
  `user_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_admin`
--

INSERT INTO `course_admin` (`id`, `firstname`, `lastname`, `username`, `password`, `email`, `confirm_password`, `user_type`) VALUES
(1, 'Priya', 'Shrestha', 'admin', 'Admin@123', 'admin@gmail.com', 'Admin@123', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_course`
--

CREATE TABLE `enrolled_course` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrolled_course`
--

INSERT INTO `enrolled_course` (`id`, `course_id`, `student_id`, `module_id`) VALUES
(20, 2, 12, 8),
(25, 2, 22, 7),
(28, 2, 15, 8),
(31, 2, 17, 10),
(32, 2, 15, 7),
(34, 2, 22, 7),
(39, 7, 23, 18),
(40, 2, 24, 8),
(41, 6, 24, 17),
(43, 2, 25, 16),
(44, 7, 25, 18),
(45, 7, 26, 18),
(46, 7, 26, 19);

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `id` int(11) NOT NULL,
  `firstname` varchar(80) NOT NULL,
  `lastname` varchar(80) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `email` varchar(255) NOT NULL,
  `confirm_password` varchar(80) NOT NULL,
  `user_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`id`, `firstname`, `lastname`, `username`, `password`, `email`, `confirm_password`, `user_type`) VALUES
(1, 'Rabin', ' Mishra', 'Rabin', 'Rabin@123', 'Rabin@gmail.com', 'Rabin@123', 'instructor'),
(2, 'Saurav', 'Bhandari', 'saurabh', 'Saurab@123', 'savb@gmail.com', 'Saurab@123', 'instructor'),
(4, 'Puja', 'Shrestha', 'Puza', 'Puza@123', 'Puja12@gmail.com', 'Puza@123', 'Instructor'),
(5, 'Ram', 'Stha', 'Ram', 'Ram@123', 'SthaRam@gmail.com', 'Ram@123', 'Instructor');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `marks` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`id`, `student_id`, `module_id`, `marks`) VALUES
(1, 12, 8, 81),
(2, 12, 10, 65),
(3, 12, 7, 80),
(4, 15, 7, 98),
(15, 25, 16, 30),
(17, 26, 18, 89),
(18, 26, 19, 75);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `course_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `is_optional` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `course_id`, `level`, `instructor_id`, `is_optional`) VALUES
(7, 'Programming Fundamentals', 2, 4, 1, 0),
(8, 'Advanced Databases', 2, 5, 2, 0),
(9, 'Advanced UIUX', 2, 6, 2, 1),
(10, 'Advanced Machine Learning', 2, 6, 2, 1),
(16, 'Embedded System', 2, 4, 2, 0),
(17, 'AI', 6, 5, 2, 0),
(18, 'Accounting', 7, 4, 4, 0),
(19, 'Marketing', 7, 5, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `firstname` varchar(80) NOT NULL,
  `lastname` varchar(80) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `email` varchar(255) NOT NULL,
  `confirm_password` varchar(80) NOT NULL,
  `user_type` varchar(30) NOT NULL,
  `course` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `firstname`, `lastname`, `username`, `password`, `email`, `confirm_password`, `user_type`, `course`) VALUES
(12, 'mixon', 'tandukar', 'mixxy', 'pass123', 'mixontandukar@gmail.com', 'pass123', 'student', 'BBA'),
(15, 'Pia', 'Shrestha', 'Pia', 'Pia@1234', 'Pia@gmail.com', 'Pia@1234', 'student', 'Computing'),
(17, 'Tina', 'Dutta', 'Tina', 'Tina@1234', 'Tina@gmail.com', 'Tina@1234', 'student', 'Computing'),
(22, 'Riddhi', 'Maskey', 'Riddhi', 'Rid@123', 'Ridhi@gmail.com', 'Rid@123', 'Student', 'Computing'),
(23, 'Deepika', 'Padukone', 'Deepee', 'Dipi@123', 'Dp@gmail.com', 'Dipi@123', 'Student', 'BBA'),
(24, 'Hina', 'Khan', 'Hina', 'Hina@123', 'Hina@gmail.com', 'Hina@123', 'Student', 'Computing'),
(25, 'Rinky', 'Raa', 'Student1', 'Student@123', 'rink@gmail.com', 'Student@123', 'Student', 'BBA'),
(26, 'Rita', 'Joshi', 'Rita', 'Rita@123', 'Rita@gmail.com', 'Rita@123', 'Student', 'BBA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_admin`
--
ALTER TABLE `course_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrolled_course`
--
ALTER TABLE `enrolled_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modules_ibfk_1` (`instructor_id`),
  ADD KEY `modules_ibfk_2` (`course_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `course_admin`
--
ALTER TABLE `course_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enrolled_course`
--
ALTER TABLE `enrolled_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `instructor`
--
ALTER TABLE `instructor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrolled_course`
--
ALTER TABLE `enrolled_course`
  ADD CONSTRAINT `enrolled_course_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `enrolled_course_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `enrolled_course_ibfk_3` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  ADD CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `modules_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
