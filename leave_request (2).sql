-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2019 at 10:45 AM
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllDATA`()
    NO SQL
BEGIN
DECLARE idEmp varchar(25);
DECLARE ltEmp varchar(25);
DECLARE v_finished INTEGER DEFAULT 0;
DECLARE v_id varchar(100) DEFAULT "1";
DECLARE e_data_id CURSOR FOR SELECT ID FROM tb_m_employee;
DECLARE e_data_lt CURSOR FOR SELECT LEAVETOTAL FROM tb_m_employee;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;
OPEN e_data_id;
get_Id: LOOP FETCH e_data_id INTO v_id;
IF v_finished = 1
THEN LEAVE get_Id;
END IF;
UPDATE tb_m_employee SET LEAVETOTAL = '99' where ID = v_id;
END LOOP get_Id;
CLOSE e_data_id;
end$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `getdatacuti`(`idemp` VARCHAR(255)) RETURNS varchar(255) CHARSET latin1
BEGIN
DECLARE temp bigint(255);
select LEAVETOTAL into temp from tb_m_employee where ID = idemp;
RETURN temp;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `nextIdELeaveType`() RETURNS varchar(255) CHARSET latin1
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

CREATE DEFINER=`root`@`localhost` FUNCTION `nextIdLeaveHistory`() RETURNS varchar(255) CHARSET latin1
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

CREATE DEFINER=`root`@`localhost` FUNCTION `nextIdRequestStatus`() RETURNS varchar(255) CHARSET latin1
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

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_employee`
--

CREATE TABLE IF NOT EXISTS `tb_m_employee` (
  `ID` varchar(25) NOT NULL DEFAULT '0',
  `NAME` varchar(255) DEFAULT NULL,
  `GENDERTYPE` varchar(255) DEFAULT NULL,
  `LEAVETOTAL` bigint(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `MARRIEDSTATUS` varchar(255) DEFAULT NULL,
  `IDMANAGER` varchar(255) DEFAULT NULL,
  `PHOTO` blob,
  `JOB` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_employee`
--

INSERT INTO `tb_m_employee` (`ID`, `NAME`, `GENDERTYPE`, `LEAVETOTAL`, `EMAIL`, `PASSWORD`, `MARRIEDSTATUS`, `IDMANAGER`, `PHOTO`, `JOB`) VALUES
('11201', 'Alfa', 'Pria', 99, 'asd@gmail.com', '$2a$10$dwrPe5cP9labjIro0pElBOnNPBV4g9NH09uDtlZdcse6L.nuUqhie', 'SN1', '11201', NULL, 'J1'),
('11202', 'Beta', 'Wanita', 99, 'beta@mail.com', '22222', 'SN1', '11201', NULL, 'J2'),
('11203', 'Charlie', 'Pria', 99, 'Charlie@mail.com', '33333', 'SN2', '11201', NULL, 'J2'),
('11204', 'Delta', 'Wanita', 99, 'delta@mail.com', '44444', 'SN1', '11202', NULL, 'J3'),
('11205', 'Echo', 'Pria', 99, 'echo@mail.com', '55555', 'SN2', '11203', NULL, 'J3');

--
-- Triggers `tb_m_employee`
--
DELIMITER //
CREATE TRIGGER `setIdEmployee` BEFORE INSERT ON `tb_m_employee`
 FOR EACH ROW BEGIN
DECLARE getId varchar(255);
SELECT nextIdEmployee() INTO getId;
SET NEW.id = getId;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_job`
--

CREATE TABLE IF NOT EXISTS `tb_m_job` (
  `ID` varchar(255) NOT NULL DEFAULT '',
  `DEPARTMENT` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_job`
--

INSERT INTO `tb_m_job` (`ID`, `DEPARTMENT`) VALUES
('J1', 'Direktur'),
('J2', 'Manager'),
('J3', 'Developer');

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_leave_desc`
--

CREATE TABLE IF NOT EXISTS `tb_m_leave_desc` (
  `ID` varchar(255) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_leave_desc`
--

INSERT INTO `tb_m_leave_desc` (`ID`, `DESCRIPTION`) VALUES
('KC1', 'Tambah Perbulan'),
('KC2', 'Hangus'),
('KC3', 'Cuti Bersama'),
('KC4', 'Cuti Biasa');

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_leave_type`
--

CREATE TABLE IF NOT EXISTS `tb_m_leave_type` (
  `ID` varchar(255) NOT NULL DEFAULT '',
  `TYPE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_leave_type`
--

INSERT INTO `tb_m_leave_type` (`ID`, `TYPE`) VALUES
('JC1', 'Umum'),
('JC2', 'Orang tua meninggal'),
('JC3', 'Keluarga meninggal'),
('JC4', 'Menikah'),
('JC5', 'Melahirkan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_married_status`
--

CREATE TABLE IF NOT EXISTS `tb_m_married_status` (
  `ID` varchar(255) NOT NULL DEFAULT '',
  `STATUS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_married_status`
--

INSERT INTO `tb_m_married_status` (`ID`, `STATUS`) VALUES
('SN1', 'Belum menikah'),
('SN2', 'Menikah');

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_parameter`
--

CREATE TABLE IF NOT EXISTS `tb_m_parameter` (
  `ID` varchar(255) NOT NULL DEFAULT '',
  `VALUE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_parameter`
--

INSERT INTO `tb_m_parameter` (`ID`, `VALUE`, `DESCRIPTION`) VALUES
('JATAH_CUTI_SEBULAN', '1', 'jumlah cuti yang didapat setiap bulan'),
('MAX_CUTI', '5', 'maksimal jumlah cuti yang dapat diambil secara berurutan'),
('tb_m_employee_ID_BEGIN', '1120', 'code awalan dari id'),
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
('tb_t_request_tb_m_status_ID_BEGIN', 'SP', 'code awalan dari id'),
('tb_t_request_tb_m_status_TABLE_NAME', 'tb_t_request_tb_m_status', 'nama table');

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_request`
--

CREATE TABLE IF NOT EXISTS `tb_m_request` (
  `ID` varchar(255) NOT NULL DEFAULT '',
  `STARTDATE` date DEFAULT NULL,
  `ENDDATE` date DEFAULT NULL,
  `TOTAL` bigint(255) DEFAULT NULL,
  `EMPLOYEE` varchar(255) DEFAULT NULL,
  `LEAVETYPE` varchar(255) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_request`
--

INSERT INTO `tb_m_request` (`ID`, `STARTDATE`, `ENDDATE`, `TOTAL`, `EMPLOYEE`, `LEAVETYPE`, `STATUS`) VALUES
('P1', '2019-03-05', '2019-03-20', 15, '11201', 'JC1', 'asdasd'),
('P2', '2019-02-25', '2019-02-25', 1, '11204', 'JC1', 'DITERIMA');

-- --------------------------------------------------------

--
-- Table structure for table `tb_m_status`
--

CREATE TABLE IF NOT EXISTS `tb_m_status` (
  `ID` varchar(255) NOT NULL DEFAULT '',
  `TYPE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_m_status`
--

INSERT INTO `tb_m_status` (`ID`, `TYPE`) VALUES
('S1', 'Diproses'),
('S2', 'Diterima'),
('S3', 'Ditolak'),
('S4', 'Dibatalkan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_t_leave_history`
--

CREATE TABLE IF NOT EXISTS `tb_t_leave_history` (
  `ID` varchar(255) NOT NULL DEFAULT '',
  `DATETIME` date DEFAULT NULL,
  `TOTAL` bigint(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `EMPLOYEE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_t_leave_history`
--

INSERT INTO `tb_t_leave_history` (`ID`, `DATETIME`, `TOTAL`, `DESCRIPTION`, `EMPLOYEE`) VALUES
('RC1', '2018-07-01', 1, 'KC2', '11201'),
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
('RC5', '2018-07-01', 1, 'KC1', '11202'),
('RC6', '2018-07-01', 1, 'KC1', '11203'),
('RC7', '2018-07-01', 1, 'KC1', '11204'),
('RC8', '2018-08-01', 1, 'KC1', '11201'),
('RC9', '2018-08-01', 1, 'KC1', '11202');

-- --------------------------------------------------------

--
-- Table structure for table `tb_t_request_status`
--

CREATE TABLE IF NOT EXISTS `tb_t_request_status` (
  `ID` varchar(255) NOT NULL DEFAULT '',
  `DATETIME` date DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `REQUEST` varchar(255) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_t_request_status`
--

INSERT INTO `tb_t_request_status` (`ID`, `DATETIME`, `DESCRIPTION`, `REQUEST`, `STATUS`) VALUES
('SP1', '2019-02-14', '', 'P1', 'S1'),
('SP2', '2019-02-15', 'Kantor sedang sibuk', 'P1', 'S3'),
('SP3', '2019-02-14', '', 'P2', 'S1');

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
