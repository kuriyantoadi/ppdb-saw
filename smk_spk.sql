-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 20, 2023 at 02:57 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smk_spk`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Id_Admin` int(11) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Jabatan` varchar(30) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Id_Admin`, `Nama`, `Jabatan`, `Username`, `Password`) VALUES
(1, 'admin', 'Admin', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997'),
(2, 'Bocilz', 'Anggota', 'anggota', 'c6e020a78c7d58fcd5a7dc0c7bef5fe2a39d0f04');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `Id_Jurusan` int(11) NOT NULL,
  `Nama_Jurusan` varchar(50) NOT NULL,
  `Kuota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`Id_Jurusan`, `Nama_Jurusan`, `Kuota`) VALUES
(1, 'TKJ', 100),
(2, 'Multimedia', 3),
(3, 'qwerty', 2),
(4, 'apa', 12),
(5, 'coba', 12),
(6, 'das', 12);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `Id_Kriteria` int(11) NOT NULL,
  `Nama_Kriteria` varchar(30) NOT NULL,
  `Bobot` double NOT NULL,
  `Keterangan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`Id_Kriteria`, `Nama_Kriteria`, `Bobot`, `Keterangan`) VALUES
(1, 'Ujian Nasional', 0.3, 'Benefit'),
(2, 'Tes Tertulis', 0.25, 'Benefit'),
(3, 'Tes Wawancara', 0.2, 'Benefit'),
(4, 'Tes Kesehatan', 0.15, 'Benefit'),
(5, 'Raport', 0.1, 'Benefit');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `Id_Nilai` int(11) NOT NULL,
  `No_Pendaftaran` varchar(6) NOT NULL,
  `C1` double NOT NULL,
  `C2` int(11) NOT NULL,
  `C3` int(11) NOT NULL,
  `C4` int(11) NOT NULL,
  `C5` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `normalisasi`
--

CREATE TABLE `normalisasi` (
  `Id_Normalisasi` int(11) NOT NULL,
  `No_Pendaftaran` varchar(6) NOT NULL,
  `C1` double NOT NULL,
  `C2` double NOT NULL,
  `C3` double NOT NULL,
  `C4` double NOT NULL,
  `C5` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `No_Pendaftaran` varchar(6) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `NISN` varchar(20) NOT NULL,
  `Id_Jurusan` int(11) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Jenis_Kelamin` varchar(1) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Alamat` varchar(50) DEFAULT NULL,
  `Asal_Sekolah` varchar(30) DEFAULT NULL,
  `Nilai_UN` double NOT NULL,
  `Nilai_Akhir` double DEFAULT NULL,
  `Ranking` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id_Admin`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`Id_Jurusan`),
  ADD UNIQUE KEY `Nama_Jurusan` (`Nama_Jurusan`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`Id_Kriteria`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`Id_Nilai`),
  ADD UNIQUE KEY `No_Pendaftaran` (`No_Pendaftaran`) USING BTREE;

--
-- Indexes for table `normalisasi`
--
ALTER TABLE `normalisasi`
  ADD PRIMARY KEY (`Id_Normalisasi`),
  ADD KEY `No_Pendaftaran` (`No_Pendaftaran`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`No_Pendaftaran`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `NISN` (`NISN`),
  ADD KEY `Id_Jurusan` (`Id_Jurusan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Id_Admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `Id_Jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `Id_Kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `Id_Nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `normalisasi`
--
ALTER TABLE `normalisasi`
  MODIFY `Id_Normalisasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`No_Pendaftaran`) REFERENCES `peserta` (`No_Pendaftaran`);

--
-- Constraints for table `normalisasi`
--
ALTER TABLE `normalisasi`
  ADD CONSTRAINT `normalisasi_ibfk_1` FOREIGN KEY (`No_Pendaftaran`) REFERENCES `peserta` (`No_Pendaftaran`);

--
-- Constraints for table `peserta`
--
ALTER TABLE `peserta`
  ADD CONSTRAINT `peserta_ibfk_1` FOREIGN KEY (`Id_Jurusan`) REFERENCES `jurusan` (`Id_Jurusan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
