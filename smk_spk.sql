-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jan 2019 pada 01.52
-- Versi server: 10.1.31-MariaDB
-- Versi PHP: 5.6.35

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
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `Id_Admin` int(11) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Jabatan` varchar(30) NOT NULL,
  `Username` varchar(15) NOT NULL,
  `Password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`Id_Admin`, `Nama`, `Jabatan`, `Username`, `Password`) VALUES
(1, 'Moh Rizal Bayu Saputro', 'Admin', 'admin', '1234'),
(2, 'Bocilz', 'Anggota', 'anggota', '1234');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `Id_Jurusan` int(11) NOT NULL,
  `Nama_Jurusan` varchar(50) NOT NULL,
  `Kuota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jurusan`
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
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `Id_Kriteria` int(11) NOT NULL,
  `Nama_Kriteria` varchar(30) NOT NULL,
  `Bobot` double NOT NULL,
  `Keterangan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`Id_Kriteria`, `Nama_Kriteria`, `Bobot`, `Keterangan`) VALUES
(1, 'Ujian Nasional', 0.3, 'Benefit'),
(2, 'Tes Tertulis', 0.25, 'Benefit'),
(3, 'Tes Wawancara', 0.2, 'Benefit'),
(4, 'Tes Kesehatan', 0.15, 'Benefit'),
(5, 'Raport', 0.1, 'Benefit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
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

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`Id_Nilai`, `No_Pendaftaran`, `C1`, `C2`, `C3`, `C4`, `C5`) VALUES
(1, 'S-0001', 32.5, 87, 75, 80, 60),
(2, 'S-0002', 32.21, 65, 98, 50, 80),
(3, 'S-0003', 33.68, 82, 80, 60, 80),
(4, 'S-0004', 34.25, 85, 90, 60, 75),
(5, 'S-0005', 36.5, 86, 60, 90, 50),
(6, 'S-0006', 34.21, 78, 69, 79, 88),
(7, 'S-0007', 35.21, 85, 60, 60, 75),
(30, 'S-0008', 21.32, 76, 86, 49, 70),
(31, 'S-0009', 23.21, 50, 60, 70, 60),
(32, 'S-0010', 32.4, 0, 0, 0, 0),
(33, 'S-0011', 23.12, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `normalisasi`
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

--
-- Dumping data untuk tabel `normalisasi`
--

INSERT INTO `normalisasi` (`Id_Normalisasi`, `No_Pendaftaran`, `C1`, `C2`, `C3`, `C4`, `C5`) VALUES
(1, 'S-0001', 0.890411, 1, 0.833333, 0.888889, 0.75),
(2, 'S-0002', 0.914797, 0.764706, 1, 0.632911, 0.909091),
(3, 'S-0003', 0.92274, 0.942529, 0.888889, 0.666667, 1),
(4, 'S-0004', 0.938356, 0.977011, 1, 0.666667, 0.9375),
(5, 'S-0005', 1, 0.988506, 0.666667, 1, 0.625),
(6, 'S-0006', 0.971599, 0.917647, 0.704082, 1, 1),
(7, 'S-0007', 1, 1, 0.612245, 0.759494, 0.852273),
(30, 'S-0008', 0.60551, 0.894118, 0.877551, 0.620253, 0.795455),
(31, 'S-0009', 0.659188, 0.588235, 0.612245, 0.886076, 0.681818),
(32, 'S-0010', 0, 0, 0, 0, 0),
(33, 'S-0011', 0.656632, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peserta`
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
-- Dumping data untuk tabel `peserta`
--

INSERT INTO `peserta` (`No_Pendaftaran`, `Email`, `Password`, `NISN`, `Id_Jurusan`, `Nama`, `Jenis_Kelamin`, `Tanggal_Lahir`, `Alamat`, `Asal_Sekolah`, `Nilai_UN`, `Nilai_Akhir`, `Ranking`) VALUES
('S-0001', 'rizalbayu@gmail.com', '1234', '2109721', 1, 'Rizal Bayu', 'L', '1998-07-20', 'Slawi', 'SMP N 1 Adiwerna', 32.5, 0.892123, NULL),
('S-0002', 'coba@gmail.com', '1234', '32134', 2, 'Nama Cewek', 'P', '2018-12-11', 'sini', 'Stuna', 32.21, 0.851461, 2),
('S-0003', 'aku@gmail.com', '1234', '7821312', 1, 'Dede Agus', 'L', '1999-01-01', 'Sana', 'Stuna', 33.68, 0.890232, NULL),
('S-0004', 'cihuy@gmail.com', '1234', '789', 1, 'Reza Agung', 'P', '2018-12-11', 'Kedung Sukun', 'Spenda', 34.25, 0.91951, NULL),
('S-0005', 'Kamal@gmail.com', '1234', '345', 1, 'Kamal Ardi', 'L', '2018-12-07', 'Slarang', 'MTS 1', 36.5, 0.89296, NULL),
('S-0006', '1@gmil.com', '1234', '84921', 2, 'dono', 'L', '2018-12-14', 'sini', 'sana', 34.21, 0.911708, NULL),
('S-0007', '2@gmail.com', '1234', '4123', 2, 'weh', 'L', '2018-12-04', 'sono', 'sini', 35.21, 0.8716, NULL),
('S-0008', '1@gmail.com', '1234', '211', 2, 'qwerty', 'P', '2018-12-13', 'qwerty', 'qwerty', 21.32, 0.753276, NULL),
('S-0009', '3123@dsa.com', '1234', '312', 2, 'qwert', 'L', '2018-12-19', 'qwer', 'eqwe', 23.21, 0.668357, NULL),
('S-0010', '4@gmail.com', '1234', '312313', 3, 'laj', 'L', '2019-01-17', 'sewa', 'wew', 32.4, NULL, NULL),
('S-0011', '6@gmail.com', '1234', '31231', 2, 'weh', 'P', '2019-01-17', 'dasds', 'dasda', 23.12, 0.19699, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id_Admin`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`Id_Jurusan`),
  ADD UNIQUE KEY `Nama_Jurusan` (`Nama_Jurusan`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`Id_Kriteria`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`Id_Nilai`),
  ADD UNIQUE KEY `No_Pendaftaran` (`No_Pendaftaran`) USING BTREE;

--
-- Indeks untuk tabel `normalisasi`
--
ALTER TABLE `normalisasi`
  ADD PRIMARY KEY (`Id_Normalisasi`),
  ADD KEY `No_Pendaftaran` (`No_Pendaftaran`);

--
-- Indeks untuk tabel `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`No_Pendaftaran`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `NISN` (`NISN`),
  ADD KEY `Id_Jurusan` (`Id_Jurusan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `Id_Admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `Id_Jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `Id_Kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `Id_Nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `normalisasi`
--
ALTER TABLE `normalisasi`
  MODIFY `Id_Normalisasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`No_Pendaftaran`) REFERENCES `peserta` (`No_Pendaftaran`);

--
-- Ketidakleluasaan untuk tabel `normalisasi`
--
ALTER TABLE `normalisasi`
  ADD CONSTRAINT `normalisasi_ibfk_1` FOREIGN KEY (`No_Pendaftaran`) REFERENCES `peserta` (`No_Pendaftaran`);

--
-- Ketidakleluasaan untuk tabel `peserta`
--
ALTER TABLE `peserta`
  ADD CONSTRAINT `peserta_ibfk_1` FOREIGN KEY (`Id_Jurusan`) REFERENCES `jurusan` (`Id_Jurusan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
