-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2019 at 03:07 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `leave_request`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `raiseLeaveTotal`()
    NO SQL
BEGIN
DECLARE v_finished INTEGER DEFAULT 0;
DECLARE v_id varchar(100) DEFAULT "1";
DECLARE e_data_id CURSOR FOR SELECT LEAVETOTAL FROM tb_m_employee;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;
OPEN e_data_id;
get_Id: LOOP FETCH e_data_id INTO v_id;
IF v_finished = 1
THEN LEAVE get_Id;
END IF;
UPDATE tb_m_employee SET LEAVETOTAL = v_id+1 where LEAVETOTAL = v_id and datediff(now(), JOINDATE) < '730';
UPDATE tb_m_employee SET LEAVETOTAL = v_id+14 where LEAVETOTAL = v_id and datediff(now(), JOINDATE) > '730' and month(now()) = '1';
END LOOP get_Id;
CLOSE e_data_id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `resetLeaveTotal`()
    NO SQL
BEGIN
DECLARE v_finished INTEGER DEFAULT 0;
DECLARE v_id varchar(100) DEFAULT "1";
DECLARE e_data_id CURSOR FOR SELECT LEAVETOTAL FROM tb_m_employee;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;
OPEN e_data_id;
get_Id: LOOP FETCH e_data_id INTO v_id;
IF v_finished = 1
THEN LEAVE get_Id;
END IF;
IF v_id > 7
THEN
UPDATE tb_m_employee SET LEAVETOTAL = '7' where LEAVETOTAL = v_id and datediff(now(), JOINDATE) < '730' and month(now()) = '7';
END IF;
IF v_id > 14
THEN
UPDATE tb_m_employee SET LEAVETOTAL = '14' where LEAVETOTAL = v_id and datediff(now(), JOINDATE) > '730' and month(now()) = '1';
END IF;
END LOOP get_Id;
CLOSE e_data_id;
end$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `nextIdEmployee`() RETURNS varchar(255) CHARSET latin1
BEGIN
DECLARE idBegin varchar(255);
DECLARE nextId varchar(255);
DECLARE idCount INT;
SELECT count(id) INTO idCount FROM tb_m_Employee;
SET idCount = idCount + 1;
SELECT value INTO idBegin FROM tb_m_parameter WHERE id = 'tb_m_employee_ID_BEGIN';
SET nextId = CONCAT(idBegin,idCount);
RETURN nextId;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `nextIdJob`() RETURNS varchar(255) CHARSET latin1
BEGIN
DECLARE idBegin varchar(255);
DECLARE nextId varchar(255);
DECLARE idCount INT;
SELECT count(id) INTO idCount FROM tb_m_Job;
SET idCount = idCount + 1;
SELECT value INTO idBegin FROM tb_m_parameter WHERE id = 'tb_m_job_ID_BEGIN';
SET nextId = CONCAT(idBegin,idCount);
RETURN nextId;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `nextIdLeaveDesc`() RETURNS varchar(255) CHARSET latin1
BEGIN
DECLARE idBegin varchar(255);
DECLARE nextId varchar(255);
DECLARE idCount INT;
SELECT count(id) INTO idCount FROM tb_m_leave_desc;
SET idCount = idCount + 1;
SELECT value INTO idBegin FROM tb_m_parameter WHERE id = 'tb_m_leave_desc_ID_BEGIN';
SET nextId = CONCAT(idBegin,idCount);
RETURN nextId;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `nextIdLeaveType`() RETURNS varchar(25) CHARSET latin1
BEGIN
DECLARE idBegin varchar(255);
DECLARE nextId varchar(255);
DECLARE idCount INT;
SELECT count(id) INTO idCount FROM tb_m_leave_type;
SET idCount = idCount + 1;
SELECT value INTO idBegin FROM tb_m_parameter WHERE id = 'tb_m_leave_type_ID_BEGIN';
SET nextId = CONCAT(idBegin,idCount);
RETURN nextId;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `nextIdLeave_History`() RETURNS varchar(25) CHARSET latin1
BEGIN
DECLARE idBegin varchar(255);
DECLARE nextId varchar(255);
DECLARE idCount INT;
SELECT count(id) INTO idCount FROM tb_t_leave_history;
SET idCount = idCount + 1;
SELECT value INTO idBegin FROM tb_m_parameter WHERE id = 'tb_t_leave_history_ID_BEGIN';
SET nextId = CONCAT(idBegin,idCount);
RETURN nextId;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `nextIdMarriedStatus`() RETURNS varchar(255) CHARSET latin1
BEGIN
DECLARE idBegin varchar(255);
DECLARE nextId varchar(255);
DECLARE idCount INT;
SELECT count(id) INTO idCount FROM tb_m_married_status;
SET idCount = idCount + 1;
SELECT value INTO idBegin FROM tb_m_parameter WHERE id = 'tb_m_married_status_ID_BEGIN';
SET nextId = CONCAT(idBegin,idCount);
RETURN nextId;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `nextIdRequest`() RETURNS varchar(255) CHARSET latin1
BEGIN
DECLARE idBegin varchar(255);
DECLARE nextId varchar(255);
DECLARE idCount INT;
SELECT count(id) INTO idCount FROM tb_m_request;
SET idCount = idCount + 1;
SELECT value INTO idBegin FROM tb_m_parameter WHERE id = 'tb_m_request_ID_BEGIN';
SET nextId = CONCAT(idBegin,idCount);
RETURN nextId;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `nextIdRequest_Status`() RETURNS varchar(25) CHARSET latin1
BEGIN
DECLARE idBegin varchar(255);
DECLARE nextId varchar(255);
DECLARE idCount INT;
SELECT count(id) INTO idCount FROM tb_t_request_status;
SET idCount = idCount + 1;
SELECT value INTO idBegin FROM tb_m_parameter WHERE id = 'tb_t_request_status_ID_BEGIN';
SET nextId = CONCAT(idBegin,idCount);
RETURN nextId;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `nextIdStatus`() RETURNS varchar(255) CHARSET latin1
BEGIN
DECLARE idBegin varchar(255);
DECLARE nextId varchar(255);
DECLARE idCount INT;
SELECT count(id) INTO idCount FROM tb_m_status;
SET idCount = idCount + 1;
SELECT value INTO idBegin FROM tb_m_parameter WHERE id = 'tb_m_status_ID_BEGIN';
SET nextId = CONCAT(idBegin,idCount);
RETURN nextId;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `nextTb_m_employee`() RETURNS varchar(99) CHARSET latin1
BEGIN
DECLARE idBegin varchar(99);
DECLARE nextId varchar(99);
DECLARE idCount INT;
SELECT count(id) INTO idCount FROM tb_m_employee;
SET idCount = idCount + 1;
SELECT value INTO idBegin FROM TB_M_PARAMETER WHERE id = 'ID';
SET nextId = CONCAT(idBegin,idCount);
RETURN nextId;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_employee`
--

CREATE TABLE IF NOT EXISTS `tb_m_employee` (
  `ID` varchar(25) NOT NULL DEFAULT '0',
  `NAME` varchar(120) DEFAULT NULL,
  `GENDERTYPE` tinyint(1) DEFAULT NULL,
  `LEAVETOTAL` bigint(20) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `MARRIEDSTATUS` varchar(25) DEFAULT NULL,
  `IDMANAGER` varchar(25) DEFAULT NULL,
  `PHOTO` blob,
  `JOB` varchar(25) DEFAULT NULL,
  `JOINDATE` date NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `isActive` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_employee`
--

INSERT INTO `tb_m_employee` (`ID`, `NAME`, `GENDERTYPE`, `LEAVETOTAL`, `EMAIL`, `PASSWORD`, `MARRIEDSTATUS`, `IDMANAGER`, `PHOTO`, `JOB`, `JOINDATE`, `isDeleted`, `isActive`) VALUES
('11201', 'Alfa', 1, 14, 'asd@gmail.com', '$2a$10$dwrPe5cP9labjIro0pElBOnNPBV4g9NH09uDtlZdcse6L.nuUqhie', 'SN1', '11201', NULL, 'J4', '2014-03-01', 0, 0),
('11202', 'Beta', 0, 14, 'beta@mail.com', '$2a$10$dwrPe5cP9labjIro0pElBOnNPBV4g9NH09uDtlZdcse6L.nuUqhie', 'SN1', '11201', NULL, 'J2', '2015-03-01', 0, 0),
('11203', 'Charlie', 1, 14, 'Charlie@mail.com', '$2a$10$dwrPe5cP9labjIro0pElBOnNPBV4g9NH09uDtlZdcse6L.nuUqhie', 'SN2', '11201', NULL, 'J2', '2016-03-01', 0, 0),
('11204', 'Delta', 0, 7, 'delta@mail.com', '$2a$10$dwrPe5cP9labjIro0pElBOnNPBV4g9NH09uDtlZdcse6L.nuUqhie', 'SN1', '11202', NULL, 'J3', '2018-03-01', 0, 0),
('11205', 'Echo', 1, 7, 'echo@mail.com', '$2a$10$dwrPe5cP9labjIro0pElBOnNPBV4g9NH09uDtlZdcse6L.nuUqhie', 'SN2', '11203', NULL, 'J3', '2018-03-01', 1, 0);

--
-- Triggers `tb_m_employee`
--
DELIMITER //
CREATE TRIGGER `setIdemployee` BEFORE INSERT ON `tb_m_employee`
 FOR EACH ROW BEGIN
DECLARE getId varchar(255);
SELECT nextIdemployee() INTO getId;
SET NEW.id = getId;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_job`
--

CREATE TABLE IF NOT EXISTS `tb_m_job` (
  `ID` varchar(25) NOT NULL DEFAULT '',
  `DEPARTMENT` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_job`
--

INSERT INTO `tb_m_job` (`ID`, `DEPARTMENT`) VALUES
('J1', 'Director'),
('J2', 'Manager'),
('J3', 'Developer'),
('J4', 'Admin');

--
-- Triggers `tb_m_job`
--
DELIMITER //
CREATE TRIGGER `setIdjob` BEFORE INSERT ON `tb_m_job`
 FOR EACH ROW BEGIN
DECLARE getId varchar(255);
SELECT nextIdjob() INTO getId;
SET NEW.id = getId;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_leave_desc`
--

CREATE TABLE IF NOT EXISTS `tb_m_leave_desc` (
  `ID` varchar(25) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_leave_desc`
--

INSERT INTO `tb_m_leave_desc` (`ID`, `DESCRIPTION`) VALUES
('KC1', 'Raise every month'),
('KC2', 'Charred'),
('KC3', 'Mass leave'),
('KC4', 'Ordinary leave');

--
-- Triggers `tb_m_leave_desc`
--
DELIMITER //
CREATE TRIGGER `setIdLeave_desc` BEFORE INSERT ON `tb_m_leave_desc`
 FOR EACH ROW BEGIN
DECLARE getId varchar(255);
SELECT nextIdLeave_desc() INTO getId;
SET NEW.id = getId;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_leave_type`
--

CREATE TABLE IF NOT EXISTS `tb_m_leave_type` (
  `ID` varchar(25) NOT NULL DEFAULT '',
  `TYPE` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_leave_type`
--

INSERT INTO `tb_m_leave_type` (`ID`, `TYPE`) VALUES
('JC1', 'General'),
('JC2', 'Parent Dead'),
('JC3', 'Family Dead'),
('JC4', 'Married'),
('JC5', 'Give birth');

--
-- Triggers `tb_m_leave_type`
--
DELIMITER //
CREATE TRIGGER `setIdLeave_type` BEFORE INSERT ON `tb_m_leave_type`
 FOR EACH ROW BEGIN
DECLARE getId varchar(255);
SELECT nextIdLeave_type() INTO getId;
SET NEW.id = getId;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_libur_nasional`
--

CREATE TABLE IF NOT EXISTS `tb_m_libur_nasional` (
  `id` varchar(25) NOT NULL,
  `date` date NOT NULL,
  `keteragan` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_libur_nasional`
--

INSERT INTO `tb_m_libur_nasional` (`id`, `date`, `keteragan`) VALUES
('lb1', '2019-05-01', 'Hari Buruh'),
('lb2', '2019-05-19', 'Hari Raya Waisak'),
('lb3', '2019-05-30', 'Kenaikan Yesus Kristus'),
('lb4', '2019-06-01', 'Hari Lahir Pancasila'),
('lb5', '2019-06-03', 'Cuti Bersama'),
('lb6', '2019-06-04', 'Cuti Bersama'),
('lb7', '2019-06-05', 'Idul Fitri'),
('lb8', '2019-06-06', 'Idul Fitri'),
('lb9', '2019-06-07', 'Cuti Bersama');

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_married_status`
--

CREATE TABLE IF NOT EXISTS `tb_m_married_status` (
  `ID` varchar(25) NOT NULL DEFAULT '',
  `STATUS` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_married_status`
--

INSERT INTO `tb_m_married_status` (`ID`, `STATUS`) VALUES
('SN1', 'Not yet married'),
('SN2', 'Married');

--
-- Triggers `tb_m_married_status`
--
DELIMITER //
CREATE TRIGGER `setIdMarried_status` BEFORE INSERT ON `tb_m_married_status`
 FOR EACH ROW BEGIN
DECLARE getId varchar(255);
SELECT nextIdMarried_status() INTO getId;
SET NEW.id = getId;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_parameter`
--

CREATE TABLE IF NOT EXISTS `tb_m_parameter` (
  `ID` varchar(255) NOT NULL DEFAULT '',
  `VALUE` varchar(80) DEFAULT NULL,
  `DESCRIPTION` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_parameter`
--

INSERT INTO `tb_m_parameter` (`ID`, `VALUE`, `DESCRIPTION`) VALUES
('JATAH_CUTI_SEBULAN', '1', 'jumlah cuti yang didapat setiap bulan'),
('MAX_CUTI', '5', 'maksimal jumlah cuti yang dapat diambil secara berurutan'),
('tb_m_employee_ID_BEGIN', '', 'code awalan dari id'),
('tb_m_employee_TABLE_NAME', 'tb_m_employee', 'nama table'),
('tb_m_job_ID_BEGIN', 'J', 'code awalan dari id'),
('tb_m_job_TABLE_NAME', 'tb_m_job', 'nama table'),
('tb_m_leave_desc_ID_BEGIN', 'KC', 'code awalan dari id'),
('tb_m_leave_desc_TABLE_NAME', 'tb_m_leave_desc', 'nama table'),
('tb_m_leave_type_ID_BEGIN', 'JC', 'code awalan dari id'),
('tb_m_leave_type_TABLE_NAME', 'tb_m_leave_type', 'nama table'),
('tb_m_married_tb_m_status_ID_BEGIN', 'SN', 'code awalan dari id'),
('tb_m_married_tb_m_status_TABLE_NAME', 'tb_m_married_tb_m_status', 'nama table'),
('tb_m_request_ID_BEGIN', 'P', 'code awalan dari id'),
('tb_m_request_TABLE_NAME', 'tb_m_request', 'nama table'),
('tb_m_status_ID_BEGIN', 'S', 'code awalan dari id'),
('tb_m_status_TABLE_NAME', 'tb_m_status', 'nama table'),
('tb_t_leave_history_ID_BEGIN', 'RC', 'code awalan dari id'),
('tb_t_leave_history_TABLE_NAME', 'tb_t_leave_history', 'nama table'),
('tb_t_request_status_ID_BEGIN', 'SP', 'code awalan dari id'),
('tb_t_request_status_TABLE_NAME', 'tb_t_request_status', 'nama table');

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_request`
--

CREATE TABLE IF NOT EXISTS `tb_m_request` (
  `ID` varchar(25) NOT NULL DEFAULT '',
  `STARTDATE` date DEFAULT NULL,
  `ENDDATE` date DEFAULT NULL,
  `TOTAL` bigint(20) DEFAULT NULL,
  `EMPLOYEE` varchar(25) DEFAULT NULL,
  `LEAVETYPE` varchar(25) DEFAULT NULL,
  `STATUS` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_request`
--

INSERT INTO `tb_m_request` (`ID`, `STARTDATE`, `ENDDATE`, `TOTAL`, `EMPLOYEE`, `LEAVETYPE`, `STATUS`) VALUES
('P1', '2018-03-19', '2018-03-19', 99, '11201', 'JC1', 'Reject'),
('P2', '2019-02-25', '2019-02-25', 1, '11205', 'JC1', 'Tidak dipakai'),
('P3', '0010-09-09', '0012-09-08', 2, '11201', 'JC1', 'Tidak dipakai'),
('P4', '0034-09-09', '0008-10-09', 4, '11205', 'JC1', 'Tidak dipakai'),
('P5', '0009-09-09', '0011-09-09', 2, '11201', 'JC1', 'Tidak dipakai');

--
-- Triggers `tb_m_request`
--
DELIMITER //
CREATE TRIGGER `setIdrequest` BEFORE INSERT ON `tb_m_request`
 FOR EACH ROW BEGIN
DECLARE getId varchar(255);
SELECT nextIdrequest() INTO getId;
SET NEW.id = getId;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_status`
--

CREATE TABLE IF NOT EXISTS `tb_m_status` (
  `ID` varchar(25) NOT NULL DEFAULT '',
  `TYPE` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_status`
--

INSERT INTO `tb_m_status` (`ID`, `TYPE`) VALUES
('S1', 'Onproses'),
('S2', 'Accept'),
('S3', 'Reject'),
('S4', 'Cancelled');

--
-- Triggers `tb_m_status`
--
DELIMITER //
CREATE TRIGGER `setIdstatus` BEFORE INSERT ON `tb_m_status`
 FOR EACH ROW BEGIN
DECLARE getId varchar(255);
SELECT nextIdstatus() INTO getId;
SET NEW.id = getId;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_t_leave_history`
--

CREATE TABLE IF NOT EXISTS `tb_t_leave_history` (
  `ID` varchar(25) NOT NULL DEFAULT '',
  `DATETIME` date DEFAULT NULL,
  `TOTAL` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(25) DEFAULT NULL,
  `EMPLOYEE` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_t_leave_history`
--

INSERT INTO `tb_t_leave_history` (`ID`, `DATETIME`, `TOTAL`, `DESCRIPTION`, `EMPLOYEE`) VALUES
('RC1', '2018-07-01', 2, 'KC2', '11201'),
('RC10', '2018-08-01', 1, 'KC1', '11203'),
('RC11', '2018-08-01', 1, 'KC1', '11204'),
('RC12', '2018-09-01', 1, 'KC1', '11201'),
('RC13', '2018-09-01', 1, 'KC1', '11202'),
('RC14', '2018-09-01', 1, 'KC1', '11203'),
('RC15', '2018-09-01', 1, 'KC1', '11204'),
('RC16', '2018-10-01', 1, 'KC1', '11201'),
('RC17', '2018-10-01', 1, 'KC1', '11202'),
('RC18', '2018-10-01', 1, 'KC1', '11203'),
('RC19', '2018-10-01', 1, 'KC1', '11204'),
('RC2', '2018-07-01', 3, 'KC2', '11202'),
('RC20', '2018-11-01', 1, 'KC1', '11201'),
('RC21', '2018-11-01', 1, 'KC1', '11202'),
('RC22', '2018-11-01', 1, 'KC1', '11203'),
('RC23', '2018-11-01', 1, 'KC1', '11204'),
('RC24', '2018-11-01', 1, 'KC1', '11205'),
('RC25', '2018-12-01', 1, 'KC1', '11201'),
('RC26', '2018-12-01', 1, 'KC1', '11202'),
('RC27', '2018-12-01', 1, 'KC1', '11203'),
('RC28', '2018-12-01', 1, 'KC1', '11204'),
('RC29', '2018-12-01', 1, 'KC1', '11205'),
('RC3', '2018-07-01', 4, 'KC2', '11203'),
('RC30', '2018-12-26', 5, 'KC4', '11201'),
('RC31', '2018-12-26', 4, 'KC4', '11202'),
('RC32', '2018-12-26', 4, 'KC4', '11203'),
('RC33', '2018-12-26', 3, 'KC4', '11204'),
('RC34', '2019-01-01', 1, 'KC1', '11201'),
('RC35', '2019-01-01', 1, 'KC1', '11202'),
('RC36', '2019-01-01', 1, 'KC1', '11203'),
('RC37', '2019-01-01', 1, 'KC1', '11204'),
('RC38', '2019-01-01', 1, 'KC1', '11205'),
('RC39', '2019-02-01', 1, 'KC1', '11201'),
('RC4', '2018-07-01', 1, 'KC1', '11201'),
('RC40', '2019-02-01', 1, 'KC1', '11202'),
('RC41', '2019-02-01', 1, 'KC1', '11203'),
('RC42', '2019-02-01', 1, 'KC1', '11204'),
('RC43', '2019-02-01', 1, 'KC1', '11205'),
('RC44', '2019-03-16', 2, 'KC4', '11201'),
('RC5', '2018-07-01', 1, 'KC1', '11202');

--
-- Triggers `tb_t_leave_history`
--
DELIMITER //
CREATE TRIGGER `setIdleave_history` BEFORE INSERT ON `tb_t_leave_history`
 FOR EACH ROW BEGIN
DECLARE getId varchar(255);
SELECT nextIdleave_history() INTO getId;
SET NEW.id = getId;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_t_request_status`
--

CREATE TABLE IF NOT EXISTS `tb_t_request_status` (
  `ID` varchar(25) NOT NULL DEFAULT '',
  `DATETIME` date DEFAULT NULL,
  `DESCRIPTION` varchar(80) DEFAULT NULL,
  `REQUEST` varchar(25) DEFAULT NULL,
  `STATUS` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_t_request_status`
--

INSERT INTO `tb_t_request_status` (`ID`, `DATETIME`, `DESCRIPTION`, `REQUEST`, `STATUS`) VALUES
('SP1', '2019-02-14', '', 'P1', 'S1'),
('SP2', '2019-02-15', 'Kantor sedang sibuk', 'P1', 'S3'),
('SP3', '2019-02-14', '', 'P2', 'S1'),
('SP4', '2019-03-17', '', 'P2', 'S1'),
('SP5', '2019-03-18', '', 'P3', 'S1'),
('SP6', '2019-03-18', '', 'P4', 'S1'),
('SP7', '2019-03-18', '', 'P5', 'S1');

--
-- Triggers `tb_t_request_status`
--
DELIMITER //
CREATE TRIGGER `setIdrequest_status` BEFORE INSERT ON `tb_t_request_status`
 FOR EACH ROW BEGIN
DECLARE getId varchar(255);
SELECT nextIdrequest_status() INTO getId;
SET NEW.id = getId;
END
//
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_m_employee`
--
ALTER TABLE `tb_m_employee`
 ADD PRIMARY KEY (`ID`), ADD KEY `MARRIEDSTATUS` (`MARRIEDSTATUS`), ADD KEY `IDMANAGER` (`IDMANAGER`), ADD KEY `JOB` (`JOB`);

--
-- Indexes for table `tb_m_job`
--
ALTER TABLE `tb_m_job`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tb_m_leave_desc`
--
ALTER TABLE `tb_m_leave_desc`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tb_m_leave_type`
--
ALTER TABLE `tb_m_leave_type`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tb_m_libur_nasional`
--
ALTER TABLE `tb_m_libur_nasional`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_m_married_status`
--
ALTER TABLE `tb_m_married_status`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tb_m_parameter`
--
ALTER TABLE `tb_m_parameter`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tb_m_request`
--
ALTER TABLE `tb_m_request`
 ADD PRIMARY KEY (`ID`), ADD KEY `EMPLOYEE` (`EMPLOYEE`), ADD KEY `LEAVETYPE` (`LEAVETYPE`);

--
-- Indexes for table `tb_m_status`
--
ALTER TABLE `tb_m_status`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tb_t_leave_history`
--
ALTER TABLE `tb_t_leave_history`
 ADD PRIMARY KEY (`ID`), ADD KEY `DESCRIPTION` (`DESCRIPTION`), ADD KEY `EMPLOYEE` (`EMPLOYEE`);

--
-- Indexes for table `tb_t_request_status`
--
ALTER TABLE `tb_t_request_status`
 ADD PRIMARY KEY (`ID`), ADD KEY `REQUEST` (`REQUEST`), ADD KEY `STATUS` (`STATUS`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_m_employee`
--
ALTER TABLE `tb_m_employee`
ADD CONSTRAINT `tb_m_employee_ibfk_1` FOREIGN KEY (`MARRIEDSTATUS`) REFERENCES `tb_m_married_status` (`ID`),
ADD CONSTRAINT `tb_m_employee_ibfk_2` FOREIGN KEY (`IDMANAGER`) REFERENCES `tb_m_employee` (`ID`),
ADD CONSTRAINT `tb_m_employee_ibfk_3` FOREIGN KEY (`JOB`) REFERENCES `tb_m_job` (`ID`);

--
-- Constraints for table `tb_m_request`
--
ALTER TABLE `tb_m_request`
ADD CONSTRAINT `tb_m_request_ibfk_1` FOREIGN KEY (`EMPLOYEE`) REFERENCES `tb_m_employee` (`ID`),
ADD CONSTRAINT `tb_m_request_ibfk_2` FOREIGN KEY (`LEAVETYPE`) REFERENCES `tb_m_leave_type` (`ID`);

--
-- Constraints for table `tb_t_leave_history`
--
ALTER TABLE `tb_t_leave_history`
ADD CONSTRAINT `tb_t_leave_history_ibfk_1` FOREIGN KEY (`DESCRIPTION`) REFERENCES `tb_m_leave_desc` (`ID`),
ADD CONSTRAINT `tb_t_leave_history_ibfk_2` FOREIGN KEY (`EMPLOYEE`) REFERENCES `tb_m_employee` (`ID`);

--
-- Constraints for table `tb_t_request_status`
--
ALTER TABLE `tb_t_request_status`
ADD CONSTRAINT `tb_t_request_status_ibfk_1` FOREIGN KEY (`REQUEST`) REFERENCES `tb_m_request` (`ID`),
ADD CONSTRAINT `tb_t_request_status_ibfk_2` FOREIGN KEY (`STATUS`) REFERENCES `tb_m_status` (`ID`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `resetLeaveTotalPermanent` ON SCHEDULE EVERY 1 MONTH STARTS '2019-01-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO CALL resetLeaveTotal()$$

CREATE DEFINER=`root`@`localhost` EVENT `raiseLeaveTotal` ON SCHEDULE EVERY 1 MONTH STARTS '2019-01-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO CALL raiseLeaveTotal()$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
