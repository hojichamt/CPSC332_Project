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
-- Table structure for table `Professor_Interface`
--

CREATE TABLE `Professor_Interface` (
  `Prof_SSN` int(9) NOT NULL,
  `Prof_Name` text NOT NULL,
  `Street_Address` text NOT NULL,
  `City` text NOT NULL,
  `State` text NOT NULL,
  `Zip_Code` int(5) NOT NULL,
  `Area_Codaze` int(3) NOT NULL,
  `7_digit_num` int(7) NOT NULL,
  `Sex` text NOT NULL,
  `Title` text NOT NULL,
  `Salary` bigint(255) NOT NULL,
  PRIMARY KEY (`Prof_SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `College_Degree`
--

CREATE TABLE `College_Degree` (
  `Degree` varchar(50) NOT NULL,
  `Prof_SSN` int(9) NOT NULL,
  PRIMARY KEY (`Degree`, `Prof_SSN`),
  FOREIGN KEY (`Prof_SSN`)
    REFERENCES `Professor_Interface` (`Prof_SSN`)
    ON UPDATE RESTRICT ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `Depart_Number` int(1) NOT NULL,
  `Depart_Name` varchar(500) NOT NULL,
  `Telephone` varchar(10) NOT NULL,
  `Location_Office` varchar(500) NOT NULL,
  `Chair_Person` int(9) NOT NULL,
  PRIMARY KEY (`Depart_Number`),
  FOREIGN KEY (`Chair_Person`)
    REFERENCES `Professor_Interface` (`Prof_SSN`)
    ON UPDATE RESTRICT ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `Course_Num` varchar(8) NOT NULL,
  `Course_Title` text NOT NULL,
  `Textbook` text NOT NULL,
  `Units` int(1) NOT NULL,
  `Depart_Num` int(1) NOT NULL,
  PRIMARY KEY (`Course_Num`, `Depart_Num`),
  FOREIGN KEY (`Depart_Num`)
    REFERENCES `Department` (`Depart_Number`)
    ON UPDATE RESTRICT ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Prereqs`
--

CREATE TABLE `Prereqs` (
  `Prereq_Course` varchar(8) NOT NULL,
  `Course_Num` varchar(8) NOT NULL,
  PRIMARY KEY (`Prereq_Course`, `Course_Num`),
  FOREIGN KEY (`Course_Num`)
    REFERENCES `Course` (`Course_Num`)
    ON UPDATE RESTRICT ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `Prof_SSN` int(9) NOT NULL,
  PRIMARY KEY (`Section_Num`, `Course_Num`),
  FOREIGN KEY (`Course_Num`)
    REFERENCES `Course` (`Course_Num`)
    ON UPDATE RESTRICT ON DELETE CASCADE,
  FOREIGN KEY (`Prof_SSN`)
    REFERENCES `Professor_Interface` (`Prof_SSN`)
    ON UPDATE RESTRICT ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `Major` int(1) NOT NULL,
  PRIMARY KEY (`Student_CWID`),
  FOREIGN KEY (`Major`)
    REFERENCES `Department` (`Depart_Number`)
    ON UPDATE RESTRICT ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Enrollment_Records`
--

CREATE TABLE `Enrollment_Records` (
  `Grade` varchar(2) NOT NULL,
  `Student_CWID` int(8) NOT NULL,
  `Section_Num` int(2) NOT NULL,
  PRIMARY KEY (`Grade`, `Student_CWID`, `Section_Num`),
  FOREIGN KEY (`Student_CWID`)
    REFERENCES `Student_Interface` (`Student_CWID`)
    ON UPDATE RESTRICT ON DELETE CASCADE,
  FOREIGN KEY (`Section_Num`)
    REFERENCES `Section` (`Section_Num`)
    ON UPDATE RESTRICT ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Minor`
--

CREATE TABLE `Minor` (
  `Minor_Dept` int(1) NOT NULL,
  `Student_CWID` int(8) NOT NULL,
  PRIMARY KEY (`Minor_Dept`, `Student_CWID`),
  FOREIGN KEY (`Minor_Dept`)
    REFERENCES `Department` (`Depart_Number`)
    ON UPDATE RESTRICT ON DELETE CASCADE,
  FOREIGN KEY (`Student_CWID`)
    REFERENCES `Student_Interface` (`Student_CWID`)
    ON UPDATE RESTRICT ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Dumping data for table `Professor_Interface`
--

INSERT INTO `Professor_Interface` (`Prof_SSN`, `Prof_Name`, `Street_Address`, `City`, `State`, `Zip_Code`, `Area_Code`, `7_digit_num`, `Sex`, `Title`, `Salary`) VALUES
(331443245, 'Galileo', '1564 Pisa Ln', 'Los Angeles', 'CA', 90082, 626, 2003425, 'M', 'Dr.', 81642),
(832871234, 'Isaac','3484 Woolsthorpe Manor Blvd', 'Anaheim', 'CA', 92831, 562, 2912077, 'M', 'Dr.', 311727),
(889983245, 'Ella', '1917 Beverly Blvd', 'Beverly Hills', 'CA', 93823, 626, 3782902, 'F', 'Mrs.', 151996);

-- --------------------------------------------------------

--
-- Dumping data for table `College_Degree`
--

INSERT INTO `College_Degree` (`Degree`, `Prof_SSN`) VALUES
('Physics', 331443245),
('Mathematics', 832871234),
('Music', 889983245);

-- --------------------------------------------------------

--
-- Dumping data for table `Department`
--

INSERT INTO `Department` (`Depart_Number`, `Depart_Name`, `Telephone`, `Location_Office`, `Chair_Person`) VALUES
(1, 'Mathematics', '6267885463', 'MH510', 832871234),
(2, 'Arts & Music', '6267354466','CPAC220', 889983245);

-- --------------------------------------------------------

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`Course_Num`, `Course_Title`, `Textbook`, `Units`, `Depart_Num`) VALUES
('ART101', 'ART 101 - INTRODUCTION TO ART', 'Art is Cool', 2, 2),
('CPSC332', 'CPSC 332 File Structure and Database System', 'Fundamentals of Database Systems', 3, 1),
('CPSC333', 'CPSC 333 Processor and Graphics Card Functionality ', 'How to Build a Processor and Graphics Card', 3, 1),
('MATH102', 'MATH 102 Intro to Linear Algebra', 'Linear Algebra: Nothing Like Algebra', 3, 1),
('MUSC243', 'MUSC 243 Intro to Jazz Composition', 'You Like Jazz: Intro to Jazz', 2, 1),
('PHYS103', 'PHYS 103 Quantum Relativity', 'Quantum Relativity: How to understand it', 3, 1);

-- --------------------------------------------------------

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
-- Dumping data for table `Student_Interface`
--

INSERT INTO `Student_Interface` (`Student_CWID`, `First_Name`, `Last_Name`, `Address`, `Telephone`, `Major`) VALUES
(99883423, 'Amelia ', 'Earhart', '91 Newbridge Street Los Angeles, CA 90042', '2132008273', 1),
(99887455, 'Marie', 'Curie', '30 N. Greenrose Dr. Chino, CA 91710', '4063570373', 1),
(99888302, 'Louis', 'Armstrong', '7025 Cherry Lane Rancho Cucamonga, CA 91730', '9099890158', 1),
(99888390, 'Albert', 'Einstein', '9791 S. Illinois Street Anaheim, CA 92804', '5622177528', 2),
(99888399, 'Stephen ', 'Hawking', '8901 Gregory St. Los Angeles, CA 90019', '2132156645', 2),
(889900429, 'Luis', 'Valle', '261 Santa Clara Lane Ontario, CA 91761', '3152331426', 1),
(889902934, 'Juan', 'Cisneros', '728 Center St. Los Angeles, CA 90034', '2132014509', 2),
(889907525, 'Tiffany', 'Trinh', '203 Devon Lane Los Angeles, CA 90063', '2132168285', 1);

-- --------------------------------------------------------

--
-- Dumping data for table `Enrollment_Records`
--

INSERT INTO `Enrollment_Records` (`Grade`, `Student_CWID`, `Section_Num`) VALUES
('A-', 99883423, 12),
('B+', 99883423, 22),
('C+', 99883423, 37),
('A+', 99887455, 43),
('A+', 99887455, 22),
('A+', 99887455, 37),
('A+', 99888302, 12),
('C+', 99888302, 22),
('A+', 99888302, 72),
('B', 99888390, 43),
('C+', 99888390, 22),
('C', 99888390, 37),
('A-', 99888399, 43),
('A+', 99888399, 22),
('A+', 99888399, 37),
('B+', 889900429, 12),
('A', 889900429, 43),
('A-', 889900429, 22),
('B', 889900429, 37),
('A', 889902934, 43),
('A-', 889902934, 51),
('A', 889902934, 22),
('A+', 889902934, 72),
('A+', 889907525, 43),
('A', 889907525, 22),
('A-', 889907525, 72),
('A', 889907525, 37);

-- --------------------------------------------------------

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

COMMIT;
-- I don't know if you need this line above ^^

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
