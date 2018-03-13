-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25 Sep 2017 pada 04.05
-- Versi Server: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wisatabantul`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `wisata`
--

CREATE TABLE `wisata` (
  `id` int(5) NOT NULL,
  `kategori` enum('alam','budaya','hotel','restoran') NOT NULL,
  `nama` varchar(30) NOT NULL,
  `keterangan` text NOT NULL,
  `latt` double NOT NULL,
  `longi` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `wisata`
--

INSERT INTO `wisata` (`id`, `kategori`, `nama`, `keterangan`, `latt`, `longi`) VALUES
(1, 'alam', 'Pantai Depok', 'Pantai DI bantull', -8.014173, 110.2922579),
(2, 'alam', 'Pantai Parangtritis', 'Pantai di Kab Bantul', -8.0257186, 110.3328845),
(3, 'budaya', 'Taman Sari', 'Wisata Budaya di kab Bantul', -7.8099649, 110.3568053),
(4, 'budaya', 'Alun - Alun Kidul', 'Wisata Budaya di Bantul', -7.8115463, 110.3607436),
(5, 'restoran', 'Rumah Makan Parangtritis', 'Rumah makan di jalan paris bantul', -7.876472, 110.3497733),
(6, 'restoran', 'Tiwul Ayu Mbok Sum', 'Rumah Makan di Mangunan Bantl', -7.9310484, 110.4225245),
(7, 'hotel', 'Grand Marto Hotel', 'Hotel di Bantul', -7.8202221, 110.3603285),
(8, 'hotel', 'Joglo Aruna', 'Joglo di Bantul', -7.8175684, 110.3386413);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wisata`
--
ALTER TABLE `wisata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wisata`
--
ALTER TABLE `wisata`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
