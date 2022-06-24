-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jun 2022 pada 13.51
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uas_python`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `email_admin` varchar(255) NOT NULL,
  `password_admin` varchar(255) NOT NULL,
  `nama_admin` varchar(255) NOT NULL,
  `telepon_admin` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`email_admin`, `password_admin`, `nama_admin`, `telepon_admin`) VALUES
('jeco@gmail.com', 'jericho', '1238921389f', 39893);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_kamar`
--

CREATE TABLE `jenis_kamar` (
  `type_kamar` varchar(255) NOT NULL,
  `stock_kamar` int(255) NOT NULL,
  `harga_kamar` int(255) NOT NULL,
  `id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jenis_kamar`
--

INSERT INTO `jenis_kamar` (`type_kamar`, `stock_kamar`, `harga_kamar`, `id`) VALUES
('Deluxe Room', 200001, 100000, 7),
('Double Room', 100, 100000, 8),
('Single Room', 100, 10000, 6),
('Standard Room', 100, 100000, 10),
('Superior Room', 100, 10000, 3),
('Twin Room ', 100, 10000, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `email_pelanggan` varchar(255) NOT NULL,
  `id_pelanggan` int(12) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `password_pelanggan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`email_pelanggan`, `id_pelanggan`, `nama_pelanggan`, `password_pelanggan`) VALUES
('jerichoo.chen@gmail.com', 5, 'Jerichojdf', '12345'),
('jerichoo00.chen@gmail.com', 6, 'jerichojr21', '1212');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sewa`
--

CREATE TABLE `sewa` (
  `id_sewa` int(11) NOT NULL,
  `type_kamar` varchar(255) NOT NULL,
  `email_pelanggan` varchar(200) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `telepon` int(15) NOT NULL,
  `checkin` date NOT NULL,
  `checkout` date NOT NULL,
  `jumlah` int(3) NOT NULL,
  `status` enum('Diproses','Sewa','Selesai') NOT NULL,
  `tgl_booking` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sewa`
--

INSERT INTO `sewa` (`id_sewa`, `type_kamar`, `email_pelanggan`, `nama`, `telepon`, `checkin`, `checkout`, `jumlah`, `status`, `tgl_booking`) VALUES
(16, 'Single Room', 'jerichoo.chen@gmail.com', 'Jericho', 92082, '2022-06-08', '2022-07-02', 12, 'Selesai', '2022-06-01 18:07:36.775480'),
(17, 'Superior Room', 'jerichoo.chen@gmail.com', 'jericho', 23232, '2022-06-21', '2022-07-01', 23, 'Diproses', '2022-06-01 19:20:33.008447'),
(18, 'Twin Room', 'jerichoo.chen@gmail.com', 'sds', 34, '2022-06-17', '2022-06-30', 23, 'Diproses', '2022-06-01 21:48:29.532748');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email_admin`),
  ADD UNIQUE KEY `telepon_admin` (`telepon_admin`);

--
-- Indeks untuk tabel `jenis_kamar`
--
ALTER TABLE `jenis_kamar`
  ADD PRIMARY KEY (`type_kamar`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`email_pelanggan`),
  ADD UNIQUE KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indeks untuk tabel `sewa`
--
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`id_sewa`),
  ADD KEY `email_pelanggan` (`email_pelanggan`),
  ADD KEY `type_kamar` (`type_kamar`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jenis_kamar`
--
ALTER TABLE `jenis_kamar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `sewa`
--
ALTER TABLE `sewa`
  MODIFY `id_sewa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `sewa`
--
ALTER TABLE `sewa`
  ADD CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`email_pelanggan`) REFERENCES `pelanggan` (`email_pelanggan`),
  ADD CONSTRAINT `sewa_ibfk_2` FOREIGN KEY (`type_kamar`) REFERENCES `jenis_kamar` (`type_kamar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
