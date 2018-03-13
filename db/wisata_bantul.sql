-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 13 Mar 2018 pada 06.30
-- Versi Server: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wisata_bantul`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(1, 'Alam'),
(2, 'Budaya'),
(3, 'Hotel'),
(4, 'Restoran');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id` int(20) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_hotel`
--

CREATE TABLE `tb_hotel` (
  `id` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `latt` double NOT NULL,
  `longi` double NOT NULL,
  `gbr` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_hotel`
--

INSERT INTO `tb_hotel` (`id`, `nama`, `keterangan`, `latt`, `longi`, `gbr`) VALUES
(1, 'aaa', '122', 23, 223, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_resto`
--

CREATE TABLE `tb_resto` (
  `id` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `latt` double NOT NULL,
  `longi` double NOT NULL,
  `gbr` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_resto`
--

INSERT INTO `tb_resto` (`id`, `nama`, `keterangan`, `latt`, `longi`, `gbr`) VALUES
(1, 'xxx', 'dddd', 1, 2, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_wisata`
--

CREATE TABLE `tb_wisata` (
  `id` int(11) NOT NULL,
  `kategori` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `alamat` text NOT NULL,
  `fasilitas` text NOT NULL,
  `tiket` varchar(50) NOT NULL,
  `latt` double NOT NULL,
  `longi` double NOT NULL,
  `gbr1` text NOT NULL,
  `gbr2` text NOT NULL,
  `gbr3` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_wisata`
--

INSERT INTO `tb_wisata` (`id`, `kategori`, `nama`, `keterangan`, `alamat`, `fasilitas`, `tiket`, `latt`, `longi`, `gbr1`, `gbr2`, `gbr3`) VALUES
(1, 1, 'a', 'a', 's', 'a', 'a', -8.766720598695727, 110.39844745000005, 'wst1-1516040934.jpg', 'wst2-1516040934.jpg', 'wst3-1516040934.jpg'),
(2, 2, 'Desa Wisata Trimurti', 'a', 'w', 'w', '2', -8.940407332737541, 110.48633807500005, 'wst1-1516041010.jpg', 'wst2-1516041010.jpg', 'wst3-1516041010.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `wisata`
--

CREATE TABLE `wisata` (
  `id` int(5) NOT NULL,
  `kategori` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `keterangan` text NOT NULL,
  `latt` double NOT NULL,
  `longi` double NOT NULL,
  `gbr1` text NOT NULL,
  `gbr2` text NOT NULL,
  `gbr3` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `wisata`
--

INSERT INTO `wisata` (`id`, `kategori`, `nama`, `keterangan`, `latt`, `longi`, `gbr1`, `gbr2`, `gbr3`) VALUES
(1, 1, 'Pantai Depok', 'Pantai DI bantull', -8.014173, 110.2922579, 'pantaidepok.jpg', '', ''),
(2, 1, 'Pantai Parangtritis', 'Pantai di Kab Bantul', -8.0257186, 110.3328845, 'pantaiparangtritis.jpg', '', ''),
(3, 2, 'Taman Sari', 'Wisata Budaya di kab Bantul', -7.8099649, 110.3568053, 'tamansari.jpg', 'pantaiparangtritis.jpg', 'pantaidepok.jpg'),
(4, 2, 'Alun - Alun Kidul', 'Wisata Budaya di Bantul', -7.8115463, 110.3607436, '', '', ''),
(5, 4, 'Rumah Makan Parangtritis', 'Rumah makan di jalan paris bantul', -7.876472, 110.3497733, '', '', ''),
(6, 4, 'Tiwul Ayu Mbok Sum', 'Rumah Makan di Mangunan Bantl', -7.9310484, 110.4225245, '', '', ''),
(7, 3, 'Grand Marto Hotel', 'Hotel di Bantul', -7.8202221, 110.3603285, '', '', ''),
(8, 3, 'Joglo Aruna', 'Joglo di Bantul', -7.8175684, 110.3386413, '', '', ''),
(35, 2, 'lo', 'k', 2, 5, 'brg1-1508575284.png', 'brg2-1508575284.png', 'brg3-1508575284.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_hotel`
--
ALTER TABLE `tb_hotel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_resto`
--
ALTER TABLE `tb_resto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_wisata`
--
ALTER TABLE `tb_wisata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wisata`
--
ALTER TABLE `wisata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_hotel`
--
ALTER TABLE `tb_hotel`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_resto`
--
ALTER TABLE `tb_resto`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_wisata`
--
ALTER TABLE `tb_wisata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wisata`
--
ALTER TABLE `wisata`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
