-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 11, 2021 at 09:17 PM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CSUF_Project_CPSC332 alias`
--

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `Units` int(1) NOT NULL,
  `Course_Num` varchar(8) NOT NULL,
  `Course_Title` text NOT NULL,
  `Textbook` text NOT NULL,
  `Cor_Number` int(11) NOT NULL,
  `Depart_Num` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`Units`, `Course_Num`, `Course_Title`, `Textbook`, `Cor_Number`, `Depart_Num`) VALUES
(2, 'ART101', 'ART 101 - INTRODUCTION TO ART', 'Art is Cool', 1, NULL),
(3, 'CPSC332', 'CPSC 332 File Structure and Database System', 'Fundamentals of Database Systems', 2, NULL),
(3, 'CPSC333', 'CPSC 333 Processor and Graphics Card Functionality ', 'How to Build a Processor and Graphics Card', 3, NULL),
(3, 'MATH102', 'MATH 102 Intro to Linear Algebra', 'Linear Algebra: Nothing Like Algebra', 4, NULL),
(2, 'MUSC243', 'MUSC 243 Intro to Jazz Composition', 'You Like Jazz: Intro to Jazz', 5, NULL),
(3, 'PHYS103', 'PHYS 103 Quantum Relativity', 'Quantum Relativity: How to understand it', 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `Depart_Number` int(11) NOT NULL,
  `name` text NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `Chair_Person` int(9) NOT NULL,
  `Location_office` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Department`
--

INSERT INTO `Department` (`Depart_Number`, `name`, `telephone`, `Chair_Person`, `Location_office`) VALUES
(1, 'Mathematics', '6267885463', 832871234, 'MH510'),
(2, 'Arts & Music', '6267354466', 889983245, 'CPAC220');

-- --------------------------------------------------------

--
-- Table structure for table `Enrollment_Records`
--

CREATE TABLE `Enrollment_Records` (
  `Student_CWID` int(8) NOT NULL,
  `Section_Num` varchar(8) NOT NULL,
  `Grade` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Enrollment_Records`
--

INSERT INTO `Enrollment_Records` (`Student_CWID`, `Section_Num`, `Grade`) VALUES
(99883423, 'ART101', 'A-'),
(99883423, 'MATH102', 'B+'),
(99883423, 'PHYS103', 'C+'),
(99887455, 'CPSC332', 'A+'),
(99887455, 'MATH102', 'A+'),
(99887455, 'PHYS103', 'A+'),
(99888302, 'ART101', 'A+'),
(99888302, 'MATH102', 'c+'),
(99888302, 'MUSC243', 'A+'),
(99888390, 'CPSC332', 'B'),
(99888390, 'MATH102', 'C+'),
(99888390, 'PHYS103', 'C'),
(99888399, 'CPSC332', 'A-'),
(99888399, 'MATH102', 'A+'),
(99888399, 'PHYS103', 'A+'),
(889900429, 'ART101', 'B+'),
(889900429, 'CPSC332', 'A'),
(889900429, 'MATH102', 'A-'),
(889900429, 'PHYS103', 'B'),
(889902934, 'CPSC332', 'A'),
(889902934, 'CPSC333', 'A-'),
(889902934, 'MATH102', 'A'),
(889902934, 'MUSC243', 'A+'),
(889907525, 'CPSC332', 'A+'),
(889907525, 'MATH102', 'A'),
(889907525, 'MUSC243', 'A-'),
(889907525, 'PHYS103', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `Prereqs`
--

CREATE TABLE `Prereqs` (
  `Prereq_Course` varchar(50) NOT NULL,
  `Course_Num` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Prereqs`
--

INSERT INTO `Prereqs` (`Prereq_Course`, `Course_Num`) VALUES
('ART098, ART099', 'ART101'),
('CPSC131, CPSC332', 'CPSC332'),
('CPSC332', 'CPSC333'),
('MATH099, MATH101', 'MATH102'),
('MUSC130, MUSC131', 'MUSC243'),
('PHYS100, PHYS101, PHYS102', 'PHYS103');

-- --------------------------------------------------------

--
-- Table structure for table `Professor_Interface`
--

CREATE TABLE `Professor_Interface` (
  `Street_Address` text NOT NULL,
  `City` text NOT NULL,
  `State` text NOT NULL,
  `Zip_Code` int(5) NOT NULL,
  `Prof_Name` text NOT NULL,
  `Prof_SSN` int(8) NOT NULL,
  `College_Degree` text NOT NULL,
  `Salary` bigint(255) NOT NULL,
  `Title` text NOT NULL,
  `Sex` text NOT NULL,
  `Area_Code` int(3) NOT NULL,
  `7_digit_num` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Professor_Interface`
--

INSERT INTO `Professor_Interface` (`Street_Address`, `City`, `State`, `Zip_Code`, `Prof_Name`, `Prof_SSN`, `College_Degree`, `Salary`, `Title`, `Sex`, `Area_Code`, `7_digit_num`) VALUES
('1564 Pisa Ln', 'Los Angeles', 'CA', 90082, 'Galileo', 331443245, 'Physics', 81642, 'Dr.', 'M', 626, 2003425),
('3484 Woolsthorpe Manor Blvd', 'Anaheim', 'CA', 92831, 'Isaac', 832871234, 'Mathematics', 311727, 'Dr.', 'M', 562, 2912077),
('1917 Beverly Blvd', 'Beverly Hills', 'CA', 93823, 'Ella', 889983245, 'Music', 151996, 'Mrs.', 'F', 626, 3782902);

-- --------------------------------------------------------

--
-- Table structure for table `Section`
--

CREATE TABLE `Section` (
  `Section_Num` varchar(8) NOT NULL,
  `Classroom` varchar(8) NOT NULL,
  `Num_Of_Seats` int(100) NOT NULL,
  `Meeting_Days` text NOT NULL,
  `Beginning_Time` text NOT NULL,
  `Ending_Time` text NOT NULL,
  `Prof_SSN` int(9) NOT NULL,
  `Cor_Number` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Section`
--

INSERT INTO `Section` (`Section_Num`, `Classroom`, `Num_Of_Seats`, `Meeting_Days`, `Beginning_Time`, `Ending_Time`, `Prof_SSN`, `Cor_Number`) VALUES
('ART101', 'MH100', 50, 'M W', '10:00:00', '12:00:00', 889983245, 1),
('CPSC332', 'MH201', 30, ' T TH', '08:00:00', '09:00:00', 331443245, 2),
('CPSC333', 'CS223', 50, 'T TH', '11:30:00', '12:45:00', 832871234, 3),
('MATH102', 'MH213', 20, 'M W TH', '09:00:00', '14:00:00', 832871234, 4),
('MUSC243', 'MH334', 50, 'F', '17:00:00', '19:00:00', 889983245, 5),
('PHYS103', 'MU113', 50, 'T TH', '14:00:00', '16:30:00', 331443245, 6);

-- --------------------------------------------------------

--
-- Table structure for table `Student_Interface`
--

CREATE TABLE `Student_Interface` (
  `First_Name` text NOT NULL,
  `Last_Name` text NOT NULL,
  `Student_CWID` int(8) NOT NULL,
  `Major` text NOT NULL,
  `Minor` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Student_Interface`
--

INSERT INTO `Student_Interface` (`First_Name`, `Last_Name`, `Student_CWID`, `Major`, `Minor`) VALUES
('Amelia ', 'Earhart', 99883423, 'Aviation', 'Geography'),
('Marie', 'Curie', 99887455, 'Chemistry ', 'Mathematics'),
('Louis', 'Armstrong', 99888302, 'Music', 'Sports Marketing'),
('Albert', 'Einstein', 99888390, 'Physics', 'Oceanography'),
('Stephen ', 'Hawking', 99888399, 'Physics', 'Cosmology'),
('Luis', 'Valle', 889900429, 'Computer Science', 'Music Theory'),
('Juan', 'Cisneros', 889902934, 'Computer Science', 'Business Administration'),
('Tiffany', 'Trinh', 889907525, 'Computer Science', 'Art');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`Cor_Number`),
  ADD KEY `Course_Department_Num_Foreign` (`Depart_Num`),
  ADD KEY `Section_course_num` (`Course_Num`);

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`Depart_Number`),
  ADD KEY `Department_Foreign` (`Chair_Person`);

--
-- Indexes for table `Enrollment_Records`
--
ALTER TABLE `Enrollment_Records`
  ADD PRIMARY KEY (`Student_CWID`,`Section_Num`),
  ADD KEY `Enrollment_Num_For` (`Section_Num`);

--
-- Indexes for table `Prereqs`
--
ALTER TABLE `Prereqs`
  ADD PRIMARY KEY (`Course_Num`);

--
-- Indexes for table `Professor_Interface`
--
ALTER TABLE `Professor_Interface`
  ADD PRIMARY KEY (`Prof_SSN`),
  ADD UNIQUE KEY `SSN` (`Prof_SSN`);

--
-- Indexes for table `Section`
--
ALTER TABLE `Section`
  ADD PRIMARY KEY (`Section_Num`),
  ADD KEY `Section_prof_ssn_num` (`Prof_SSN`),
  ADD KEY `course_num_foreign` (`Cor_Number`);

--
-- Indexes for table `Student_Interface`
--
ALTER TABLE `Student_Interface`
  ADD PRIMARY KEY (`Student_CWID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Course`
--
ALTER TABLE `Course`
  ADD CONSTRAINT `Course_Department_Num_Foreign` FOREIGN KEY (`Depart_Num`) REFERENCES `Department` (`Depart_Number`),
  ADD CONSTRAINT `Prereq_course_num_foreign` FOREIGN KEY (`Course_Num`) REFERENCES `Prereqs` (`Course_Num`),
  ADD CONSTRAINT `Section_course_num` FOREIGN KEY (`Course_Num`) REFERENCES `Section` (`Section_Num`);

--
-- Constraints for table `Department`
--
ALTER TABLE `Department`
  ADD CONSTRAINT `Department_Foreign` FOREIGN KEY (`Chair_Person`) REFERENCES `Proessor_Interface` (`Prof_SSN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Enrollment_Records`
--
ALTER TABLE `Enrollment_Records`
  ADD CONSTRAINT `Enrollment_Num_For` FOREIGN KEY (`Section_Num`) REFERENCES `Section` (`Section_Num`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Student_CWID` FOREIGN KEY (`Student_CWID`) REFERENCES `Student_Interface` (`Student_CWID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Section`
--
ALTER TABLE `Section`
  ADD CONSTRAINT `Section_prof_ssn_num` FOREIGN KEY (`Prof_SSN`) REFERENCES `Proessor_Interface` (`Prof_SSN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `course_num_foreign` FOREIGN KEY (`Cor_Number`) REFERENCES `Course` (`Cor_Number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
