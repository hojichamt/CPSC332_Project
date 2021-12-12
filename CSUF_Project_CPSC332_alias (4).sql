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
  `Course_Num` varchar(8) NOT NULL,
  `Course_Title` text NOT NULL,
  `Textbook` text NOT NULL,
  `Units` int(1) NOT NULL,
  `Depart_Num` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`Course_Num`, `Course_Title`, `Textbook`, `Units`, `Depart_Num`) VALUES
('ART101', 'ART 101 - INTRODUCTION TO ART', 'Art is Cool', 2, NULL),
('CPSC332', 'CPSC 332 File Structure and Database System', 'Fundamentals of Database Systems', 3, NULL),
('CPSC333', 'CPSC 333 Processor and Graphics Card Functionality ', 'How to Build a Processor and Graphics Card', 3, NULL),
('MATH102', 'MATH 102 Intro to Linear Algebra', 'Linear Algebra: Nothing Like Algebra', 3, NULL),
('MUSC243', 'MUSC 243 Intro to Jazz Composition', 'You Like Jazz: Intro to Jazz', 2, NULL),
('PHYS103', 'PHYS 103 Quantum Relativity', 'Quantum Relativity: How to understand it', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `Depart_Number` int(1) NOT NULL,
  `Depart_Name` text NOT NULL,
  `Telephone` varchar(10) NOT NULL,
  `Location_Office` varchar(500) NOT NULL,
  `Chair_Person` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Department`
--

INSERT INTO `Department` (`Depart_Number`, `Depart_Name`, `Telephone`, `Location_Office`, `Chair_Person`) VALUES
(1, 'Mathematics', '6267885463', 'MH510', 832871234),
(2, 'Arts & Music', '6267354466','CPAC220', 889983245);

-- --------------------------------------------------------

--
-- Table structure for table `Enrollment_Records`
--

CREATE TABLE `Enrollment_Records` (
  `Grade` varchar(2) NOT NULL,
  `Student_CWID` int(8) NOT NULL,
  `Section_Num` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Enrollment_Records`
--

INSERT INTO `Enrollment_Records` (`Grade`, `Student_CWID`, `Section_Num`) VALUES
('A-', 99883423, 'ART101'),
('B+', 99883423, 'MATH102'),
('C+', 99883423, 'PHYS103'),
('A+', 99887455, 'CPSC332'),
('A+', 99887455, 'MATH102'),
('A+', 99887455, 'PHYS103'),
('A+', 99888302, 'ART101'),
('C+', 99888302, 'MATH102'),
('A+', 99888302, 'MUSC243'),
('B', 99888390, 'CPSC332'),
('C+', 99888390, 'MATH102'),
('C', 99888390, 'PHYS103'),
('A-', 99888399, 'CPSC332'),
('A+', 99888399, 'MATH102'),
('A+', 99888399, 'PHYS103'),
('B+', 889900429, 'ART101'),
('A', 889900429, 'CPSC332'),
('A-', 889900429, 'MATH102'),
('B', 889900429, 'PHYS103'),
('A', 889902934, 'CPSC332'),
('A-', 889902934, 'CPSC333'),
('A', 889902934, 'MATH102'),
('A+', 889902934, 'MUSC243'),
('A+', 889907525, 'CPSC332'),
('A', 889907525, 'MATH102'),
('A-', 889907525, 'MUSC243'),
('A', 889907525, 'PHYS103');

-- --------------------------------------------------------

--
-- Table structure for table `Prereqs`
--

CREATE TABLE `Prereqs` (
  `Prereq_Course` varchar(8) NOT NULL,
  `Course_Num` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Prereqs`
--

INSERT INTO `Prereqs` (`Prereq_Course`, `Course_Num`) VALUES
('ART098', 'ART101'),
('ART099', 'ART101'),
('CPSC131', 'CPSC332'),
('CPSC130', 'CPSC332'),
('CPSC332', 'CPSC333'),
('MATH099', 'MATH102'),
('MATH101', 'MATH102'),
('MUSC130', 'MUSC243'),
('MUSC131', 'MUSC243'),
('PHYS100', 'PHYS103'),
('PHYS101', 'PHYS103'),
('PHYS102', 'PHYS103');

-- --------------------------------------------------------

--
-- Table structure for table `Professor_Interface`
--

CREATE TABLE `Professor_Interface` (
  `Prof_SSN` int(9) NOT NULL,
  `Prof_Name` text NOT NULL,
  `Street_Address` text NOT NULL,
  `City` text NOT NULL,
  `State` text NOT NULL,
  `Zip_Code` int(5) NOT NULL,
  `Area_Code` int(3) NOT NULL,
  `7_digit_num` int(7) NOT NULL,
  `Sex` text NOT NULL,
  `Title` text NOT NULL,
  `Salary` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Professor_Interface`
--

INSERT INTO `Professor_Interface` (`Prof_SSN`, `Prof_Name`, `Street_Address`, `City`, `State`, `Zip_Code`, `Area_Code`, `7_digit_num`, `Sex`, `Title`, `Salary`) VALUES
(331443245, 'Galileo', '1564 Pisa Ln', 'Los Angeles', 'CA', 90082, 626, 2003425, 'M', 'Dr.', 81642),
(832871234, 'Isaac','3484 Woolsthorpe Manor Blvd', 'Anaheim', 'CA', 92831, 562, 2912077, 'M', 'Dr.', 311727),
(889983245, 'Ella', '1917 Beverly Blvd', 'Beverly Hills', 'CA', 93823, 626, 3782902, 'F', 'Mrs.', 151996);

-- --------------------------------------------------------

--
-- Table structure for table `College_Degree`
--

CREATE TABLE `College_Degree` (
  `Degree` text NOT NULL,
  `Prof_SSN` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `College_Degree`
--

INSERT INTO `College_Degree` (`Degree`, `Prof_SSN`) VALUES
('Physics', 331443245),
('Mathematics', 832871234),
('Music', 889983245);

-- --------------------------------------------------------

--
-- Table structure for table `Section`
--

CREATE TABLE `Section` (
  `Section_Num` int(2) NOT NULL,
  `Classroom` varchar(8) NOT NULL,
  `Num_Of_Seats` int(100) NOT NULL,
  `Meeting_Days` text NOT NULL,
  `Beginning_Time` text NOT NULL,
  `Ending_Time` text NOT NULL,
  `Course_Num` varchar(8) NOT NULL,
  `Prof_SSN` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Section`
--

INSERT INTO `Section` (`Section_Num`, `Classroom`, `Num_Of_Seats`, `Meeting_Days`, `Beginning_Time`, `Ending_Time`, `Course_Num`, `Prof_SSN`) VALUES
(12, 'MH100', 50, 'M W', '10:00:00', '12:00:00', 'ART101', 889983245),
(43, 'MH201', 30, ' T TH', '08:00:00', '09:00:00', 'CPSC332', 331443245),
(51, 'CS223', 50, 'T TH', '11:30:00', '12:45:00', 'CPSC333', 832871234),
(22, 'MH213', 20, 'M W TH', '09:00:00', '14:00:00', 'MATH102', 832871234),
(72, 'MH334', 50, 'F', '17:00:00', '19:00:00', 'MUSC243', 889983245),
(37, 'MU113', 50, 'T TH', '14:00:00', '16:30:00', 'PHYS103', 331443245);

-- --------------------------------------------------------

--
-- Table structure for table `Student_Interface`
--

CREATE TABLE `Student_Interface` (
  `Student_CWID` int(8) NOT NULL,
  `First_Name` text NOT NULL,
  `Last_Name` text NOT NULL,
  `Address` text NOT NULL,
  `Telephone` varchar(10) NOT NULL,
  `Major` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Student_Interface`
--

INSERT INTO `Student_Interface` (`Student_CWID`, `First_Name`, `Last_Name`, `Address`, `Telephone`, `Major`) VALUES
(99883423, 'Amelia ', 'Earhart', '91 Newbridge Street Los Angeles, CA 90042', '2132008273', 'Mathematics'),
(99887455, 'Marie', 'Curie', '30 N. Greenrose Dr. Chino, CA 91710', '4063570373', 'Mathematics'),
(99888302, 'Louis', 'Armstrong', '7025 Cherry Lane Rancho Cucamonga, CA 91730', '9099890158', 'Mathematics'),
(99888390, 'Albert', 'Einstein', '9791 S. Illinois Street Anaheim, CA 92804', '5622177528', 'Arts & Music'),
(99888399, 'Stephen ', 'Hawking', '8901 Gregory St. Los Angeles, CA 90019', '2132156645', 'Arts & Music'),
(889900429, 'Luis', 'Valle', '261 Santa Clara Lane Ontario, CA 91761', '3152331426', 'Mathematics'),
(889902934, 'Juan', 'Cisneros', '728 Center St. Los Angeles, CA 90034', '2132014509', 'Arts & Music'),
(889907525, 'Tiffany', 'Trinh', '203 Devon Lane Los Angeles, CA 90063', '2132168285', 'Mathematics');

-- --------------------------------------------------------

--
-- Table structure for table `Minor`
--

CREATE TABLE `Minor` (
  `Minor_Dept` int(1) NOT NULL,
  `Student_CWID` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Minor`
--

INSERT INTO `Minor` (`Minor_Dept`, `Student_CWID`) VALUES
(1, 99883423),
(2, 99887455),
(2, 99888302),
(1, 99888390),
(2, 99888399),
(1, 889900429),
(2, 889902934),
(1, 889907525);

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`Course_Num`, `Depart_Num`),
  ADD KEY `Course_Department_Num_Foreign` (`Depart_Num`);

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
  ADD PRIMARY KEY (`Grade`, `Student_CWID`, `Section_Num`),
  ADD KEY `Enrollment_CWID` (`Student_CWID`),
  ADD KEY `Enrollment_Num` (`Section_Num`);

--
-- Indexes for table `Prereqs`
--
ALTER TABLE `Prereqs`
  ADD PRIMARY KEY (`Prereq_Course`, `Course_Num`),
  ADD KEY `Course_Foreign` (`Course_Num`);

--
-- Indexes for table `Professor_Interface`
--
ALTER TABLE `Professor_Interface`
  ADD PRIMARY KEY (`Prof_SSN`),
  ADD UNIQUE KEY `SSN` (`Prof_SSN`);

--
-- Indexes for table `College_Degree`
--
ALTER TABLE `College_Degree`
  ADD PRIMARY KEY (`Degree`, `Prof_SSN`),
  ADD UNIQUE KEY `SSN` (`Prof_SSN`);

--
-- Indexes for table `Section`
--
ALTER TABLE `Section`
  ADD PRIMARY KEY (`Section_Num`, `Course_Num`),
  ADD KEY `Course_Num_Foreign` (`Course_Num`),
  ADD KEY `Section_Prof_Ssn_Num` (`Prof_SSN`);

--
-- Indexes for table `Student_Interface`
--
ALTER TABLE `Student_Interface`
  ADD PRIMARY KEY (`Student_CWID`),
  ADD KEY `Dept_Name` (`Major`);
  
--
-- Indexes for table `Minor`
--
ALTER TABLE `Minor`
  ADD PRIMARY KEY (`Minor_Dept`),
  ADD KEY `Minor_CWID` (`Student_CWID`);

-- --------------------------------------------------------

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Course`
--
ALTER TABLE `Course`
  ADD CONSTRAINT `Course_Department_Num_Foreign` FOREIGN KEY (`Depart_Num`) REFERENCES `Department` (`Depart_Number`);

--
-- Constraints for table `Department`
--
ALTER TABLE `Department`
  ADD CONSTRAINT `Chair_Foreign` FOREIGN KEY (`Chair_Person`) REFERENCES `Proessor_Interface` (`Prof_SSN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Enrollment_Records`
--
ALTER TABLE `Enrollment_Records`
  ADD CONSTRAINT `Student_CWID` FOREIGN KEY (`Student_CWID`) REFERENCES `Student_Interface` (`Student_CWID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Enrollment_Num_For` FOREIGN KEY (`Section_Num`) REFERENCES `Section` (`Section_Num`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Prereqs`
--
ALTER TABLE `Prereqs`
  ADD CONSTRAINT `Prereqs_foreign` FOREIGN KEY (`Course_Num`) REFERENCES `Course` (`Course_Num`);

--
-- Constraints for table `College_Degree`
--
ALTER TABLE `College_Degree`
  ADD CONSTRAINT `Prof_Degree` FOREIGN KEY (`Prof_SSN`) REFERENCES `Proessor_Interface` (`Prof_SSN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Section`
--
ALTER TABLE `Section`
  ADD CONSTRAINT `Course_Num_Foreign` FOREIGN KEY (`Course_Num`) REFERENCES `Course` (`Course_Num`),
  ADD CONSTRAINT `Section_Prof_Ssn_Num` FOREIGN KEY (`Prof_SSN`) REFERENCES `Proessor_Interface` (`Prof_SSN`) ON DELETE CASCADE ON UPDATE CASCADE;
  
--
-- Constraints for table `Student`
--
ALTER TABLE `Student_Interface`
  ADD CONSTRAINT `Dept_Major_Foreign` FOREIGN KEY (`Major`) REFERENCES `Department` (`Depart_Number`);

--
-- Constraints for table `Minor`
--
ALTER TABLE `Minor`
  ADD CONSTRAINT `Dept_Minor_Foreign` FOREIGN KEY (`Minor_Dept`) REFERENCES `Department` (`Depart_Number`),
  ADD CONSTRAINT `Minor_CWID` FOREIGN KEY (`Student_CWID`) REFERENCES `Student_Interface` (`Student_CWID`) ON DELETE CASCADE ON UPDATE CASCADE,
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
